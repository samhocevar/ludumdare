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

Game::Game()
{
    m_controller = new Controller("Default", KEY_MAX /* keys */, 0 /* axes */);
    m_controller->GetKey(KEY_LEFT).Bind("Keyboard", "Left");
    m_controller->GetKey(KEY_RIGHT).Bind("Keyboard", "Right");

    /* First tileset */
    m_tiles1 = Tiler::Register("data/tiles1.png");

    /* Second tileset */
    m_tiles2 = Tiler::Register("data/tiles2.png");
    m_tiles2->AddTile(ibox2(0, 100, 18, 118));

    m_camera = new Camera();
    m_camera->SetView(mat4(1.f));
    m_camera->SetProjection(mat4::ortho(-160.f, 160.f,
                                        -120.f, 120.f,
                                        -100.f, 100.f));
    g_scene->PushCamera(m_camera);
    Ticker::Ref(m_camera);

    /* Ship */
    m_ship = new Thing(this, m_tiles2, 0);
    m_ship->m_position = vec3(200.f, 200.f, 0.f);
    Ticker::Ref(m_ship);

    m_camera_pos = vec3::zero;

    m_ready = false;
}

Game::~Game()
{
    Tiler::Deregister(m_tiles1);
    Tiler::Deregister(m_tiles2);

    Ticker::Unref(m_ship);

    g_scene->PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void Game::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    m_camera_pos += 0.1f * (m_ship->m_position - m_camera_pos);

    /* Resolve input */
    float speed = (m_controller->GetKey(KEY_RIGHT).IsDown() ? SPEED : 0.f)
                - (m_controller->GetKey(KEY_LEFT).IsDown() ? SPEED : 0.f);
    m_ship->m_position += vec3(speed, 0.f, 0.f) * seconds;
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

