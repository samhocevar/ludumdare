//
// Ludum Dare 28 Entry
//
// Copyright: (c) 2013 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#if defined HAVE_CONFIG_H
#   include "config.h"
#endif

#include "core.h"

using namespace std;
using namespace lol;

#include "ld28.h"
#include "game.h"
#include "thing.h"
#include "wave.h"

Wave::Wave(Game *game, int type)
  : m_game(game),
    m_type(type)
{
    switch(type)
    {
    case 0:
        for (int i = 0; i < 10; ++i)
        {
            m_things.Push(new Thing(game, 1, 1));
            Ticker::Ref(m_things.Last());
            m_things.Last()->m_position = vec3((i - 4.5f) * 25.f, ARENA.y, 10.f);
        }
        break;
    }
}

Wave::~Wave()
{
    for (int i = 0; i < m_things.Count(); ++i)
        Ticker::Unref(m_things[i]);
}

void Wave::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    for (int i = 0; i < m_things.Count(); ++i)
    {
        /* Scroll down */
        m_things[i]->m_position += vec3(0.f, -SCROLL_SPEED, 0.f) * seconds;

        /* Check collisions */
        if (!m_things[i]->m_dead && distance(m_game->m_ship->m_position.xy,
                                            m_things[i]->m_position.xy) < 12.f)
            m_game->KillPlayer();
    }
}

void Wave::TickDraw(float seconds)
{
    WorldEntity::TickDraw(seconds);
}

