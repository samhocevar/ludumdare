//
//  Singlshot — A shooter developed for Ludum Dare 28
//
//  Copyright © 2013 Sam Hocevar <sam@hocevar.net>
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
//

class Game : public WorldEntity
{
    friend class Thing;
    friend class Wave;
    friend class Starfield;
    friend class Explosion;

public:
    Game();
    ~Game();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    void KillPlayer();

private:
    void SpawnShit();
    bool HasPassed(double period, double phase = 0.0);

public:
    Controller *m_controller;
    TileSet *m_tiles;
    int m_snd_missile, m_snd_bullet, m_snd_explosion, m_snd_powerup;

    class Starfield *m_starfield;
    array<class Explosion *> m_explosions;
    class Thing *m_ship;
    array<class Thing *> m_rockets;
    array<class Thing *> m_bullets;
    array<class Thing *> m_powerups;
    array<class Wave *> m_waves;
    array<Text *> m_score_texts;
    Text *m_hint_text;

    vec3 m_camera_pos;

    int m_power, m_hint;
    int m_score, m_combo;
    double m_prev_time, m_time;

    bool m_ready;
};

