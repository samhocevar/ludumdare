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
  : m_direction(0),
    m_type(t)
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

    tileid body_tid;

#if ANIM_DEBUG_CODE
    static double anim = 0.0;
    anim += seconds;
#endif

    switch (m_type)
    {
    case actortype::monster:
        switch (m_direction)
        {
            case -1:
                body_tid = tileid::monster_left_body;
                break;
            case 1:
                body_tid = tileid::monster_right_body;
                break;
            default:
                body_tid = tileid::monster_idle;
                break;
        }
        break;
    default:
        /* XXX: this is a test */
        body_tid = tileid::monster_idle;
        break;
    }

    /* Render body (4 sprites) */
    for (int y = 0; y < 2; ++y)
    for (int x = 0; x < 2; ++x)
    {
        int tid = int(body_tid) + x + y * 0x40;

#if ANIM_DEBUG_CODE
        double anim_debug = lol::fmod(anim / 0.7, 1.0);
        tid += anim_debug < 0.25 ? 0 : anim_debug < 0.5 ? 2 : anim_debug < 0.75 ? 4 : 2;
#endif

        scene.AddTile(g_game->m_tiles, tid, m_position + vec3(x * TILE_SIZE_X, -y * TILE_SIZE_Y, 0.f), 0, vec2(1.f), 0.f);
    }

    /* Render feet and hand */
    if (m_type == actortype::monster && m_direction != 0)
    {
        int tid_front, tid_back, tid_hand, anim_mul;

        switch (m_direction)
        {
            case -1:
                tid_front = int(tileid::monster_left_foot);
                tid_hand = int(tileid::monster_left_hand);
                break;
            case 1:
                tid_front = int(tileid::monster_right_foot);
                tid_hand = int(tileid::monster_right_hand);
                break;
        }
        tid_back = tid_front + 0x40;
        
#if ANIM_DEBUG_CODE
        double anim_debug = lol::fmod(anim / 1.4, 1.0);
        tid_front += (2 + 16 + m_direction * int(anim_debug * 8.0 + 2.0)) % 8;
        tid_back += (6 + 16 + m_direction * int(anim_debug * 8.0 + 2.0)) % 8;

		int hand_off = (4 + 16 + m_direction * int(anim_debug * 8.0 + 2.0)) % 8;
        tid_hand += hand_off >= 4 ? 7 - hand_off : hand_off;
#endif

        scene.AddTile(g_game->m_tiles, tid_front, m_position + vec3(0.5f * TILE_SIZE_X, -1.f * TILE_SIZE_Y, 0.5f), 0, vec2(1.f), 0.f);
        scene.AddTile(g_game->m_tiles, tid_back, m_position + vec3(0.5f * TILE_SIZE_X, -1.f * TILE_SIZE_Y, -0.5f), 0, vec2(1.f), 0.f);
        scene.AddTile(g_game->m_tiles, tid_hand, m_position + vec3(0.5f * TILE_SIZE_X, -1.f * TILE_SIZE_Y, 0.5f), 0, vec2(1.f), 0.f);
    }
}
