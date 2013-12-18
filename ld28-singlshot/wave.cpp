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

using namespace lol;

#include "singlshot.h"
#include "game.h"
#include "thing.h"
#include "wave.h"
#include "explosion.h"

Wave::Wave(Game *game, int type)
  : m_dead(false),
    m_game(game),
    m_time(0.0),
    m_type(type)
{
    switch(type)
    {
    case 0:
        for (int i = 0; i < 9; ++i)
        {
            m_things.Push(new Thing(game, 2));
            Ticker::Ref(m_things.Last());

            m_fire_time.Push(rand(20.0));

            float d = i - 4.f;
            m_things.Last()->m_position = vec3(d * 30.f, ARENA.y * 0.8f + lol::abs(d) * 15.f, 10.f);
        }
        break;
    case 1:
        for (int i = 0; i < 9; ++i)
        {
            m_things.Push(new Thing(game, 10));
            Ticker::Ref(m_things.Last());

            m_fire_time.Push(rand(20.0));

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

    double fire_threshold = lol::clamp(10.0 - 2.0 * m_game->m_time / 60.0,
                                       1.0, 10.0);

    for (int i = 0; i < m_things.Count(); ++i)
    {
        m_fire_time[i] += seconds;

        /* Scroll down */
        m_things[i]->m_position += vec3(0.f, -SCROLL_SPEED, 0.f) * seconds;

        /* Use alternate tileset */
        m_things[i]->m_tileid |= 1;
        m_things[i]->m_tileid -= lol::sin(4.f * m_time) > 0;

        /* Fire? Only if we’re not dead and the player isn’t either */
        if (!m_things[i]->m_dead && !m_game->m_ship->m_dead
             && m_fire_time[i] > fire_threshold
             && m_things[i]->m_position.y < ARENA.y * 0.5f
             && m_things[i]->m_position.y > -ARENA.y * 0.5f)
        {
            /* Reset to zero in case we accumulated too much */
            m_fire_time[i] = 0.0;

            Sampler::PlaySample(m_game->m_snd_bullet);

            m_game->m_bullets.Push(new Thing(m_game, 8));
            m_game->m_bullets.Last()->m_position = m_things[i]->m_position;
            m_game->m_bullets.Last()->m_position.z = 0.0f;
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
        lol::distance(m_game->m_ship->m_position.xy, thing->m_position.xy) < 12.f)
    {
        m_game->m_explosions.Push(new Explosion(m_game));
        m_game->m_explosions.Last()->m_position = thing->m_position;
        m_game->m_explosions.Last()->m_position.z = 40.f;
        Ticker::Ref(m_game->m_explosions.Last());

        thing->m_dead = true;

        m_game->KillPlayer();
    }

    /* Check collisions with rockets */
    for (int i = 0; i < m_game->m_rockets.Count(); ++i)
    {
        if (m_game->m_rockets[i]->m_dead)
            continue;

        if (lol::distance(m_game->m_rockets[i]->m_position.xy,
                          thing->m_position.xy) < 12.f)
        {
            m_game->m_explosions.Push(new Explosion(m_game));
            m_game->m_explosions.Last()->m_position = thing->m_position;
            m_game->m_explosions.Last()->m_position.z = 40.f;
            Ticker::Ref(m_game->m_explosions.Last());

            m_game->m_powerups.Push(new Thing(m_game, 6));
            m_game->m_powerups.Last()->m_position = thing->m_position;
            m_game->m_powerups.Last()->m_position.z = 0.f;
            Ticker::Ref(m_game->m_powerups.Last());

            m_game->m_score_texts.Push(new Text(String::Printf("%d", m_game->m_combo), "data/font.png"));
            m_game->m_score_texts.Last()->SetAlign(Text::ALIGN_CENTER);
            m_game->m_score_texts.Last()->SetPos(vec3(thing->m_position.xy, 50.f));
            Ticker::Ref(m_game->m_score_texts.Last());

            thing->m_dead = true;
            m_game->m_rockets[i]->m_dead = true;

            m_game->m_score += m_game->m_combo;
            m_game->m_combo += 100;

            /* Stop missile sound */
            Sampler::StopSample(m_game->m_snd_missile);
        }
    }
}

