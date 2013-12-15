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
    void SpawnShit();
    bool HasPassed(double period, double phase = 0.0);

public:
    Controller *m_controller;
    Camera *m_camera;
    TileSet *m_tiles[2];

    class Starfield *m_starfield;
    Array<class Explosion *> m_explosions;
    class Hud *m_hud;
    class Thing *m_ship;
    Array<class Thing *> m_rockets;
    Array<class Thing *> m_bullets;
    Array<class Thing *> m_powerups;
    Array<class Wave *> m_waves;

    vec3 m_camera_pos;

    int m_power;
    int m_score, m_combo;
    double m_prev_time, m_time;

    bool m_ready;
};

