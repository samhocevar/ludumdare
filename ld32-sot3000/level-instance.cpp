﻿//
// Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32 3000
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#if HAVE_CONFIG_H
#   include "config.h"
#endif

#include <lol/engine.h>

using namespace lol;

#include "level-instance.h"
#include "constants.h"
#include "game.h"
#include "thing.h"

level_instance::level_instance()
  : m_player(nullptr),
    m_player_impulse(0.f),
    m_active_gun(thing_type::none),
    m_exit_reached(false),
    m_player_killed(false),
    m_player_fell(false),
    m_timer(0.0)
{
}

level_instance::~level_instance()
{
    clear();
}

void level_instance::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    m_timer += seconds;

    if (!g_game->is_paused())
    {
        tick_player(seconds);
        for (thing *t : m_projectiles)
            tick_projectile(t, seconds);
        for (thing *t : m_items)
            tick_living(t, seconds);
        for (thing *t : m_monsters)
            tick_living(t, seconds);
    }
}

void level_instance::tick_player(float seconds)
{
    // Check whether we fell out of the map
    if (m_player->m_position.y < -10.f * TILE_SIZE)
    {
        m_player_fell = true;
        return;
    }

    if (!m_player_killed)
    {
        // If there is an impulse, fix player orientation (TODO: animation states)
        // Otherwise, don’t touch the sprite.
        if (m_player_impulse.x < 0)
            m_player->m_tile_index = Tiles::PlayerGoLeft;
        if (m_player_impulse.x > 0)
            m_player->m_tile_index = Tiles::PlayerGoRight;

        // Check how long we can apply player impulse before we hit something
        float impulse_time = collide_thing(m_player, m_player_impulse, seconds);
        m_player->m_position += m_player_impulse * impulse_time;
        m_player_impulse = vec3(0.0f);
    }
    else
    {
        // FIXME: delta-time this shit!
        m_player->m_target_scale = min(4.f, m_player->m_target_scale * (1.f + 2.f * seconds));
    }

    // We have gravity (most of the time)
    m_player->m_velocity.y -= GRAVITY * seconds;

    // If the play was killed, we have no collision or air friction
    if (m_player_killed)
    {
        m_player->m_position += m_player->m_velocity * seconds;
        return;
    }

    // We have air friction which prevents our speed to reach
    // dangerous values… make this naive for now
    float y_speed = lol::abs(m_player->m_velocity.y);
    if (y_speed > PLAYER_MAX_SPEED)
        m_player->m_velocity.y *= (PLAYER_MAX_SPEED / y_speed);

    float force_time;
    force_time = collide_thing(m_player, m_player->m_velocity, seconds);
    m_player->m_position += m_player->m_velocity * force_time;

    // If not all forces were applied, try to slide horizontally or vertically
    if (force_time < seconds)
    {
        float remaining_time = seconds - force_time;
        vec3 x_velocity(m_player->m_velocity.x, 0.f, 0.f);
        vec3 y_velocity(0.f, m_player->m_velocity.y, 0.f);
        float x_force_time = collide_thing(m_player, x_velocity, remaining_time);
        float y_force_time = collide_thing(m_player, y_velocity, remaining_time);

        // If gravity isn’t strong enough to move us downwards, we’re grounded
        if (m_player->m_velocity.y < 0.f && y_force_time == 0.f)
            m_player->m_grounded = true;

        if (x_force_time > 0)
            m_player->m_position += x_velocity * x_force_time;
        else
            m_player->m_velocity.x = 0.f;

        if (y_force_time > 0)
            m_player->m_position += y_velocity * y_force_time;
        else
            m_player->m_velocity.y = 0.f;
    }

    // Check whether we can pick up an item
    for (thing *t : m_items)
    {
        if (t->m_hidden || m_active_gun == t->get_type())
            continue;

        bool is_pink = t->get_type() == thing_type::pink_gun;
        bool is_blue = t->get_type() == thing_type::blue_gun;
        bool is_button = t->get_type() == thing_type::button;

        if (!is_pink && !is_blue && !is_button)
            continue;

        if (collide(m_player, vec3(0), t, vec3(0), 0.f, seconds) >= seconds)
            continue;

        if (is_pink || is_blue)
        {
            m_active_gun = t->get_type();
            t->m_hidden = true;

            // If we picked the blue gun, show all hidden pink guns, and vice-versa
            for (thing *t2 : m_items)
            {
                bool other_is_pink = t2->get_type() == thing_type::pink_gun;
                bool other_is_blue = t2->get_type() == thing_type::blue_gun;

                if (t2->m_hidden && ((is_pink && other_is_blue) || (is_blue && other_is_pink)))
                    t2->m_hidden = false;
            }
        }

        /* If we pressed a button not larger than us, switch off all lasers */
        if (is_button && m_player->m_target_scale >= t->m_target_scale)
        {
            for (thing *t2 : m_items)
            {
                if (t2->get_type() == thing_type::laser)
                    t2->m_hidden = true;
            }
        }
    }

    // Check whether we reached the exit; FIXME: use standard collisions instead
    if (m_exit)
        m_exit_reached = distance(m_exit->m_position.xy,
                                  m_player->m_position.xy)
                   < TILE_SIZE * (m_player->m_scale + m_exit->m_scale) / 2;

    // Check whether we were killed
    for (thing *t : m_things)
    {
        if (t->can_kill()
             && collide(m_player, vec3(0), t, vec3(0), 0.f, seconds) < seconds)
        {
            m_player_killed = true;
            m_player->m_position.z = 90.f;
            m_player->m_velocity = vec3(0.f, PLAYER_JUMP_SPEED, 0.f);
            break;
        }
    }
}

