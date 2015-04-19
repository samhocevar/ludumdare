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
    pause,
    go_left,
    go_right,
    jump,
    fire,
    escape,
    //start, // FIXME: apparently I can’t register the same key to several IDs
};

enum class game_state
{
    title_screen,
    in_game,
    next_level,
    paused,
    you_win,
};

class ld32_game : public Entity
{
public:
    ld32_game();
    ~ld32_game();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    inline bool is_paused() const { return m_state == game_state::paused; }

private:
    void tick_camera(float seconds);
    void tick_events(float seconds);

public:
    TileSet *m_tiles;

private:
    game_state m_state;

    Camera *m_camera;
    Controller *m_controller;
    InputProfile m_input;
    float m_input_cooldown;

    Text *m_start_text;
    Text *m_pause_text;
    Text *m_level_text;

    ld32_map m_map;
    int m_current_progress;
    level_instance *m_level;
};

