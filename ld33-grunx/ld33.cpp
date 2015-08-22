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

#if HAVE_CONFIG_H
#   include "config.h"
#endif

#include <lol/engine.h>

#include "constants.h"

using namespace lol;

int main(int argc, char **argv)
{
    System::Init(argc, argv);

    Application app("LD33",
                    ivec2(WINDOW_SIZE_X, WINDOW_SIZE_Y), 60.0f);

    app.Run();

    return EXIT_SUCCESS;
}
