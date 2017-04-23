//
//  LD37 — convert image to PICO-8 palette
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

#define ZLIB_LEVEL 9
#define ZLIB_CHUNK 16384

#define PRESERVATION 0.5f

int main(int argc, char **argv)
{
    if (argc != 6)
    {
        fprintf(stderr, "Usage: %s <source> <w> <h> <dest> <data>\n", argv[0]);
        return EXIT_FAILURE;
    }

    static u8vec4 const palette_u8[] =
    {
        u8vec4(0x00, 0x00, 0x00, 0xff), // black
        u8vec4(0x1d, 0x2b, 0x53, 0xff), // dark_blue
        u8vec4(0x7e, 0x25, 0x53, 0xff), // dark_purple
        u8vec4(0x00, 0x87, 0x51, 0xff), // dark_green
        u8vec4(0xab, 0x52, 0x36, 0xff), // brown
        u8vec4(0x5f, 0x57, 0x4f, 0xff), // dark_gray
        u8vec4(0xc2, 0xc3, 0xc7, 0xff), // light_gray
        u8vec4(0xff, 0xf1, 0xe8, 0xff), // white
        u8vec4(0xff, 0x00, 0x4d, 0xff), // red
        u8vec4(0xff, 0xa3, 0x00, 0xff), // orange
        u8vec4(0xff, 0xec, 0x27, 0xff), // yellow
        u8vec4(0x00, 0xe4, 0x36, 0xff), // green
        u8vec4(0x29, 0xad, 0xff, 0xff), // blue
        u8vec4(0x83, 0x76, 0x9c, 0xff), // indigo
        u8vec4(0xff, 0x77, 0xa8, 0xff), // pink
        u8vec4(0xff, 0xcc, 0xaa, 0xff), // peach
    };

    /* Fill palette with PICO-8 colours */
    array<vec4> palette;
    for (int i = 0; i < 16; ++i)
        palette << vec4(palette_u8[i]) * vec4(1.0f / 255);

#if 0
    /* Add colour combinations that aren’t too awful */
    for (int i = 0; i < 16; ++i)
        for (int j = i + 1; j < 16; ++j)
        {
            if (distance(palette[i], palette[j]) < 0.8f)
                palette << mix(palette[i], palette[j], 0.5f);
        }
#endif

    msg::info("palette has %d colours\n", palette.count());

    /* Load images */
    Image im;
    im.Load(argv[1]);

    ivec2 size(im.GetSize());
    int const desired_width = (atoi(argv[2]) + 7) / 8 * 8;
    int const desired_height = atoi(argv[3]);

    if (size.x != desired_width || size.y != desired_height)
    {
        size.x = desired_width;
        size.y = desired_height;
        im = im.Resize(size, ResampleAlgorithm::Bicubic);
    }

    // Slight blur
    im = im.Resize(size * 2, ResampleAlgorithm::Bicubic)
           .Resize(size, ResampleAlgorithm::Bresenham);

    msg::info("image size %d×%d\n", size.x, size.y);

    Image dst(size);
    array<uint8_t> rawdata;

    /* Dither image for first destination */
    array2d<vec4> &curdata = im.Lock2D<PixelFormat::RGBA_F32>();
    array2d<vec4> &dstdata = dst.Lock2D<PixelFormat::RGBA_F32>();
    for (int j = 0; j < size.y; ++j)
    {
        for (int i = 0; i < size.x; ++i)
        {
            vec4 pixel = curdata[i][j];

            // Find nearest colour
            int nearest = -1;
            float best_dist = 1e8f;

            for (int n = 0; n < palette.count(); ++n)
            {
                float new_dist = distance(palette[n].rgb, pixel.rgb);
                if (new_dist < best_dist)
                {
                    best_dist = new_dist;
                    nearest = n;
                }
            }

            // Append raw data
            if (i & 1)
                rawdata.last() |= (nearest << 4) & 0xf0;
            else
                rawdata.push(nearest & 0x0f);

            // Store colour
            dstdata[i][j] = palette[nearest];
            vec4 error = PRESERVATION * (pixel - palette[nearest]) / 16.0f;

            //float diff[] = { 7.0f, 1.0f, 5.0f, 3.0f }; // Floyd-Steinberg
            float diff[] = { 6.0f, 3.0f, 5.0f, 2.0f }; // Hocevar-Niger
            //float diff[] = { 0.0f, 5.0f, 7.0f, 4.0f }; // Horizontal stripes
            //float diff[] = { 9.0f, 3.0f, 0.0f, 4.0f }; // Vertical stripes

            // Propagate error to current image
            if (i + 1 < size.x)
                curdata[i + 1][j] += diff[0] * error;
            if (i - 1 >= 0 && j + 1 < size.y)
                curdata[i - 1][j + 1] += diff[1] * error;
            if (j + 1 < size.y)
                curdata[i][j + 1] += diff[2] * error;
            if (i + 1 < size.x && j + 1 < size.y)
                curdata[i + 1][j + 1] += diff[3] * error;
        }
    }

    im.Unlock2D(curdata);
    dst.Unlock2D(dstdata);

    /* Save image */
    //dst = dst.Resize(size * 4, ResampleAlgorithm::Bresenham);
    dst.Save(argv[4]);

    /* Save data */
    FILE *dest = fopen(argv[5], "w+");
    fwrite(rawdata.data(), 1, rawdata.count(), dest);
    fclose(dest);

    return 0;
}

