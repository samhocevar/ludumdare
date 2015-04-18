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

    // Handle the player
    m_player->m_position.x += m_player_impulse;
    m_player_impulse = 0.0f;
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
        t->m_position = vec3(i, j, 0) * TILE_SIZE;
        switch (m_map->m_layout[i][j])
        {
        case thing_type::ground:
            t->m_tile_index = 16;
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
    m_player->m_position = vec3(vec2(m_map->m_start), 0.f) * TILE_SIZE;
    m_player->m_tile_index = 0;
    m_things.push(m_player);
    Ticker::Ref(m_player);
}

void level_instance::move_x(float seconds)
{
    m_player_impulse += seconds * PLAYER_SPEED;
}
