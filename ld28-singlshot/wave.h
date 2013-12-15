//
// Ludum Dare 28 Entry
//
// Copyright: (c) 2013 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

class Wave : public WorldEntity
{
public:
    Wave(Game *game, int type);
    ~Wave();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds);

private:
    Game *m_game;
    int m_type;
    Array<Thing *> m_things;
};

