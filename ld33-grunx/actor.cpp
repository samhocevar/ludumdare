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

#include "constants.h"
#include "game.h"
#include "actor.h"

actor::actor(actortype t)
  : m_tile(0, 0),
    m_delta(0.f, 0.f),
    m_type(t),
    m_state(actorstate::idle),
    m_timer(0.0)
{
}

actor::~actor()
{
}

void actor::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    double footstep_then = lol::fmod(m_timer / 0.35, 1.0);

    m_timer += seconds;

    double footstep_now = lol::fmod(m_timer / 0.35, 1.0);

    if (footstep_now < footstep_then &&
         (m_state == actorstate::go_left || m_state == actorstate::go_right))
    {
        Sampler::PlaySample(g_game->m_fx_step);
    }

    /* Try to move left and right depending on our state */
    switch (m_state)
    {
    case actorstate::go_left:
        m_delta.x -= MONSTER_SPEED_X * TILE_SIZE_X * seconds;
        switch (g_game->m_level->get_tile(m_tile + ivec2(-1, 0)))
        {
            case tileid::empty:
                break;
            default:
                if (m_delta.x < 0.f)
                    m_delta.x = 0.f;
                break;
        }
        break;
    case actorstate::go_right:
        m_delta.x += MONSTER_SPEED_X * TILE_SIZE_X * seconds;
        switch (g_game->m_level->get_tile(m_tile + ivec2(1, 0)))
        {
            case tileid::empty:
                break;
            default:
                if (m_delta.x > 0.f)
                    m_delta.x = 0.f;
                break;
        }
        break;
    }

    /* If movement was successful, we may arrive on a new tile */
    while (m_delta.x > TILE_SIZE_X / 2)
    {
        m_tile.x += 1;
        m_delta.x -= TILE_SIZE_X;
    }

    while (m_delta.x < -TILE_SIZE_X / 2)
    {
        m_tile.x -= 1;
        m_delta.x += TILE_SIZE_X;
    }

    while (m_delta.y > TILE_SIZE_Y / 2)
    {
        m_tile.y += 1;
        m_delta.y -= TILE_SIZE_Y;
    }

    while (m_delta.y < -TILE_SIZE_Y / 2)
    {
        m_tile.y -= 1;
        m_delta.y += TILE_SIZE_Y;
    }

    m_position = vec3(m_tile.x * TILE_SIZE_X, -m_tile.y * TILE_SIZE_Y, 0.f);
    m_position += vec3(m_delta, 0.f);
}

void actor::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    tileid body_tid;

    switch (m_type)
    {
    case actortype::monster:
        switch (m_state)
        {
            case actorstate::go_left:
                body_tid = tileid::monster_left_body;
                break;
            case actorstate::go_right:
                body_tid = tileid::monster_right_body;
                break;
            case actorstate::idle:
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

        double anim_debug = lol::fmod(m_timer / 0.35, 1.0);
        tid += anim_debug < 0.25 ? 0 : anim_debug < 0.5 ? 2 : anim_debug < 0.75 ? 4 : 2;

        scene.AddTile(g_game->m_tiles, tid, m_position + vec3((x - 0.5f) * TILE_SIZE_X, (1.f - y) * TILE_SIZE_Y, 0.f), 0, vec2(1.f), 0.f);
    }

    /* Render feet and hand */
    if (m_type == actortype::monster &&
         (m_state == actorstate::go_left || m_state == actorstate::go_right))
    {
        int dir, tid_front, tid_back, tid_hand, anim_mul;

        switch (m_state)
        {
            case actorstate::go_left:
                tid_front = int(tileid::monster_left_foot);
                tid_hand = int(tileid::monster_left_hand);
                dir = -1;
                break;
            case actorstate::go_right:
                tid_front = int(tileid::monster_right_foot);
                tid_hand = int(tileid::monster_right_hand);
                dir = +1;
                break;
        }
        tid_back = tid_front + 0x40;
        
        double anim_debug = lol::fmod(m_timer / 0.7, 1.0);
        tid_front += (2 + 16 + dir * int(anim_debug * 8.0 + 2.0)) % 8;
        tid_back += (6 + 16 + dir * int(anim_debug * 8.0 + 2.0)) % 8;

        int hand_off = (4 + 16 + dir * int(anim_debug * 8.0 + 2.0)) % 8;
        tid_hand += hand_off >= 4 ? 7 - hand_off : hand_off;

        scene.AddTile(g_game->m_tiles, tid_front, m_position + vec3(0.f, 0.f, 0.5f), 0, vec2(1.f), 0.f);
        scene.AddTile(g_game->m_tiles, tid_back, m_position + vec3(0.f, 0.f, -0.5f), 0, vec2(1.f), 0.f);
        scene.AddTile(g_game->m_tiles, tid_hand, m_position + vec3(0.5, 0.f, 0.5f), 0, vec2(1.f), 0.f);
    }
}

void actor::move_left()
{
    if (m_state != actorstate::go_left)
        m_timer = 0.0;
    m_state = actorstate::go_left;
}

void actor::move_right()
{
    if (m_state != actorstate::go_right)
        m_timer = 0.0;
    m_state = actorstate::go_right;
}

void actor::move_idle()
{
    m_state = actorstate::idle;
}

