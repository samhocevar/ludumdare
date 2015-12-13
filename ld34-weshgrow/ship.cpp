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
  : m_thrust_left(false),
    m_thrust_right(false),
    m_timer(0.0)
{
}

ship::~ship()
{
}

void ship::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

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

    /* Air drag (FIXME: not delta-timed) */
    m_velocity *= lol::pow(1.f - 4.f / 60.f, 60.f * seconds);
    m_rotation_velocity *= lol::pow(1.f - 20.f / 60.f, 60.f * seconds);

    m_rotation *= slerp(quat(1.f), quat::fromeuler_xyz(m_rotation_velocity), 0.5f);
    m_position += 0.5f * (old_velocity + m_velocity);

    /* Step 2: detect collisions */

    /* Tile coordinates, non-integer */
    vec2 ftile = m_position.xy / vec2(TILE_SIZE_X, -TILE_SIZE_Y);
    /* Tile coordinates, integer */
    ivec2 tile = ivec2(ftile + vec2(0.5f, 0.5f));

    auto tile_here = g_game->m_level->get_tile(tile);
    auto tile_below = g_game->m_level->get_tile(tile + ivec2(0, 1));
    auto tile_above = g_game->m_level->get_tile(tile + ivec2(0, -1));
    auto tile_left = g_game->m_level->get_tile(tile + ivec2(-1, 0));
    auto tile_right = g_game->m_level->get_tile(tile + ivec2(1, 0));

    if (blocks_top(tile_below))
    {
        if (m_position.y < float(tile.y * -TILE_SIZE_Y))
            m_velocity.y = 0.0f;
        m_position.y = max(m_position.y, float(tile.y * -TILE_SIZE_Y));
    }

    if (blocks_bottom(tile_above))
        m_position.y = min(m_position.y, float(tile.y * -TILE_SIZE_Y));

    if (blocks_right(tile_left))
        m_position.x = max(m_position.x, float(tile.x * TILE_SIZE_X));

    if (blocks_left(tile_right))
        m_position.x = min(m_position.x, float(tile.x * TILE_SIZE_X));
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

    scene.AddTile(g_game->m_tiles, int(tileid::ship), pos, 0, vec2(1.f), degrees(heading));

    int thrust_small_frame = int(tileid::thrust_small) + int(m_timer * 10.f) % 4;

    if (m_thrust_left)
        scene.AddTile(g_game->m_tiles, thrust_small_frame, pos - front * 14 - right * 5, 0, vec2(1.f), degrees(heading));
    if (m_thrust_right)
        scene.AddTile(g_game->m_tiles, thrust_small_frame, pos - front * 14 + right * 5, 0, vec2(1.f), degrees(heading));
}

float ship::get_mass()
{
    return 1.f;
}

float ship::get_thrust_left_force()
{
    /* FIXME: compute how many thrusters we have depending on the ship configuration! */
    return m_thrust_left ? 1.f / get_mass() : 0.f;
}

float ship::get_thrust_right_force()
{
    return m_thrust_right ? 1.f / get_mass() : 0.f;
}

float ship::get_thrust_middle_force()
{
    /* If only one thrusters is on, it only contributes to 1/4 of the forward motion */
    return (!m_thrust_left && !m_thrust_right) ? 0.f
         : ((m_thrust_left && m_thrust_right) ? 2.f : 0.5f) / get_mass();
}

