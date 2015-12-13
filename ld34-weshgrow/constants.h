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

static int const VIEWPORT_SIZE_X = 300;
static int const VIEWPORT_SIZE_Y = 200;

static int const TILE_SIZE_X = 16;
static int const TILE_SIZE_Y = 16;

/* Tile IDs */
enum class tileid : uint16_t
{
    empty = 0x00,

    /* Special tiles */
    special_start = 0x02,

    /* Animated tiles */
    arrow = 0x48, // 2 frames, 4 variants

    /* Moving objects */
    ship = 0x40,
    thrust_small = 0x41, // 4 frames

    /* Ground tiles */
    ground_top = 0x80,
    ground_full = 0xc0,
    ground_se = 0x100,
    ground_sw = 0x140,
    ground_nw = 0x180,
    ground_ne = 0x1c0,
};

static inline bool blocks_top(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40); // Only check the line it belongs to
    return id == tileid::ground_full || id == tileid::ground_nw || id == tileid::ground_ne;
}

static inline bool blocks_bottom(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40); // Only check the line it belongs to
    return id == tileid::ground_full || id == tileid::ground_sw || id == tileid::ground_se;
}

static inline bool blocks_left(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40); // Only check the line it belongs to
    return id == tileid::ground_full || id == tileid::ground_sw || id == tileid::ground_nw;
}

static inline bool blocks_right(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40); // Only check the line it belongs to
    return id == tileid::ground_full || id == tileid::ground_se || id == tileid::ground_ne;
}

static inline bool is_decoration(tileid id)
{
    return !blocks_top(id) && !blocks_bottom(id) && !blocks_left(id) && !blocks_right(id);
}

static inline bool is_arrow(tileid id)
{
    return int(id) >= int(tileid::arrow) && int(id) < int(tileid::arrow) + 4;
}