void level_instance::tick_living(thing *t, float seconds)
{
    bool can_push_button = false;

    // Handle horizontal movement
    vec3 impulse(0.f);

    switch (t->get_type())
    {
    case thing_type::flying_monster:
        impulse.x = t->m_facing_left ? -MONSTER_RUN_SPEED : MONSTER_RUN_SPEED;
        break;
    case thing_type::walking_monster:
        can_push_button = true;
        impulse.x = t->m_facing_left ? -MONSTER_RUN_SPEED : MONSTER_RUN_SPEED;
        break;
    default:
        break;
    }

    // Check how long we can apply impulse before we hit something
    float impulse_time = collide_thing(t, impulse, seconds);
    t->m_position += impulse * impulse_time;
    if (impulse_time < seconds)
        t->m_facing_left = !t->m_facing_left;

    // We have gravity (most of the time)
    if (t->can_fall())
    {
        t->m_velocity.y -= GRAVITY * seconds;
    }

    // We also have air friction which prevents our speed to reach
    // dangerous values… make this naive for now
    float y_speed = lol::abs(t->m_velocity.y);
    if (y_speed > OBJECT_MAX_SPEED)
        t->m_velocity.y *= (OBJECT_MAX_SPEED / y_speed);

    // Apply as much velocity from forces as possible
    float force_time = collide_thing(t, t->m_velocity, seconds);
    t->m_position += t->m_velocity * force_time;

    // If not all forces were applied, try to slide horizontally or vertically
    if (force_time < seconds)
    {
        float remaining_time = seconds - force_time;
        vec3 x_velocity(t->m_velocity.x, 0.f, 0.f);
        vec3 y_velocity(0.f, t->m_velocity.y, 0.f);
        float x_force_time = collide_thing(t, x_velocity, remaining_time);
        float y_force_time = collide_thing(t, y_velocity, remaining_time);

        // If gravity isn’t strong enough to move us downwards, we’re grounded
        if (t->m_velocity.y < 0.f && y_force_time == 0.f)
            t->m_grounded = true;

        if (x_force_time > 0)
            t->m_position += x_velocity * x_force_time;
        else
            t->m_velocity.x = 0.f;

        if (y_force_time > 0)
            t->m_position += y_velocity * y_force_time;
        else
            t->m_velocity.y = 0.f;
    }

    // Check whether we activated an item
    for (thing *t2 : m_items)
    {
        if (can_push_button)
        {
            if (t2->get_type() != thing_type::button)
                continue;

            // Cannot push buttons bigger than us
            if (t2->m_target_scale > t->m_target_scale)
                continue;

            if (collide(t, vec3(0), t2, vec3(0), 0.f, seconds) >= seconds)
                continue;

            /* If we pressed a button, switch off all lasers */
            for (thing *t3 : m_items)
            {
                if (t3->get_type() == thing_type::laser)
                    t3->m_hidden = true;
            }
        }
    }
}

