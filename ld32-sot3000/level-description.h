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

class level_description
{
    friend class level_instance;

public:
    void load_data(char const *data);
    void clear();

protected:
    array2d<thing_type> m_layout;
    ivec2 m_start, m_exit;
};

