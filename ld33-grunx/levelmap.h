//
//  LD33
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
class levelmap : public WorldEntity
{
public:
    levelmap();
    ~levelmap();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    void load_file(char const *file);
    void load_data(char const *data);

private:
    array<array2d<tileid>> m_layers;
};

