﻿//
// Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32
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

sot3000_game::sot3000_game()
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
    m_level_text->SetPos(vec3(0.f, 20.f, 0.f));
    Ticker::Ref(m_level_text);

    m_level_name_text = new Text("", "data/font.png");
    m_level_name_text->SetAlign(TextAlign::Center);
    m_level_name_text->SetScale(vec2(0.2f));
    m_level_name_text->SetSpacing(-0.2f);
    m_level_name_text->SetPos(vec3(0.f, -40.f, 0.f));
    Ticker::Ref(m_level_name_text);

    m_start_text = new Text("", "data/font.png");
    m_start_text->SetAlign(TextAlign::Center);
    m_start_text->SetScale(vec2(0.15f));
    m_start_text->SetSpacing(-0.2f);
    Ticker::Ref(m_start_text);
}

sot3000_game::~sot3000_game()
{
    // Just in case; but this should not happen!
    if (m_instance)
    {
        Log::Error("there’s still a level active…\n");
        Ticker::Unref(m_instance);
    }

    // Clean up after ourselves
    Ticker::Unref(m_pause_text);
    Ticker::Unref(m_start_text);
    Ticker::Unref(m_level_text);
    Ticker::Unref(m_level_name_text);
    Tiler::Deregister(m_tiles);
    Tiler::Deregister(m_newtiles);
    Scene::PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void sot3000_game::TickGame(float seconds)
{
    Entity::TickGame(seconds);

    tick_events(seconds);
    tick_camera(seconds);
}

void sot3000_game::TickDraw(float seconds, Scene &scene)
{
    Entity::TickDraw(seconds, scene);

    m_tiles->GetTexture()->SetMagFiltering(TextureMagFilter::LINEAR_TEXEL);
    m_tiles->GetTexture()->SetMinFiltering(TextureMinFilter::LINEAR_TEXEL_NO_MIPMAP);

    m_newtiles->GetTexture()->SetMagFiltering(TextureMagFilter::LINEAR_TEXEL);
    m_newtiles->GetTexture()->SetMinFiltering(TextureMinFilter::LINEAR_TEXEL_NO_MIPMAP);

    //g_renderer->SetClearColor(vec4(0.9f, 0.9f, 0.9f, 1.f));
    g_renderer->SetClearColor(vec4(0.95f, 0.95f, 0.95f, 1.f));
    //g_renderer->SetClearColor(vec4(1.0f, 1.0f, 1.0f, 1.f));

    /* We do not draw much; the level itself takes care of it. */
    if (m_state == game_state::title_screen)
        scene.AddTile(m_tiles, Tiles::TitleScreen, vec3(-256.f, -192.f, 0.f), 0, vec2(1.f), 0.f);

    if (m_state == game_state::you_win)
        scene.AddTile(m_tiles, Tiles::YouWinScreen, vec3(-256.f, -192.f, 0.f), 0, vec2(1.f), 0.f);

    if (m_state == game_state::in_game
         || m_state == game_state::paused)
    {
        // Put the pause text in front of the camera…
        m_pause_text->SetPos(vec3(m_poi, 0.0f));

        // Display the active gun
        thing_type gun = m_instance->get_active_gun();
        if (gun != thing_type::none)
        {
            int id = gun == thing_type::blue_gun ? Tiles::BlueGun : Tiles::PinkGun;
            scene.AddTile(m_newtiles, id, vec3(m_poi + m_viewport_size * vec2(-0.45f, 0.30f), 50.f), 0, vec2(1.f), 0.f);
        }
    }
}

void sot3000_game::tick_camera(float seconds)
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
        vec2 world_size = m_instance->world_size();

        vec2 tmp(MAX_VIEWPORT_X, MAX_VIEWPORT_X * WINDOW_SIZE_Y / WINDOW_SIZE_X);
        tmp *= min(world_size.x / tmp.x, 1.f);
        tmp *= min(world_size.y / tmp.y, 1.f);
        tmp *= max(MIN_VIEWPORT_X / tmp.x, 1.f);
        m_viewport_size = tmp;

        mat4 proj = mat4::ortho(m_viewport_size.x, m_viewport_size.y, -100.f, 100.f);

        /* Try to center the camera around the player but don’t show stuff outside the
         * level boundaries if possible. */
        m_poi = m_instance->get_poi().xy;
        m_poi = max(m_poi, 0.5f * m_viewport_size + vec2(0.5f * TILE_SIZE));
        m_poi = min(m_poi, world_size - 0.5f * m_viewport_size - vec2(0.5f * TILE_SIZE));
        mat4 view = mat4::translate(-vec3(m_poi, 0.0f));

        m_camera->SetView(view);
        m_camera->SetProjection(proj);
    }

    if (m_state == game_state::paused)
    {
        m_pause_text->SetText("PAUSED");
    }
    else
    {
        m_pause_text->SetText("");
    }

    if (m_state == game_state::next_level && m_current_level < m_levels.count())
    {
        m_level_text->SetText(String::Printf("Level %d/%d", 1 + m_current_level, (int)m_levels.count()));
        m_level_name_text->SetText(String::Printf("%s", m_levels[m_current_level].get_name().C()));
    }
    else
    {
        m_level_text->SetText("");
        m_level_name_text->SetText("");
    }
}

