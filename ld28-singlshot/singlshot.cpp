//
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

#if HAVE_CONFIG_H
#   include "config.h"
#endif

#include <lol/engine.h>

using namespace lol;

#include "singlshot.h"
#include "game.h"

#include "thing.h"
#include "wave.h"

#include "starfield.h"
#include "explosion.h"

#include "hud.h"

class SinglShot : public WorldEntity
{
public:
    SinglShot()
    {
        new Hud();
    }

    ~SinglShot()
    {
    }

    virtual void TickGame(float seconds)
    {
        WorldEntity::TickGame(seconds);
    }

    virtual void TickDraw(float seconds, Scene &scene)
    {
        WorldEntity::TickDraw(seconds, scene);
    }

private:
};

int main(int argc, char **argv)
{
    sys::init(argc, argv);

    Application app("SinglShot", RESOLUTION, 60.0f);
    new SinglShot();
    app.Run();

    return EXIT_SUCCESS;
}

