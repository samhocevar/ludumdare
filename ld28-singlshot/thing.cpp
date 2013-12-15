//
// Ludum Dare 28 Entry
//
// Copyright: (c) 2013 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#if defined HAVE_CONFIG_H
#   include "config.h"
#endif

#include "core.h"

using namespace std;
using namespace lol;

#include "ld28.h"
#include "game.h"
#include "thing.h"

Thing::Thing(Game *game, TileSet *tileset, int tileid)
  : m_game(game),
    m_tileset(tileset),
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

void Thing::TickDraw(float seconds)
{
    WorldEntity::TickDraw(seconds);

    g_scene->AddTile(m_tileset, m_tileid,
                     m_position - m_game->m_camera_pos, 0.f, vec2(1.f));
}

