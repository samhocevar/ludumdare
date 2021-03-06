﻿//
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
  : m_thrust_left(false),
    m_thrust_right(false),
    m_thruster_count(0),
    m_cockpit_count(1),
    m_timer(0.0)
{
    setup_hull();
}

ship::~ship()
{
}

void ship::setup_hull()
{
    m_hull.empty();
    m_thrusters.empty();

    int line = 0;

    /* Build the thruster lines */
    if (m_thruster_count > 0)
    {
        int n = m_thruster_count > 4 ? (m_thruster_count + 1) / 2 : m_thruster_count;
        for (int i = 0; i < n; ++i)
        {
            int x = 12 * i - 6 * n + 6;
            int y = line * 10;
            m_hull << hull_piece { ivec2(x, y), tileid::hull_2 };
            m_thrusters << ivec3(x, y - 14, 2);
        }
        ++line;
    }

    if (m_thruster_count > 4)
    {
        int n = m_thruster_count / 2;
        for (int i = 0; i < m_thruster_count / 2; ++i)
        {
            int x = 12 * i - 6 * n + 6;
            int y = line * 10;
            m_hull << hull_piece { ivec2(x, y), tileid::hull_2 };
            m_thrusters << ivec3(x, y - 14, 2);
        }
        ++line;
    }

    // The original two thrusters are always here
    m_thrusters << ivec3(-5, line * 10 - 14, 1);
    m_thrusters << ivec3(5, line * 10 - 14, 1);

    /* Build the cockpit lines */
    ivec3 layout(m_cockpit_count, 0, 0);
    for (int i = 0; i < m_cockpit_count; ++i)
    {
        if (layout[0] - layout[1] > 2)
            --layout[0], ++layout[1];
        if (layout[1] - layout[2] > 2)
            --layout[1], ++layout[2];
        if (layout[0] - layout[1] > 1 && layout[1] - layout[2] > 1)
            --layout[0], ++layout[2];
    }

    //for (int n : layout) // XXX: this causes the MS compiler to crash
    for (int nn = 0; nn < 3; ++nn)
    {
        int n = layout[nn];
        if (n > 0)
        {
            for (int i = 0; i < n; ++i)
            {
                int x = 12 * i - 6 * n + 6;
                int y = line * 10;
                m_hull << hull_piece { ivec2(x, y), x < 0 ? tileid::hull_4 : x > 0 ? tileid::hull_3 : tileid::ship };

            }
            ++line;
        }
    }
}