void sot3000_game::tick_events(float seconds)
{
    if (m_state == game_state::next_level)
    {
        if (m_current_level >= m_levels.count())
        {
            m_state = game_state::you_win;
            return;
        }
    }

    // XXX: debug code
    if (m_controller->WasKeyPressedThisFrame(input::next_level))
    {
        if (m_state == game_state::in_game
             && m_current_level + 1 < m_levels.count())
        {
            Ticker::Unref(m_instance);
            m_instance = new level_instance();
            m_instance->init(m_levels[++m_current_level]);
            Ticker::Ref(m_instance);
        }
    }

    if (m_controller->WasKeyPressedThisFrame(input::pause)
         || m_controller->WasKeyPressedThisFrame(input::fire))
    {
        if (m_state == game_state::title_screen)
        {
            // Discover all levels
            m_levels.empty();
            m_current_level = 0;

            for (bool found = true; found;)
            {
                found = false;

                String name = String::Printf("data/level%d.txt", (int)m_levels.count() + 1);
                array<String> datafiles = System::GetPathList(name);
                for (String candidate : datafiles)
                {
                    File f;
                    f.Open(candidate, FileAccess::Read);
                    if (!f.IsValid())
                        continue;
                    m_levels.push(level_description());
                    m_levels.last().load_data(f.ReadString().C());
                    f.Close();
                    found = true;
                }
            }

            if (m_levels.count() > 0)
                m_state = game_state::next_level;
            return;
        }

        if (m_state == game_state::next_level)
        {
            // Create a new level
            m_instance = new level_instance();
            m_instance->init(m_levels[m_current_level]);
            Ticker::Ref(m_instance);

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
        if (m_instance->get_exit_reached())
        {
            Ticker::Unref(m_instance);
            m_instance = nullptr;
            ++m_current_level;
            m_state = game_state::next_level;
            return;
        }

        // Escape restarts the level when not paused
        if (m_controller->WasKeyPressedThisFrame(input::escape)
             || m_instance->get_player_fell())
        {
            Ticker::Unref(m_instance);
            m_instance = new level_instance();
            m_instance->init(m_levels[m_current_level]);
            Ticker::Ref(m_instance);
        }

        if (m_controller->IsKeyPressed(input::go_left))
            m_instance->impulse_x(-1.f);
        else if (m_controller->IsKeyPressed(input::go_right))
            m_instance->impulse_x(1.f);

        if (m_controller->WasKeyPressedThisFrame(input::jump))
            m_instance->jump();
        if (m_controller->IsKeyPressed(input::jump))
            m_instance->continue_jump(PLAYER_JUMP_SPEED, seconds);

        if (m_controller->WasKeyPressedThisFrame(input::fire))
            m_instance->fire();
    }
}

