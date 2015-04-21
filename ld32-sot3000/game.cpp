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

// XXX: use this alternate set of maps for debugging purposes
#define USE_DEBUG_MAPS 0

using namespace lol;

#include "constants.h"
#include "game.h"
#if USE_DEBUG_MAPS
#   include "test_maps.h"
#else
#   include "final_maps.h"
#endif

ld32_game::ld32_game()
  : m_state(game_state::title_screen),
    m_current_level(0)
{
    m_tiles = Tiler::Register("data/tiles.png");
    m_tiles->AddTile(ivec2(16, 16));
    m_tiles->AddTile(ibox2(512, 640, 1024, 1024));
    m_tiles->AddTile(ibox2(0, 640, 512, 1024));

    m_newtiles = Tiler::Register("data/newtiles.png");
    m_newtiles->AddTile(ivec2(8, 8));

    m_camera = new Camera();
    Scene::PushCamera(m_camera);
    Ticker::Ref(m_camera);

    m_controller = new Controller("default controller");

    m_input << InputProfile::Keyboard(input::go_left, "Left");
    m_input << InputProfile::Keyboard(input::go_right, "Right");
    m_input << InputProfile::Keyboard(input::jump, "Up");
    m_input << InputProfile::Keyboard(input::fire, "Space");
    m_input << InputProfile::Keyboard(input::pause, "P");
    m_input << InputProfile::Keyboard(input::escape, "Escape");

    m_input << InputProfile::Keyboard(input::next_level, "X");

    m_input << InputProfile::JoystickKey(1, input::go_left, "DPadLeft");
    m_input << InputProfile::JoystickKey(1, input::go_right, "DPadRight");
    m_input << InputProfile::JoystickKey(1, input::jump, "Y");
    m_input << InputProfile::JoystickKey(1, input::fire, "X");
    m_input << InputProfile::JoystickKey(1, input::pause, "Start");

    m_controller->Init(m_input);

    m_pause_text = new Text("", "data/font.png");
    m_pause_text->SetAlign(TextAlign::Center);
    m_pause_text->SetSpacing(0.0f);
    Ticker::Ref(m_pause_text);

    m_level_text = new Text("", "data/font.png");
    m_level_text->SetAlign(TextAlign::Center);
    m_level_text->SetScale(vec2(0.25f));
    m_level_text->SetSpacing(-0.2f);
    Ticker::Ref(m_level_text);

    m_start_text = new Text("", "data/font.png");
    m_start_text->SetAlign(TextAlign::Center);
    m_start_text->SetScale(vec2(0.15f));
    m_start_text->SetSpacing(-0.2f);
    Ticker::Ref(m_start_text);
}