void level_instance::tick_projectile(thing *t, float seconds)
{
    if (!t->m_hidden)
    {
        t->m_position += t->m_velocity * seconds;

        auto check = [&](thing *t2)
        {
            if (t2->can_scale() &&
                 collide(t, vec3(0), t2, vec3(0), 0.f, seconds) < seconds)
            {
                t->m_hidden = true;
                t2->m_target_scale = (t->get_type() == thing_type::blue_projectile) ? 2.f : 1.f;
            }
        };

        for (thing *t2 : m_items)
            check(t2);
        for (thing *t2 : m_monsters)
            check(t2);
    }
}

void level_instance::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    for (thing *t : m_things)
    {
        if (t->m_hidden)
            continue;

        // Slight tweaking of the tile size so that we can use overlap for effects
        // FIXME: value added to pos is wrong here
        vec3 pos = t->m_position - vec3(t->m_scale) * 0.25f;
        vec2 scale = vec2(t->m_scale * 1.5f);

        /* Some tweaks */
        switch (t->m_tile_index)
        {
        case Tiles::Laser:
             if (lol::cos(5.0 * m_timer) > 0)
             {
                 pos.x += TILE_SIZE * scale.x;
                 scale.x *= -1.f;
             }
             if (lol::sin(5.0 * m_timer) > 0)
             {
                 pos.y += TILE_SIZE * scale.y;
                 scale.y *= -1.f;
             }
             break;
        case Tiles::PinkProjectile:
        case Tiles::BlueProjectile:
        case Tiles::FlyingMonster:
        case Tiles::WalkingMonster:
             if (t->m_velocity.x < 0.0f || t->m_facing_left)
             {
                 pos.x += TILE_SIZE * scale.x;
                 scale.x *= -1.f;
             }
             break;
        }

        if (t->m_tile_index < 1000)
            scene.AddTile(g_game->m_newtiles, t->m_tile_index,
                          pos, 0, scale / 3.f, 0.f);
        else
            scene.AddTile(g_game->m_tiles, t->m_tile_index - 1000,
                          pos, 0, scale, 0.f);
    }
}

ivec2 level_instance::layout_size() const
{
    return m_layout_size;
}

vec2 level_instance::world_size() const
{
    // We add +1 in X because we account for the last column’s tile which is probably double-width
    return (vec2(m_layout_size) + vec2(2.f, 0.f)) * vec2(TILE_SIZE * 0.5f, TILE_SIZE);
}

void level_instance::clear()
{
    for (thing *t : m_things)
    {
        Ticker::Unref(t);
    }
    m_things.empty();

    m_projectiles.empty();
    m_monsters.empty();
    m_items.empty();
}

