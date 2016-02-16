//
//  W.E.S.H. Grow — Entry for Ludum Dare 34
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

#define DEBUG_CODE 1 // press X to skip level

#include "constants.h"
#include "game.h"

weshgrow_game::weshgrow_game()
  : m_level_id(0),
    m_level(nullptr),
    m_ship(nullptr),
    m_timer(0.0),
    m_time_since_thrust(0.f),
    m_shake_duration(0.f),
    m_next_level(false),
    m_must_warp(false)
{
    m_tiles = Tiler::Register("data/tiles.png");
    m_tiles->define_tile(ivec2(64, 64));

    m_camera = new Camera();
    Scene& scene = Scene::GetScene();
    scene.PushCamera(m_camera);
    Ticker::Ref(m_camera);

    m_controller = new Controller("default controller");

    m_input << InputProfile::Keyboard(input::thrust_left, "Left");
    m_input << InputProfile::Keyboard(input::thrust_left, "Q");
    m_input << InputProfile::Keyboard(input::thrust_left, "W");
    m_input << InputProfile::Keyboard(input::thrust_right, "Right");
    m_input << InputProfile::Keyboard(input::thrust_right, "O");
    m_input << InputProfile::Keyboard(input::thrust_right, "P");
    m_input << InputProfile::Keyboard(input::escape, "Escape");

    m_input << InputProfile::JoystickKey(1, input::thrust_left, "X");
    m_input << InputProfile::JoystickKey(1, input::thrust_left, "LeftShoulder");
    m_input << InputProfile::JoystickKey(1, input::thrust_left, "LeftTrigger");
    m_input << InputProfile::JoystickKey(1, input::thrust_right, "A");
    m_input << InputProfile::JoystickKey(1, input::thrust_right, "RightShoulder");
    m_input << InputProfile::JoystickKey(1, input::thrust_right, "RightTrigger");

    m_input << InputProfile::Keyboard(input::debug, "Space");

    m_controller->Init(m_input);

    m_fx_engine_start = Sampler::Register("data/fx_engine_start.wav");
    m_fx_engine_loop = Sampler::Register("data/fx_engine_loop.wav");
    m_fx_bonus = Sampler::Register("data/fx_bonus.wav");
    m_fx_crash = Sampler::Register("data/fx_crash.wav");
    m_music_title = Sampler::Register("data/bu-blue-and-crazed.ogg");
    m_music_game = Sampler::Register("data/bu-legs-of-heads.ogg");
    // FIXME: title music handling is broken
    //Sampler::LoopSample(m_music_title);
    Sampler::LoopSample(m_music_game);
}

weshgrow_game::~weshgrow_game()
{
    // Clean up after ourselves
    Sampler::Deregister(m_fx_engine_start);
    Sampler::Deregister(m_fx_engine_loop);
    Sampler::Deregister(m_fx_bonus);
    Sampler::Deregister(m_fx_crash);
    Sampler::Deregister(m_music_title);
    Sampler::Deregister(m_music_game);

    Tiler::Deregister(m_tiles);

    Scene& scene = Scene::GetScene();
    scene.PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void weshgrow_game::TickGame(float seconds)
{
    Entity::TickGame(seconds);

    m_timer += seconds;

    if (!m_level)
    {
        m_level = new levelmap();
        Ticker::Ref(m_level);
        String lvl = String::format("data/map%d.tmx", m_level_id);
        if (!m_level->load_file(lvl.C()))
        {
            m_level_id = 0;
            m_level->load_file("data/title.tmx");
        }
    }

    if (!m_ship)
    {
        m_ship = new ship();
        Ticker::Ref(m_ship);
        m_ship->m_position = m_level->m_start;
        m_must_warp = true;
    }

    tick_events(seconds);
}

void weshgrow_game::TickDraw(float seconds, Scene &scene)
{
    Entity::TickDraw(seconds, scene);

    tick_camera(seconds);

    // Make sure we’re using nearest neighbour, it’s pixel art after all!
    m_tiles->GetTexture()->SetMagFiltering(TextureMagFilter::NEAREST_TEXEL);
    m_tiles->GetTexture()->SetMinFiltering(TextureMinFilter::NEAREST_TEXEL_NO_MIPMAP);

    Renderer::Get()->SetClearColor(Color::black);
}

void weshgrow_game::tick_camera(float seconds)
{
    UNUSED(seconds);

    ivec2 m_viewport_size = ivec2(VIEWPORT_SIZE_X, VIEWPORT_SIZE_Y);

    if (m_level && m_level->m_poi.z)
    {
        m_poi = m_level->m_poi.xy;
    }
    else if (m_ship)
    {
        vec2 new_poi = m_ship->m_position.xy;
        new_poi += 30.f * m_ship->m_velocity.xy;
        if (m_must_warp)
            m_poi = new_poi;
        else
            m_poi = lerp(m_poi, new_poi, 3.f * seconds);
        m_must_warp = false;
    }
    else if (m_level)
    {
        m_poi = m_level->m_start.xy;
    }

    vec2 poi = m_poi;
    //poi.x = round(poi.x);
    //poi.y = round(poi.y);

    mat4 proj = mat4::ortho(m_viewport_size.x, m_viewport_size.y, -100.f, 100.f);
    mat4 view = mat4::translate(-vec3(poi.xy, 0.0f));

    if (m_shake_duration > 0.0f)
    {
        float shake_intensity = m_shake_duration / SHAKE_DURATION;
        view = mat4::rotate(rand(-.1f, .1f) * shake_intensity, vec3::axis_z)
             * mat4::translate(rand(-10.f, 10.f) * shake_intensity, rand(-10.f, 10.f) * shake_intensity, 0.f)
             * view;
        m_shake_duration -= seconds;
    }

    m_camera->SetView(view);
    m_camera->SetProjection(proj);
}

void weshgrow_game::tick_events(float seconds)
{
    if (m_next_level || m_controller->IsKeyPressed(input::escape))
    {
        if (m_ship)
        {
            // XXX: we need to be careful with running sounds
            Sampler::StopSample(m_fx_engine_loop);

            Ticker::Unref(m_ship);
            m_ship = nullptr;
        }

        if (m_level)
        {
            Ticker::Unref(m_level);
            m_level = nullptr;
        }
    }

    if (m_next_level)
    {
        m_next_level = false;

        ++m_level_id;

#if 0 // FIXME: this seems broken
        /* Reset music */
        Sampler::StopSample(m_music_title);
        Sampler::StopSample(m_music_game);
        Sampler::LoopSample(m_level_id ? m_music_game : m_music_title);
#endif
    }

    if (m_ship)
    {
        int had_thrust = int(m_ship->m_thrust_left) + 2 * int(m_ship->m_thrust_right);

        m_ship->m_thrust_left = m_controller->IsKeyPressed(input::thrust_left);
        m_ship->m_thrust_right = m_controller->IsKeyPressed(input::thrust_right);

        int has_thrust = int(m_ship->m_thrust_left) + 2 * int(m_ship->m_thrust_right);

        if (has_thrust & ~had_thrust)
            Sampler::PlaySample(m_fx_engine_start);

        if (has_thrust && !had_thrust)
            Sampler::LoopSample(m_fx_engine_loop);

        if (!has_thrust && had_thrust)
            Sampler::StopSample(m_fx_engine_loop);
    }
}

