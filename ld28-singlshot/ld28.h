//
// Ludum Dare 28 Entry
//
// Copyright: (c) 2013 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#include "core.h"

using namespace lol;

/* The screen resolution */
ivec2 const RESOLUTION(640, 480);

/* The arena size */
vec2 const ARENA(320.f, 240.f);

float const SCROLL_SPEED = 50.f;
float const SHIP_SPEED = 180.0f;
float const ROCKET_SPEED = 240.0f;

enum
{
    KEY_LEFT,
    KEY_RIGHT,
    KEY_UP,
    KEY_DOWN,
    KEY_FIRE,
    KEY_MAX,
};

