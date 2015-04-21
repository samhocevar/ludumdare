//
// Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32 3000
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#pragma once

static int const TILE_SIZE = 64;

/* The size of the window we create */
static int const WINDOW_SIZE_X = 1024;
static int const WINDOW_SIZE_Y = 720;

/* The minimum and maximum sizes of the playing area, in world coordinates */
static int const MIN_VIEWPORT_X = TILE_SIZE * 16;
static int const MIN_VIEWPORT_Y = TILE_SIZE * 12;
static int const MAX_VIEWPORT_X = TILE_SIZE * 40;
static int const MAX_VIEWPORT_Y = TILE_SIZE * 30;

/* Player runs at 12 tiles per second, monsters are slower */
static float const PLAYER_RUN_SPEED = TILE_SIZE * 12.f;
static float const MONSTER_RUN_SPEED = TILE_SIZE * 8.f;

/* 30 / 120 are good values to prevent player from jumping
 * on 4-block platforms. For 3-block platforms, use 24 / 100. */
static float const PLAYER_JUMP_SPEED = TILE_SIZE * 30.f;
static float const GRAVITY = TILE_SIZE * 120.f;

/* Number of seconds during which pressing the jump button has
 * an effect. This allows for short and long jumps. */
static float const PLAYER_JUMP_TIME = 0.100f;

/* Maximum speeds, including in free fall. */
static float const PLAYER_MAX_SPEED = TILE_SIZE * 35.f;
static float const OBJECT_MAX_SPEED = TILE_SIZE * 20.f;
static float const PROJECTILE_MAX_SPEED = TILE_SIZE * 20.f;

/* Tiles */
enum Tiles
{
    /* Bits: down up right left, 1 means open */
    Button = 2,
    Laser = 3,

    PinkProjectile = 8,
    PinkGun = 9,
    BlueProjectile = 10,
    BlueGun = 11,

    Ground = 32,

    /* Old tiles */
    PlayerGoRight = 1000,
    PlayerGoLeft = 1001,

    Blocker = 1019,
    Spikes = 1020,
    Door = 1021,
    SawBlade = 1022,

    SittingMonster = 1032,
    WalkingMonster = 1033,
    FlyingMonster = 1048,

    Key = 1068, /* UNUSED */

    TitleScreen = 256,
    YouWinScreen = 257,
};

