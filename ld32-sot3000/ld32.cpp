//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#if HAVE_CONFIG_H
#   include "config.h"
#endif

#include <lol/engine.h>

using namespace lol;

#include "constants.h"

#include "menu.h"

#include "thing.h"
#include "level.h"
#include "game.h"

int main(int argc, char **argv)
{
    System::Init(argc, argv);

    Application app("Ludum Dare 32", ivec2(SIZE_X, SIZE_Y), 60.0f);

    //new ld32_menu();
    new ld32_game();
    app.Run();

    return EXIT_SUCCESS;
}
