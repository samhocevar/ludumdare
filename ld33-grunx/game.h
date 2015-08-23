//
//  LD33
//
//  Copyright © 2015 Sam Hocevar <sam@hocevar.net>
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
//

#pragma once

#include "levelmap.h"
#include "actor.h"

extern class ld33_game *g_game;

enum input
{
    do_pause,
    go_left,
    go_right,
    jump,
    fire,
    escape,
    reset,
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

class ld33_game : public Entity
{
public:
    ld33_game();
    ~ld33_game();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    inline bool is_paused() const { return m_state == game_state::paused; }

private:
    void tick_camera(float seconds);
    void tick_events(float seconds);

public:
    TileSet *m_tiles;

    levelmap *m_level; // current level
    vec2 m_poi; // point of interest (i.e. player)

private:
    game_state m_state;

    Camera *m_camera;
    Controller *m_controller;
    InputProfile m_input;
    int m_music;

    Text *m_start_text;
    Text *m_game_text;
    Text *m_level_text;
    Text *m_level_name_text;

    actor *m_monster, *m_hero;

    double m_timer;
};

