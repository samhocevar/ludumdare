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

#include "core.h"

using namespace std;
using namespace lol;

class Hud : public WorldEntity
{
public:
    Hud()
      : m_game(nullptr),
        m_hiscore(0),
        m_state(-1)
    {
        m_controller = new Controller("Menu", KEY_MAX /* keys */, 0 /* axes */);
        m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Space");
        m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Return");
        m_controller->GetKey(KEY_FIRE).Bind("Keyboard", "Tab");

        m_camera = new Camera();
        m_camera->SetView(mat4(1.f));
        m_camera->SetProjection(mat4::ortho(-ARENA.x * 0.5f, ARENA.x * 0.5f,
                                            -ARENA.y * 0.5f, ARENA.y * 0.5f,
                                            -100.f, 100.f));
        g_scene->PushCamera(m_camera);
        Ticker::Ref(m_camera);

        /* Default text */
        m_menu.Push(new Text("", "data/font.png"));
        m_menu[0]->SetPos(vec3(0.f, 30.f, 50.f));
        m_menu[0]->SetAlign(Text::ALIGN_CENTER);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[1]->SetPos(vec3(0.f, 0.f, 50.f));
        m_menu[1]->SetAlign(Text::ALIGN_CENTER);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[2]->SetPos(vec3(0.f, -20.f, 50.f));
        m_menu[2]->SetAlign(Text::ALIGN_CENTER);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[3]->SetPos(vec3(0.f, -70.f, 50.f));
        m_menu[3]->SetAlign(Text::ALIGN_CENTER);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[4]->SetPos(vec3(0.f, -90.f, 50.f));
        m_menu[4]->SetAlign(Text::ALIGN_CENTER);

        m_menu.Push(new Text("", "data/font.png"));
        m_menu[5]->SetPos(vec3(0.f, -110.f, 50.f));
        m_menu[5]->SetAlign(Text::ALIGN_CENTER);

        for (int i = 0; i < m_menu.Count(); ++i)
            Ticker::Ref(m_menu[i]);

        /* In-game text */
        m_score.Push(new Text("", "data/font.png"));
        m_score[0]->SetPos(vec3(-ARENA.x / 2 + 5.f, ARENA.y / 2 - 20.f, 50.f));

        m_score.Push(new Text("", "data/font.png"));
        m_score[1]->SetPos(vec3(ARENA.x / 2 - 5.f, ARENA.y / 2 - 20.f, 50.f));
        m_score[1]->SetAlign(Text::ALIGN_RIGHT);

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

        g_scene->PopCamera(m_camera);
        Ticker::Unref(m_camera);
    }

    virtual void TickGame(float seconds)
    {
        /* Handle state changes */
        if (m_state == -1)
        {
            m_menu[0]->SetText("SINGLSHOT");
            m_menu[1]->SetText("a game by Sam Hocevar");
            m_menu[2]->SetText("for Ludum Dare 28");
            m_menu[3]->SetText("you only get one shot! () to reload");
            m_menu[4]->SetText("press fire to play");
            m_menu[5]->SetText("move: W A S D   fire: Space");

            m_state = 0;
        }
        else if (m_state == 0 && m_controller->GetKey(KEY_FIRE).IsPressed())
        {
            for (int i = 0; i < m_menu.Count(); ++i)
                m_menu[i]->SetText("");

            m_game = new Game();
            Ticker::Ref(m_game);

            m_state = 1;
        }
        else if (m_state == 1 && m_game->m_ship->m_dead)
        {
            m_gameover.Get();
            m_menu[1]->SetText("GAME OVER");

            m_state = 2;
        }
        else if (m_state == 2 && m_gameover.Poll() > 1.0)
        {
            m_menu[3]->SetText("press fire");

            m_state = 3;
        }
        else if (m_state == 3 && m_controller->GetKey(KEY_FIRE).IsPressed())
        {
            Ticker::Unref(m_game);
            m_game = nullptr;

            m_state = -1;
        }

        /* Handle states */
        if (m_game && m_game->m_score > m_hiscore)
            m_hiscore = m_game->m_score;

        m_score[0]->SetText(String::Printf("SCORE %08d", m_game ? m_game->m_score : 0));
        m_score[1]->SetText(String::Printf("HIGH %08d", m_hiscore));

        WorldEntity::TickGame(seconds);
    }

    virtual void TickDraw(float seconds)
    {
        WorldEntity::TickDraw(seconds);

        g_renderer->SetClearColor(vec4(0.0f, 0.0f, 0.0f, 1.0f));
    }

private:
    Controller *m_controller;
    Camera *m_camera;
    Game *m_game;
    Array<Text *> m_menu;
    Array<Text *> m_score;
    Timer m_gameover;

    int m_hiscore;

    int m_state;
};

