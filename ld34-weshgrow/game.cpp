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
  : m_level(nullptr),
    m_ship(nullptr),
    m_timer(0.0),
    must_warp(false)
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

    m_controller->Init(m_input);

    //m_fx_step = Sampler::Register("data/fx_step.wav");
    m_music = Sampler::Register("data/bu-a-castles-witches.ogg");
    Sampler::LoopSample(m_music);
}

weshgrow_game::~weshgrow_game()
{
    // Clean up after ourselves
    //Sampler::Deregister(m_fx_step);
    Sampler::Deregister(m_music);

    Tiler::Deregister(m_tiles);

    Scene& scene = Scene::GetScene();
    scene.PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void weshgrow_game::TickGame(float seconds)
{
    Entity::TickGame(seconds);

    m_timer += seconds;

#if DEBUG_CODE
    if (!m_level)
    {
        m_level = new levelmap();
        m_level->load_file("data/testmap.tmx");
    }

    if (!m_ship)
    {
        m_ship = new ship();
        m_ship->m_position = m_level->m_start;
        must_warp = true;
    }
#endif

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

    if (m_ship)
    {
        vec2 new_poi = m_ship->m_position.xy;
        new_poi += 30.f * m_ship->m_velocity.xy;
        if (must_warp)
            m_poi = new_poi;
        else
            m_poi = lerp(m_poi, new_poi, 3.f * seconds);
        must_warp = false;
    }
    else if (m_level)
        m_poi = m_level->m_start.xy;

    vec2 poi = m_poi;
    //poi.x = round(poi.x);
    //poi.y = round(poi.y);

    mat4 proj = mat4::ortho(m_viewport_size.x, m_viewport_size.y, -100.f, 100.f);
    mat4 view = mat4::translate(-vec3(poi.xy, 0.0f));

    m_camera->SetView(view);
    m_camera->SetProjection(proj);
}

void weshgrow_game::tick_events(float seconds)
{
    if (m_ship)
    {
        m_ship->m_thrust_left = m_controller->IsKeyPressed(input::thrust_left);
        m_ship->m_thrust_right = m_controller->IsKeyPressed(input::thrust_right);
    }
}

