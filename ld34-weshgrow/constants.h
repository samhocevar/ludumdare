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

/* Stuff about the world */
static float const EXHAUST_LIFETIME = 0.8f;


/* Tile IDs */
enum class tileid : uint16_t
{
    empty = 0x00,

    /* Special tiles */
    special_start = 0x02,
    special_finish = 0x01,

    /* Animated tiles */
    arrow = 0x48, // 2 frames, 4 variants
    exhaust = 0x03, // 3 frames
    bonus_thrust = 0x8c,
    bonus_cockpit = 0x8d,

    /* Moving objects */
    ship = 0x40,
    hull_1 = 0x08,
    hull_2 = 0x09,
    hull_3 = 0x0a,
    hull_4 = 0x0b,
    thrust_small = 0x41, // 4 frames
    thrust_large = 0x4c, // 4 frames

    /* Ground tiles */
    ground_full = 0xc0,
    ground_se = 0x100,
    ground_sw = 0x140,
    ground_nw = 0x180,
    ground_ne = 0x1c0,
};

static inline bool blocks_n(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40); // Only check the line it belongs to
    return id == tileid::ground_full || id == tileid::ground_nw || id == tileid::ground_ne;
}

static inline bool blocks_s(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40);
    return id == tileid::ground_full || id == tileid::ground_sw || id == tileid::ground_se;
}

static inline bool blocks_w(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40);
    return id == tileid::ground_full || id == tileid::ground_sw || id == tileid::ground_nw;
}

static inline bool blocks_e(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40);
    return id == tileid::ground_full || id == tileid::ground_se || id == tileid::ground_ne;
}

static inline bool blocks_ne(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40);
    return id == tileid::ground_ne;
}

static inline bool blocks_nw(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40);
    return id == tileid::ground_nw;
}

static inline bool blocks_se(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40);
    return id == tileid::ground_se;
}

static inline bool blocks_sw(tileid id)
{
    id = tileid(int(id) / 0x40 * 0x40);
    return id == tileid::ground_sw;
}

static inline bool is_decoration(tileid id)
{
    return !blocks_n(id) && !blocks_s(id) && !blocks_e(id) && !blocks_w(id)
        && !blocks_ne(id) && !blocks_nw(id) && !blocks_se(id) && !blocks_sw(id);
}

static inline bool is_arrow(tileid id)
{
    return int(id) >= int(tileid::arrow) && int(id) < int(tileid::arrow) + 4;
}

static inline bool is_bonus(tileid id)
{
    return id == tileid::bonus_thrust || id == tileid::bonus_cockpit;
}

