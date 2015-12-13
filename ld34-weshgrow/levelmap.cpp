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
#include "levelmap.h"
#include "game.h"

levelmap::levelmap()
  : m_start(vec3::zero),
    m_timer(0.0)
{
}

levelmap::~levelmap()
{
}

void levelmap::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    m_timer += seconds;
}

void levelmap::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);

    /* Render the background layer, with z == -10 */
    vec3 const orig(g_game->m_poi, -10.f);
    vec2 delta(-0.5f * g_game->m_poi); // how much we deviate from camera

    int xcenter = orig.x / TILE_SIZE_X;
    int ycenter = orig.y / -TILE_SIZE_Y;
    int tilecount = 0;

    /* Render the foreground tiles, with z == -2 (background), 0 (signs), 1, 2... */
    int z = -2;
    for (array2d<tileid> const &layer : m_layers)
    {
        ivec2 const size = layer.size();

        int xstart = max(0, xcenter - VIEWPORT_SIZE_X / TILE_SIZE_X);
        int ystart = max(0, ycenter - VIEWPORT_SIZE_Y / TILE_SIZE_Y);
        int xend = min(size.x, xcenter + VIEWPORT_SIZE_X / TILE_SIZE_X + 1);
        int yend = min(size.y, ycenter + VIEWPORT_SIZE_Y / TILE_SIZE_Y + 1);

        for (int y = ystart; y < yend; ++y)
        {
            for (int x = xstart; x < xend; ++x)
            {
                tileid t = layer[x][y];
                if (t != tileid::empty)
                {
                    vec3 pos(TILE_SIZE_X * x, - TILE_SIZE_Y * y, z);

                    /* Special cases for animations */
                    if (is_arrow(t))
                    {
                        t = tileid(int(t) + int(m_timer * 5.0) % 2 * 0x40);
                    }

                    if (is_bonus(t))
                    {
                        pos.y += sq((float)lol::sin(3.0 * m_timer)) * TILE_SIZE_Y * 0.4f;
                    }

                    scene.AddTile(g_game->m_tiles, int(t), pos, 0, vec2(1.f), 0.f);
                    ++tilecount;
                }
            }
        }
        if (!++z) ++z;
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

        m_map.resize(ivec2(lol::max(width, m_map.size().x),
                           lol::max(height, m_map.size().y)));

        tmp = parser;
        for (int y = 0; y < height; ++y)
        {
            for (int x = 0; x < width; ++x)
            {
                int id = atoi(tmp) - 1;

                /* Handle special tiles */
                switch (tileid(id))
                {
                case tileid::special_start:
                    m_start = vec3(x * TILE_SIZE_X, -y * TILE_SIZE_Y, 0.f);
                    id = 0;
                case tileid::special_finish:
                    m_finish << vec3(x * TILE_SIZE_X, -y * TILE_SIZE_Y, 0.f);
                    id = 0;
                    break;
                }

                if (id >= 0)
                {
                    m_layers.last()[x][y] = tileid(id);
                    if (!is_decoration(tileid(id)))
                        m_map[x][y] = tileid(id);
                }
                else
                {
                    m_layers.last()[x][y] = tileid::empty;
                }
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

tileid levelmap::get_tile(ivec2 pos) const
{
    if (pos.x < 0 || pos.y < 0 || pos.x >= m_map.size().x || pos.y >= m_map.size().y)
        return tileid::empty;

    return m_map[pos];
}

