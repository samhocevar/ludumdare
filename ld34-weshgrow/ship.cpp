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

    /* Gravity */
    float const gravity_accel = 10.f;
    vec3 gravity(0.f, -gravity_accel, 0.f);
    m_velocity += gravity * seconds;

    /* FIXME: compute how many thrusters we have depending on the ship configuration! */
    float const thrust_power = 10.f;
    float thrust_power_left = thrust_power * get_thrust_left_force();
    float thrust_power_right = thrust_power * get_thrust_right_force();
    float thrust_power_middle = thrust_power * get_thrust_middle_force();

    /* Thrusters; both sides contribute to the forward motion */
    vec3 thrust_dir = m_rotation * vec3(0.f, 1.f, 0.f);
    m_velocity += thrust_dir * thrust_power_middle * seconds;

    /* Thrusters for rotation */
    m_rotation_velocity.z += (thrust_power_right - thrust_power_left) / 20.f * seconds;

    /* Air drag (FIXME: not delta-timed) */
    m_velocity -= m_velocity * 4.0f * seconds;
    m_rotation_velocity -= m_rotation_velocity * 2.0f * seconds;

    m_rotation *= slerp(quat(1.f), quat::fromeuler_xyz(m_rotation_velocity), 0.5f);
    m_position += 0.5f * (old_velocity + m_velocity);
}

void ship::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    float heading = -vec3::toeuler_xyz(m_rotation).z;
    vec3 right = m_rotation * vec3(1.f, 0.f, 0.f);
    vec3 front = m_rotation * vec3(0.f, 1.f, 0.f);

    scene.AddTile(g_game->m_tiles, int(tileid::ship), m_position, 0, vec2(1.f), degrees(heading));

    int thrust_small_frame = int(tileid::thrust_small) + int(m_timer * 10.f) % 4;

    if (m_thrust_left)
        scene.AddTile(g_game->m_tiles, thrust_small_frame, m_position - front * 14 - right * 5, 0, vec2(1.f), degrees(heading));
    if (m_thrust_right)
        scene.AddTile(g_game->m_tiles, thrust_small_frame, m_position - front * 14 + right * 5, 0, vec2(1.f), degrees(heading));

}

float ship::get_mass()
{
    return 1.f;
}

float ship::get_thrust_left_force()
{
    return m_thrust_left ? 1.f / get_mass() : 0.f;
}

float ship::get_thrust_right_force()
{
    return m_thrust_right ? 1.f / get_mass() : 0.f;
}

float ship::get_thrust_middle_force()
{
    /* If only one thrusters is on, it only contributes to 1/4 of the forward motion */
    return ((m_thrust_left && m_thrust_right) ? 2.f : 0.5f) / get_mass();
}

