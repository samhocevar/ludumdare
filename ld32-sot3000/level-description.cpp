//
// Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32 3000
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

#include "pegtl.hh"

using namespace lol;

#include "level-description.h"

void level_description::load_data(char const *data)
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
            //m_layout[i][j] = thing_type::door;
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
            m_layout[i][j] = thing_type::monster_blocker;
            break;
        case '+':
            m_layout[i][j] = thing_type::item_scaler;
            break;
        case '_':
            m_layout[i][j] = thing_type::button;
            break;
        case '|':
            m_layout[i][j] = thing_type::laser;
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
        case '#':
            m_layout[i][j] = thing_type::sitting_monster;
            break;
        case '@':
            m_layout[i][j] = thing_type::walking_monster;
            break;
        case '*':
            m_layout[i][j] = thing_type::flying_monster;
            break;
        }
    }
}

void level_description::clear()
{
    for (int i = 0; i < m_layout.GetSize().x; ++i)
    for (int j = 0; j < m_layout.GetSize().y; ++j)
    {
        m_layout[i][j] = thing_type::none;
    }
}

