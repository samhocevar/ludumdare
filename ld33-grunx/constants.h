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

#pragma once

/* The size of the window we create */
static int const WINDOW_SIZE_X = 900;
static int const WINDOW_SIZE_Y = 600;

static int const TILE_SIZE_X = 16;
static int const TILE_SIZE_Y = 16;

/* How many tiles we use for the background layer before wrapping */
static int const BG_SIZE_X = 12;
static int const BG_SIZE_Y = 8;

static float const MONSTER_SPEED_WALK = 6.f;
static float const MONSTER_SPEED_CLIMB = 4.f;
static float const MONSTER_SPEED_FALL = 8.f;
static float const MONSTER_SPEED_JUMP = 6.f;

/* The IDs of our tiles */
enum class tileid : uint16_t
{
    empty = 0x00,
    select = 0x18b,

    background = 0x08,

    wall = 0x80,
    wall_start = wall,
    wall_end = 0x100,

    stairs_up = 0x40,
    stairs_down = 0x41,

    shoot_right = 0x107,
    shoot_left = 0x108,
    arrow_right = 0x109,
    arrow_left = 0x10a,

    heart = 0x180,
    spikes = 0x181,
    ladder = 0x184,

    hero_start = 0x182,
    monster_start = 0x183,
    treasure = 0x187,

    /* Monster animations */
    monster_idle = 0x1c0,
    monster_sqashed = 0x1c6,

    monster_right_body = 0x1ca,
    monster_right_foot = 0x1ca + 0x0a,
    monster_right_hand = 0x1ca + 0x46,

    monster_left_body = 0x24a,
    monster_left_foot = 0x24a + 0x0a,
    monster_left_hand = 0x24a + 0x46,

    /* Hero animations */
    hero_right_body = 0x1ca + 0x100,
    hero_right_foot = 0x1ca + 0x10a,
    hero_right_hand = 0x1ca + 0x146,

    hero_left_body = 0x24a + 0x100,
    hero_left_foot = 0x24a + 0x10a,
    hero_left_hand = 0x24a + 0x146,
};

