//
// Size-o-Tron 3000 — A puzzle game developed for Ludum Dare 32
//
// Copyright: © 2015 Sam Hocevar <sam@hocevar.net>
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of the Do What The Fuck You Want To
//   Public License, Version 2, as published by Sam Hocevar. See
//   http://www.wtfpl.net/ for more details.
//

#pragma once

#include "level-description.h"
#include "level-instance.h"

extern class sot3000_game *g_game;

enum input
{
    pause,
    go_left,
    go_right,
    jump,
    fire,
    escape,
    //start, // FIXME: apparently I can’t register the same key to several IDs

    // For debugging purposes
    next_level,
};

enum class game_state
{
    title_screen,
    in_game,
    next_level,
    paused,
    you_win,
};

class sot3000_game : public Entity
{
public:
    sot3000_game();
    ~sot3000_game();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    inline bool is_paused() const { return m_state == game_state::paused; }

private:
    void tick_camera(float seconds);
    void tick_events(float seconds);

public:
    TileSet *m_tiles, *m_newtiles;

private:
    game_state m_state;

    Camera *m_camera;
    Controller *m_controller;
    InputProfile m_input;
    float m_input_cooldown;

    Text *m_start_text;
    Text *m_pause_text;
    Text *m_level_text;
    vec2 m_viewport_size, m_poi;

    level_description m_level_desc;
    level_instance *m_level;
    int m_current_level;
};

