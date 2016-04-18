//
//  All Turd Beast — Entry for Ludum Dare 35
//
//  Copyright © 2016 Sam Hocevar <sam@hocevar.net>
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
    m_timer(0.0),
    m_shake_timer(0.0)
{
    m_tiles = Tiler::Register("data/tiles.png");
    m_tiles->define_tile(ivec2(16, 16));

    m_bigtiles = Tiler::Register("data/./tiles.png");
    m_bigtiles->define_tile(ivec2(8, 8));

    m_supertiles = Tiler::Register("data/././tiles.png");
    m_supertiles->define_tile(ivec2(2, 2));

    m_gradient = Tiler::Register("data/gradient.png");
    m_gradient->define_tile(ivec2(1, 1));

    m_title = Tiler::Register("data/title.png");
    m_title->define_tile(ivec2(1, 1));

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
    m_input << InputProfile::Keyboard(input::jump, "Space");
    m_input << InputProfile::Keyboard(input::morph_1, "J");
    m_input << InputProfile::Keyboard(input::morph_2, "K");
    m_input << InputProfile::Keyboard(input::morph_3, "L");
    m_input << InputProfile::Keyboard(input::do_pause, "P");
    m_input << InputProfile::Keyboard(input::reset, "R");
    m_input << InputProfile::Keyboard(input::escape, "Escape");

#if DEBUG_CODE
    m_input << InputProfile::Keyboard(input::next_level, "X");
#endif

    m_input << InputProfile::JoystickKey(1, input::go_left, "DPadLeft");
    m_input << InputProfile::JoystickKey(1, input::go_right, "DPadRight");
    m_input << InputProfile::JoystickKey(1, input::jump, "A");
    m_input << InputProfile::JoystickKey(1, input::morph_1, "X");
    m_input << InputProfile::JoystickKey(1, input::morph_2, "Y");
    m_input << InputProfile::JoystickKey(1, input::morph_3, "B");
    m_input << InputProfile::JoystickKey(1, input::do_pause, "Start");
    m_input << InputProfile::JoystickKey(1, input::reset, "Back");

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

    m_player = new actor();
    Ticker::Ref(m_player);

    m_postprocess = new postprocess();
    Ticker::Ref(m_postprocess);

    m_fx_step = Sampler::Register("data/fx_step.wav");
    m_music = Sampler::Register("data/bu-a-castles-witches.ogg");
    Sampler::LoopSample(m_music);
}

ld33_game::~ld33_game()
{
    // Clean up after ourselves
    Sampler::Deregister(m_fx_step);
    Sampler::Deregister(m_music);

    Ticker::Unref(m_player);
    Ticker::Unref(m_postprocess);

    Ticker::Unref(m_game_text);
    Ticker::Unref(m_level_text);
    Ticker::Unref(m_level_name_text);
    Ticker::Unref(m_start_text);

    Tiler::Deregister(m_tiles);
    Tiler::Deregister(m_bigtiles);
    Tiler::Deregister(m_supertiles);
    Tiler::Deregister(m_gradient);
    Tiler::Deregister(m_title);

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
}

