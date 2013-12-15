//
// Ludum Dare 28 Entry
//
// Copyright: (c) 2013 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

class Game : public WorldEntity
{
    friend class Thing;
    friend class Wave;
    friend class Starfield;
    friend class Explosion;
    friend class Hud;

public:
    Game();
    ~Game();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds);

    void KillPlayer();

private:
    Controller *m_controller;
    Camera *m_camera;
    TileSet *m_tiles[2];

    class Starfield *m_starfield;
    class Hud *m_hud;
    class Thing *m_ship;
    Array<class Wave *> m_waves;

    vec3 m_camera_pos;

    bool m_ready;
};

