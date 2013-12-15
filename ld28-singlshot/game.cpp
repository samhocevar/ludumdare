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

Game::Game()
{
    m_controller = new Controller("Default", KEY_MAX /* keys */, 0 /* axes */);
    m_controller->GetKey(KEY_LEFT).Bind("Keyboard", "Left");
    m_controller->GetKey(KEY_RIGHT).Bind("Keyboard", "Right");

    m_camera = new Camera();
    m_camera->SetView(mat4(1.f));
    m_camera->SetProjection(mat4::ortho(-320.f, 320.f,
                                        -240.f, 240.f,
                                        -100.f, 100.f));
    g_scene->PushCamera(m_camera);
    Ticker::Ref(m_camera);

    m_ship_pos = vec2(200.f, 200.f);

    m_camera_pos = vec2::zero;

    m_ready = false;
}

Game::~Game()
{
    g_scene->PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void Game::TickGame(float seconds)
{
    WorldEntity::TickGame(seconds);

    m_camera_pos += 0.1f * (m_ship_pos - m_camera_pos);

    /* Resolve input */
    float speed = (m_controller->GetKey(KEY_LEFT).IsDown() ? SPEED : 0.f)
                - (m_controller->GetKey(KEY_RIGHT).IsDown() ? SPEED : 0.f);
    m_ship_pos += vec2(speed, 0.f) * seconds;
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

