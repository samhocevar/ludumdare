﻿//
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
    m_player_impulse(0.f)
{
}

level_instance::~level_instance()
{
    clear();
}

void level_instance::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    // If there is an impulse, fix player orientation (TODO: animation states)
    // Otherwise, don’t touch the sprite.
    if (m_player_impulse.x < 0)
        m_player->m_tile_index = 1;
    if (m_player_impulse.x > 0)
        m_player->m_tile_index = 0;

    // Check how long we can apply player impulse before we hit something
    float impulse_time = collide_player(m_player_impulse, seconds);
    m_player->m_position += m_player_impulse * impulse_time;
    m_player_impulse = vec3(0.0f);

    // We have gravity (most of the time)
    m_player->m_velocity.y -= GRAVITY * seconds;

    // Apply as much velocity from forces as possible
    float force_time = collide_player(m_player->m_velocity, seconds);
    m_player->m_position += m_player->m_velocity * force_time;

    // If not all forces were applied, try to slide horizontally or vertically
    if (force_time < seconds)
    {
        float remaining_time = seconds - force_time;
        vec3 x_velocity(m_player->m_velocity.x, 0.f, 0.f);
        vec3 y_velocity(0.f, m_player->m_velocity.y, 0.f);
        float x_force_time = collide_player(x_velocity, remaining_time);
        float y_force_time = collide_player(y_velocity, remaining_time);

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
}

void level_instance::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    for (thing *t : m_things)
    {
        scene.AddTile(g_game->m_tiles, t->m_tile_index, t->m_position, 0, vec2(1.f), 0.f);
    }
}

ivec2 level_instance::size()
{
    return (ivec2)m_map->m_layout.GetSize();
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
}

void level_instance::build()
{
    ivec2 const size = (ivec2)m_map->m_layout.GetSize();

    // First, the solid parts of the map
    for (int i = 0; i < size.x; ++i)
    for (int j = 0; j < size.y; ++j)
    {
        if (m_map->m_layout[i][j] == thing_type::none)
            continue;

        thing *t = new thing(m_map->m_layout[i][j]);
        t->m_position = vec3(i, j, 0) * float(TILE_SIZE);
        t->m_bbox[0] = vec3(0);
        t->m_bbox[1] = vec3(float(TILE_SIZE));

        // Slightly tweak platform positions
        t->m_bbox[0].x += TILE_SIZE * 0.1f;
        t->m_bbox[0].y += TILE_SIZE * 0.3f;
        t->m_bbox[1].x -= TILE_SIZE * 0.1f;
        t->m_bbox[1].y -= TILE_SIZE * 0.1f;

        switch (m_map->m_layout[i][j])
        {
        case thing_type::ground:
            t->m_tile_index = 16;
            // FIXME: reduce bounding box in the following two cases
            if (i == 0 || m_map->m_layout[i - 1][j] != thing_type::ground)
                t->m_tile_index = 17;
            if (i == size.x - 1 || m_map->m_layout[i + 1][j] != thing_type::ground)
                t->m_tile_index = 18;
            break;
        default:
            t->m_tile_index = 19;
        }
        m_things.push(t);
        Ticker::Ref(t);
    }

    // Now the moving parts
    m_player = new thing(thing_type::player);
    m_player->m_position = vec3(vec2(m_map->m_start), 0.f) * float(TILE_SIZE);
    m_player->m_bbox[0] = vec3(0.f);
    m_player->m_bbox[1] = vec3(float(TILE_SIZE));
    m_player->m_tile_index = 0;
    m_things.push(m_player);
    Ticker::Ref(m_player);
}

float level_instance::collide_player(vec3 velocity, float seconds)
{
    for (thing *t : m_things)
    {
        if (t == m_player)
            continue;

        float collision_time = collide(m_player, velocity, t, vec3(0), 0.f, seconds);
        if (collision_time < seconds)
        {
            // There will be a collision, but we might also be encroached in a current
            // collision. Check again with a different start time to check whether we
            // might be unencroaching.
            float new_collision_time = collide(m_player, velocity, t, vec3(0), 0.4f * seconds, seconds);
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
    m_player_impulse += vec3(impulse, 0.f, 0.f);
    //m_player->m_velocity.x += impulse;
}

void level_instance::jump_y(float velocity)
{
    if (m_player->m_grounded)
    {
        m_player->m_velocity.y = velocity;
        m_player->m_grounded = false;
    }
}
