//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#pragma once

static int TILE_SIZE = 64;

/* The size of the window we create */
static int WINDOW_SIZE_X = 1024;
static int WINDOW_SIZE_Y = 720;

/* The minimum and maximum sizes of the playing area, in world coordinates */
static int MIN_VIEWPORT_X = TILE_SIZE * 16;
static int MIN_VIEWPORT_Y = TILE_SIZE * 12;
static int MAX_VIEWPORT_X = TILE_SIZE * 40;
static int MAX_VIEWPORT_Y = TILE_SIZE * 30;

/* Player runs at 12 tiles per second, enemies are slower */
static float PLAYER_RUN_SPEED = TILE_SIZE * 12.f;
static float ENEMY_RUN_SPEED = TILE_SIZE * 8.f;

/* 30 / 120 are good values to prevent player from jumping
 * on 4-block platforms. For 3-block platforms, use 24 / 100. */
static float PLAYER_JUMP_SPEED = TILE_SIZE * 30.f;
static float GRAVITY = TILE_SIZE * 120.f;

/* Number of seconds during which pressing the jump button has
 * an effect. This allows for short and long jumps. */
static float PLAYER_JUMP_TIME = 0.100f;

/* Maximum speeds, including in free fall. */
static float PLAYER_MAX_SPEED = TILE_SIZE * 35.f;
static float OBJECT_MAX_SPEED = TILE_SIZE * 20.f;
static float PROJECTILE_MAX_SPEED = TILE_SIZE * 20.f;

/* Tiles */
enum Tiles
{
    PlayerGoRight = 0,
    PlayerGoLeft = 1,

    GroundTop = 16,
    GroundTopRight = 17,
    GroundTopLeft = 18,

    Blocker = 19,
    Spikes = 20,
    Door = 21,
    SawBlade = 22,
    Button = 23,
    Laser = 24,

    SittingEnemy = 32,
    WalkingEnemy = 33,
    FlyingGoRight = 48,
    FlyingGoLeft = 49,

    PinkProjectile = 64,
    PinkGun = 65,
    BlueProjectile = 66,
    BlueGun = 67,
    Key = 68, /* UNUSED */

    TitleScreen = 256,
    YouWinScreen = 257,
};
