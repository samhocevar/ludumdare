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

ivec2 const RESOLUTION(320, 240);

float const SPEED = 30.0f;

enum
{
    KEY_LEFT,
    KEY_RIGHT,
    KEY_MAX,
};

