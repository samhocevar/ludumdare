//
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

    void load_data(char const *data)
    {
        int const width = ::strchr(data, '\n') - data;
        int const height = ::strlen(data) / (width + 1);

        m_layout.SetSize(ivec2(width, height));
        clear();

        for (int i = 0; i < width; ++i)
        for (int j = 0; j < height; ++j)
        {
            char ch = data[(height - 1 - j) * (width + 1) + i];
            switch (ch)
            {
            case 'S':
                m_layout[i][j] = thing_type::door;
                m_start = ivec2(i, j);
                break;
            case 'E':
                m_layout[i][j] = thing_type::door;
                m_exit = ivec2(i, j);
                break;
            case '%':
                m_layout[i][j] = thing_type::ground;
                break;
            case 'X':
                m_layout[i][j] = thing_type::blocker;
                break;
            case '-':
                m_layout[i][j] = thing_type::enemy_blocker;
                break;
            case 'W':
                m_layout[i][j] = thing_type::spikes;
                break;
            case 'p':
                m_layout[i][j] = thing_type::pink_gun;
                break;
            case 'b':
                m_layout[i][j] = thing_type::blue_gun;
                break;
            case 'K':
                m_layout[i][j] = thing_type::key;
                break;
            case '#':
                m_layout[i][j] = thing_type::sitting_enemy;
                break;
            case '@':
                m_layout[i][j] = thing_type::walking_enemy;
                break;
            case '*':
                m_layout[i][j] = thing_type::flying_enemy;
                break;
            }
        }
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


/* The level is a world representation of a map */
class level_instance : public WorldEntity
{
public:
    level_instance();
    ~level_instance();

    virtual void TickGame(float seconds);
    void tick_player(float seconds);
    void tick_projectile(thing *t, float seconds);
    void tick_living(thing *t, float seconds);

    virtual void TickDraw(float seconds, Scene &scene);

    ivec2 layout_size();
    vec2 world_size();
    void load_map(ld32_map *map);
    void clear();
    void build();

    vec3 get_poi() const;
    inline bool get_exit_reached() const { return m_exit_reached; }
    inline bool get_player_fell() const { return m_player_fell; }

    float collide_thing(thing const *t, vec3 velocity, float seconds);
    void impulse_x(float impulse);
    void jump();
    void continue_jump(float velocity, float seconds);
    void fire();

private:
    // The level description
    ld32_map *m_map;

    // Instanced things (to be moved somewhere else; split level description / level instance)
    array<thing *> m_things;
    thing *m_player;
    array<thing *> m_enemies;
    array<thing *> m_projectiles;
    array<thing *> m_items;

    vec3 m_player_impulse;
    thing_type m_active_gun;
    bool m_exit_reached, m_player_killed, m_player_fell;
};