void ld33_game::TickDraw(float seconds, Scene &scene)
{
    Entity::TickDraw(seconds, scene);

    // Make sure we’re using nearest neighbour, it’s pixel art after all!
    m_tiles->GetTexture()->SetMagFiltering(TextureMagFilter::NEAREST_TEXEL);
    m_tiles->GetTexture()->SetMinFiltering(TextureMinFilter::NEAREST_TEXEL_NO_MIPMAP);
    m_bigtiles->GetTexture()->SetMagFiltering(TextureMagFilter::NEAREST_TEXEL);
    m_bigtiles->GetTexture()->SetMinFiltering(TextureMinFilter::NEAREST_TEXEL_NO_MIPMAP);
    m_supertiles->GetTexture()->SetMagFiltering(TextureMagFilter::NEAREST_TEXEL);
    m_supertiles->GetTexture()->SetMinFiltering(TextureMinFilter::NEAREST_TEXEL_NO_MIPMAP);

    m_gradient->GetTexture()->SetMagFiltering(TextureMagFilter::NEAREST_TEXEL);
    m_gradient->GetTexture()->SetMinFiltering(TextureMinFilter::NEAREST_TEXEL_NO_MIPMAP);
    m_title->GetTexture()->SetMagFiltering(TextureMagFilter::NEAREST_TEXEL);
    m_title->GetTexture()->SetMinFiltering(TextureMinFilter::NEAREST_TEXEL_NO_MIPMAP);

    Renderer::Get()->SetClearColor(Color::black);
    Renderer::Get()->SetAlphaFunc(AlphaFunc::Greater, 0.f);
    Renderer::Get()->SetBlendFunc(BlendFunc::SrcAlpha, BlendFunc::OneMinusSrcAlpha);

    if (!m_level)
    {
        vec2 const viewport_size = (vec2)ivec2(VIEWPORT_SIZE_X, VIEWPORT_SIZE_Y);
        scene.AddTile(g_game->m_title, 0, vec3(m_poi - vec2(0.4f, 0.4f) * viewport_size, 9.f), 0,
                      0.8f * vec2(VIEWPORT_SIZE_X / 256.f, VIEWPORT_SIZE_Y / 144.f), 0);
    }
}

void ld33_game::tick_camera(float seconds)
{
    UNUSED(seconds);

    ivec2 const viewport_size = ivec2(VIEWPORT_SIZE_X, VIEWPORT_SIZE_Y);

    if (m_player)
    {
        // Center the camera slightly above the player sprite
        m_poi = m_player->m_position.xy + vec2(0.5f * TILE_SIZE_X, 1.0f * TILE_SIZE_Y);
    }
    else
    {
        m_poi = vec2(0.f, 0.f);
    }

    mat4 proj = mat4::ortho(viewport_size.x, viewport_size.y, -100.f, 100.f);
    mat4 view = mat4::translate(-vec3(m_poi, 0.0f));

    if (m_shake_timer > 0.f)
    {
        float shake_intensity = (float)m_shake_timer / SHAKE_DURATION;
        view = mat4::rotate(rand(-.1f, .1f) * shake_intensity, vec3::axis_z)
             * mat4::translate(rand(-5.f, 5.f) * shake_intensity, rand(-5.f, 5.f) * shake_intensity, 0.f)
             * mat4::scale(rand(1.f, 1.2f))
             * view;
        m_shake_timer -= seconds;
    }

    m_camera->SetView(view);
    m_camera->SetProjection(proj);
}

void ld33_game::tick_events(float seconds)
{
    if (!m_level)
    {
        if (!m_controller->WasKeyPressedThisFrame(input::jump))
            return;

#if DEBUG_CODE
        if (!m_level)
        {
            m_level = new levelmap();
            m_level->load_file("data/testmap.tmx");

            m_player->m_tile = m_level->m_player_start;
        }
#endif
    }

    /* Handle directions */
    if (m_controller->IsKeyPressed(input::go_left))
        m_player->move(actorstate::go_left);
    else if (m_controller->IsKeyPressed(input::go_right))
        m_player->move(actorstate::go_right);
    else
        m_player->move(actorstate::idle);

    /* Handle morphing */
    bool m1 = m_controller->IsKeyPressed(input::morph_1);
    bool m2 = m_controller->IsKeyPressed(input::morph_2);
    bool m3 = m_controller->IsKeyPressed(input::morph_3);

    if (m1 && m2)
        m_player->morph(animaltype::bird);
    else if (m2 && m3)
        m_player->morph(animaltype::turd);
    else if (m1)
        m_player->morph(animaltype::elephant);
    else if (m2)
        m_player->morph(animaltype::cat);
    else if (m3)
        m_player->morph(animaltype::mouse);

    /* Handle jump */
    if (m_controller->WasKeyPressedThisFrame(input::jump))
        m_player->jump();
}
