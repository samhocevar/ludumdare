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
    m_falling(false),
    m_jumping(false),
    m_dead(false),
    m_timer(0.0)
{
}

actor::~actor()
{
}

void actor::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    if (!g_game->m_level)
    {
        /* No level yet; bail out */
        return;
    }

    double footstep_then = lol::fmod(m_timer / 0.35, 1.0);

    m_timer += seconds;
    m_jump_timer += seconds;

    double footstep_now = lol::fmod(m_timer / 0.35, 1.0);

    if (footstep_now < footstep_then &&
         (m_state == actorstate::go_left || m_state == actorstate::go_right))
    {
        Sampler::PlaySample(g_game->m_fx_step);
    }

    auto tile_here = g_game->m_level->get_tile(m_tile);
    auto tile_below = g_game->m_level->get_tile(m_tile + ivec2(0, 1));
    auto tile_above = g_game->m_level->get_tile(m_tile + ivec2(0, -1));
    auto tile_left = g_game->m_level->get_tile(m_tile + ivec2(-1, 0));
    auto tile_right = g_game->m_level->get_tile(m_tile + ivec2(1, 0));

    /* Handle falling */
    if (m_jump_timer > 0.5)
    {
        m_jumping = false;
        m_falling = true;
    }

    if (m_jumping)
    {
        m_delta.y += 3.0f * (0.5f - float(m_jump_timer)) * seconds * MONSTER_SPEED_JUMP * TILE_SIZE_Y;
        m_falling = true;
        //m_delta.y += (1.0f - sq(float(m_jump_timer) - 1.0f)) * seconds * MONSTER_SPEED_FALL * TILE_SIZE_Y;
    }
    else if (tile_here == tileid::empty)
    {
        m_delta.y -= MONSTER_SPEED_FALL * TILE_SIZE_Y * seconds;
    }

    /* Try to move left and right depending on our state */
    switch (m_state)
    {
    case actorstate::go_left:
        m_delta.x -= MONSTER_SPEED_WALK * TILE_SIZE_X * seconds;
        break;
    case actorstate::go_right:
        m_delta.x += MONSTER_SPEED_WALK * TILE_SIZE_X * seconds;
        break;
    case actorstate::go_up:
        m_delta.y += MONSTER_SPEED_CLIMB * TILE_SIZE_Y * seconds;
        break;
    case actorstate::go_down:
        m_delta.y -= MONSTER_SPEED_CLIMB * TILE_SIZE_Y * seconds;
        break;
    }

    /* Handle effects from surrounding tiles */
    switch (tile_here)
    {
        case tileid::wall:
            /* Inside a wall? Push actor outside! */
            while (sqlength(m_delta) < 0.5 * 0.5 * (TILE_SIZE_X * TILE_SIZE_Y))
                m_delta *= 1.05f;
            break;
        case tileid::ladder:
            m_falling = false;
            break;
        case tileid::stairs_down:
            m_delta.y = max(m_delta.y, 0.5f * TILE_SIZE_Y - m_delta.x);
            break;
        case tileid::stairs_up:
            m_delta.y = max(m_delta.y, 0.5f * TILE_SIZE_Y + m_delta.x);
            break;
    }

    switch (tile_left)
    {
        case tileid::wall:
            m_delta.x = max(m_delta.x, 0.f);
            break;
    }

    switch (tile_right)
    {
        case tileid::wall:
            m_delta.x = min(m_delta.x, 0.f);
            break;
    }

    switch (tile_above)
    {
        case tileid::wall:
        case tileid::stairs_down:
        case tileid::stairs_up:
            if (m_delta.y > 0.f)
            {
                m_jumping = false;
                m_falling = true;
                m_delta.y = 0.f;
            }
            break;
    }

    switch (tile_below)
    {
        case tileid::wall:
            if (m_delta.y < 0.f)
                m_falling = false;
            m_delta.y = max(m_delta.y, 0.f);
            break;
        case tileid::stairs_down:
            m_delta.y = max(m_delta.y, -0.5f * TILE_SIZE_Y - m_delta.x);
            break;
        case tileid::stairs_up:
            m_delta.y = max(m_delta.y, -0.5f * TILE_SIZE_Y + m_delta.x);
            break;
    }

    /* If movement was successful, we may have arrived on a new tile */
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
        m_tile.y -= 1;
        m_delta.y -= TILE_SIZE_Y;
    }

    while (m_delta.y < -TILE_SIZE_Y / 2)
    {
        m_tile.y += 1;
        m_delta.y += TILE_SIZE_Y;
    }

    m_position = vec3(m_tile.x * TILE_SIZE_X, -m_tile.y * TILE_SIZE_Y, 0.f);
    m_position += vec3(m_delta, 0.f);
}

void actor::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    if (!g_game->m_level)
    {
        /* No level yet; bail out */
        return;
    }

    // debug cell
    //scene.AddTile(g_game->m_tiles, int(tileid::select), vec3(TILE_SIZE_X * m_tile.x, - TILE_SIZE_Y * m_tile.y, 10.f), 0, vec2(1.f), 0.f);

    tileid body_tid;

    int tile_offset = m_type == actortype::monster ? 0x000 : 0x100;

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

    /* Render body (4 sprites) */
    for (int y = 0; y < 2; ++y)
    for (int x = 0; x < 2; ++x)
    {
        int tid = tile_offset + int(body_tid) + x + y * 0x40;

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
                tid_front = tile_offset + int(tileid::monster_left_foot);
                tid_hand = tile_offset + int(tileid::monster_left_hand);
                dir = -1;
                break;
            case actorstate::go_right:
                tid_front = tile_offset + int(tileid::monster_right_foot);
                tid_hand = tile_offset + int(tileid::monster_right_hand);
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

void actor::move(actorstate state)
{
    if (m_state != state)
        m_timer = 0.0;
    if (m_jumping && state == actorstate::idle)
        return;
    m_state = state;
}

void actor::jump()
{
    if (!m_jumping && !m_falling && m_state != actorstate::idle)
    {
        m_jump_timer = 0.0;
        m_jumping = true;
    }
}

