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

ld32_level::ld32_level()
{
}

ld32_level::~ld32_level()
{
}

void ld32_level::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);
}

void ld32_level::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    for (thing *t : m_things)
    {
        scene.AddTile(g_game->m_tiles, t->m_tile_index, t->m_position, 0, vec2(1.f), 0.f);
    }
}

ivec2 ld32_level::size()
{
    return (ivec2)m_map->m_layout.GetSize();
}

void ld32_level::load_map(ld32_map *map)
{
    clear();
    m_map = map;
    build();
}

void ld32_level::clear()
{
    for (thing *t : m_things)
    {
        Ticker::Unref(t);
    }
    m_things.empty();
}

void ld32_level::build()
{
    for (int i = 0; i < m_map->m_layout.GetSize().x; ++i)
    for (int j = 0; j < m_map->m_layout.GetSize().y; ++j)
    {
        if (m_map->m_layout[i][j] == thing_type::none)
            continue;

        thing *t = new thing(m_map->m_layout[i][j]);
        vec3 pos = vec3(i, j, 0) * TILE_SIZE;

        t->m_position = pos;
        t->m_tile_index = 16;
        m_things.push(t);
        Ticker::Ref(t);
    }
}

