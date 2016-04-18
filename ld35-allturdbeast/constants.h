//
//  All Turd Beast — Entry for Ludum Dare 35
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
static int const WINDOW_SIZE_X = 800;
static int const WINDOW_SIZE_Y = 466;

static int const VIEWPORT_SIZE_X = 200;
static int const VIEWPORT_SIZE_Y = 120;

static int const TILE_SIZE_X = 16;
static int const TILE_SIZE_Y = 16;

/* How many tiles we use for the background layer before wrapping */
static int const BG_SIZE_X = 12;
static int const BG_SIZE_Y = 8;

static float const SHAKE_CHARGE_DURATION = 0.14f; // enough for a 3-level fall
static float const SHAKE_DURATION = 0.4f;

static float const MORPH_DURATION = 0.4f;

static float const CAT_SPEED_WALK = 10.0f;
static float const CAT_SPEED_FALL = 14.0f; // fall speed must be > walk speed
static float const CAT_SPEED_JUMP = 10.0f;
static float const CAT_TIME_JUMP = 0.35f;

static float const ELEPHANT_SPEED_WALK = 3.0f;
static float const ELEPHANT_SPEED_FALL = 20.0f;
static float const ELEPHANT_SPEED_JUMP = 1.0f;
static float const ELEPHANT_TIME_JUMP = 0.1f;

static float const MOUSE_SPEED_WALK = 6.0f;
static float const MOUSE_SPEED_FALL = 10.0f;
static float const MOUSE_SPEED_JUMP = 0.0f;
static float const MOUSE_TIME_JUMP = 0.0f;

static float const BIRD_SPEED_WALK = 3.0f;
static float const BIRD_SPEED_FALL = 0.0f;
static float const BIRD_SPEED_JUMP = 0.0f;
static float const BIRD_TIME_JUMP = 0.0f;

static float const TURD_SPEED_WALK = 0.0f;
static float const TURD_SPEED_FALL = 0.0f;
static float const TURD_SPEED_JUMP = 0.0f;
static float const TURD_TIME_JUMP = 0.0f;

/* The IDs of our tiles */
enum class tileid : uint16_t
{
    empty = 0x00,
    player_start = 0x01,
    select = 0x02,
    orb = 0x03,

    wall = 0x10,
    wall_start = wall,
    wall_end = 0x20,

    slope_up = 0x20,
    slope_down = 0x21,

    mouse_passage = 0x24, // +6
    elephant_passage = 0x2a, // +1

    background = 0x40,
    /* ... and the following four 2×2 tiles (5 in total) */
};

enum class bigtileid : uint16_t
{
    ray = 0x2,
    orb = 0x15,
    player_idle = 0x18,
};
