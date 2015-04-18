//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

class level : public WorldEntity
{
public:
    level()
    {
    }

    ~level()
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

    ivec2 size()
    {
        return (ivec2)m_layout.GetSize();
    }

    void clear()
    {
        for (thing *t : m_things)
        {
            Ticker::Unref(t);
        }
        m_things.empty();

        for (int i = 0; i < m_layout.GetSize().x; ++i)
        for (int j = 0; j < m_layout.GetSize().y; ++j)
        {
            m_layout[i][j] = thing_type::none;
        }
    }

    void build()
    {
        for (int i = 0; i < m_layout.GetSize().x; ++i)
        for (int j = 0; j < m_layout.GetSize().y; ++j)
        {
            if (m_layout[i][j] != thing_type::none)
            {
                m_things.push(new thing(m_layout[i][j], ivec2(1)));
                Ticker::Ref(m_things.last());
            }
        }
    }

protected:
    // The level description
    array2d<thing_type> m_layout;
    ivec2 m_start, m_exit;

    // Instanced things (to be moved somewhere else; split level description / level instance)
    array<thing *> m_things;
};

//
// Debug class to test the game before we have actual level design
//
class test_level : public level
{
public:
    test_level()
    {
        m_layout.SetSize(ivec2(WIDTH, HEIGHT));
        clear();

        m_start = ivec2(2, 2);
        m_exit = ivec2(WIDTH - 1 - 2, 2);

        for (int i = 0; i < WIDTH; ++i)
        {
            m_layout[i][0] = thing_type::ground;
        }

        build();
    }

    ~test_level()
    {
    }

private:
    static int const WIDTH = 40;
    static int const HEIGHT = 30;
};
