//
// Lol Engine - Noise tutorial
//
// Copyright: (c) 2012-2013 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#if defined HAVE_CONFIG_H
#   include "config.h"
#endif

#include <lol/engine.h>

using namespace lol;

class Hud : public WorldEntity
{
public:
    Hud()
      : m_game(nullptr),
        m_hiscore(0),
        m_state(BlankScreen)
    {
        m_controller = new Controller("Menu");
        m_controller->SetInputCount(KEY_MAX /* keys */, 0 /* axes */);
        m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Space");
        m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Return");
        m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Tab");

        m_camera = new Camera();
        m_camera->SetView(mat4(1.f));
        m_camera->SetProjection(mat4::ortho(-ARENA.x * 0.5f, ARENA.x * 0.5f,
                                            -ARENA.y * 0.5f, ARENA.y * 0.5f,
                                            -100.f, 100.f));
        Scene& scene = Scene::GetScene();
        scene.PushCamera(m_camera);
        Ticker::Ref(m_camera);

        /* TileSet */
        m_tiles = Tiler::Register("data/tiles.png");
        m_tiles->AddTile(ibox2(0, 0, 20, 20));     /* 0: ship */
        m_tiles->AddTile(ibox2(20, 0, 40, 20));    /* ship */
        m_tiles->AddTile(ibox2(40, 0, 60, 20));    /* 2: alien 1 */
        m_tiles->AddTile(ibox2(60, 0, 80, 20));    /* 3: alien 1 */
        m_tiles->AddTile(ibox2(0, 20, 20, 40));    /* 4: rocket */
        m_tiles->AddTile(ibox2(20, 20, 40, 40));   /* 5: rocket */
        m_tiles->AddTile(ibox2(40, 20, 60, 40));   /* 6: powerup */
        m_tiles->AddTile(ibox2(60, 20, 80, 40));   /* 7: powerup */
        m_tiles->AddTile(ibox2(80, 20, 100, 40));  /* 8: bullet */
        m_tiles->AddTile(ibox2(100, 20, 120, 40)); /* 9: bullet */
        m_tiles->AddTile(ibox2(80, 0, 100, 20));   /* 10: alien 2 */
        m_tiles->AddTile(ibox2(100, 0, 120, 20));  /* 11: alien 2 */
        m_tiles->AddTile(ibox2(120, 0, 140, 20));  /* 12: ship 2 */
        m_tiles->AddTile(ibox2(140, 0, 160, 20));  /* 13: ship 2 */
        m_tiles->AddTile(ibox2(0, 80, 100, 100));  /* 14: title screen */

        /* Default text */
        m_menu.Push(new Text("", "data/font.png"));
        m_menu[0]->SetPos(vec3(0.f, 30.f, 50.f));
        m_menu[0]->SetAlign(TextAlign::Center);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[1]->SetPos(vec3(0.f, 0.f, 50.f));
        m_menu[1]->SetAlign(TextAlign::Center);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[2]->SetPos(vec3(0.f, -23.5f, 50.f));
        m_menu[2]->SetAlign(TextAlign::Center);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[3]->SetPos(vec3(0.f, -46.5f, 50.f));
        m_menu[3]->SetAlign(TextAlign::Center);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[4]->SetPos(vec3(0.f, -70.f, 50.f));
        m_menu[4]->SetAlign(TextAlign::Center);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[5]->SetPos(vec3(0.f, -90.f, 50.f));
        m_menu[5]->SetAlign(TextAlign::Center);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[6]->SetPos(vec3(0.f, -110.f, 50.f));
        m_menu[6]->SetAlign(TextAlign::Center);

        for (int i = 0; i < m_menu.Count(); ++i)
            Ticker::Ref(m_menu[i]);

        /* In-game text */
        m_score.Push(new Text("", "data/font.png"));
        m_score[0]->SetPos(vec3(-ARENA.x / 2 + 5.f, ARENA.y / 2 - 20.f, 50.f));

        m_score.Push(new Text("", "data/font.png"));
        m_score[1]->SetPos(vec3(ARENA.x / 2 - 5.f, ARENA.y / 2 - 20.f, 50.f));
        m_score[1]->SetAlign(TextAlign::Right);

        for (int i = 0; i < m_score.Count(); ++i)
            Ticker::Ref(m_score[i]);
    }

