//
//  W.E.S.H. Grow — Entry for Ludum Dare 34
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

#include "constants.h"
#include "ship.h"
#include "game.h"

ship::ship()
  : m_timer(0.0)
{
}

ship::~ship()
{
}

void ship::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    m_timer += seconds;
}

void ship::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    scene.AddTile(g_game->m_tiles, int(tileid::ship), m_position, 0, vec2(1.f), degrees(m_timer));
}

