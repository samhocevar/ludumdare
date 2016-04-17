//
//  Unnamed — Entry for Ludum Dare 35
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

enum class animaltype : int8_t
{
    none = -1,
    cat = 0,
    elephant = 1,
    mouse = 2,
    turd = 3,
    bird = 4,
};

enum class actorstate : int8_t
{
    idle = 0,
    go_left = 1,
    go_right = 2,
    free = 3,
};

class actor : public WorldEntity
{
public:
    actor();
    ~actor();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    ivec2 m_tile; /* Current tile in the map */
    vec2 m_delta; /* Current world delta from tile centre */

    void move(actorstate desired);
    void jump();
    void morph(animaltype type);

private:
    void subtick_game(float seconds);

    float get_walk_speed() const;
    float get_jump_speed() const;
    float get_jump_time() const;
    float get_fall_speed() const;

    tileid get_tile(ivec2 pos) const;

    animaltype m_type, m_target_type;
    actorstate m_state;
    bool m_eastward, m_moving, m_falling, m_jumping, m_dead;
    double m_timer, m_jump_timer, m_morph_timer;
};

