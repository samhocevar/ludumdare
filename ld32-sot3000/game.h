//
// Ludum Dare 32 Entry
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#pragma once

#include "level.h"

extern class ld32_game *g_game;

enum input
{
    go_left = 0,
    go_right = 1,
    jump = 2,
    fire = 3,
    pause = 4,
    escape = 5,
};

class ld32_game : public Entity
{
public:
    ld32_game();
    ~ld32_game();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    inline bool is_paused() const { return m_paused; }

private:
    void tick_camera(float seconds);
    void tick_input(float seconds);

public:
    TileSet *m_tiles;

private:
    Camera *m_camera;
    Controller *m_controller;
    InputProfile m_input;

    Text *m_pause_text;
    bool m_paused;

    ld32_map *m_map;
    level_instance *m_level;
};

