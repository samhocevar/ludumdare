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

enum class actortype : uint8_t
{
    hero = 0,
    monster = 1,
};

enum class actorstate : uint8_t
{
    idle = 0,
    go_left = 1,
    go_right = 2,
    go_up = 3,
    go_down = 4,
};

class actor : public WorldEntity
{
public:
    actor(actortype t);
    ~actor();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    ivec2 m_tile; /* Current tile in the map */
    vec2 m_delta; /* Current world delta from tile centre */

    void move(actorstate desired);
    void jump();

private:
    actortype m_type;
    actorstate m_state;
    bool m_falling, m_jumping, m_dead;
    double m_timer, m_jump_timer;
};

