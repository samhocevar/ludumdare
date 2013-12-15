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
    /* Fire */
    m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Space");

    /* First tileset */
    m_tiles[0] = Tiler::Register("data/tiles1.png");

    /* Second tileset */
    m_tiles[1] = Tiler::Register("data/tiles2.png");
    m_tiles[1]->AddTile(ibox2(0, 0, 20, 20)); /* ship */
    m_tiles[1]->AddTile(ibox2(20, 0, 40, 20)); /* ship */
    m_tiles[1]->AddTile(ibox2(40, 0, 60, 20)); /* alien 1 */
    m_tiles[1]->AddTile(ibox2(60, 0, 80, 20)); /* alien 1 */
    m_tiles[1]->AddTile(ibox2(0, 20, 20, 40)); /* rocket */
    m_tiles[1]->AddTile(ibox2(20, 20, 40, 40)); /* rocket */
    m_tiles[1]->AddTile(ibox2(40, 20, 60, 40)); /* powerup */

    m_camera = new Camera();
    m_camera->SetView(mat4(1.f));
    m_camera->SetProjection(mat4::ortho(-ARENA.x * 0.5f, ARENA.x * 0.5f,
                                        -ARENA.y * 0.5f, ARENA.y * 0.5f,
                                        -100.f, 100.f));
    g_scene->PushCamera(m_camera);
    Ticker::Ref(m_camera);

    /* Starfield */
    m_starfield = new Starfield(this);
    Ticker::Ref(m_starfield);

    /* HUD */
    m_hud = new Hud(this);
    Ticker::Ref(m_hud);

    /* Ship */
    m_ship = new Thing(this, 1, 0);
    m_ship->m_position = vec3(0.f, -ARENA.y * 0.4f, 20.f);
    Ticker::Ref(m_ship);

    m_camera_pos = vec3(0.f, 0.f, 0.f);

    m_power = 1;

    m_score = 0;
    m_combo = 100;

    m_prev_time = m_time = 0.0;
    m_ready = false;
}

Game::~Game()
{
    Tiler::Deregister(m_tiles[0]);
    Tiler::Deregister(m_tiles[1]);

    Ticker::Unref(m_hud);
    Ticker::Unref(m_ship);
    Ticker::Unref(m_starfield);
    for (int i = 0; i < m_explosions.Count(); ++i)
        Ticker::Unref(m_powerups[i]);
    for (int i = 0; i < m_powerups.Count(); ++i)
        Ticker::Unref(m_powerups[i]);
    for (int i = 0; i < m_rockets.Count(); ++i)
        Ticker::Unref(m_rockets[i]);
    for (int i = 0; i < m_waves.Count(); ++i)
        Ticker::Unref(m_waves[i]);

    g_scene->PopCamera(m_camera);
    Ticker::Unref(m_camera);
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
        m_rockets.Push(new Thing(this, 1, 5));
        m_rockets.Last()->m_position = m_ship->m_position;
        Ticker::Ref(m_rockets.Last());

        m_power = 0;
    }

    /* Advance powerups */
    for (int i = m_powerups.Count(); i--; )
    {
        m_powerups[i]->m_position.y -= SCROLL_SPEED * seconds;

        if (distance(m_ship->m_position.xy,
                     m_powerups[i]->m_position.xy) < 12.f)
        {
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
}

void Game::TickDraw(float seconds)
{
    WorldEntity::TickDraw(seconds);

    if (!m_ready)
    {
        g_renderer->SetClearColor(vec4(0.0f, 0.0f, 0.0f, 1.0f));
        m_ready = true;
    }
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
    return (m_prev_time + phase) / period
             <= lol::floor((m_time + phase) / period);
}

void Game::SpawnShit()
{
    /* Spawn a powerup every 8 seconds */
    if (HasPassed(8.0))
    {
        m_powerups.Push(new Thing(this, 1, 6));
        m_powerups.Last()->m_position = vec3(rand(-0.4f, 0.4f) * ARENA.x,
                                             ARENA.y, 10.f);
        Ticker::Ref(m_powerups.Last());
    }

    /* Spawn an enemy wave every 4 seconds, offset 1 second */
    if (HasPassed(4.0, 1.0))
    {
        m_waves.Push(new Wave(this, 0));
        Ticker::Ref(m_waves.Last());
    }
}

