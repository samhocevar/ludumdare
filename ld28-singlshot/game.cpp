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

#include "starfield.h"
#include "explosion.h"

#include "hud.h"

Game::Game()
{
    m_controller = new Controller("Default", KEY_MAX /* keys */, 0 /* axes */);
    /* up/down/left/right */
    m_controller->GetKey(KEY_LEFT).Bind("Keyboard", "Left");
    m_controller->GetKey(KEY_RIGHT).Bind("Keyboard", "Right");
    m_controller->GetKey(KEY_UP).Bind("Keyboard", "Up");
    m_controller->GetKey(KEY_DOWN).Bind("Keyboard", "Down");
    /* WASD */
    m_controller->GetKey(KEY_LEFT).Bind("Keyboard", "A");
    m_controller->GetKey(KEY_LEFT).Bind("Keyboard", "Q");
    m_controller->GetKey(KEY_RIGHT).Bind("Keyboard", "D");
    m_controller->GetKey(KEY_UP).Bind("Keyboard", "W");
    m_controller->GetKey(KEY_UP).Bind("Keyboard", "Z");
    m_controller->GetKey(KEY_DOWN).Bind("Keyboard", "S");
    /* IJKL */
    m_controller->GetKey(KEY_LEFT).Bind("Keyboard", "J");
    m_controller->GetKey(KEY_RIGHT).Bind("Keyboard", "L");
    m_controller->GetKey(KEY_UP).Bind("Keyboard", "I");
    m_controller->GetKey(KEY_DOWN).Bind("Keyboard", "K");
    /* Fire */
    m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Space");
    m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Return");
    m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Tab");

    Ticker::Ref(m_controller);

    /* SFX */
    m_snd_missile = Sampler::Register("data/missile.wav");
    m_snd_bullet = Sampler::Register("data/bullet.wav");

    /* Tileset */
    m_tiles = Tiler::Register("data/tiles.png");

    /* Starfield */
    m_starfield = new Starfield(this);
    Ticker::Ref(m_starfield);

    /* Ship */
    m_ship = new Thing(this, 0);
    m_ship->m_position = vec3(0.f, -ARENA.y * 0.4f, 20.f);
    Ticker::Ref(m_ship);

    m_camera_pos = vec3(0.f, 0.f, 0.f);

    m_power = 0;

    m_score = 0;
    m_combo = 100;

    m_prev_time = m_time = 0.0;
    m_ready = false;
}

Game::~Game()
{
    Tiler::Deregister(m_tiles);

    Sampler::Deregister(m_snd_missile);
    Sampler::Deregister(m_snd_bullet);

    Ticker::Unref(m_ship);
    Ticker::Unref(m_starfield);
    for (int i = 0; i < m_explosions.Count(); ++i)
        Ticker::Unref(m_explosions[i]);
    for (int i = 0; i < m_powerups.Count(); ++i)
        Ticker::Unref(m_powerups[i]);
    for (int i = 0; i < m_rockets.Count(); ++i)
        Ticker::Unref(m_rockets[i]);
    for (int i = 0; i < m_bullets.Count(); ++i)
        Ticker::Unref(m_bullets[i]);
    for (int i = 0; i < m_waves.Count(); ++i)
        Ticker::Unref(m_waves[i]);
    for (int i = 0; i < m_texts.Count(); ++i)
        Ticker::Unref(m_texts[i]);

    Ticker::Unref(m_controller);
}

void Game::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    m_prev_time = m_time;
    m_time += seconds;