void ship::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    /* FIXME: we shouldn’t be ticked here */
    if (!g_game->m_level)
        return;

    m_timer += seconds;

    vec3 old_velocity = m_velocity;
    vec3 old_rotation_velocity = m_rotation_velocity;

    /* Step 1: apply physics */

    /* Gravity */
    float const gravity_accel = 5.f;
    vec3 gravity(0.f, -gravity_accel, 0.f);
    m_velocity += gravity * seconds;

    /* Thrusters; both sides contribute to the forward motion */
    float const thrust_power = 8.f;
    float thrust_power_middle = thrust_power * get_thrust_middle_force();
    vec3 thrust_dir = m_rotation * vec3(0.f, 1.f, 0.f);
    m_velocity += thrust_dir * thrust_power_middle * seconds;

    /* Thrusters for rotation */
    float const thrust_rotate_power = 0.5f;
    float thrust_power_left = thrust_power * get_thrust_left_force();
    float thrust_power_right = thrust_power * get_thrust_right_force();
    m_rotation_velocity.z += (thrust_power_right - thrust_power_left) * thrust_rotate_power * seconds;

    m_velocity *= lol::pow(1.f - 4.f / 60.f, 60.f * seconds);
    m_rotation_velocity *= lol::pow(1.f - 20.f / 60.f, 60.f * seconds);

    m_rotation *= slerp(quat(1.f), quat::fromeuler_xyz(m_rotation_velocity), 0.5f);
    m_position += 0.5f * (old_velocity + m_velocity);

    /* Step 2: detect collisions */

    tileid bonus_tile = tileid::empty;
    vec3 bonus_pos(0.f);

    vec3 right = m_rotation * vec3(1.f, 0.f, 0.f);
    vec3 front = m_rotation * vec3(0.f, 1.f, 0.f);

    float correct_n = 0.f, correct_s = 0.f, correct_w = 0.f, correct_e = 0.f;

    for (auto const &hull : m_hull)
    {
        vec2 pos = m_position.xy + float(hull.pos.x) * right.xy + float(hull.pos.y) * front.xy;

        /* Tile coordinates, non-integer */
        vec2 ftile = pos / vec2(TILE_SIZE_X, -TILE_SIZE_Y);
        /* Tile coordinates, integer (rounded) */
        ivec2 tile = ivec2(ftile + vec2(0.5f, 0.5f));

        auto tile_here = g_game->m_level->get_tile(tile);
        auto tile_below = g_game->m_level->get_tile(tile + ivec2(0, 1));
        auto tile_above = g_game->m_level->get_tile(tile + ivec2(0, -1));
        auto tile_left = g_game->m_level->get_tile(tile + ivec2(-1, 0));
        auto tile_right = g_game->m_level->get_tile(tile + ivec2(1, 0));

        /* Are we close to a bonus tile? */
        for (int n = g_game->m_level->m_bonus.count(); n--; )
        {
            /* Can only grab the “next level” tile if it’s the last one */
            if (g_game->m_level->m_bonus[n].m2 == tileid::bonus_go
                 && g_game->m_level->m_bonus.count() != 1)
                continue;

            if (distance(pos, g_game->m_level->m_bonus[n].m1.xy) < 0.7f * TILE_SIZE_X)
            {
                bonus_tile = g_game->m_level->m_bonus[n].m2;
                bonus_pos = g_game->m_level->m_bonus[n].m1;
                g_game->m_level->m_bonus.remove(n);
            }
        }

        if (blocks_n(tile_below))
        {
            if (pos.y < float(tile.y * -TILE_SIZE_Y))
                correct_n = max(correct_n, float(tile.y * -TILE_SIZE_Y) - pos.y);
        }

        if (blocks_s(tile_above))
        {
            if (pos.y > float(tile.y * -TILE_SIZE_Y))
                correct_s = min(correct_s, float(tile.y * -TILE_SIZE_Y) - pos.y);
        }

        if (blocks_e(tile_left))
        {
            if (pos.x < float(tile.x * TILE_SIZE_X))
                correct_e = max(correct_e, float(tile.x * TILE_SIZE_X) - pos.x);
        }

        if (blocks_w(tile_right))
        {
            if (pos.x > float(tile.x * TILE_SIZE_X))
                correct_w = min(correct_w, float(tile.x * TILE_SIZE_X) - pos.x);
        }
    }

    if (correct_n || correct_s || correct_e || correct_w)
    {
        if (correct_n)
        {
            /* Special case: try to readjust along the vertical */
            if (front.y > 0.95f)
            {
                m_velocity.y *= -0.2f;
                m_rotation = slerp(m_rotation, quat::rotate(0.f, 0.f, 0.f, 0.f), 0.8f);
            }
            else
            {
                m_velocity.y *= -0.9f;
            }
        }

        if (correct_s)
            m_velocity.y *= front.y < -0.95f ? -0.2f : -0.9f;

        if (correct_w)
            m_velocity.x *= front.x > 0.95f ? -0.2f : -0.9f;

        if (correct_e)
            m_velocity.x *= front.x < -0.95f ? -0.2f : -0.9f;

        if (length(m_velocity) > 1.f)
        {
            if (g_game->m_shake_duration < 0.7f * SHAKE_DURATION)
                sampler::play_sample(g_game->m_fx_crash);

            g_game->m_shake_duration = SHAKE_DURATION;
        }
    }

    m_position.x += correct_w + correct_e;
    m_position.y += correct_n + correct_s;

    /* Misc 1: exhausts */

    for (int i = m_exhausts.count(); i--; )
    {
        m_exhausts[i].vel += gravity * seconds;
        m_exhausts[i].pos += m_exhausts[i].vel * seconds;

        m_exhausts[i].life -= seconds;
        if (m_exhausts[i].life < 0)
            m_exhausts.remove(i);
    }

    if (true)//m_exhausts.count() < 100)
    {
        for (auto &th : m_thrusters)
        {
            if ((th.x <= 0 && m_thrust_left) || (th.x >= 0 && m_thrust_right))
            {
                m_exhausts.push(exhaust());
                /* Slight shift up, so that it appears to come from the actual exhaust */
                m_exhausts.last().pos = m_position + front * th.y + right * th.x + front * 0.4f * TILE_SIZE_Y;
                m_exhausts.last().vel = m_velocity - front * rand(60.f, 80.f) + right * rand(-60.f, 60.f);
                m_exhausts.last().life = rand(0.5f, 1.f) * EXHAUST_LIFETIME;
                m_exhausts.last().angle = radians(rand(360.f));
            }
        }
    }

    /* Misc 2: bonus */
    if (bonus_tile != tileid::empty)
    {
        sampler::play_sample(g_game->m_fx_bonus);
        if (bonus_tile == tileid::bonus_cockpit)
            ++m_cockpit_count;
        if (bonus_tile == tileid::bonus_thruster)
            ++m_thruster_count;
        if (bonus_tile == tileid::bonus_go)
            g_game->m_next_level = true;
        setup_hull();
    }
}

