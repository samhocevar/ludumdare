//
//  Unnamed — Entry for Ludum Dare 35
//
//  Copyright © 2016 Sam Hocevar <sam@hocevar.net>
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

actor::actor()
  : m_tile(0, 0),
    m_delta(0.f, 0.f),
    m_type(animaltype::cat),
    m_target_type(animaltype::none),
    m_state(actorstate::idle),
    m_eastward(true),
    m_moving(false),
    m_falling(false),
    m_jumping(false),
    m_dead(false),
    m_timer(0.0),
    m_jump_timer(0.0),
    m_morph_timer(0.0)
{
}

actor::~actor()
{
}

void actor::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    for (int i = 0; i < 4; ++i)
        subtick_game(seconds * 0.25f);
}

void actor::subtick_game(float seconds)
{
    if (!g_game->m_level)
    {
        /* No level yet; bail out */
        return;
    }

    double footstep_then = lol::fmod(m_timer / 0.35, 1.0);

    m_timer += seconds;
    m_jump_timer += seconds;
    m_morph_timer += seconds;

    double footstep_now = lol::fmod(m_timer / 0.35, 1.0);

    if (footstep_now < footstep_then &&
         (m_state == actorstate::go_left || m_state == actorstate::go_right))
    {
        Sampler::PlaySample(g_game->m_fx_step);
    }

    if (m_target_type != animaltype::none)
    {
        if (m_morph_timer > MORPH_DURATION * 0.5f)
            m_type = m_target_type;

        if (m_morph_timer > MORPH_DURATION)
            m_target_type = animaltype::none;
    }

    auto tile_here = get_tile(m_tile);
    auto tile_below = get_tile(m_tile + ivec2(0, 1));
    auto tile_above = get_tile(m_tile + ivec2(0, -1));
    auto tile_left = get_tile(m_tile + ivec2(-1, 0));
    auto tile_right = get_tile(m_tile + ivec2(1, 0));

    /* Handle falling */
    if (m_jump_timer > get_jump_time())
    {
        m_jumping = false;
        m_falling = true;
    }

    if (m_jumping)
    {
        m_delta.y += 3.0f * (0.5f - float(m_jump_timer)) * seconds * get_jump_speed() * TILE_SIZE_Y;
        m_falling = true;
        //m_delta.y += (1.0f - sq(float(m_jump_timer) - 1.0f)) * seconds * get_fall_speed() * TILE_SIZE_Y;
    }
    else if(tile_here != tileid::wall)
    {
        m_delta.y -= get_fall_speed() * TILE_SIZE_Y * seconds;
    }

    /* Try to move left and right depending on our state */
    switch (m_state)
    {
    case actorstate::go_left:
        m_delta.x -= get_walk_speed() * TILE_SIZE_X * seconds;
        break;
    case actorstate::go_right:
        m_delta.x += get_walk_speed() * TILE_SIZE_X * seconds;
        break;
    case actorstate::free:
        /* FIXME: fish and bird mode? */
        break;
    }

    /* Handle effects from surrounding tiles */
    switch (tile_here)
    {
        case tileid::wall:
            /* Inside a wall? Push actor outside! */
            while (sqlength(m_delta) < 0.5 * 0.5 * (TILE_SIZE_X * TILE_SIZE_Y))
                m_delta = m_delta * 1.05f + vec2(rand(0.01f));
            break;
        case tileid::slope_down:
            if (m_delta.y <= 0.5f * TILE_SIZE_Y - m_delta.x)
                m_falling = false;
            m_delta.y = max(m_delta.y, 0.5f * TILE_SIZE_Y - m_delta.x);
            break;
        case tileid::slope_up:
            if (m_delta.y <= 0.5f * TILE_SIZE_Y + m_delta.x)
                m_falling = false;
            m_delta.y = max(m_delta.y, 0.5f * TILE_SIZE_Y + m_delta.x);
            break;
        default:
            break;
    }

    switch (tile_left)
    {
        case tileid::wall:
            m_delta.x = max(m_delta.x, -0.01f);
            break;
        default:
            break;
    }

    switch (tile_right)
    {
        case tileid::wall:
            m_delta.x = min(m_delta.x, 0.01f);
            break;
        default:
            break;
    }

    switch (tile_above)
    {
        case tileid::wall:
        case tileid::slope_down:
        case tileid::slope_up:
            if (m_delta.y > 0.f)
            {
                m_jumping = false;
                m_falling = true;
                m_delta.y = 0.f;
            }
            break;
        default:
            break;
    }

    switch (tile_below)
    {
        case tileid::wall:
            if (m_delta.y < 0.f)
                m_falling = false;
            m_delta.y = max(m_delta.y, 0.f);
            break;
        case tileid::slope_down:
            if (m_delta.y <= -0.5f * TILE_SIZE_Y - m_delta.x)
                m_falling = false;
            m_delta.y = max(m_delta.y, -0.5f * TILE_SIZE_Y - m_delta.x);
            break;
        case tileid::slope_up:
            if (m_delta.y <= -0.5f * TILE_SIZE_Y + m_delta.x)
                m_falling = false;
            m_delta.y = max(m_delta.y, -0.5f * TILE_SIZE_Y + m_delta.x);
            break;
        default:
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

float actor::get_walk_speed() const
{
    switch (m_type)
    {
        case animaltype::cat:
            return CAT_SPEED_WALK;
        case animaltype::elephant:
            return ELEPHANT_SPEED_WALK;
        case animaltype::mouse:
            return MOUSE_SPEED_WALK;
        case animaltype::turd:
            return TURD_SPEED_WALK;
        case animaltype::bird:
            return BIRD_SPEED_WALK;
    }
    return 0.0f;
}

float actor::get_jump_speed() const
{
    switch (m_type)
    {
        case animaltype::cat:
            return CAT_SPEED_JUMP;
        case animaltype::elephant:
            return ELEPHANT_SPEED_JUMP;
        case animaltype::mouse:
            return MOUSE_SPEED_JUMP;
        case animaltype::turd:
            return TURD_SPEED_JUMP;
        case animaltype::bird:
            return BIRD_SPEED_JUMP;
    }
    return 0.0f;
}

float actor::get_jump_time() const
{
    switch (m_type)
    {
        case animaltype::cat:
            return CAT_TIME_JUMP;
        case animaltype::elephant:
            return ELEPHANT_TIME_JUMP;
        case animaltype::mouse:
            return MOUSE_TIME_JUMP;
        case animaltype::turd:
            return TURD_TIME_JUMP;
        case animaltype::bird:
            return BIRD_TIME_JUMP;
    }
    return 0.0f;
}

float actor::get_fall_speed() const
{
    switch (m_type)
    {
        case animaltype::cat:
            return CAT_SPEED_FALL;
        case animaltype::elephant:
            return ELEPHANT_SPEED_FALL;
        case animaltype::mouse:
            return MOUSE_SPEED_FALL;
        case animaltype::turd:
            return TURD_SPEED_FALL;
        case animaltype::bird:
            return BIRD_SPEED_FALL;
    }
    return 0.0f;
}

tileid actor::get_tile(ivec2 pos) const
{
    tileid tile = g_game->m_level->get_tile(pos);

    if (tile == tileid::mouse_passage && m_type != animaltype::mouse)
        tile = tileid::wall;

    return tile;
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

    bigtileid body_tid;

    /* Offset tile information depending on the animal type */
    body_tid = bigtileid(int(bigtileid::player_idle) + 0x8 * int(m_type));

    /* Birds never fall and always move */
    if (m_type == animaltype::bird)
    {
        m_falling = m_jumping = false;
        m_moving = true;
    }

    /* Render body (big tile) */
    int tid = int(body_tid);
    float delta = 0.f;
    vec2 scale(m_eastward ? 1.f : -1.f, 1.f);
    vec2 oldscale(m_eastward ? 1.f : -1.f, 1.f);

    if (m_target_type != animaltype::none)
    {
        float skew = (2.f / MORPH_DURATION) * lol::abs(0.5f * MORPH_DURATION - m_morph_timer);
        scale.x *= skew;
        scale.y /= skew + 1e-6f;
        delta = 1.0f - skew;
    }

    if (m_falling || m_jumping)
    {
        // jump pose
        if (m_type == animaltype::cat)
        {
            tid += 3;
        }
        else if (m_type == animaltype::elephant)
        {
            tid += 2;
        }
        else if (m_type == animaltype::mouse)
        {
            tid += 1;
        }
        else if (m_type == animaltype::turd)
        {
        }
        else if (m_type == animaltype::bird)
        {
        }
    }
    else if (m_moving)
    {
        // walk loop
        if (m_type == animaltype::cat)
        {
            double anim_debug = lol::fmod(m_timer / .35, 1.0);
            tid += anim_debug < 0.333 ? 2 : anim_debug < 0.666 ? 3 : 4;
        }
        else if (m_type == animaltype::elephant)
        {
            double anim_debug = lol::fmod(m_timer / 0.55, 1.0);
            tid += anim_debug < 0.333 ? 0 : anim_debug < 0.666 ? 2 : 3;
        }
        else if (m_type == animaltype::mouse)
        {
            double anim_debug = lol::fmod(m_timer / 0.25, 1.0);
            tid += anim_debug < 0.5 ? 0 : 1;
        }
        else if (m_type == animaltype::turd)
        {
            //double anim_debug = lol::fmod(m_timer / 0.55, 1.0);
            //tid += anim_debug < 0.333 ? 0 : anim_debug < 0.666 ? 2 : 3;
        }
        else if (m_type == animaltype::bird)
        {
            double anim_debug = lol::fmod(m_timer / 0.35, 1.0);
            tid += anim_debug < 0.333 ? 0 : anim_debug < 0.666 ? 1 : 2;
        }
    }
    else
    {
        // idle loop
        double anim_debug = lol::fmod(m_timer / 1.10, 1.0);
        tid += anim_debug < 0.5 ? 0 : 1;
    }

    for (int i = 0; i < (1 + delta * 10); ++i)
    {
        vec3 pos = m_position + vec3(0.f, 0.f, 1.f);
        pos.x += (0.5f - scale.x) * TILE_SIZE_X;

        pos.x += rand(-delta, delta) * 0.3f * TILE_SIZE_X;
        pos.y += rand(-delta, delta) * 0.2f * TILE_SIZE_Y;

        scene.AddTile(g_game->m_bigtiles, tid, pos, 0, scale, 0.f);

        // debug
        //scene.AddTile(g_game->m_tiles, 0x10, vec3(pos.xy, 10.f), 0, vec2(0.1f), 0.f);
    }

#if 0 // shitty
    if (m_target_type != animaltype::none)
    {
        vec3 pos = m_position;
        pos.x += (0.5f - oldscale.x) * TILE_SIZE_X;
        pos.y -= 0.5f * TILE_SIZE_X;

        float skew = (2.f / MORPH_DURATION) * lol::abs(0.5f * MORPH_DURATION - m_morph_timer);
        int frame = skew > 0.666 ? 0 : skew > 0.333 ? 1 : 2;
        scene.AddTile(g_game->m_bigtiles, int(bigtileid::ball) + frame, pos, 0, oldscale, 0.f);
    }
#endif

    if (m_type == animaltype::turd)
    {
        // Use morph timer because it’ll run forever
        vec3 pos = m_position + vec3(-7.5f * TILE_SIZE_X, -7.5f * TILE_SIZE_Y, 0.f);
        float angle = (float)radians(lol::fmod(m_morph_timer / 6.0, 1.0) * 360);
        pos.x += 0.f * TILE_SIZE_X * lol::cos(angle);
        pos.y += 0.f * TILE_SIZE_Y * lol::sin(angle);
        scene.AddTile(g_game->m_supertiles, 3, pos, 0, vec2(2.f), -2.f * angle);
    }

    // Debug stuff
    //scene.AddTile(g_game->m_tiles, int(tileid::select), vec3(m_tile.x * TILE_SIZE_X, -m_tile.y * TILE_SIZE_Y, 0.f), 0, vec2(1.f), 0.f);
}

void actor::move(actorstate state)
{
    if (m_state != state)
        m_timer = 0.0;
    m_state = state;

    /* Correct movement boolean and facing direction */
    switch (state)
    {
        case actorstate::go_right:
            m_moving = true;
            m_eastward = true;
            break;
        case actorstate::go_left:
            m_moving = true;
            m_eastward = false;
            break;
        default:
            m_moving = false;
            break;
    }
}

void actor::morph(animaltype type)
{
    /* If we already have a two-button target, cancel */
    if (m_target_type == animaltype::turd || m_target_type == animaltype::bird)
        return;

    /* If a transition is ongoing, cancel */
    if (m_target_type != animaltype::none && m_morph_timer >= 0.5f * MORPH_DURATION)
        return;

    /* If no change, cancel */
    if (type == m_type)
        return;

    if (m_target_type == animaltype::none)
        m_morph_timer = 0.0;

    m_target_type = type;
}

void actor::jump()
{
    if (!m_jumping && !m_falling)
    {
        m_jump_timer = 0.0;
        m_jumping = true;
    }
}

