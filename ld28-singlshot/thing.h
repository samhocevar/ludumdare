//
// Ludum Dare 28 Entry
//
// Copyright: (c) 2013 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
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

