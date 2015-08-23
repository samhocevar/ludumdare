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

enum class actortype : uint8_t
{
    hero = 0,
    monster = 1,
};

class actor : public WorldEntity
{
public:
    actor(actortype t);
    ~actor();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    int m_direction; /* -1, 0, 1 */

private:
    actortype m_type;
};

