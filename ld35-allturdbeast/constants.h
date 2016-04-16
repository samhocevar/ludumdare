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

#pragma once

/* The size of the window we create */
static int const WINDOW_SIZE_X = 900;
static int const WINDOW_SIZE_Y = 600;

static int const TILE_SIZE_X = 16;
static int const TILE_SIZE_Y = 16;

/* How many tiles we use for the background layer before wrapping */
static int const BG_SIZE_X = 12;
static int const BG_SIZE_Y = 8;

static float const PLAYER_SPEED_WALK = 15.0f;
static float const PLAYER_SPEED_FALL = 16.0f; // fall speed must be > walk speed
static float const PLAYER_SPEED_JUMP = 15.0f;

/* The IDs of our tiles */
enum class tileid : uint16_t
{
    empty = 0x00,
    player_start = 0x01,
    select = 0x02,

    background = 0x40,
    /* ... and the following four 2×2 tiles (5 in total) */

    wall = 0x10,
    wall_start = wall,
    wall_end = 0x20,

    stairs_up = 0x20,
    stairs_down = 0x21,

    player_idle = 0x60,
};

