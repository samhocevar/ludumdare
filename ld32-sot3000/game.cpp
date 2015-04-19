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
{
    m_tiles = Tiler::Register("data/tiles.png");
    m_tiles->AddTile(ivec2(16, 16));

    m_camera = new Camera();
    m_camera->SetView(mat4(1.f));
    m_camera->SetProjection(mat4::ortho((float)VIEWPORT_SIZE_X, (float)VIEWPORT_SIZE_Y, -100.f, 100.f));
    g_scene->PushCamera(m_camera);
    Ticker::Ref(m_camera);

    m_controller = new Controller("default controller");
    m_input << InputProfile::Keyboard(input::go_left, "Left");
    m_input << InputProfile::Keyboard(input::go_right, "Right");
    m_input << InputProfile::Keyboard(input::jump, "Up");
    m_input << InputProfile::Keyboard(input::fire, "Space");
    m_input << InputProfile::JoystickKey(1, input::go_left, "DPadLeft");
    m_input << InputProfile::JoystickKey(1, input::go_right, "DPadRight");
    m_input << InputProfile::JoystickKey(1, input::jump, "Y");
    m_input << InputProfile::JoystickKey(1, input::fire, "X");
    m_controller->Init(m_input);

    // Some debug 
    char const *debug_info[] = { "Hi :-)", "\\o/", "$%!%^#@" };
    float debug_y = VIEWPORT_SIZE_Y * 0.5f;
    for (auto t : debug_info)
    {
        m_debug_text.push(new Text(t, "data/font.png"));
        m_debug_text.last()->SetPos(vec3(VIEWPORT_SIZE_X * 0.5f, debug_y, 50.f));
        m_debug_text.last()->SetAlign(TextAlign::Center);
        m_debug_text.last()->SetScale(vec2(0.6f));
        m_debug_text.last()->SetSpacing(-0.0f);
        Ticker::Ref(m_debug_text.last());
        debug_y -= 1.5f * TILE_SIZE;
    }

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
    for (auto t : m_debug_text)
        Ticker::Unref(t);

    Tiler::Deregister(m_tiles);
    g_scene->PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void ld32_game::TickGame(float seconds)
{
    Entity::TickGame(seconds);

    // Center the camera around the centre of the level for now
    mat4 view = mat4::translate(vec3(vec2(m_level->size()), 0.f) * (-0.5f * TILE_SIZE));
    m_camera->SetView(view);

    // Input stuff
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

void ld32_game::TickDraw(float seconds, Scene &scene)
{
    Entity::TickDraw(seconds, scene);

    g_renderer->SetClearColor(vec4(1.f));
}