void level_instance::init(level_description const &desc)
{
    clear();

    auto const &layout = desc.m_layout;
    m_layout_size = (ivec2)layout.GetSize();

    // First, the solid parts of the map
    for (int i = 0; i < m_layout_size.x; ++i)
    for (int j = 0; j < m_layout_size.y; ++j)
    {
        if (layout[i][j] == thing_type::none)
            continue;

        thing *t = new thing(layout[i][j]);
        t->m_position = vec3(i * 0.5f, j, 0) * float(TILE_SIZE);
        t->m_velocity = vec3(0.f);
        t->m_original_aabb.A = vec3(0);
        t->m_original_aabb.B = vec3(float(TILE_SIZE));

        int b = 0;

        switch (layout[i][j])
        {
        case thing_type::ground:
            b = (j + 1 < m_layout_size.y && layout[i][j + 1] != thing_type::ground ? 4 : 0)
              | (j - 1 >= 0 && layout[i][j - 1] != thing_type::ground ? 8 : 0)
              | (i + 2 < m_layout_size.x && layout[i + 2][j] != thing_type::ground ? 2 : 0)
              | (i - 2 >= 0 && layout[i - 2][j] != thing_type::ground ? 1 : 0);

            t->m_tile_index = Tiles::Ground + b;

            // Reduce bounding box in open ends
            if (b & 0x1)
                t->m_original_aabb.A.x += TILE_SIZE * 0.1f;
            if (b & 0x8)
                t->m_original_aabb.A.y += TILE_SIZE * 0.3f;
            if (b & 0x2)
                t->m_original_aabb.B.x -= TILE_SIZE * 0.1f;
            if (b & 0x4)
                t->m_original_aabb.B.y -= TILE_SIZE * 0.1f;
            break;
        case thing_type::blocker:
            t->m_tile_index = Tiles::Blocker;
            m_items.push(t);
            break;
        case thing_type::monster_blocker:
            t->m_tile_index = Tiles::Blocker;
            t->m_hidden = true;
            break;
        case thing_type::item_scaler:
            t->m_tile_index = Tiles::Blocker;
            t->m_hidden = true;
            break;
        case thing_type::door:
            t->m_tile_index = Tiles::Door;
            m_exit = t;
            break;
        case thing_type::spikes:
            t->m_tile_index = Tiles::Spikes;
            t->m_original_aabb.B.y -= TILE_SIZE * 0.5f;
            break;
        case thing_type::button:
            t->m_tile_index = Tiles::Button;
            t->m_original_aabb.B.y -= TILE_SIZE * 0.7f;
            m_items.push(t);
            break;
        case thing_type::laser:
            t->m_tile_index = Tiles::Laser;
            t->m_original_aabb.A.x += TILE_SIZE * 0.4f;
            t->m_original_aabb.B.x -= TILE_SIZE * 0.4f;
            m_items.push(t);
            break;
        case thing_type::pink_gun:
            t->m_tile_index = Tiles::PinkGun;
            m_items.push(t);
            break;
        case thing_type::blue_gun:
            t->m_tile_index = Tiles::BlueGun;
            m_items.push(t);
            break;
        case thing_type::sitting_monster:
            t->m_tile_index = Tiles::SittingMonster;
            m_monsters.push(t);
            break;
        case thing_type::walking_monster:
            t->m_tile_index = Tiles::WalkingMonster;
            m_monsters.push(t);
            break;
        case thing_type::flying_monster:
            t->m_tile_index = Tiles::FlyingMonster;
            m_monsters.push(t);
            break;
        default:
            t->m_tile_index = Tiles::Blocker; // FIXME: what to do here?
            t->m_hidden = true;
            break;
        }
        m_things.push(t);
        Ticker::Ref(t);

        // If necessary, scale object thanks to our in-map markers. This can
        // scale objects that are otherwise unaffected by the gun.
        if (j < m_layout_size.y - 1 && layout[i][j + 1] == thing_type::item_scaler)
        {
            t->m_scale = 2.0f;
            t->m_target_scale = 2.0f;
        }
    }

    // Now the moving parts
    m_player = new thing(thing_type::player);
    m_player->m_position = vec3(vec2(desc.m_start) * vec2(TILE_SIZE * 0.5f, TILE_SIZE), 0.f);
    m_player->m_original_aabb.A = vec3(0.f);
    m_player->m_original_aabb.B = vec3(float(TILE_SIZE));
    m_player->m_tile_index = Tiles::PlayerGoRight;
    m_things.push(m_player);
    Ticker::Ref(m_player);

    for (thing_type type : { thing_type::pink_projectile,
                             thing_type::blue_projectile })
    {
        thing *t = new thing(type);
        m_projectiles.push(t);
        t->m_hidden = true;
        t->m_original_aabb.A = vec3(TILE_SIZE * 0.4f);
        t->m_original_aabb.B = vec3(TILE_SIZE * 0.6f);

        if (type == thing_type::pink_projectile)
            t->m_tile_index = Tiles::PinkProjectile;
        else
            t->m_tile_index = Tiles::BlueProjectile;

        m_things.push(t);
        Ticker::Ref(t);
    }
}

