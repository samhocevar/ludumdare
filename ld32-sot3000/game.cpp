//
//  Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32
//
//  Copyright © 2015 Sam Hocevar <sam@hocevar.net>
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

#define DEBUG_CODE 0 // press X to skip level

#include "constants.h"
#include "game.h"

sot3000_game::sot3000_game()
  : m_state(game_state::title_screen),
    m_current_level(0),
    m_instance(nullptr)
{
    m_tiles = Tiler::Register("data/tiles.png");
    m_tiles->AddTile(ivec2(8, 8));

    m_title = Tiler::Register("data/title.png");
    m_title->AddTile(ibox2(0, 0, 1024, 768));

    m_background = Tiler::Register("data/background.png");
    m_background->AddTile(ibox2(0, 0, 1024, 1024));

    m_camera = new Camera();
    Scene& scene = Scene::GetScene();
    scene.PushCamera(m_camera);
    Ticker::Ref(m_camera);

    m_controller = new Controller("default controller");

    m_input << InputProfile::Keyboard(input::go_left, "Left");
    m_input << InputProfile::Keyboard(input::go_left, "Q");
    m_input << InputProfile::Keyboard(input::go_left, "A");
    m_input << InputProfile::Keyboard(input::go_right, "Right");
    m_input << InputProfile::Keyboard(input::go_right, "D");
    m_input << InputProfile::Keyboard(input::jump, "W");
    m_input << InputProfile::Keyboard(input::jump, "Z");
    m_input << InputProfile::Keyboard(input::jump, "Up");
    m_input << InputProfile::Keyboard(input::jump, "Space");
    m_input << InputProfile::Keyboard(input::fire, "S");
    m_input << InputProfile::Keyboard(input::fire, "Down");
    m_input << InputProfile::Keyboard(input::fire, "Return");
    m_input << InputProfile::Keyboard(input::do_pause, "P");
    m_input << InputProfile::Keyboard(input::reset, "R");
    m_input << InputProfile::Keyboard(input::escape, "Escape");

#if DEBUG_CODE
    m_input << InputProfile::Keyboard(input::next_level, "X");
#endif

    m_input << InputProfile::JoystickKey(1, input::go_left, "DPadLeft");
    m_input << InputProfile::JoystickKey(1, input::go_right, "DPadRight");
    m_input << InputProfile::JoystickKey(1, input::jump, "A");
    m_input << InputProfile::JoystickKey(1, input::fire, "X");
    m_input << InputProfile::JoystickKey(1, input::jump, "LeftShoulder");
    m_input << InputProfile::JoystickKey(1, input::fire, "RightShoulder");
    m_input << InputProfile::JoystickKey(1, input::reset, "Back");
    m_input << InputProfile::JoystickKey(1, input::do_pause, "Start");

    m_controller->Init(m_input);

    m_game_text = new Text("", "data/font.png");
    m_game_text->SetAlign(TextAlign::Center);
    m_game_text->SetSpacing(0.0f);
    Ticker::Ref(m_game_text);

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
    m_start_text->SetSpacing(-0.1f);
    Ticker::Ref(m_start_text);
}

