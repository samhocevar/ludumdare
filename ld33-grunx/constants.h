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

static float const MONSTER_SPEED_X = 3.f;
static float const MONSTER_SPEED_Y = 3.f;

/* The IDs of our tiles */
enum class tileid : uint16_t
{
    empty = 0,

    wall_gen = 0x40,
    wall_box = 0x41,
    wall_hole = 0x42,

    stairs_up = 0x43,
    stairs_down = 0x44,

    skull = 0x80,

    heart = 0x180,
    spikes = 0x181,

    /* Monster animations */
    monster_idle = 0x1c0,

    monster_right_body = 0x240,
    monster_right_foot = 0x24a,
    monster_right_hand = 0x286,

    monster_left_body = 0x2c0,
    monster_left_foot = 0x2ca,
    monster_left_hand = 0x306,

    /* Hero animations */
};

