//
//  LD37 — create a 16×16 blue noise kernel with PICO-8 palette
//
//  Copyright © 2016 Sam Hocevar <sam@hocevar.net>
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

int main(int argc, char **argv)
{
    UNUSED(argc, argv);

    auto const &im = image::kernel::blue_noise(ivec2(16,16), ivec2(5,5));

    for (int j = 0; j < 16; ++j)
    {
        for (int i = 0; i < 8; ++i)
        {
            int a = int(16 * im[i][j]);
            int b = int(16 * im[i+1][j]);
            printf("%02x", a + b * 16);
        }
        printf("\n");
    }

    return 0;
}

