//
// Ludum Dare 28 Entry
//
// Copyright: (c) 2013 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#if defined HAVE_CONFIG_H
#   include "config.h"
#endif

#include "core.h"

using namespace std;
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

    virtual void TickDraw(float seconds)
    {
        WorldEntity::TickDraw(seconds);
    }

private:
};

int main(int argc, char **argv)
{
    System::Init(argc, argv);

    Application app("SinglShot", RESOLUTION, 60.0f);
    new SinglShot();
    app.Run();

    return EXIT_SUCCESS;
}

