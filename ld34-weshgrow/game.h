﻿//
//  W.E.S.H. Grow — Entry for Ludum Dare 34
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
#include "ship.h"

enum input
{
    thrust_left,
    thrust_right,
    escape,
    //start, // FIXME: apparently I can’t register the same key to several IDs
    debug,
};

class weshgrow_game : public Entity
{
public:
    weshgrow_game();
    ~weshgrow_game();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

private:
    void tick_camera(float seconds);
    void tick_events(float seconds);

public:
    TileSet *m_tiles;
    int m_fx_engine_start, m_fx_engine_loop;
    int m_fx_bonus, m_fx_crash;
    float m_time_since_thrust;

    float m_shake_duration;
    bool m_next_level;

    int m_level_id;
    levelmap *m_level; // current level
    vec2 m_poi; // point of interest (i.e. player)

    ship *m_ship; // current player

private:
    double m_timer;

    Camera *m_camera;
    Controller *m_controller;
    InputProfile m_input;
    int m_music_title, m_music_game;

    bool m_must_warp;
};

extern weshgrow_game *g_game;

