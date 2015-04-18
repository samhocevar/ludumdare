﻿//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#pragma once

/* The size of the window we create */
static int WINDOW_SIZE_X = 800;
static int WINDOW_SIZE_Y = 600;

static int TILE_SIZE = 64;

/* Player goes at 8 tiles per second */
static float PLAYER_SPEED = TILE_SIZE * 12.f;
static float PLAYER_JUMP_SPEED = TILE_SIZE * 35.f;
static float GRAVITY = TILE_SIZE * 120.f;

/* The size of the viewport, in world coordinates */
static int VIEWPORT_SIZE_X = TILE_SIZE * 40;
static int VIEWPORT_SIZE_Y = TILE_SIZE * 30;
