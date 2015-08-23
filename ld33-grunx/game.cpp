//
//  LD33
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

ld33_game::ld33_game()
  : m_level(nullptr),
    m_timer(0.0)
{
    m_tiles = Tiler::Register("data/tiles.png");
    m_tiles->define_tile(ivec2(64, 64));

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
    m_input << InputProfile::Keyboard(input::go_up, "W");
    m_input << InputProfile::Keyboard(input::go_up, "Z");
    m_input << InputProfile::Keyboard(input::go_up, "Up");
    m_input << InputProfile::Keyboard(input::go_down, "S");
    m_input << InputProfile::Keyboard(input::go_down, "Down");
    m_input << InputProfile::Keyboard(input::jump, "Space");
    m_input << InputProfile::Keyboard(input::fire, "Return");
    m_input << InputProfile::Keyboard(input::do_pause, "P");
    m_input << InputProfile::Keyboard(input::reset, "R");
    m_input << InputProfile::Keyboard(input::escape, "Escape");

#if DEBUG_CODE
    m_input << InputProfile::Keyboard(input::next_level, "X");
#endif

    m_input << InputProfile::JoystickKey(1, input::go_left, "DPadLeft");
    m_input << InputProfile::JoystickKey(1, input::go_right, "DPadRight");
    m_input << InputProfile::JoystickKey(1, input::go_up, "DPadUp");
    m_input << InputProfile::JoystickKey(1, input::go_down, "DPadDown");
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

    m_monster = new actor(actortype::monster);
    Ticker::Ref(m_monster);
    m_hero = new actor(actortype::hero);
    m_hero->m_position.z = 1000.f; // hide hero for now
    Ticker::Ref(m_hero);

    m_fx_step = Sampler::Register("data/fx_step.wav");
    m_music = Sampler::Register("data/bu-a-castles-witches.ogg");
    Sampler::LoopSample(m_music);
}

ld33_game::~ld33_game()
{
    // Clean up after ourselves
    Sampler::Deregister(m_fx_step);
    Sampler::Deregister(m_music);

    Ticker::Unref(m_monster);
    Ticker::Unref(m_hero);

    Ticker::Unref(m_game_text);
    Ticker::Unref(m_level_text);
    Ticker::Unref(m_level_name_text);
    Ticker::Unref(m_start_text);

    Tiler::Deregister(m_tiles);

    Scene& scene = Scene::GetScene();
    scene.PopCamera(m_camera);
    Ticker::Unref(m_camera);
}

void ld33_game::TickGame(float seconds)
{
    Entity::TickGame(seconds);

    m_timer += seconds;

    tick_events(seconds);
    tick_camera(seconds);

#if DEBUG_CODE
    if (!m_level)
    {
        m_level = new levelmap();
        m_level->load_file("data/testmap.tmx");

        m_hero->m_tile = m_level->m_hero_start;
        m_monster->m_tile = m_level->m_monster_start;
    }
#endif
}

void ld33_game::TickDraw(float seconds, Scene &scene)
{
    Entity::TickDraw(seconds, scene);

    // Make sure we’re using nearest neighbour, it’s pixel art after all!
    m_tiles->GetTexture()->SetMagFiltering(TextureMagFilter::NEAREST_TEXEL);
    m_tiles->GetTexture()->SetMinFiltering(TextureMinFilter::NEAREST_TEXEL_NO_MIPMAP);

    Renderer::Get()->SetClearColor(Color::white);
}

void ld33_game::tick_camera(float seconds)
{
    UNUSED(seconds);

    ivec2 m_viewport_size = ivec2(300, 200);

    if (m_monster)
    {
        mat4 proj = mat4::ortho(m_viewport_size.x, m_viewport_size.y, -100.f, 100.f);

        m_poi = m_monster->m_position.xy;
        mat4 view = mat4::translate(-vec3(m_poi.xy, 0.0f));

        m_camera->SetView(view);
        m_camera->SetProjection(proj);
    }
}

void ld33_game::tick_events(float seconds)
{
    if (m_controller->IsKeyPressed(input::go_up))
        m_monster->move(actorstate::go_up);
    else if (m_controller->IsKeyPressed(input::go_down))
        m_monster->move(actorstate::go_down);
    else if (m_controller->IsKeyPressed(input::go_left))
        m_monster->move(actorstate::go_left);
    else if (m_controller->IsKeyPressed(input::go_right))
        m_monster->move(actorstate::go_right);
    else
        m_monster->move(actorstate::idle);

    if (m_controller->WasKeyPressedThisFrame(input::jump))
        m_monster->jump();
}
