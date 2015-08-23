//
//  Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32
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
#include "levelmap.h"
#include "game.h"

levelmap::levelmap()
{
}

levelmap::~levelmap()
{
}

void levelmap::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);
}

void levelmap::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    int z = 0;
    for (array2d<tileid> const &layer : m_layers)
    {
        ivec2 const size = layer.size();
        ++z;

        for (int y = 0; y < size.y; ++y)
        {
            for (int x = 0; x < size.x; ++x)
            {
                tileid const &t = layer[x][y];
                if (t != tileid::empty)
                    scene.AddTile(g_game->m_tiles, int(t), vec3(TILE_SIZE_X * x, - TILE_SIZE_Y * y, z), 0, vec2(1.f), 0.f);
            }
        }
    }
}

void levelmap::load_file(char const *file)
{
    msg::debug("loading level %s\n", file);

    array<String> datafiles = System::GetPathList(file);
    for (String candidate : datafiles)
    {
        File f;
        f.Open(candidate, FileAccess::Read);
        if (!f.IsValid())
            continue;
        load_data(f.ReadString().C());
        f.Close();
        break;
    }
}

void levelmap::load_data(char const *data)
{
    m_layers.empty();

    for (char const *parser = data; ; )
    {
        char const *tmp;

        parser = strstr(parser, "<layer ");
        if (!parser)
            break;

        tmp = strstr(parser, "width=\"");
        if (!tmp)
            break;
        int width = atoi(tmp + strlen("width=\""));

        tmp = strstr(parser, "height=\"");
        if (!tmp)
            break;
        int height = atoi(tmp + strlen("height=\""));

        parser = strstr(parser, "<data");
        if (!parser)
            break;
        parser = strchr(parser, '>');
        if (!parser)
            break;
        parser++;

        m_layers.push(array2d<tileid>());
        m_layers.last().resize(ivec2(width, height));
        tmp = parser;
        for (int y = 0; y < height; ++y)
        {
            for (int x = 0; x < width; ++x)
            {
                int id = atoi(tmp);
                if (id > 0)
                    m_layers.last()[x][y] = tileid(id - 1);
                tmp = strchr(tmp, ',');
                if (!tmp)
                    break;
                ++tmp;
            }
            if (!tmp)
                break;
        }

        msg::debug("layer %d: %d x %d\n", m_layers.count(), width, height);
    }
}

