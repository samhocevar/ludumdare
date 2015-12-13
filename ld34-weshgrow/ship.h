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

#include "constants.h"

/* The level is a world representation of a map */
class ship : public WorldEntity
{
public:
    ship();
    ~ship();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    /* Can’t be bothered to make setters for this */
    bool m_thrust_left, m_thrust_right;

private:
    struct exhaust
    {
        vec3 pos, vel;
        float life, angle;
    };

    array<exhaust> m_exhausts;
    array<ivec3> m_thrusters; // x, y, left/right

    double m_timer;

    float get_mass();
    float get_thrust_left_force();
    float get_thrust_right_force();
    float get_thrust_middle_force();
};