sot3000_game::~sot3000_game()
{
    // Just in case; but this should not happen!
    if (m_instance)
    {
        msg::error("there’s still a level active…\n");
        Ticker::Unref(m_instance);
    }

    // Clean up after ourselves
    Ticker::Unref(m_game_text);
    Ticker::Unref(m_start_text);
    Ticker::Unref(m_level_text);
    Ticker::Unref(m_level_name_text);
    Tiler::Deregister(m_tiles);
    Tiler::Deregister(m_title);
    Tiler::Deregister(m_background);
    Scene& scene = Scene::GetScene();
    scene.PopCamera(m_camera);
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

    Renderer::Get()->SetClearColor(Color::white);

    /* We do not draw much; the level itself takes care of it. */
    if (m_state == game_state::title_screen)
        scene.AddTile(m_title, 0, vec3(-256.f, -192.f, 0.f), 0, vec2(0.5f), 0.f);

    if (m_state == game_state::in_game
         || m_state == game_state::paused)
    {
        // Always render the pause text (it’s empty when not in-game)
        m_game_text->SetPos(vec3(m_poi, 90.0f));

        // Display the background
        vec2 parallax = m_poi * vec2(0.5f, 0.15f);
        parallax.x = lol::fmod(parallax.x, 1024.f);
        if (parallax.x < 0.f)
            parallax.x += 1024.f;

        for (float f : { -1024.f, 0.f, 1024.f })
            scene.AddTile(m_background, 0, vec3(m_poi - parallax, -90.f) + vec3(f, -512.f, 0.f), 0, vec2(1.f), 0.f);

        // Display the active ammo
        thing_type ammo = m_instance->get_active_ammo();
        if (ammo != thing_type::none)
        {
            int id = ammo == thing_type::plus_ammo ? Tiles::PlusAmmo : Tiles::MinusAmmo;
            scene.AddTile(m_tiles, id, vec3(m_poi + m_viewport_size * vec2(-0.45f, 0.30f), 50.f), 0, vec2(1.f), 0.f);
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
        m_start_text->SetPos(vec3(0.f, -180.f, 50.f));
        m_start_text->SetText("Press start to start!! LOL");
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
        m_game_text->SetText("PAUSED");
    }
    else if (m_state == game_state::in_game
              && m_instance->get_player_killed())
    {
        m_game_text->SetText("YOU DIED");
    }
    else
    {
        m_game_text->SetText("");
    }

    if (m_state == game_state::next_level && m_current_level < m_levels.count())
    {
        m_level_text->SetText(String::format("Level %d/%d", 1 + m_current_level, (int)m_levels.count()));
        m_level_name_text->SetText(String::format("%s", m_levels[m_current_level].get_name().C()));
    }
    else if (m_state == game_state::you_win)
    {
        m_level_text->SetText("YOU WIN");
        m_level_name_text->SetText("Thanks for playing!");
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

    if (m_controller->WasKeyPressedThisFrame(input::escape))
    {
        if (m_state == game_state::in_game
             || m_state == game_state::paused
             || m_state == game_state::you_win
             || m_state == game_state::next_level)
        {
            if (m_instance)
                Ticker::Unref(m_instance);
            m_instance = nullptr;
            m_state = game_state::title_screen;
            return;
        }

        if (m_state == game_state::title_screen)
        {
            Ticker::Shutdown();
            return;
        }
    }

#if DEBUG_CODE
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
#endif

    if (m_controller->WasKeyPressedThisFrame(input::do_pause)
         || m_controller->WasKeyPressedThisFrame(input::fire)
         || m_controller->WasKeyPressedThisFrame(input::jump))
    {
        if (m_state == game_state::title_screen)
        {
            // Discover all levels
            m_levels.empty();
            m_current_level = 0;

            array<String> levelfiles;
            array<String> listfiles = System::GetPathList("data/levels.txt");
            for (String candidate : listfiles)
            {
                File f;
                f.Open(candidate, FileAccess::Read);
                if (!f.IsValid())
                    continue;
                String list = f.ReadString();
                for (char const *line = list.C(); *line; )
                {
                    char const *eol = line;
                    while (*eol && *eol != '\n' && *eol != '\r')
                        ++eol;
                    if (*line != '#')
                        levelfiles.push(String(line, eol - line));
                    while (*eol == '\n' || *eol == '\r')
                        ++eol;
                    line = eol;
                }
                f.Close();
            }

            for (String level : levelfiles)
            {
                String fullname = String::format("data/%s", level.C());
                array<String> datafiles = System::GetPathList(fullname);
                for (String candidate : datafiles)
                {
                    File f;
                    f.Open(candidate, FileAccess::Read);
                    if (!f.IsValid())
                        continue;
                    m_levels.push(level_description());
                    m_levels.last().load_data(f.ReadString().C());
                    f.Close();
                    break;
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
    if (m_controller->WasKeyPressedThisFrame(input::do_pause))
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
        if (m_controller->WasKeyPressedThisFrame(input::reset)
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