void ship::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    quat rot = m_rotation;
    float heading = -vec3::toeuler_xyz(rot).z;
    /* XXX: test clamping rotation to 16 orientations */
    //heading = F_PI / 8.f * round(heading / (F_PI / 8.f));
    //rot = quat::fromeuler_xyz(0.f, 0.f, -heading);
    vec3 right = rot * vec3(1.f, 0.f, 0.f);
    vec3 front = rot * vec3(0.f, 1.f, 0.f);

    vec3 pos = m_position;
    //pos.x = round(pos.x);
    //pos.y = round(pos.y);

    for (auto const &hull : m_hull)
        scene.AddTile(g_game->m_tiles, int(hull.id), pos + right * hull.pos.x + front * hull.pos.y, 0, vec2(1.f), heading);

    int thrust_small_frame = int(tileid::thrust_small) + int(m_timer * 10.f) % 4;
    int thrust_large_frame = int(tileid::thrust_large) + int(m_timer * 10.f) % 4;

    /* Thrusters on/off sprite */
    for (auto &th : m_thrusters)
    {
        if ((th.x <= 0 && m_thrust_left) || (th.x >= 0 && m_thrust_right))
            scene.AddTile(g_game->m_tiles, th.z == 1 ? thrust_small_frame : thrust_large_frame, pos + front * th.y + right * th.x, 0, vec2(1.f), heading);
    }

    /* Exhaust particles */
    for (auto &ex : m_exhausts)
    {
        int frame = clamp(int(5.f * (EXHAUST_LIFETIME - ex.life) / EXHAUST_LIFETIME), 0, 5);
        scene.AddTile(g_game->m_tiles, int(tileid::exhaust) + frame, ex.pos, 0, vec2(1.f), ex.angle);
    }
}

float ship::get_mass()
{
    /* Each hull piece contributes 0.7 units of mass except the first one */
    return 1.0f + 0.7f * (m_hull.count() - 1);
}

float ship::get_thrust_left_force()
{
    int total = 0;
    for (auto &th : m_thrusters)
        if (th.x <= 0)
            total += th.z;

    return m_thrust_left ? total / get_mass() : 0.f;
}

float ship::get_thrust_right_force()
{
    int total = 0;
    for (auto &th : m_thrusters)
        if (th.x >= 0)
            total += th.z;

    return m_thrust_right ? total / get_mass() : 0.f;
}

float ship::get_thrust_middle_force()
{
    if (m_thrust_left && m_thrust_right)
    {
        int total = 0;
        for (auto &th : m_thrusters)
            total += th.z;
        return total / get_mass();
    }

    /* If only one thruster is on, it only contributes to 1/4 of the forward motion */
    if (m_thrust_left)
        return 0.25f * get_thrust_left_force();

    if (m_thrust_right)
        return 0.25f * get_thrust_right_force();

    return 0.f;
}

