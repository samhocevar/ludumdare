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
    Hud(Game *game)
      : m_game(game)
    {
        m_score = new Text("", "data/font.png");
        m_score->SetPos(vec3(-ARENA.x / 2 + 5.f, -ARENA.y / 2 + 5.f, 0.f));
    }

    virtual void TickGame(float seconds)
    {
        m_score->SetText(String::Printf("%08d", m_game->m_score));

        WorldEntity::TickGame(seconds);
    }

    virtual void TickDraw(float seconds)
    {
        WorldEntity::TickDraw(seconds);
    }

private:
    Game *m_game;

    Text *m_score;
};

