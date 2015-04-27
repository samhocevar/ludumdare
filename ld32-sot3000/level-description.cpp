//
// Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32
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

#include <string>

#include <lol/engine.h>

#include "pegtl.hh"

using namespace lol;
using namespace pegtl;

#include "level-description.h"

struct do_size : action_base<do_size>
{
    static void apply(std::string const &ctx, level_layout &layout)
    {
        printf(">%s<\n", ctx.c_str());
    }
};

struct do_name : action_base<do_name>
{
    static void apply(std::string const &ctx, level_layout &layout)
    {
        layout.m_name = ctx.c_str();
    }
};

struct do_line : action_base<do_line>
{
    static void apply(std::string const &ctx, level_layout &layout)
    {
        // Resize layout
        layout.m_size.y += 1;
        layout.m_size.x = lol::max(layout.m_size.x, (int)ctx.length());
        layout.m_lines.push(ctx);
    }
};

struct _ : star<space> {};

struct r_bom
  : opt<string<'\xef', '\xbb', '\xbf'>> {};

struct r_line
  : seq<ifapply<star<one<' ', 'S', 'E', '%', 'X', '-', '+', '_',
                         'o', '|', 'W', 'p', 'b', '#', '@', '*'>>,
                do_line>,
        eol> {};

struct r_layout
  : plus<r_line> {};

struct r_name
  : seq<string<'n', 'a', 'm', 'e'>, _, one<'='>, _,
        ifapply<until<at<eol>, any>,
                do_name>,
        eol> {};

struct r_size
  : ifapply<seq<string<'s', 'i', 'z', 'e'>,
                _, plus<digit>, _, plus<digit>, _, eol>,
            do_size> {};

struct r_header
  : star<sor<r_size,
             r_name>> {};

struct r_level
  : seq<r_bom, r_header, r_layout, eof> {};

//
// Level description implementation
//

void level_description::load_data(char const *data)
{
    m_layout = level_layout();

    m_layout.m_size = ivec2(0);
    basic_parse_string<r_level>(data, m_layout);
    m_layout.m_tiles.resize(m_layout.m_size);

    for (int j = 0; j < m_layout.m_size.y; ++j)
    {
        std::string const &line = m_layout.m_lines[m_layout.m_size.y - 1 - j];

        for (int i = 0; i < m_layout.m_size.x; ++i)
        {
            thing_type t = thing_type::none;

            char ch = i < line.length() ? line[i] : ' ';
            switch (ch)
            {
                case 'S': break;
                case 'E': t = thing_type::door; break;
                case '%': t = thing_type::ground; break;
                case 'X': t = thing_type::blocker; break;
                case 'o': t = thing_type::boulder; break;
                case '-': t = thing_type::monster_blocker; break;
                case '+': t = thing_type::item_scaler; break;
                case '_': t = thing_type::button; break;
                case '|': t = thing_type::laser; break;
                case 'W': t = thing_type::spikes; break;
                case 'p': t = thing_type::minus_ammo; break;
                case 'b': t = thing_type::plus_ammo; break;
                case '#': t = thing_type::sitting_monster; break;
                case '@': t = thing_type::walking_monster; break;
                case '*': t = thing_type::flying_monster; break;
                default: break;
            }

            if (ch == 'S')
                m_layout.m_start = ivec2(i, j);

            m_layout.m_tiles[i][j] = t;
        }
    }
}

