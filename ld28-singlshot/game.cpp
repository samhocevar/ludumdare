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
#include "starfield.h"

Game::Game()
{
    m_controller = new Controller("Default", KEY_MAX /* keys */, 0 /* axes */);
    m_controller->GetKey(KEY_LEFT).Bind("Keyboard", "Left");
    m_controller->GetKey(KEY_RIGHT).Bind("Keyboard", "Right");
    m_controller->GetKey(KEY_UP).Bind("Keyboard", "Up");
    m_controller->GetKey(KEY_DOWN).Bind("Keyboard", "Down");

    /* First tileset */
    m_tiles1 = Tiler::Register("data/tiles1.png");

    /* Second tileset */
    m_tiles2 = Tiler::Register("data/tiles2.png");
    m_tiles2->AddTile(ibox2(0, 100, 18, 118));

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

    /* Ship */
    m_ship = new Thing(this, m_tiles2, 0);
    m_ship->m_position = vec3(0.f, -ARENA.y * 0.4f, 0.f);
    Ticker::Ref(m_ship);

    m_camera_pos = vec3(0.f, 0.f, 0.f);

    m_ready = false;
}

Game::~Game()
{
    Tiler::Deregister(m_tiles1);
    Tiler::Deregister(m_tiles2);

    Ticker::Unref(m_ship);
    Ticker::Unref(m_starfield);

    g_scene->PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void Game::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

//    m_camera_pos += 0.02f * (m_ship->m_position - m_camera_pos);

    /* Resolve input */
    vec3 velocity(0.f);
    velocity.x = (m_controller->GetKey(KEY_RIGHT).IsDown() ? 1.f : 0.f)
               - (m_controller->GetKey(KEY_LEFT).IsDown() ? 1.f : 0.f);
    velocity.y = (m_controller->GetKey(KEY_UP).IsDown() ? 1.f : 0.f)
               - (m_controller->GetKey(KEY_DOWN).IsDown() ? 1.f : 0.f);
    m_ship->m_position += normalize(velocity) * SPEED * seconds;
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