//    m_camera_pos += 0.02f * (m_ship->m_position - m_camera_pos);

    /* Spawn shit */
    SpawnShit();

    /* Resolve input */
    if (!m_ship->m_dead)
    {
        vec3 velocity(0.f);
        velocity.x = (int)m_controller->GetKey(KEY_RIGHT).IsDown()
                   - (int)m_controller->GetKey(KEY_LEFT).IsDown();
        velocity.y = (int)m_controller->GetKey(KEY_UP).IsDown()
                   - (int)m_controller->GetKey(KEY_DOWN).IsDown();
        m_ship->m_position += normalize(velocity) * SHIP_SPEED * seconds;
        m_ship->m_position.x = clamp(m_ship->m_position.x,
                                     -ARENA.x / 2 + 9.f, ARENA.x / 2 - 9.f);
        m_ship->m_position.y = clamp(m_ship->m_position.y,
                                     -ARENA.y / 2 + 9.f, ARENA.y / 2 - 9.f);

        m_ship->m_tileid = m_power ? 12 : 0;

        m_ship->m_tileid |= 1;
        m_ship->m_tileid -= (length(velocity) == 0.0f);
    }

    /* Advance rockets */
    for (int i = m_rockets.Count(); i--; )
    {
        m_rockets[i]->m_position.y += ROCKET_SPEED * seconds;

        if (m_rockets[i]->m_dead)
        {
            Ticker::Unref(m_rockets[i]);
            m_rockets.Remove(i);
        }
        else if (m_rockets[i]->m_position.y > ARENA.y * 0.5f + 15.f)
        {
            Ticker::Unref(m_rockets[i]);
            m_rockets.Remove(i);

            /* Rocket is lost: reset combo to minimum */
            m_combo = 100;
        }
    }

    /* Advance bullets */
    for (int i = m_bullets.Count(); i--; )
    {
        m_bullets[i]->m_position += m_bullets[i]->m_velocity * seconds;

        m_bullets[i]->m_tileid |= 1;
        m_bullets[i]->m_tileid -= lol::sin(15.f * m_time) > 0.0f;

        if (lol::distance(m_ship->m_position.xy, m_bullets[i]->m_position.xy) < 8.f)
        {
            KillPlayer();

            Ticker::Unref(m_bullets[i]);
            m_bullets.Remove(i);
        }
        else if (m_bullets[i]->m_position.y > ARENA.y
                  || m_bullets[i]->m_position.y < -ARENA.y
                  || m_bullets[i]->m_position.x > ARENA.x
                  || m_bullets[i]->m_position.x < -ARENA.x)
        {
            Ticker::Unref(m_bullets[i]);
            m_bullets.Remove(i);
        }
    }

    /* Advance explosions */
    for (int i = m_explosions.Count(); i--; )
    {
        if (m_explosions[i]->m_time > 5.f)
        {
            Ticker::Unref(m_explosions[i]);
            m_explosions.Remove(i);
        }
    }

    /* Resolve fire */
    if (!m_ship->m_dead && m_power && m_controller->GetKey(KEY_FIRE).IsDown())
    {
        Sampler::PlaySample(m_snd_missile);

        m_rockets.Push(new Thing(this, 5));
        m_rockets.Last()->m_position = m_ship->m_position;
        Ticker::Ref(m_rockets.Last());

        m_power = 0;
    }

    /* Advance powerups */
    for (int i = m_powerups.Count(); i--; )
    {
        m_powerups[i]->m_position.y -= POWERUP_SPEED * seconds;

        m_powerups[i]->m_tileid |= 1;
        m_powerups[i]->m_tileid -= (lol::sin(15.0 * m_time) > 0.0);

        if (lol::distance(m_ship->m_position.xy,
                     m_powerups[i]->m_position.xy) < 12.f)
        {
            if (m_power)
            {
                m_texts.Push(new Text("1000", "data/font.png"));
                m_texts.Last()->SetAlign(Text::ALIGN_CENTER);
                m_texts.Last()->SetPos(vec3(m_powerups[i]->m_position.xy, 50.f));
                Ticker::Ref(m_texts.Last());

                m_score += 1000;
            }

            ++m_power;

            Ticker::Unref(m_powerups[i]);
            m_powerups.Remove(i);
        }
        else if (m_powerups[i]->m_position.y < -ARENA.y * 0.5f - 15.f)
        {
            Ticker::Unref(m_powerups[i]);
            m_powerups.Remove(i);
        }
    }

    /* Advance text */
    for (int i = m_texts.Count(); i--; )
    {
        vec3 pos = m_texts[i]->GetPos();
        pos.y += POWERUP_SPEED * seconds;
        m_texts[i]->SetPos(pos);

        if (pos.y > ARENA.y)
        {
            Ticker::Unref(m_texts[i]);
            m_texts.Remove(i);
        }
    }
}

void Game::TickDraw(float seconds)
{
    WorldEntity::TickDraw(seconds);
}

void Game::KillPlayer()
{
    if (!m_ship->m_dead)
    {
        m_explosions.Push(new Explosion(this));
        m_explosions.Last()->m_position = m_ship->m_position;
        Ticker::Ref(m_explosions.Last());
    }

    m_ship->m_dead = true;
}

bool Game::HasPassed(double period, double phase)
{
    return (m_prev_time - phase) / period
             <= lol::floor((m_time - phase) / period);
}

void Game::SpawnShit()
{
    /* Don’t spawn anything if we’re dead */
    if (m_ship->m_dead)
        return;

    /* Spawn a powerup every 8 seconds */
    if (HasPassed(8.0, 2.0))
    {
        m_powerups.Push(new Thing(this, 6));
        m_powerups.Last()->m_position = vec3(rand(-0.4f, 0.4f) * ARENA.x,
                                             ARENA.y * 0.5f + 10.f, 0.f);
        Ticker::Ref(m_powerups.Last());
    }

    /* Spawn an enemy wave every 16 seconds */
    if (HasPassed(16.0))
    {
        int type = HasPassed(32.0) ? 0 : 1;

        m_waves.Push(new Wave(this, type));
        Ticker::Ref(m_waves.Last());
    }
}

