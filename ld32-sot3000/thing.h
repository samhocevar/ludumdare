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

enum class thing_type : int
{
    none = -1,
    /* Living things */
    player,
    sitting_monster,
    walking_monster,
    boulder,
    flying_monster,
    pink_projectile,
    blue_projectile,
    /* Items */
    button,
    pink_gun,
    blue_gun,
    /* Environment */
    ground,
    door,
    platform,
    blocker,
    monster_blocker,
    item_scaler,
    spikes,
    laser,
};

class thing : public WorldEntity
{
public:
    thing(thing_type t);
    ~thing();

    virtual void TickGame(float seconds);
    virtual void TickDraw(float seconds, Scene &scene);

    bool can_fall();
    bool can_kill();
    bool can_block();
    bool can_block_monster();
    bool can_scale();

    inline thing_type get_type() const { return m_type; }

public:
    /* Generic */
    vec2 m_size;
    box3 m_original_aabb;
    double m_time;
    float m_target_scale, m_scale;
    int m_tile_index;
    bool m_hidden;

    /* Player-specific (for now) */
    bool m_grounded, m_can_impulse, m_facing_left;
    float m_jump_time;

private:
    thing_type m_type;
};

extern float collide(thing const *t1, vec3 v1,
                     thing const *t2, vec3 v2, float start, float stop);

