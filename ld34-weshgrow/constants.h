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

#pragma once

/* The size of the window we create */
static int const WINDOW_SIZE_X = 900;
static int const WINDOW_SIZE_Y = 600;

static int const VIEWPORT_SIZE_X = 320;
static int const VIEWPORT_SIZE_Y = 240;

static int const TILE_SIZE_X = 16;
static int const TILE_SIZE_Y = 16;

/* Tile IDs */
enum class tileid : uint16_t
{
    empty = 0x00,

    /* Special tiles */
    special_start = 0x02,

    /* Moving objects */
    ship = 0x40,
    thrust_small = 0x41, // 4 frames

    /* Ground tiles */
    ground_top = 0x80,
    ground_full = 0xc0,
};

