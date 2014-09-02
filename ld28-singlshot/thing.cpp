//
// Ludum Dare 28 Entry
//
// Copyright: (c) 2013 Sam Hocevar <sam@hocevar.net>
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

#include "singlshot.h"
#include "game.h"
#include "thing.h"

Thing::Thing(Game *game, int tileid)
  : m_dead(false),
    m_game(game),
    m_tileid(tileid)
{
}

Thing::~Thing()
{
}

void Thing::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);
}

void Thing::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    /* 9.f : compensate for sprite size */
    if (!m_dead)
    {
        scene.AddTile(m_game->m_tiles, m_tileid,
                      m_position - m_game->m_camera_pos - vec3(9.f, 9.f, 0.f),
                      0.f, vec2(1.f), 0.f);
    }
}

