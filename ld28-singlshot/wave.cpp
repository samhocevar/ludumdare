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
#include "explosion.h"

Wave::Wave(Game *game, int type)
  : m_dead(false),
    m_game(game),
    m_type(type)
{
    switch(type)
    {
    case 0:
        for (int i = 0; i < 9; ++i)
        {
            m_things.Push(new Thing(game, 1, 2));
            Ticker::Ref(m_things.Last());

            float d = i - 4.f;
            m_things.Last()->m_position = vec3(d * 30.f, ARENA.y * 0.6f + lol::abs(d) * 10.f, 10.f);
        }
        break;
    case 1:
        for (int i = 0; i < 9; ++i)
        {
            m_things.Push(new Thing(game, 1, 10));
            Ticker::Ref(m_things.Last());

            m_things.Last()->m_position = vec3(0.f, ARENA.y * 0.6f + i * 30.f, 10.f);
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

    m_time += seconds;

    for (int i = 0; i < m_things.Count(); ++i)
    {
        /* Scroll down */
        m_things[i]->m_position += vec3(0.f, -SCROLL_SPEED, 0.f) * seconds;

        /* Use alternate tileset */
        m_things[i]->m_tileid |= 1;
        m_things[i]->m_tileid -= lol::sin(4.f * m_time) > 0;

        /* Fire? */
        if (lol::rand(300) == 0)
        {
            m_game->m_bullets.Push(new Thing(m_game, 1, 8));
            m_game->m_bullets.Last()->m_position = m_things[i]->m_position;
            float angle = -F_PI / 2.0f + rand(-3, 4) / 5.0f;
            vec3 dir = vec3(lol::cos(angle), lol::sin(angle), 0.0f);
            m_game->m_bullets.Last()->m_velocity = dir * BULLET_SPEED;
            Ticker::Ref(m_game->m_bullets.Last());
        }

        /* Move in weird ways? */
        switch (m_type)
        {
        case 0:
            m_things[i]->m_position.x += SCROLL_SPEED * 0.50f
                                          * lol::sin(4.f * m_time + i) * seconds;
            break;
        case 1:
            m_things[i]->m_position.x = ARENA.x * 0.35f * lol::sin(m_time * 0.5f + i * 0.25f);
            break;
        }

        /* Handle collisions */
        HandleCollisions(m_things[i]);
    }
}

void Wave::TickDraw(float seconds)
{
    WorldEntity::TickDraw(seconds);
}

void Wave::HandleCollisions(Thing *thing)
{
    if (thing->m_dead)
        return;

    /* Check collisions with player */
    if (!m_game->m_ship->m_dead &&
        distance(m_game->m_ship->m_position.xy, thing->m_position.xy) < 12.f)
    {
        m_game->m_explosions.Push(new Explosion(m_game));
        m_game->m_explosions.Last()->m_position = thing->m_position;
        Ticker::Ref(m_game->m_explosions.Last());

        thing->m_dead = true;

        m_game->KillPlayer();
    }

    /* Check collisions with rockets */
    for (int i = 0; i < m_game->m_rockets.Count(); ++i)
    {
        if (m_game->m_rockets[i]->m_dead)
            continue;

        if (distance(m_game->m_rockets[i]->m_position.xy,
                     thing->m_position.xy) < 12.f)
        {
            m_game->m_explosions.Push(new Explosion(m_game));
            m_game->m_explosions.Last()->m_position = thing->m_position;
            Ticker::Ref(m_game->m_explosions.Last());

            m_game->m_powerups.Push(new Thing(m_game, 1, 6));
            m_game->m_powerups.Last()->m_position = thing->m_position;
            Ticker::Ref(m_game->m_powerups.Last());

            thing->m_dead = true;
            m_game->m_rockets[i]->m_dead = true;

            m_game->m_score += m_game->m_combo;
            m_game->m_combo += 100;
        }
    }
}

