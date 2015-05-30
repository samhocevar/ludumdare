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

class Thing : public WorldEntity
{
    friend class Game;
    friend class Wave;

public:
    Thing(Game *game, int tileid);
    ~Thing();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

public:
    bool m_dead;

private:
    Game *m_game;
    int m_tileid;
};

