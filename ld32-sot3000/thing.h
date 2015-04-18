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

enum class thing_type : int
{
    none     = -1,
    player   =  0,
    ground   =  1,
    platform =  2,
    rock     =  3,
    enemy    =  4,
};

class thing : public WorldEntity
{
public:
    thing(thing_type t)
      : m_type(t)
    {
    }

    ~thing()
    {
    }

    virtual void TickGame(float seconds)
    {
        WorldEntity::TickGame(seconds);
    }

    virtual void TickDraw(float seconds, Scene &scene)
    {
        WorldEntity::TickDraw(seconds, scene);
    }

    bool can_fall()
    {
        switch (m_type)
        {
        case thing_type::player:
        case thing_type::platform:
        case thing_type::rock:
        case thing_type::enemy:
            return true;
        case thing_type::ground:
            return false;
        }
    }

    bool can_kill()
    {
        switch (m_type)
        {
        case thing_type::player:
        case thing_type::ground:
        case thing_type::platform:
        case thing_type::rock:
            return false;
        case thing_type::enemy:
            return true;
        }
    }

public:
    int m_tile_index;

private:
    thing_type m_type;
};

