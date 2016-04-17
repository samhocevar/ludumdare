//
//  Unnamed — Entry for Ludum Dare 35
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

#include "constants.h"
#include "levelmap.h"
#include "game.h"

levelmap::levelmap()
{
    /* Generate a random background */
    m_background.resize(ivec2(BG_SIZE_X, BG_SIZE_Y));
    for (int y = 0; y < BG_SIZE_Y; ++y)
    for (int x = 0; x < BG_SIZE_X; ++x)
    {
        int r = lol::rand(4) == 0 ? lol::rand(5) : 0;
        m_background[x][y] = int(tileid::background) + r * 2;
    }
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

    /* Render the background layer, with z == -10 */
    vec3 const orig(g_game->m_poi, -10.f);
    vec2 delta(-0.5f * g_game->m_poi); // how much we deviate from camera

    for (int y = 0; y < BG_SIZE_Y; ++y)
    for (int x = 0; x < BG_SIZE_X; ++x)
    {
        /* Only render inside the camera */
        vec3 pos = vec3(delta, 0.f) + vec3(2.f * x * TILE_SIZE_X, -2.f * y * TILE_SIZE_Y, 0.f);
        while (pos.x > BG_SIZE_X * TILE_SIZE_X)
        {
            pos.x -= 2 * BG_SIZE_X * TILE_SIZE_X;
            pos.y -= BG_SIZE_Y * TILE_SIZE_Y;
        }
        while (pos.x < -BG_SIZE_X * TILE_SIZE_X)
        {
            pos.x += 2 * BG_SIZE_X * TILE_SIZE_X;
            pos.y -= BG_SIZE_Y * TILE_SIZE_Y;
        }
        while (pos.y > BG_SIZE_Y * TILE_SIZE_Y) pos.y -= 2 * BG_SIZE_Y * TILE_SIZE_Y;
        while (pos.y < -BG_SIZE_Y * TILE_SIZE_Y) pos.y += 2 * BG_SIZE_Y * TILE_SIZE_Y;

        int id = m_background[x][y];
        scene.AddTile(g_game->m_tiles, id, orig + pos, 0, vec2(1.f), 0.f);
        scene.AddTile(g_game->m_tiles, id + 0x01, orig + pos + vec3(TILE_SIZE_X, 0.f, 0.f), 0, vec2(1.f), 0.f);
        scene.AddTile(g_game->m_tiles, id + 0x10, orig + pos + vec3(0.f, -TILE_SIZE_Y, 0.f), 0, vec2(1.f), 0.f);
        scene.AddTile(g_game->m_tiles, id + 0x11, orig + pos + vec3(TILE_SIZE_X, -TILE_SIZE_Y, 0.f), 0, vec2(1.f), 0.f);
    }

    /* Render the foreground tiles, with z == -1 (ground), 0, 1, 2... */
    int z = -1;
    for (array2d<tileid> const &layer : m_layers)
    {
        ivec2 const size = layer.size();
        for (int y = 0; y < size.y; ++y)
        {
            for (int x = 0; x < size.x; ++x)
            {
                tileid t = layer[x][y];
                if (t != tileid::empty)
                    scene.AddTile(g_game->m_tiles, int(t), vec3(TILE_SIZE_X * x, - TILE_SIZE_Y * y, z), 0, vec2(1.f), 0.f);
            }
        }
        ++z;
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
                if (id >= 0)
                {
                    m_layers.last()[x][y] = tileid(id);

                    // If this tile is important for gameplay, update m_map
                    if (id == int(tileid::slope_up) || id == int(tileid::slope_up) + 2)
                        m_map[x][y] = tileid::slope_up;

                    else if (id == int(tileid::slope_down) || id == int(tileid::slope_down) + 2)
                        m_map[x][y] = tileid::slope_down;

                    else if (id >= int(tileid::mouse_passage) && id < int(tileid::mouse_passage) + 6)
                        m_map[x][y] = tileid::mouse_passage;

                    else if (id >= int(tileid::wall_start) && id < int(tileid::wall_end))
                        m_map[x][y] = tileid::wall;

                    else if (id == int(tileid::player_start))
                    {
                        m_player_start = ivec2(x, y);
                        m_layers.last()[x][y] = tileid::empty;
                    }
                }
                else
                {
                    m_layers.last()[x][y] = tileid::empty;
                    //m_map[x][y] = tileid::empty; // don’t override other layers!
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

