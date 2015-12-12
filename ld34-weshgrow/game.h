//
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

class weshgrow_game : public Entity
{
public:
    weshgrow_game() {}
    ~weshgrow_game() {}

    virtual void TickGame(float seconds) { Entity::TickGame(seconds); }
    virtual void TickDraw(float seconds, Scene &scene) { Entity::TickDraw(seconds, scene); }
};

