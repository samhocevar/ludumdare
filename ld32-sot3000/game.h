//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

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
    }

    ~ld32_game()
    {
        Tiler::Deregister(m_tiles);
        g_scene->PopCamera(m_camera);
        Ticker::Unref(m_camera);
    }

    virtual void TickGame(float seconds)
    {
        m_timer += seconds;
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

    float m_timer;
};

