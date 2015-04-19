//
// Ludum Dare 32 Entry
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

#include "constants.h"
#include "level.h"
#include "game.h"
#include "thing.h"

level_instance::level_instance()
  : m_player(nullptr),
    m_player_impulse(0.f),
    m_active_gun(thing_type::none)
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
        for (thing *t : m_enemies)
            tick_living(t, seconds);
    }
}

void level_instance::tick_player(float seconds)
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

    // We have gravity (most of the time)
    m_player->m_velocity.y -= GRAVITY * seconds;

    // But we also have air friction which prevents our speed to reach
    // dangerous values… make this naive for now
    float speed = length(m_player->m_velocity);
    if (speed > PLAYER_MAX_SPEED)
        m_player->m_velocity *= (PLAYER_MAX_SPEED / speed);

    // Apply as much velocity from forces as possible
    float force_time = collide_thing(m_player, m_player->m_velocity, seconds);
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

        if ((is_pink || is_blue) &&
            collide(m_player, vec3(0), t, vec3(0), 0.f, seconds) < seconds)
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
    }
}

void level_instance::tick_living(thing *t, float seconds)
{
    // We have gravity (most of the time)
    if (t->can_fall())
    {
        t->m_velocity.y -= GRAVITY * seconds;
    }

    // We also have air friction which prevents our speed to reach
    // dangerous values… make this naive for now
    float speed = length(t->m_velocity);
    if (speed > OBJECT_MAX_SPEED)
        t->m_velocity *= (OBJECT_MAX_SPEED / speed);

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
        for (thing *t2 : m_enemies)
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

        scene.AddTile(g_game->m_tiles, t->m_tile_index, t->m_position, 0, vec2(t->m_scale), 0.f);
    }
}

ivec2 level_instance::layout_size()
{
    return (ivec2)m_map->m_layout.GetSize();
}

vec2 level_instance::world_size()
{
    // We add +1 in X because we account for the last column’s tile which is probably double-width
    return (vec2(m_map->m_layout.GetSize()) + vec2(1.f, 0.f)) * vec2(TILE_SIZE * 0.5f, TILE_SIZE);
}

void level_instance::load_map(ld32_map *map)
{
    clear();
    m_map = map;
    build();
}

void level_instance::clear()
{
    for (thing *t : m_things)
    {
        Ticker::Unref(t);
    }
    m_things.empty();

    m_projectiles.empty();
    m_enemies.empty();
    m_items.empty();
}

void level_instance::build()
{
    ivec2 const size = layout_size();

    // First, the solid parts of the map
    for (int i = 0; i < size.x; ++i)
    for (int j = 0; j < size.y; ++j)
    {
        if (m_map->m_layout[i][j] == thing_type::none)
            continue;

        thing *t = new thing(m_map->m_layout[i][j]);
        t->m_position = vec3(i * 0.5f, j, 0) * float(TILE_SIZE);
        t->m_original_aabb.A = vec3(0);
        t->m_original_aabb.B = vec3(float(TILE_SIZE));

        switch (m_map->m_layout[i][j])
        {
        case thing_type::ground:
            t->m_tile_index = Tiles::GroundTop;

            // Slightly tweak platform positions
            t->m_original_aabb.A.x += TILE_SIZE * 0.1f;
            t->m_original_aabb.A.y += TILE_SIZE * 0.3f;
            t->m_original_aabb.B.x -= TILE_SIZE * 0.1f;
            t->m_original_aabb.B.y -= TILE_SIZE * 0.1f;

            // FIXME: reduce bounding box in the following two cases
            if (i - 2 < 0 || m_map->m_layout[i - 2][j] != thing_type::ground)
                t->m_tile_index = Tiles::GroundTopRight;
            if (i + 2 >= size.x || m_map->m_layout[i + 2][j] != thing_type::ground)
                t->m_tile_index = Tiles::GroundTopLeft;
            break;
        case thing_type::blocker:
            t->m_tile_index = Tiles::Blocker;
            m_items.push(t);
            break;
        case thing_type::door:
            t->m_tile_index = Tiles::Door;
            break;
        case thing_type::spikes:
            t->m_tile_index = Tiles::Spikes;
            t->m_original_aabb.B.y -= TILE_SIZE * 0.5f;
            break;
        case thing_type::key:
            t->m_tile_index = Tiles::Key;
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
        case thing_type::sitting_enemy:
            t->m_tile_index = Tiles::SittingEnemy;
            m_enemies.push(t);
            break;
        case thing_type::walking_enemy:
            t->m_tile_index = Tiles::WalkingEnemy;
            m_enemies.push(t);
            break;
        case thing_type::flying_enemy:
            t->m_tile_index = Tiles::FlyingGoLeft;
            m_enemies.push(t);
            break;
        default:
            t->m_tile_index = Tiles::Blocker; // FIXME: what to do here?
        }
        m_things.push(t);
        Ticker::Ref(t);
    }

    // Now the moving parts
    m_player = new thing(thing_type::player);
    m_player->m_position = vec3(vec2(m_map->m_start) * vec2(TILE_SIZE * 0.5f, TILE_SIZE), 0.f);
    m_player->m_original_aabb.A = vec3(0.f);
    m_player->m_original_aabb.B = vec3(float(TILE_SIZE));
    m_player->m_tile_index = Tiles::PlayerGoRight;
    m_things.push(m_player);
    Ticker::Ref(m_player);

    for (thing_type type : { thing_type::pink_projectile, thing_type::blue_projectile})
    {
        thing *t = new thing(type);
        m_projectiles.push(t);
        t->m_hidden = true;
        t->m_original_aabb.A = vec3(TILE_SIZE * 0.4f);
        t->m_original_aabb.B = vec3(TILE_SIZE * 0.6f);
        switch (type)
        {
            case thing_type::pink_projectile:
                t->m_tile_index = Tiles::PinkProjectile;
                break;
            case thing_type::blue_projectile:
                t->m_tile_index = Tiles::BlueProjectile;
                break;
        }
        m_things.push(t);
        Ticker::Ref(t);
    }
}

vec3 level_instance::get_poi() const
{
    // Get the level instance’s Point of Interest — for now, just the player
    return m_player->m_position + 0.5f * (m_player->m_original_aabb.B - m_player->m_original_aabb.A);
}

float level_instance::collide_thing(thing const *t, vec3 velocity, float seconds)
{
    for (thing *t2 : m_things)
    {
        if (t2 == t || t2->m_hidden || !t2->can_block())
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
    m_player_impulse += vec3(impulse, 0.f, 0.f);
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
    thing *fire;

    switch (m_active_gun)
    {
    case thing_type::none:
        return;
    case thing_type::pink_gun:
        fire = m_projectiles[0];
        break;
    case thing_type::blue_gun:
        fire = m_projectiles[1];
        break;
    }

    vec3 dir = (m_player->m_facing_left ? -1.f : 1.f) * vec3(1.0f, 0.f, 0.f);

    fire->m_hidden = false;
    fire->m_position = m_player->m_position + (TILE_SIZE * 0.5f) * dir;
    fire->m_velocity = PROJECTILE_MAX_SPEED * dir;
}

