//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

enum input
{
    go_left = 0,
    go_right = 1,
    jump = 2,
    fire = 3,
};

class ld32_game : public Entity
{
public:
    ld32_game()
      : m_timer(0.0)
    {
        m_tiles = Tiler::Register("data/tiles.png");
        m_tiles->AddTile(ibox2(0, 0, 32, 32));

        m_camera = new Camera();
        m_camera->SetView(mat4(1.f));
        m_camera->SetProjection(mat4::ortho((float)SIZE_X, (float)SIZE_Y, -100.f, 100.f));
        g_scene->PushCamera(m_camera);
        Ticker::Ref(m_camera);

        m_controller = new Controller("default controller");
        m_input << InputProfile::Keyboard(input::go_left, "Left");
        m_input << InputProfile::Keyboard(input::go_right, "Right");
        m_input << InputProfile::Keyboard(input::jump, "Up");
        m_input << InputProfile::Keyboard(input::fire, "Space");
        m_controller->Init(m_input);

        m_debug_text.push(new Text("Hello World!", "data/font.png"));
        m_debug_text.last()->SetPos(vec3(0.f, 0.f, 50.f));
        m_debug_text.last()->SetAlign(TextAlign::Center);
        m_debug_text.last()->SetScale(vec2(0.25f));
        m_debug_text.last()->SetSpacing(-0.1f);

        m_debug_text.push(new Text("THIS IS MY HAND-MADE FONT", "data/font.png"));
        m_debug_text.last()->SetPos(vec3(0.f, -40.f, 50.f));
        m_debug_text.last()->SetAlign(TextAlign::Center);
        m_debug_text.last()->SetScale(vec2(0.25f));
        m_debug_text.last()->SetSpacing(-0.1f);

        for (auto t : m_debug_text)
            Ticker::Ref(t);

        // Run a test level
        m_level = new test_level();
        Ticker::Ref(m_level);
    }

    ~ld32_game()
    {
        // Destroy the test level
        Ticker::Unref(m_level);

        // Clean up after ourselves
        for (auto t : m_debug_text)
            Ticker::Unref(t);

        Tiler::Deregister(m_tiles);
        g_scene->PopCamera(m_camera);
        Ticker::Unref(m_camera);
    }

    virtual void TickGame(float seconds)
    {
        Entity::TickGame(seconds);

        if (m_controller->IsKeyPressed(input::go_left))
            m_timer += seconds;
        else if (m_controller->IsKeyPressed(input::go_right))
            m_timer -= seconds;

    }

    virtual void TickDraw(float seconds, Scene &scene)
    {
        Entity::TickDraw(seconds, scene);

        mat2 rot = mat2::rotate(degrees(m_timer));
        scene.AddTile(m_tiles, 0, vec3(rot * vec2(0.3f * SIZE_Y), 0.f), 0, vec2(1.f), 0.f);
    }

private:
    TileSet *m_tiles;
    Camera *m_camera;
    Controller *m_controller;
    InputProfile m_input;

    array<Text *> m_debug_text;

    level *m_level;

    float m_timer;
};

