﻿//
//  Singlshot — A shooter developed for Ludum Dare 28
//
//  Copyright © 2013 Sam Hocevar <sam@hocevar.net>
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

#include <lol/engine.h>

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
    m_controller = new Controller("Default");
    m_controller->SetInputCount(KEY_MAX /* keys */, 0 /* axes */);
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
    m_snd_missile = sampler::load_sample("data/missile.wav");
    m_snd_bullet = sampler::load_sample("data/bullet.wav");
    m_snd_explosion = sampler::load_sample("data/explosion.wav");
    m_snd_powerup = sampler::load_sample("data/powerup.wav");

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

    m_hint_text = nullptr;
    m_hint = 0;

    m_score = 0;
    m_combo = 100;

    m_prev_time = m_time = 0.0;
    m_ready = false;
}

Game::~Game()
{
    Tiler::Deregister(m_tiles);

    sampler::unload_sample(m_snd_missile);
    sampler::unload_sample(m_snd_bullet);
    sampler::unload_sample(m_snd_explosion);
    sampler::unload_sample(m_snd_powerup);

    Ticker::Unref(m_ship);
    Ticker::Unref(m_starfield);
    for (auto explosion : m_explosions)
        Ticker::Unref(explosion);
    for (auto powerup : m_powerups)
        Ticker::Unref(powerup);
    for (auto rocket : m_rockets)
        Ticker::Unref(rocket);
    for (auto bullet : m_bullets)
        Ticker::Unref(bullet);
    for (auto wave : m_waves)
        Ticker::Unref(wave);

    for (auto score_text : m_score_texts)
        Ticker::Unref(score_text);
    if (m_hint_text)
        Ticker::Unref(m_hint_text);

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
        velocity.x = (int)m_controller->IsKeyPressed(KEY_RIGHT)
            - (int)m_controller->IsKeyPressed(KEY_LEFT);
        velocity.y = (int)m_controller->IsKeyPressed(KEY_UP)
            - (int)m_controller->IsKeyPressed(KEY_DOWN);
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
    for (int i = m_rockets.count(); i--; )
    {
        m_rockets[i]->m_position.y += ROCKET_SPEED * seconds;

        if (m_rockets[i]->m_dead)
        {
            Ticker::Unref(m_rockets[i]);
            m_rockets.remove(i);
        }
        else if (m_rockets[i]->m_position.y > ARENA.y * 0.5f + 15.f)
        {
            Ticker::Unref(m_rockets[i]);
            m_rockets.remove(i);

            /* Rocket is lost: reset combo to minimum */
            m_combo = 100;
        }
    }

    /* Advance bullets */
    for (int i = m_bullets.count(); i--; )
    {
        m_bullets[i]->m_position += m_bullets[i]->m_velocity * seconds;

        m_bullets[i]->m_tileid |= 1;
        m_bullets[i]->m_tileid -= lol::sin(15.f * m_time) > 0.0f;

        if (lol::distance(m_ship->m_position.xy, m_bullets[i]->m_position.xy) < 8.f)
        {
            KillPlayer();

            Ticker::Unref(m_bullets[i]);
            m_bullets.remove(i);
        }
        else if (m_bullets[i]->m_position.y > ARENA.y
                  || m_bullets[i]->m_position.y < -ARENA.y
                  || m_bullets[i]->m_position.x > ARENA.x
                  || m_bullets[i]->m_position.x < -ARENA.x)
        {
            Ticker::Unref(m_bullets[i]);
            m_bullets.remove(i);
        }
    }

    /* Advance explosions */
    for (int i = m_explosions.count(); i--; )
    {
        if (m_explosions[i]->m_time > 5.f)
        {
            Ticker::Unref(m_explosions[i]);
            m_explosions.remove(i);
        }
    }

    /* Resolve fire */
    if (!m_ship->m_dead && m_power && m_controller->IsKeyPressed(KEY_FIRE))
    {
        sampler::play_sample(m_snd_missile);

        m_rockets.push(new Thing(this, 5));
        m_rockets.last()->m_position = m_ship->m_position;
        Ticker::Ref(m_rockets.last());

        m_power = 0;
    }

    /* Advance powerups */
    for (int i = m_powerups.count(); i--; )
    {
        m_powerups[i]->m_position.y -= POWERUP_SPEED * seconds;

        if (m_hint_text)
            m_hint_text->SetPos(m_hint_text->GetPos()
                                 - vec3(0.f, POWERUP_SPEED * seconds, 0.f));

        m_powerups[i]->m_tileid |= 1;
        m_powerups[i]->m_tileid -= (lol::sin(15.0 * m_time) > 0.0);

        if (lol::distance(m_ship->m_position.xy,
                     m_powerups[i]->m_position.xy) < 12.f)
        {
            sampler::play_sample(m_snd_powerup);

            if (m_power)
            {
                m_score_texts.push(new Text("1000", "data/font.png"));
                m_score_texts.last()->SetAlign(TextAlign::Center);
                m_score_texts.last()->SetPos(vec3(m_powerups[i]->m_position.xy, 50.f));
                Ticker::Ref(m_score_texts.last());

                m_score += 1000;
            }

            ++m_power;

            if (m_hint_text)
            {
                Ticker::Unref(m_hint_text);
                m_hint_text = nullptr;
            }

            Ticker::Unref(m_powerups[i]);
            m_powerups.remove(i);
        }
        else if (m_powerups[i]->m_position.y < -ARENA.y * 0.5f - 15.f)
        {
            if (m_hint_text)
            {
                Ticker::Unref(m_hint_text);
                m_hint_text = nullptr;
            }

            Ticker::Unref(m_powerups[i]);
            m_powerups.remove(i);
        }
    }

    /* Advance text */
    for (int i = m_score_texts.count(); i--; )
    {
        vec3 pos = m_score_texts[i]->GetPos();
        pos.y += POWERUP_SPEED * seconds;
        m_score_texts[i]->SetPos(pos);

        if (pos.y > ARENA.y)
        {
            Ticker::Unref(m_score_texts[i]);
            m_score_texts.remove(i);
        }
    }
}

void Game::TickDraw(float seconds, Scene &scene)
{
    WorldEntity::TickDraw(seconds, scene);
}

void Game::KillPlayer()
{
    if (!m_ship->m_dead)
    {
        m_explosions.push(new Explosion(this));
        m_explosions.last()->m_position = m_ship->m_position;
        Ticker::Ref(m_explosions.last());
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
        m_powerups.push(new Thing(this, 6));
        m_powerups.last()->m_position = vec3(rand(-0.4f, 0.4f) * ARENA.x,
                                             ARENA.y * 0.5f + 10.f, 0.f);
        Ticker::Ref(m_powerups.last());

        if (!m_hint)
        {
            m_hint = 1;
            m_hint_text = new Text("Pick Me Up!!", "data/font.png");
            m_hint_text->SetAlign(TextAlign::Center);
            m_hint_text->SetPos(m_powerups.last()->m_position
                                 + vec3(0.f, 20.f, 0.f));
            Ticker::Ref(m_hint_text);
        }
    }

    /* Spawn an enemy wave every 16 seconds */
    if (HasPassed(16.0))
    {
        int type = HasPassed(32.0) ? 0 : 1;

        m_waves.push(new Wave(this, type));
        Ticker::Ref(m_waves.last());
    }
}

