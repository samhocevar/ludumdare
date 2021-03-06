﻿//
//  Singlshot — A shooter developed for Ludum Dare 28
//
//  Copyright © 2013 Sam Hocevar <sam@hocevar.net>
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
//

#include <lol/engine.h>

using namespace lol;

/* The screen resolution */
ivec2 const RESOLUTION(640, 480);

/* The arena size */
vec2 const ARENA(320.f, 240.f);

float const SCROLL_SPEED = 15.f;
float const POWERUP_SPEED = 100.0f;
float const SHIP_SPEED = 180.0f;
float const ROCKET_SPEED = 320.0f;
float const BULLET_SPEED = 80.0f;

enum
{
    KEY_LEFT,
    KEY_RIGHT,
    KEY_UP,
    KEY_DOWN,
    KEY_FIRE,
    KEY_MAX,
};

