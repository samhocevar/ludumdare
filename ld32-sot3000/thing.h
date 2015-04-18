//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

enum class thing_type : int
{
    player       = 0,
    ground       = 1,
    ground_left  = 2,
    ground_right = 3,
    enemy        = 4,
};

enum class thing_state : int
{
    small = 0,
    large = 1,
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
        case thing_type::enemy:
            return true;
        case thing_type::ground:
        case thing_type::ground_left:
        case thing_type::ground_right:
            return false;
        }
    }

    bool can_kill()
    {
        switch (m_type)
        {
        case thing_type::player:
        case thing_type::ground:
        case thing_type::ground_left:
        case thing_type::ground_right:
            return false;
        case thing_type::enemy:
            return true;
        }
    }

private:
    thing_type m_type;
};

