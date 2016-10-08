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

#if HAVE_CONFIG_H
#   include "config.h"
#endif

#include <lol/engine.h>

using namespace lol;

#include "constants.h"
#include "game.h"

weshgrow_game *g_game;

int main(int argc, char **argv)
{
    sys::init(argc, argv);

    Application app("Wesh Grow",
                    ivec2(WINDOW_SIZE_X, WINDOW_SIZE_Y), 60.0f);

    g_game = new weshgrow_game();
    app.Run();

    return EXIT_SUCCESS;
}