ld32_game::~ld32_game()
{
    // Just in case; but this should not happen!
    if (m_level)
    {
        Log::Error("there’s still a level active…");
        Ticker::Unref(m_level);
    }

    // Clean up after ourselves
    Ticker::Unref(m_pause_text);
    Ticker::Unref(m_start_text);
    Ticker::Unref(m_level_text);
    Tiler::Deregister(m_tiles);
    Tiler::Deregister(m_newtiles);
    Scene::PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void ld32_game::TickGame(float seconds)
{
    Entity::TickGame(seconds);

    tick_events(seconds);
    tick_camera(seconds);
}

void ld32_game::TickDraw(float seconds, Scene &scene)
{
    Entity::TickDraw(seconds, scene);

    m_tiles->GetTexture()->SetMagFiltering(TextureMagFilter::LINEAR_TEXEL);
    m_tiles->GetTexture()->SetMinFiltering(TextureMinFilter::LINEAR_TEXEL_NO_MIPMAP);

    m_newtiles->GetTexture()->SetMagFiltering(TextureMagFilter::LINEAR_TEXEL);
    m_newtiles->GetTexture()->SetMinFiltering(TextureMinFilter::LINEAR_TEXEL_NO_MIPMAP);

    g_renderer->SetClearColor(vec4(0.9f, 0.9f, 0.9f, 1.f));

    /* We do not draw much; the level itself takes care of it. */
    if (m_state == game_state::title_screen)
        scene.AddTile(m_tiles, Tiles::TitleScreen, vec3(-256.f, -192.f, 0.f), 0, vec2(1.f), 0.f);

    if (m_state == game_state::you_win)
        scene.AddTile(m_tiles, Tiles::YouWinScreen, vec3(-256.f, -192.f, 0.f), 0, vec2(1.f), 0.f);

    if (m_state == game_state::in_game)
    {
        // Put the pause text in front of the camera…
        m_pause_text->SetPos(vec3(m_poi, 0.0f));

        // Display the active gun
        thing_type gun = m_level->get_active_gun();
        if (gun != thing_type::none)
        {
            int id = gun == thing_type::blue_gun ? Tiles::BlueGun : Tiles::PinkGun;
            scene.AddTile(m_newtiles, id, vec3(m_poi + m_viewport_size * vec2(-0.45f, 0.30f), 50.f), 0, vec2(1.f), 0.f);
        }
    }
}

void ld32_game::tick_camera(float seconds)
{
    UNUSED(seconds);

    if (m_state == game_state::title_screen
         || m_state == game_state::next_level
         || m_state == game_state::you_win)
    {
        mat4 view = mat4::identity;
        m_camera->SetView(view);

        mat4 proj = mat4::ortho(512.f, 384.f, -100.f, 100.f);
        m_camera->SetProjection(proj);
    }

    if (m_state == game_state::title_screen)
    {
        m_start_text->SetPos(vec3(0.f, 0.f, 50.f));
        m_start_text->SetText("Press start to start!!");
    }
    else
    {
        m_start_text->SetText("");
    }

    if (m_state == game_state::in_game)
    {
        vec2 level_size = m_level->world_size();
        float zoom_in  = min(min(MAX_VIEWPORT_X / level_size.x,
                                 MAX_VIEWPORT_Y / level_size.y), 1.f);
        float zoom_out = max(max(MIN_VIEWPORT_X / level_size.x,
                                 MIN_VIEWPORT_Y / level_size.y), 1.f);
        m_viewport_size = level_size * zoom_in * zoom_out;
        mat4 proj = mat4::ortho(m_viewport_size.x, m_viewport_size.y, -100.f, 100.f);

        /* Try to center the camera around the player but don’t show stuff outside the
         * level boundaries if possible. */
        m_poi = m_level->get_poi().xy;
        m_poi = max(m_poi, 0.5f * m_viewport_size);
        m_poi = min(m_poi, level_size - 0.5f * m_viewport_size);
        mat4 view = mat4::translate(-vec3(m_poi, 0.0f));

        m_camera->SetView(view);
        m_camera->SetProjection(proj);

        // FIXME: this is wrong but honestly I don't have time to fix it
        m_pause_text->SetScale(vec2(1.5f / (zoom_in * zoom_out)));
    }

    if (m_state == game_state::paused)
    {
        m_pause_text->SetText("PAUSED");
    }
    else
    {
        m_pause_text->SetText("");
    }

    if (m_state == game_state::next_level)
    {
        String str = String::Printf("Level %d/%d", 1 + m_current_level, g_map_count);
        m_level_text->SetText(str);
    }
    else
    {
        m_level_text->SetText("");
    }
}

void ld32_game::tick_events(float seconds)
{
    if (m_state == game_state::next_level)
    {
        if (m_current_level >= g_map_count)
        {
            m_state = game_state::you_win;
            return;
        }
    }

    // XXX: debug code
    if (m_controller->WasKeyPressedThisFrame(input::next_level))
    {
        if (m_state == game_state::in_game
             && m_current_level + 1 < g_map_count)
        {
            Ticker::Unref(m_level);
            m_level = new level_instance();
            m_level_desc.load_data(g_maps[++m_current_level]);
            m_level->init(m_level_desc);
            Ticker::Ref(m_level);
        }
    }

    if (m_controller->WasKeyPressedThisFrame(input::pause)
         || m_controller->WasKeyPressedThisFrame(input::fire))
    {
        if (m_state == game_state::title_screen)
        {
            m_current_level = 0;
            m_state = game_state::next_level;
            return;
        }

        if (m_state == game_state::next_level)
        {
            m_level_desc.load_data(g_maps[m_current_level]);

            // Create a new level
            m_level = new level_instance();
            m_level->init(m_level_desc);
            Ticker::Ref(m_level);

            m_state = game_state::in_game;
            return; // state has changed — don’t do anything else
        }

        if (m_state == game_state::you_win)
        {
            m_state = game_state::title_screen;
            return;
        }
    }

    // Allow to pause the game
    if (m_controller->WasKeyPressedThisFrame(input::pause))
    {
        if (m_state == game_state::in_game)
        {
            m_state = game_state::paused;
            return;
        }
        else if (m_state == game_state::paused)
        {
            m_state = game_state::in_game;
            return;
        }
    }

    // Input stuff
    if (m_state == game_state::in_game)
    {
        if (m_level->get_exit_reached())
        {
            ++m_current_level;
            Ticker::Unref(m_level);
            m_level = nullptr;
            m_state = game_state::next_level;
            return;
        }

        // Escape restarts the level when not paused
        if (m_controller->WasKeyPressedThisFrame(input::escape)
             || m_level->get_player_fell())
        {
            Ticker::Unref(m_level);
            m_level = new level_instance();
            m_level->init(m_level_desc);
            Ticker::Ref(m_level);
        }

        if (m_controller->IsKeyPressed(input::go_left))
            m_level->impulse_x(-1.f);
        else if (m_controller->IsKeyPressed(input::go_right))
            m_level->impulse_x(1.f);

        if (m_controller->WasKeyPressedThisFrame(input::jump))
            m_level->jump();
        if (m_controller->IsKeyPressed(input::jump))
            m_level->continue_jump(PLAYER_JUMP_SPEED, seconds);

        if (m_controller->WasKeyPressedThisFrame(input::fire))
            m_level->fire();
    }
}