vec3 level_instance::get_poi() const
{
    // Get the level instance’s Point of Interest — for now, just the player
    return m_player->m_position + 0.5f * (m_player->m_original_aabb.B - m_player->m_original_aabb.A);
}

float level_instance::collide_thing(thing const *t, vec3 velocity,
                                    float seconds) const
{
    bool is_moving_monster = t->get_type() == thing_type::walking_monster
                        || t->get_type() == thing_type::flying_monster;

    for (thing *t2 : m_things)
    {
        if (t2 == t)
            continue;

        if (is_moving_monster && !t2->can_block_monster())
            continue;

        if (!is_moving_monster && !t2->can_block())
            continue;

        float collision_time = collide(t, velocity, t2, vec3(0), 0.f, seconds);
        if (collision_time < seconds)
        {
            // There will be a collision, but we might also be encroached in a current
            // collision. Check again with a different start time to check whether we
            // might be unencroaching.
            float new_collision_time = collide(t, velocity, t2, vec3(0), 0.4f * seconds, seconds);
            if (new_collision_time > 0.6f * seconds)
                collision_time = new_collision_time;

            seconds = collision_time;
        }
    }

    return seconds;
}

void level_instance::impulse_x(float impulse)
{
    // FIXME: left/right commands should affect velocity directly so
    // that we can do more appealing air control.
    // FIXME: decide whether we run faster when scaled up; I don’t think
    // it looks cool, but maybe it makes sense for the gameplay?
    m_player_impulse += vec3(impulse * PLAYER_RUN_SPEED, 0.f, 0.f);
    //m_player_impulse += vec3(impulse * m_player->m_scale, 0.f, 0.f);
    //m_player->m_velocity.x += impulse;

    m_player->m_facing_left = impulse < 0.0f;
}

void level_instance::jump()
{
    if (m_player->m_grounded)
    {
        m_player->m_grounded = false;
        m_player->m_can_impulse = true;
        m_player->m_jump_time = PLAYER_JUMP_TIME;
    }
}

void level_instance::continue_jump(float velocity, float seconds)
{
    if (m_player->m_can_impulse)
    {
        // We can jump higher when scaled up!
        if (m_player->m_jump_time == PLAYER_JUMP_TIME)
            m_player->m_velocity.y = velocity * m_player->m_scale;

        m_player->m_jump_time -= seconds;
        if (m_player->m_jump_time < 0.0f)
            m_player->m_can_impulse = false;

#if 0
        // FIXME: does not work well; I’m cancelling the short/long jump feature
        m_player->m_velocity.y += 1.0f * velocity * seconds / PLAYER_JUMP_TIME;
#endif
    }
}

void level_instance::fire()
{
    thing *projecile;

    switch (m_active_gun)
    {
    case thing_type::pink_gun:
        projecile = m_projectiles[0];
        break;
    case thing_type::blue_gun:
        projecile = m_projectiles[1];
        break;
    default:
        return;
    }

    vec3 dir = (m_player->m_facing_left ? -1.f : 1.f) * vec3(1.0f, 0.f, 0.f);

    projecile->m_hidden = false;
    projecile->m_position = m_player->m_position + (TILE_SIZE * 0.5f) * dir;
    projecile->m_velocity = PROJECTILE_MAX_SPEED * dir;
}