    ~Hud()
    {
        if (m_game)
            Ticker::Unref(m_game);

        for (int i = 0; i < m_menu.Count(); ++i)
            Ticker::Unref(m_menu[i]);
        for (int i = 0; i < m_score.Count(); ++i)
            Ticker::Unref(m_score[i]);

        Scene& scene = Scene::GetScene();
        scene.PopCamera(m_camera);
        Ticker::Unref(m_camera);

        //Tiler::Deregister(m_tiles);
    }

    virtual void TickGame(float seconds)
    {
        WorldEntity::TickGame(seconds);

        HandleStateChanges(seconds);
        HandleStates(seconds);
    }

    virtual void TickDraw(float seconds, Scene &scene)
    {
        WorldEntity::TickDraw(seconds, scene);

        Renderer::Get()->SetClearColor(vec4(0.0f, 0.0f, 0.0f, 1.0f));

        switch (m_state)
        {
        case TitleScreen:
            scene.AddTile(m_tiles, 14, vec3(-50.0f, 0.0f, 0.0f),
                          0.f, vec2(1.f), 0.f);
            break;
        default:
            break;
        }
    }

private:
    void HandleStateChanges(float seconds)
    {
        /* Handle state changes */
        switch (m_state)
        {
        case BlankScreen:
            m_menu[0]->SetText("");
            m_menu[1]->SetText("");
            m_menu[2]->SetText("");
            m_menu[3]->SetText("");
            m_menu[4]->SetText("");
            m_menu[5]->SetText("press fire to play");
            m_menu[6]->SetText("move: W A S D   fire: Space");

            m_state = TitleScreen;
            break;

        case TitleScreen:
            if (m_controller->WasKeyPressedThisFrame(KEY_FIRE))
            {
                for (int i = 0; i < m_menu.Count(); ++i)
                    m_menu[i]->SetText("");

                m_game = new Game();
                Ticker::Ref(m_game);

                m_state = InGame;
            }
            break;

        case InGame:
            if (m_game->m_ship->m_dead)
            {
                m_gameover.Get();

                m_state = JustDied;
            }
            break;

        case JustDied:
            if (m_gameover.Poll() > 1.0)
            {
                m_menu[1]->SetText("GAME OVER");
                m_menu[4]->SetText("press fire");

#if 0
                m_state = XXX;
            }
            break;

        case XXX:
            if (m_controller->WasKeyPressedThisFrame(KEY_FIRE))
            {
                m_menu[0]->SetText("WORLD LEADERBOARDS");
                m_menu[1]->SetText(" 1. Sam              00068290");
                m_menu[2]->SetText(" 2. Sam              00058900");
                m_menu[3]->SetText(" 3. Sam              00037830");
                m_menu[4]->SetText(" 4. Nobody           00000000");
#endif

                m_state = GameOver;
            }
            break;

        case GameOver:
            if (m_controller->WasKeyPressedThisFrame(KEY_FIRE))
            {
                Ticker::Unref(m_game);
                m_game = nullptr;

                m_state = BlankScreen;
            }
            break;

        default:
            break;
        }
    }

    void HandleStates(float seconds)
    {
        if (m_game && m_game->m_score > m_hiscore)
            m_hiscore = m_game->m_score;

        m_score[0]->SetText(String::Printf("SCORE %08d", m_game ? m_game->m_score : 0));
        m_score[1]->SetText(String::Printf("HIGH %08d", m_hiscore));
    }

private:
    Controller *m_controller;
    Camera *m_camera;
    Game *m_game;
    TileSet *m_tiles;
    array<Text *> m_menu;
    array<Text *> m_score;
    Timer m_gameover;

    int m_hiscore;

    enum HudState
    {
        BlankScreen = 0,
        TitleScreen,
        InGame,
        JustDied,
        GameOver,
    }
    m_state;
};

