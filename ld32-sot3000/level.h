﻿//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#pragma once

#include "thing.h"

class ld32_map
{
    friend class level_instance;

public:
    ld32_map()
    {
    }

    virtual ~ld32_map()
    {
    }

    void load(char const *name)
    {
        ASSERT(false, "Implement map loading for %s", name);
    }

    void clear()
    {
        for (int i = 0; i < m_layout.GetSize().x; ++i)
        for (int j = 0; j < m_layout.GetSize().y; ++j)
        {
            m_layout[i][j] = thing_type::none;
        }
    }

protected:
    array2d<thing_type> m_layout;
    ivec2 m_start, m_exit;
};

//
// Debug class to test the game before we have actual level design
//
class test_map : public ld32_map
{
public:
    test_map()
    {
        m_layout.SetSize(ivec2(WIDTH, HEIGHT));
        clear();

        /* Spawn some random platforms */
        for (int n = 0; n < 50; ++n)
        {
            int j = lol::rand(HEIGHT);
            int i = lol::rand(WIDTH - 4);
            int i2 = lol::min(i + lol::rand(2, 4), WIDTH);

            while (i < i2)
                m_layout[i++][j] = thing_type::ground;
        }

        /* Start platform */
        m_start = ivec2(10, 2);
        m_layout[10][2] = thing_type::none;
        m_layout[10][3] = thing_type::none;

        /* End platform == ground */
        m_exit = ivec2(WIDTH - 1 - 2, 1);
        for (int i = 0; i < WIDTH; ++i)
            m_layout[i][0] = thing_type::ground;
    }

private:
    static int const WIDTH = 40;
    static int const HEIGHT = 30;
};

/* The level is a world representation of a map */
class level_instance : public WorldEntity
{
public:
    level_instance();
    ~level_instance();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    ivec2 size();
    void load_map(ld32_map *map);
    void clear();
    void build();

    float collide_player(vec3 velocity, float seconds);
    void impulse_x(float impulse);
    void jump_y(float velocity);

private:
    // The level description
    ld32_map *m_map;

    // Instanced things (to be moved somewhere else; split level description / level instance)
    array<thing *> m_things;
    thing *m_player;

    vec3 m_player_impulse;
};
