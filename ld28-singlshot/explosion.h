//
//  Singlshot — A shooter developed for Ludum Dare 28
//
//  Copyright © 2013 Sam Hocevar <sam@hocevar.net>
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
//

#if defined HAVE_CONFIG_H
#   include "config.h"
#endif

#include <lol/engine.h>

using namespace lol;

LOLFX_RESOURCE_DECLARE(explosion);

class Explosion : public WorldEntity
{
public:
    Explosion(Game *game) :
        m_time(0.0),
        m_game(game),
        m_ready(false)
    {
        Sampler::PlaySample(m_game->m_snd_explosion);

        m_vertices << vec2(-1.0,  1.0);
        m_vertices << vec2(-1.0, -1.0);
        m_vertices << vec2( 1.0, -1.0);
        m_vertices << vec2(-1.0,  1.0);
        m_vertices << vec2( 1.0, -1.0);
        m_vertices << vec2( 1.0,  1.0);
    }

    virtual void TickDraw(float seconds, Scene &scene)
    {
        WorldEntity::TickDraw(seconds, scene);

        m_time += seconds;

        if (!m_ready)
        {
            m_shader = Shader::Create(LOLFX_RESOURCE_NAME(explosion));
            m_coord = m_shader->GetAttribLocation(VertexUsage::Position, 0);
            m_time_uni = m_shader->GetUniformLocation("u_time");
            m_center_uni = m_shader->GetUniformLocation("u_center");

            m_vdecl = new VertexDeclaration(VertexStream<vec2>(VertexUsage::Position));

            m_vbo = new VertexBuffer(m_vertices.bytes());
            void *vertices = m_vbo->Lock(0, 0);
            memcpy(vertices, &m_vertices[0], m_vertices.bytes());
            m_vbo->Unlock();

            m_ready = true;

            /* FIXME: this object never cleans up */
        }

        m_shader->Bind();
        m_shader->SetUniform(m_time_uni, m_time);
        m_shader->SetUniform(m_center_uni,
                             m_position.xy - m_game->m_camera_pos.xy);
        m_vdecl->SetStream(m_vbo, m_coord);
        m_vdecl->Bind();
        m_vdecl->DrawElements(MeshPrimitive::Triangles, 0, 6);
        m_vdecl->Unbind();
    }

public:
    float m_time;

private:
    Game *m_game;

    array<vec2> m_vertices;
    Shader *m_shader;
    ShaderAttrib m_coord;
    ShaderUniform m_time_uni, m_center_uni;
    VertexDeclaration *m_vdecl;
    VertexBuffer *m_vbo;

    bool m_ready;
};

