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

enum class thing_type : int
{
    none     = -1,
    player   =  0,
    ground   =  1,
    platform =  2,
    rock     =  3,
    enemy    =  4,
};

class thing : public WorldEntity
{
public:
    thing(thing_type t);
    ~thing();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    bool can_fall();
    bool can_kill();

public:
	vec2 m_size;
    int m_tile_index;

private:
    thing_type m_type;
};

extern float collide(thing const *t1, vec3 v1,
                     thing const *t2, vec3 v2, float start, float stop);
