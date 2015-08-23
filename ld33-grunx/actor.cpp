//
//  LD33
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

#define ANIM_DEBUG_CODE 1

#include "constants.h"
#include "game.h"
#include "actor.h"

actor::actor(actortype t)
  : m_type(t)
{
}

actor::~actor()
{
}

void actor::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);
}

void actor::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    tileid base_tid;

    switch (m_type)
    {
    case actortype::monster:
        base_tid = tileid::monster_idle_0;
        break;
    default:
        base_tid = tileid(0);
        break;
    }

#if ANIM_DEBUG_CODE
    static double anim = 0.0;
    anim += seconds;
#endif

    vec2 pos = m_position.xy + vec2(-0.5f * TILE_SIZE_X, 1.f * TILE_SIZE_Y);

    for (int y = 0; y < 2; ++y)
    for (int x = 0; x < 2; ++x)
    {
        int tid = int(base_tid) + x + y * 0x40;

#if ANIM_DEBUG_CODE
        double anim_debug = lol::fmod(anim, 0.8);
        //tid = tileid(int(tid) + (anim / 8 % 5 / 2) * 2);
        tid += anim_debug < 0.2 ? 0 : anim_debug < 0.4 ? 2 : anim_debug < 0.6 ? 4 : 2;
#endif

        scene.AddTile(g_game->m_tiles, tid, vec3(pos.x + x * TILE_SIZE_X, pos.y + y * -TILE_SIZE_Y, 0.f), 0, vec2(1.f), 0.f);
    }
}

