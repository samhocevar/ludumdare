//
//  Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32
//
//  Copyright © 2015 Sam Hocevar <sam@hocevar.net>
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
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
    m_player_effective_impulse(0.f),
    m_active_ammo(thing_type::none),
    m_exit_reached(false),
    m_player_killed(false),
    m_player_fell(false)
{
}

level_instance::~level_instance()
{
    clear();
}

void level_instance::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

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
    if (m_player->m_position.y < -2.f * TILE_SIZE)
        m_player_killed = true;

    if (m_player->m_position.y < -35.f * TILE_SIZE)
    {
        m_player_fell = true;
        return;
    }

    if (!m_player_killed)
    {
        // If there is an impulse, fix player orientation
        // Otherwise, don’t touch the sprite.
        if (m_player_impulse.x < 0)
            m_player->m_facing_left = true;
        if (m_player_impulse.x > 0)
            m_player->m_facing_left = false;

        // lerping speed for inertia -- braking is faster than accelerating
        float s = m_player_impulse.x ? 8.f * seconds : 20.f * seconds;
        m_player_effective_impulse = lerp(m_player_effective_impulse, m_player_impulse, s);

        // Check how long we can apply player impulse before we hit something
        float impulse_time = collide_thing(m_player, m_player_effective_impulse, seconds);
        if (impulse_time > EPSILON)
            m_player->m_position += m_player_effective_impulse * (impulse_time - EPSILON);
        m_player_impulse = vec3(0.0f);
    }
    else
    {
        // FIXME: delta-time this shit!
        m_player->m_target_scale = m_player->m_target_scale + 8.f * seconds;
        //m_player->m_target_scale = min(8.f, m_player->m_target_scale * (1.f + 4.f * seconds));
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
    if (force_time > EPSILON)
        m_player->m_position += m_player->m_velocity * (force_time - EPSILON);

    // If not all forces were applied, try to slide horizontally or vertically
    float remaining_time = seconds - force_time;
    if (remaining_time > EPSILON)
    {
        vec3 x_velocity(m_player->m_velocity.x, 0.f, 0.f);
        float x_force_time = collide_thing(m_player, x_velocity, remaining_time);

        if (x_force_time > EPSILON)
            m_player->m_position += x_velocity * (x_force_time - EPSILON);
        else
            m_player->m_velocity.x = 0.f;

        vec3 y_velocity(0.f, m_player->m_velocity.y, 0.f);
        float y_force_time = collide_thing(m_player, y_velocity, remaining_time);

        // If gravity isn’t strong enough to move us downwards, we’re grounded
        if (m_player->m_velocity.y < -EPSILON && y_force_time < EPSILON)
            m_player->m_grounded = true;

        if (y_force_time > EPSILON)
            m_player->m_position += y_velocity * (y_force_time - EPSILON);
        else
            m_player->m_velocity.y = 0.f;
    }

    // Check whether we can pick up an item
    for (thing *t : m_items)
    {
        if (t->m_hidden || m_active_ammo == t->get_type())
            continue;

        bool is_minus = t->get_type() == thing_type::minus_ammo;
        bool is_plus = t->get_type() == thing_type::plus_ammo;
        bool is_button = t->get_type() == thing_type::button;

        if (!is_minus && !is_plus && !is_button)
            continue;

        if (collide(m_player, vec3(0), t, vec3(0), 0.f, seconds) >= seconds)
            continue;

        if (is_minus || is_plus)
        {
            m_active_ammo = t->get_type();
            t->m_hidden = true;

            // If we picked the plus ammo, show all hidden minus ammo, and vice-versa
            for (thing *t2 : m_items)
            {
                bool other_is_minus = t2->get_type() == thing_type::minus_ammo;
                bool other_is_plus = t2->get_type() == thing_type::plus_ammo;

                if (t2->m_hidden && ((is_minus && other_is_plus) || (is_plus && other_is_minus)))
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
             && collide(m_player, vec3(0), t, vec3(0), 0.f, seconds) < seconds - EPSILON)
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
    case thing_type::boulder:
    case thing_type::walking_monster:
        can_push_button = true;
        impulse.x = t->m_facing_left ? -MONSTER_RUN_SPEED : MONSTER_RUN_SPEED;
        break;
    default:
        break;
    }

    // Check how long we can apply impulse before we hit something
    float impulse_time = collide_thing(t, impulse, seconds);
    if (impulse_time > EPSILON)
        t->m_position += impulse * (impulse_time - EPSILON);
    if (impulse_time < seconds - EPSILON)
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
    if (force_time > EPSILON)
        t->m_position += t->m_velocity * (force_time - EPSILON);

    // If not all forces were applied, try to slide horizontally or vertically
    float remaining_time = seconds - force_time;
    if (remaining_time > EPSILON)
    {
        vec3 x_velocity(t->m_velocity.x, 0.f, 0.f);
        float x_force_time = collide_thing(t, x_velocity, remaining_time);

        if (x_force_time > EPSILON)
            t->m_position += x_velocity * (x_force_time - EPSILON);
        else
            t->m_velocity.x = 0.f;

        vec3 y_velocity(0.f, t->m_velocity.y, 0.f);
        float y_force_time = collide_thing(t, y_velocity, remaining_time);

        // If gravity isn’t strong enough to move us downwards, we’re grounded
        if (t->m_velocity.y < 0.f && y_force_time < EPSILON)
            t->m_grounded = true;

        if (y_force_time > EPSILON)
            t->m_position += y_velocity * (y_force_time - EPSILON);
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

            if (collide(t, vec3(0), t2, vec3(0), 0.f, seconds) > seconds - EPSILON)
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
                 collide(t, vec3(0), t2, vec3(0), 0.f, seconds) < seconds - EPSILON)
            {
                t->m_hidden = true;
                if (m_active_ammo == thing_type::plus_ammo)
                    t2->m_target_scale = 2.f;
                else if (m_active_ammo == thing_type::minus_ammo)
                    t2->m_target_scale = 1.f;
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
        vec3 pos = t->m_position;
        pos.x -= (t->m_scale - 1.f) * (1.f / 3 + 0.5f) * TILE_SIZE;
        pos.y -= (t->m_scale - 1.f) * (1.f / 3) * TILE_SIZE;
        vec2 scale = vec2(t->m_scale * 1.5f);
        float rot = 0.f;

        /* Some scaling tweaks */
        switch (t->get_type())
        {
        case thing_type::player:
            scale *= 1.5f;
            pos.x -= TILE_SIZE / 3.f;
            break;
        default:
            break;
        }

        /* Some Z-order tweaks */
        switch (t->get_type())
        {
        case thing_type::minus_ammo:
        case thing_type::plus_ammo:
        case thing_type::projectile:
            pos.z += 50.f;
            break;
        case thing_type::button:
        case thing_type::blocker:
        case thing_type::flying_monster:
        case thing_type::walking_monster:
        case thing_type::boulder:
            pos.z -= 50.f;
            break;
        case thing_type::laser:
        case thing_type::spikes:
        case thing_type::door:
            pos.z -= 60.f;
            break;
        default:
            break;
        }

        /* Some horizontal/vertical flip tweaks */
        switch (t->get_type())
        {
        case thing_type::laser:
            if (lol::cos(5.0 * t->m_time) > 0)
            {
                pos.x += TILE_SIZE * scale.x;
                scale.x *= -1.f;
            }
            if (lol::sin(5.0 * t->m_time) > 0)
            {
                pos.y += TILE_SIZE * scale.y;
                scale.y *= -1.f;
            }
            // Slightly offset vertically for aesthetics
            pos.y += 0.15f * TILE_SIZE * lol::abs(scale.y);
            break;
        case thing_type::minus_ammo:
        case thing_type::plus_ammo:
            pos.z += 50.f;
            pos.y += TILE_SIZE * 0.5f * lol::abs(lol::sin(6.f * t->m_time));
            break;
        case thing_type::player:
        case thing_type::projectile:
        case thing_type::flying_monster:
        case thing_type::walking_monster:
        case thing_type::boulder:
            if (t->m_velocity.x < 0.0f || t->m_facing_left)
            {
                pos.x += TILE_SIZE * scale.x;
                scale.x *= -1.f;
            }
            break;
        default:
            break;
        }

        /* Some rotation tweaks */
        switch (t->get_type())
        {
        case thing_type::boulder:
            rot = (t->m_velocity.x < 0.0f || t->m_facing_left ? 0.6f : -0.6f) * MONSTER_RUN_SPEED * t->m_time;
            //scene.AddTile(g_game->m_tiles, Tiles::Boulder, pos + vec3(0.f, 0.f, 10.f), 0, scale / 3.f, (t->m_velocity.x < 0.0f || t->m_facing_left ? 0.6f : -0.6f) * MONSTER_RUN_SPEED * t->m_time);
            //scene.AddTile(g_game->m_tiles, Tiles::BoulderTexture, pos + vec3(0.f, 0.f, 10.f), 0, scale / 3.f, (t->m_velocity.x < 0.0f || t->m_facing_left ? 0.6f : -0.6f) * MONSTER_RUN_SPEED * t->m_time);
            break;
        default:
            break;
        }

        int tid = t->m_tile_index;

        switch (t->get_type())
        {
        case thing_type::player:
            if (m_player_killed)
                tid = Tiles::DeadPlayer + (lol::sin(20.0 * t->m_time) > 0);
            else if (!t->m_grounded)
                tid = Tiles::Player + 3;
            else if (lol::abs(m_player_effective_impulse.x) < 0.1 * TILE_SIZE)
                tid = Tiles::Player + 6;
            else
                tid = Tiles::Player + int(lol::fmod(8.0 * t->m_time, 6.0));
            break;
        default:
            break;
        }

        scene.AddTile(g_game->m_tiles, tid, pos, 0, scale / 3.f, rot);
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

    auto const &layout = desc.get_layout();
    m_layout_size = (ivec2)layout.size();

    // First, the solid parts of the map
    for (int i = 0; i < m_layout_size.x; ++i)
    for (int j = 0; j < m_layout_size.y; ++j)
    {
        if (layout[i][j] == thing_type::none)
            continue;

        thing *t = new thing(layout[i][j]);
        t->m_position = vec3(i * 0.5f, j, 0) * float(TILE_SIZE);
        t->m_velocity = vec3(0.f);
        t->m_original_aabb.aa = vec3(TILE_SIZE * EPSILON);
        t->m_original_aabb.bb = vec3(TILE_SIZE - TILE_SIZE * EPSILON);

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
                t->m_original_aabb.aa.x += TILE_SIZE * 0.1f;
            if (b & 0x8)
                t->m_original_aabb.aa.y += TILE_SIZE * 0.3f;
            if (b & 0x2)
                t->m_original_aabb.bb.x -= TILE_SIZE * 0.1f;
            if (b & 0x4)
                t->m_original_aabb.bb.y -= TILE_SIZE * 0.1f;
            break;
        case thing_type::blocker:
            t->m_original_aabb.aa.x += TILE_SIZE * 0.1f;
            t->m_original_aabb.bb.x -= TILE_SIZE * 0.1f;
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
            t->m_original_aabb.aa.x += TILE_SIZE * 0.25f;
            t->m_original_aabb.bb.x -= TILE_SIZE * 0.25f;
            t->m_original_aabb.bb.y -= TILE_SIZE * 0.5f;
            break;
        case thing_type::button:
            t->m_tile_index = Tiles::Button;
            t->m_original_aabb.bb.y -= TILE_SIZE * 0.7f;
            m_items.push(t);
            break;
        case thing_type::boulder:
            t->m_original_aabb.aa.x += TILE_SIZE * 0.2f;
            t->m_original_aabb.bb.x -= TILE_SIZE * 0.2f;
            t->m_tile_index = Tiles::Boulder;
            m_monsters.push(t);
            break;
        case thing_type::laser:
            t->m_tile_index = Tiles::Laser;
            t->m_original_aabb.aa.x += TILE_SIZE * 0.4f;
            t->m_original_aabb.bb.x -= TILE_SIZE * 0.4f;
            m_items.push(t);
            break;
        case thing_type::minus_ammo:
            t->m_tile_index = Tiles::MinusAmmo;
            m_items.push(t);
            break;
        case thing_type::plus_ammo:
            t->m_tile_index = Tiles::PlusAmmo;
            m_items.push(t);
            break;
        case thing_type::sitting_monster:
        case thing_type::walking_monster:
        case thing_type::flying_monster:
            // FIXME: deprecated
            t->m_hidden = true;
            m_monsters.push(t);
            break;
        default:
            t->m_hidden = true;
            break;
        }
        m_things.push(t);
        Ticker::Ref(t);

        // If necessary, scale object thanks to our in-map markers. This can
        // scale objects that are otherwise unaffected by the ammo.
        if (j < m_layout_size.y - 1 && layout[i][j + 1] == thing_type::item_scaler)
        {
            t->m_scale = 2.0f;
            t->m_target_scale = 2.0f;
        }
    }

    // Now the moving parts
    m_player = new thing(thing_type::player);
    m_player->m_position = vec3(vec2(desc.get_start()) * vec2(TILE_SIZE * 0.5f, TILE_SIZE), 0.f);
    m_player->m_original_aabb.aa = vec3(TILE_SIZE * EPSILON);
    m_player->m_original_aabb.bb = vec3(TILE_SIZE - TILE_SIZE * EPSILON);
    m_player->m_tile_index = Tiles::Player;
    m_things.push(m_player);
    Ticker::Ref(m_player);

    thing *t = new thing(thing_type::projectile);
    m_projectiles.push(t);
    t->m_hidden = true;
    t->m_original_aabb.aa = vec3(TILE_SIZE * 0.35f);
    t->m_original_aabb.bb = vec3(TILE_SIZE * 0.65f);
    t->m_tile_index = Tiles::Projectile;
    m_things.push(t);
    Ticker::Ref(t);
}

vec3 level_instance::get_poi() const
{
    // Get the level instance’s Point of Interest — for now, just the player
    return m_player->m_position + 0.5f * m_player->m_original_aabb.extent();
}

float level_instance::collide_thing(thing const *t, vec3 velocity,
                                    float seconds) const
{
    bool is_moving_monster = t->get_type() == thing_type::boulder
                        || t->get_type() == thing_type::walking_monster
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
        if (collision_time < seconds - EPSILON)
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
    if (!m_player_killed)
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
}

void level_instance::jump()
{
    if (!m_player_killed && m_player->m_grounded)
    {
        m_player->m_grounded = false;
        m_player->m_can_impulse = true;
        m_player->m_jump_time = PLAYER_JUMP_TIME;
    }
}

void level_instance::continue_jump(float velocity, float seconds)
{
    if (!m_player_killed && m_player->m_can_impulse)
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
    if (!m_player_killed && m_active_ammo != thing_type::none)
    {
        thing *projecile = m_projectiles[0];

        float dir = m_player->m_facing_left ? -1.f : 1.f;

        projecile->m_hidden = false;
        projecile->m_position = m_player->m_position + vec3(TILE_SIZE * 1.2f * dir, TILE_SIZE * 0.5f, 0.f);
        projecile->m_velocity = vec3(PROJECTILE_MAX_SPEED * dir, 0.f, 0.f);
    }
}

