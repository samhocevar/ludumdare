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

class Wave : public WorldEntity
{
public:
    Wave(Game *game, int type);
    ~Wave();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

private:
    void HandleCollisions(Thing *thing);

public:
    bool m_dead;

private:
    Game *m_game;
    double m_time;
    int m_type;
    array<Thing *> m_things;
    array<double> m_fire_time;
};

