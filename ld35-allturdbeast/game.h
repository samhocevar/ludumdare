﻿//
//  All Turd Beast — Entry for Ludum Dare 35
//
//  Copyright © 2016 Sam Hocevar <sam@hocevar.net>
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
    go_up,
    go_down,
    jump,
    morph_1,
    morph_2,
    morph_3,
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
    TileSet *m_tiles, *m_bigtiles, *m_supertiles, *m_gradient, *m_title;
    int m_fx_step;

    levelmap *m_level; // current level
    vec2 m_poi; // point of interest (i.e. player)

    double m_timer, m_shake_timer;

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

    actor *m_player;
    class postprocess *m_postprocess;
};

class postprocess : public Entity
{
public:
    postprocess()
    {
        m_drawgroup = DRAWGROUP_HUD;
    }

    virtual void TickDraw(float seconds, Scene &scene)
    {
        Entity::TickDraw(seconds, scene);

        // Add some cheap “postprocess”
        int frame = (int)lol::fmod(g_game->m_timer * 10.0, 8.0);
        float angle = radians(90.f * frame);
        int flip = frame < 4 ? 1 : -1;

        vec2 const viewport_size = (vec2)ivec2(VIEWPORT_SIZE_X, VIEWPORT_SIZE_Y);
        scene.AddTile(g_game->m_gradient, 0, vec3(g_game->m_poi - vec2(flip * 0.5f, 0.5f) * viewport_size.xy, 10.f), 0,
                      vec2(flip * VIEWPORT_SIZE_X / 256.f, VIEWPORT_SIZE_Y / 256.f), angle);
    }
};

