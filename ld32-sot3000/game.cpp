//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#if HAVE_CONFIG_H
#   include "config.h"
#endif

#include <lol/engine.h>

using namespace lol;

#include "constants.h"
#include "game.h"

ld32_game::ld32_game()
  : m_paused(false)
{
    m_tiles = Tiler::Register("data/tiles.png");
    m_tiles->AddTile(ivec2(16, 16));

    m_camera = new Camera();
    g_scene->PushCamera(m_camera);
    Ticker::Ref(m_camera);

    m_controller = new Controller("default controller");

    m_input << InputProfile::Keyboard(input::go_left, "Left");
    m_input << InputProfile::Keyboard(input::go_right, "Right");
    m_input << InputProfile::Keyboard(input::jump, "Up");
    m_input << InputProfile::Keyboard(input::fire, "Space");
    m_input << InputProfile::Keyboard(input::pause, "P");
    m_input << InputProfile::Keyboard(input::escape, "Escape");

    m_input << InputProfile::JoystickKey(1, input::go_left, "DPadLeft");
    m_input << InputProfile::JoystickKey(1, input::go_right, "DPadRight");
    m_input << InputProfile::JoystickKey(1, input::jump, "Y");
    m_input << InputProfile::JoystickKey(1, input::fire, "X");
    m_input << InputProfile::JoystickKey(1, input::pause, "Start");
    m_controller->Init(m_input);

    m_pause_text = new Text("PAUSED!", "data/font.png");
    m_pause_text->SetAlign(TextAlign::Center);
    m_pause_text->SetSpacing(0.0f);
    Ticker::Ref(m_pause_text);

    // “Load” a test map
    m_map = new test_map();

    // Create a new level
    m_level = new level_instance();
    m_level->load_map(m_map);
    Ticker::Ref(m_level);
}

ld32_game::~ld32_game()
{
    // Destroy the current level
    m_level->clear();
    Ticker::Unref(m_level);

    // Destroy the test map
    delete m_map;

    // Clean up after ourselves
    Ticker::Unref(m_pause_text);
    Tiler::Deregister(m_tiles);
    g_scene->PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void ld32_game::TickGame(float seconds)
{
    Entity::TickGame(seconds);

    tick_input(seconds);
    tick_camera(seconds);
}

void ld32_game::TickDraw(float seconds, Scene &scene)
{
    Entity::TickDraw(seconds, scene);

    g_renderer->SetClearColor(vec4(0.9f, 0.9f, 0.9f, 1.f));

    /* We do not draw much; the level itself takes care of it. */
}

void ld32_game::tick_camera(float seconds)
{
    vec2 level_size = m_level->world_size();
    float zoom_in  = min(min(MAX_VIEWPORT_X / level_size.x,
                             MAX_VIEWPORT_Y / level_size.y), 1.f);
    float zoom_out = max(max(MIN_VIEWPORT_X / level_size.x,
                             MIN_VIEWPORT_Y / level_size.y), 1.f);
    vec2 viewport_size = level_size * zoom_in * zoom_out;
    mat4 proj = mat4::ortho(viewport_size.x, viewport_size.y, -100.f, 100.f);

    /* Try to center the camera around the player but don’t show stuff outside the
     * level boundaries if possible. */
    vec2 poi = m_level->get_poi().xy;
    poi = max(poi, 0.5f * viewport_size);
    poi = min(poi, level_size - 0.5f * viewport_size);
    mat4 view = mat4::translate(-vec3(poi, 0.0f));

    m_camera->SetView(view);
    m_camera->SetProjection(proj);

    // Handle the HUD here because it can use POI for instance
    if (m_paused)
    {
        m_pause_text->SetPos(vec3(poi, 0.0f));
        // FIXME: this is wrong but honestly I don't have time to fix it
        m_pause_text->SetScale(vec2(1.f / (zoom_in * zoom_out)));
    }
    else
    {
        // Put the pause text behind the camera…
        m_pause_text->SetPos(vec3(0.f, 0.f, -1000.f));
    }
}

void ld32_game::tick_input(float seconds)
{
    if (m_controller->WasKeyPressedThisFrame(input::escape))
    {
        if (!m_paused)
        {
            // Escape restarts the level when not paused
            Ticker::Unref(m_level);
            m_level = new level_instance();
            m_level->load_map(m_map);
            Ticker::Ref(m_level);
        }
    }

    // Allow to pause the game
    if (m_controller->WasKeyPressedThisFrame(input::pause))
    {
        m_paused = !m_paused;
    }

    // Input stuff
    if (!m_paused)
    {
        if (m_controller->IsKeyPressed(input::go_left))
            m_level->impulse_x(-PLAYER_RUN_SPEED);
        else if (m_controller->IsKeyPressed(input::go_right))
            m_level->impulse_x(PLAYER_RUN_SPEED);

        if (m_controller->WasKeyPressedThisFrame(input::jump))
            m_level->jump();
        if (m_controller->IsKeyPressed(input::jump))
            m_level->continue_jump(PLAYER_JUMP_SPEED, seconds);

        if (m_controller->WasKeyPressedThisFrame(input::fire))
            m_level->fire();
    }
}

