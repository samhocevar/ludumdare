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
#include "thing.h"

/* The level is a world representation of a map */
class level_instance : public WorldEntity
{
public:
    level_instance();
    ~level_instance();

    virtual void TickGame(float seconds);
    void tick_hero(float seconds);
    void tick_projectile(thing *t, float seconds);
    void tick_living(thing *t, float seconds);

    virtual void TickDraw(float seconds, Scene &scene);

    ivec2 layout_size() const;
    vec2 world_size() const;
    void init(level_description const &desc);
    void clear();

    vec3 get_poi() const;
    inline bool get_exit_reached() const { return m_exit_reached; }
    inline bool get_hero_fell() const { return m_hero_fell; }
    inline bool get_hero_killed() const { return m_hero_killed; }
    inline thing_type get_active_ammo() const { return m_active_ammo; }

    float collide_thing(thing const *t, vec3 velocity, float seconds) const;
    void impulse_x(float impulse);
    void jump();
    void continue_jump(float velocity, float seconds);
    void fire();

private:
    ivec2 m_layout_size;

    thing *m_hero, *m_exit;
    array<thing *> m_things;
    array<thing *> m_monsters;
    array<thing *> m_projectiles;
    array<thing *> m_items;

    vec3 m_hero_impulse, m_hero_effective_impulse;
    thing_type m_active_ammo;
    bool m_exit_reached, m_hero_killed, m_hero_fell;
};

