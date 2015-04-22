//
// Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#if HAVE_CONFIG_H
#   include "config.h"
#endif

#include <lol/engine.h>

using namespace lol;

#include "constants.h"
#include "thing.h"
#include "game.h"

thing::thing(thing_type t)
  : m_time(0.0),
    m_target_scale(1.f),
    m_scale(1.f),
    m_hidden(false),
    m_grounded(false),
    m_can_impulse(false),
    m_facing_left(false),
    m_jump_time(0.0f),
    m_type(t)
{
}

thing::~thing()
{
}

void thing::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    if (!g_game->is_paused())
        m_time += seconds;

    /* Make objects scale horizontally from the middle axis, but
     * vertically from the baseline. */
    vec3 delta(0.f);
    delta.x = (m_scale - 1.f) * (0.5f) * TILE_SIZE;
    delta.y = (m_scale - 1.f) * (0.0f) * TILE_SIZE;

    m_aabb = m_original_aabb * m_scale - delta;

    // FIXME: delta-time this shit!
    if (lol::abs(m_scale - m_target_scale) > 0.01f)
        m_scale = lerp(m_scale, m_target_scale, seconds * 15.0f);
    else
        m_scale = m_target_scale;
}

void thing::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);
}

bool thing::can_fall()
{
    switch (m_type)
    {
    case thing_type::none:
        return false;
    case thing_type::player:
    case thing_type::platform:
    case thing_type::blocker:
    case thing_type::monster_blocker:
    case thing_type::item_scaler:
    case thing_type::minus_ammo:
    case thing_type::plus_ammo:
    case thing_type::boulder:
    case thing_type::walking_monster:
    case thing_type::sitting_monster:
        return true;
    case thing_type::ground:
    case thing_type::door:
    case thing_type::spikes:
    case thing_type::button:
    case thing_type::projectile:
    case thing_type::flying_monster:
    case thing_type::laser:
        return false;
    }
    return false;
}

bool thing::can_kill()
{
    switch (m_type)
    {
    case thing_type::none:
        return false;
    case thing_type::player:
    case thing_type::ground:
    case thing_type::door:
    case thing_type::platform:
    case thing_type::blocker:
    case thing_type::monster_blocker:
    case thing_type::item_scaler:
    case thing_type::projectile:
    case thing_type::minus_ammo:
    case thing_type::plus_ammo:
    case thing_type::button:
        return false;
    case thing_type::spikes:
    case thing_type::boulder:
    case thing_type::walking_monster:
    case thing_type::sitting_monster:
    case thing_type::flying_monster:
    case thing_type::laser:
        return !m_hidden;
    }
    return false;
}

bool thing::can_block()
{
    switch (m_type)
    {
    case thing_type::none:
        return false;
    case thing_type::door:
    case thing_type::spikes:
    case thing_type::projectile:
    case thing_type::minus_ammo:
    case thing_type::plus_ammo:
    case thing_type::button:
    case thing_type::laser:
    case thing_type::monster_blocker:
    case thing_type::item_scaler:
    case thing_type::boulder:
    case thing_type::walking_monster:
    case thing_type::sitting_monster:
    case thing_type::flying_monster:
        return false;
    case thing_type::player:
    case thing_type::platform:
    case thing_type::ground:
    case thing_type::blocker:
        return true;
    }
    return false;
}

bool thing::can_block_monster()
{
    switch (m_type)
    {
    case thing_type::none:
        return false;
    case thing_type::player:
    case thing_type::door:
    case thing_type::projectile:
    case thing_type::minus_ammo:
    case thing_type::plus_ammo:
    case thing_type::item_scaler:
    case thing_type::button:
    case thing_type::laser:
    case thing_type::boulder:
    case thing_type::walking_monster:
    case thing_type::sitting_monster:
    case thing_type::flying_monster:
    case thing_type::spikes:
        return false;
    case thing_type::platform:
    case thing_type::ground:
    case thing_type::blocker:
    case thing_type::monster_blocker:
        return true;
    }
    return false;
}

bool thing::can_scale()
{
    switch (m_type)
    {
    case thing_type::none:
        return false;
    case thing_type::platform:
    case thing_type::ground:
    case thing_type::door:
    case thing_type::spikes:
    case thing_type::monster_blocker:
    case thing_type::item_scaler:
    case thing_type::projectile:
    case thing_type::minus_ammo:
    case thing_type::plus_ammo:
    case thing_type::laser:
        return false;
    case thing_type::player:
    case thing_type::blocker:
    case thing_type::button:
    case thing_type::boulder:
    case thing_type::walking_monster:
    case thing_type::sitting_monster:
    case thing_type::flying_monster:
        return true;
    }
    return false;
}

// Return collision time between two rectangular things
// Note: merely touching != collidiing
float collide(thing const *t1, vec3 v1,
              thing const *t2, vec3 v2, float min_time, float max_time)
{
    vec3 aa = t2->m_position + t2->m_aabb.aa - t1->m_aabb.bb;
    vec3 bb = t2->m_position + t2->m_aabb.bb - t1->m_aabb.aa;

    vec3 start = t1->m_position + (v1 - v2) * min_time;
    vec3 end = t1->m_position + (v1 - v2) * max_time;

    float const epsilon = 1e-5f * distance(start, end);

    // If the AABBs were already colliding, return 0.0f because collision
    // happens immediately.
    if (start.x > aa.x + epsilon && start.y > aa.y + epsilon
         && start.x < bb.x - epsilon && start.y < bb.y - epsilon)
        return 0.0f;

    float hit_ratio_left, hit_ratio_right, hit_ratio_bottom, hit_ratio_top;

    // Check the time needed to collide with the left or right vertical edges
    if (lol::abs(start.x - end.x) > epsilon)
    {
        hit_ratio_left   = (aa.x - start.x) / (end.x - start.x);
        hit_ratio_right  = (bb.x - start.x) / (end.x - start.x);
    }
    else
    {
        hit_ratio_left = hit_ratio_right = (start.x > aa.x && start.x < bb.x) ? 0.f : 1.0f;
    }

    // Check the time needed to collide with the bottom or top vertical edges
    if (lol::abs(start.y - end.y) > epsilon)
    {
        hit_ratio_bottom = (aa.y - start.y) / (end.y - start.y);
        hit_ratio_top    = (bb.y - start.y) / (end.y - start.y);
    }
    else
    {
        hit_ratio_bottom = hit_ratio_top = (start.y > aa.y && start.y < bb.y) ? 0.f : 1.0f;
    }

    // Compute the collision time
    float hit_ratio_x = 1.0f, hit_ratio_y = 1.0f;

    if (hit_ratio_left >= 0.f && hit_ratio_left < 1.0f)
        hit_ratio_x = min(hit_ratio_x, hit_ratio_left);
    if (hit_ratio_right >= 0.f && hit_ratio_right < 1.0f)
        hit_ratio_x = min(hit_ratio_x, hit_ratio_right);
    if (hit_ratio_bottom >= 0.f && hit_ratio_bottom < 1.0f)
        hit_ratio_y = min(hit_ratio_y, hit_ratio_bottom);
    if (hit_ratio_top >= 0.f && hit_ratio_top < 1.0f)
        hit_ratio_y = min(hit_ratio_y, hit_ratio_top);

    // This value could be “seconds”, it means there is either no collision
    // in X or no collision in Y.
    return mix(min_time, max_time, max(hit_ratio_x, hit_ratio_y));
}
