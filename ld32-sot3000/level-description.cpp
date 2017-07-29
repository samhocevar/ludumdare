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

#include <string>

#include <lol/engine.h>

#include "tao/pegtl.hpp"

using namespace lol;
using namespace tao::pegtl;

#include "level-description.h"

namespace grammar
{
    //
    // Grammar rules
    //

    struct _ : star<space> {};

    struct r_bom
      : opt<TAOCPP_PEGTL_STRING("\xef\xbb\xbf")> {};

    struct r_line
      : seq<star<one<' ', 'S', 'E', '%', 'X', '-', '+', '_',
                     'o', '|', 'W', 'p', 'b', '#', '@', '*'>>,
            eol> {};

    struct r_layout
      : plus<r_line> {};

    struct r_name
      : until<at<eol>, any> {};

    struct r_name_statement
      : seq<TAOCPP_PEGTL_STRING("name"), _, one<'='>, _, r_name,
            eol> {};

    struct r_size
      : seq<TAOCPP_PEGTL_STRING("size"), _, plus<digit>, _, plus<digit>, _, eol> {};

    struct r_header
      : star<sor<r_size,
                 r_name_statement>> {};

    struct r_level
      : seq<r_bom, r_header, r_layout, tao::pegtl::eof> {};

    //
    // Grammar actions
    //

    template<typename R>
    struct action : nothing<R> {};

    template<>
    struct action<r_size>
    {
        template<typename Input>
        static void apply(Input const &in, level_layout &layout)
        {
            printf(">%s<\n", in.string().c_str());
        }
    };

    template<>
    struct action<r_name>
    {
        template<typename Input>
        static void apply(Input const &in, level_layout &layout)
        {
            layout.m_name = in.string().c_str();
        }
    };

    template<>
    struct action<r_line>
    {
        template<typename Input>
        static void apply(Input const &in, level_layout &layout)
        {
            // Resize layout
            layout.m_size.y += 1;
            layout.m_size.x = lol::max(layout.m_size.x, (int)in.string().length());
            layout.m_lines.push(in.string());
        }
    };
}

//
// Level description implementation
//

void level_description::load_data(char const *data)
{
    m_layout = level_layout();

    m_layout.m_size = ivec2(0);
    tao::pegtl::memory_input<> in(data, "level");
    tao::pegtl::parse<grammar::r_level, grammar::action>(in, m_layout);
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

