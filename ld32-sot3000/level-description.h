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

#pragma once

#include "thing.h"

struct level_layout
{
    String m_name;
    array2d<thing_type> m_tiles;
    ivec2 m_start;

    // Parser state
    array<std::string> m_lines;
    array<int> m_numbers;
    ivec2 m_size, m_cursor;
};

class level_description
{
public:
    void load_data(char const *data);

    array2d<thing_type> const & get_layout() const { return m_layout.m_tiles; }
    String const &get_name() const { return m_layout.m_name; }
    ivec2 get_start() const { return m_layout.m_start; }

private:
    level_layout m_layout;
};

