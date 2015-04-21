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

static char const * const g_maps[] =
{
    "name = A Walk in the Park\n"
    "             X       X       X                 \n"
    "                X        X      X              \n"
    "                                               \n"
    "                 X       X       X             \n"
    "             X       X       X                 \n"
    "                                               \n"
    "             X       X       X                 \n"
    "                X        X       X             \n"
    "             X X     X   X   X   X             \n"
    "                X        X       X             \n"
    "%            X       X       X                %\n"
    "%            X   X    X X    X   X            %\n"
    "%                                             %\n"
    "%                                             %\n"
    "%         % % % % % % % % % % % % % %         %\n"
    "%                                             %\n"
    "%                                             %\n"
    "%                                        +    %\n"
    "%    S                                   E    %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    "name = Some Excitement\n"
    "              X  X   X  X        X             \n"
    "                 X   X   X     X               \n"
    "          X   X                   X            \n"
    "              X  X      X   X  X               \n"
    "          X          X         X X             \n"
    "              X            X                   \n"
    "                 X          X   X              \n"
    "           X                                   \n"
    "              X         X      X               \n"
    "             X   X   X                         \n"
    "                  X     X   X                  \n"
    "%                    X      X  X           +   \n"
    "%                                          E   \n"
    "%                   X   X   X           % % % %\n"
    "%                                             %\n"
    "%                                             %\n"
    "%                                             %\n"
    "%                                             %\n"
    "%    S                                W W W   %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    "name = It Burns!\n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                            % %\n"
    "              % % % %         % % %           %\n"
    "               |               |        +     %\n"
    "% %            |               |        E     %\n"
    "%         % % % %           % % % % % % % % % %\n"
    "%            |                    % % % % % % %\n"
    "%   S        |                    % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    "name = It Stings!\n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                             % % W W W % %     \n"
    "                             % % % % % % %     \n"
    "                  W W                          \n"
    "                % % % %                        \n"
    "% %                                         % %\n"
    "%                                             %\n"
    "%                                       +     %\n"
    "%    S                                  E     %\n"
    "% % % % % % % % % W W W W W W % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    "name = Elevation\n"
    "                                               \n"
    "                                              %\n"
    "                                              %\n"
    "                                              %\n"
    "                            W                 %\n"
    "                         % % % %          +   %\n"
    "                                          E   %\n"
    "               W                        % % % %\n"
    "            % % % %                           %\n"
    "                                              %\n"
    "% %                                           %\n"
    "%                   % % % %                   %\n"
    "%                                             %\n"
    "%                               W             %\n"
    "%                     % % % % % % % % % % % % %\n"
    "%                       % % % % % % % % % % % %\n"
    "%   S                   % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    "name = The Blue Gun\n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                             %%\n"
    "                                              %\n"
    "%                                        +    %\n"
    "%                                        E    %\n"
    "%                         % % % % % % % % % % %\n"
    "% b                         % % % % %       % %\n"
    "% %                         % % % % % % % % % %\n"
    "%                           % %     % % % % % %\n"
    "%    S                X     % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    "name = The Pink Gun\n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "% % % % % % % % % %                            \n"
    "%                 %                            \n"
    "%                 %                            \n"
    "%                 %                            \n"
    "%                 %                            \n"
    "%                 %       @        -           \n"
    "% p               % % % % % % % % %         % %\n"
    "% %                % % % % % % % %            %\n"
    "%                      +     +          +     %\n"
    "%    S                 X     X          E     %\n"
    "% % % % % % W W % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    "name = Airwalk\n"
    "                                               \n"
    "                                               \n"
    "%                     %                        \n"
    "%                     % % % % % %              \n"
    "%                     %        |               \n"
    "%                     %        |               \n"
    "%               % % % %        |               \n"
    "%  S                           |               \n"
    "% % %                        % % %             \n"
    "%                                           % %\n"
    "%                                             %\n"
    "%                                       +     %\n"
    "%                                       E     %\n"
    "% % % W W W W W W W W W % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    "name = Getting Serious\n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "%                                   %   +      \n"
    "%                                   %   E     %\n"
    "%                       +           % % % %   %\n"
    "% S                     W      _    %         %\n"
    "% %               % % % % % % % % % %         %\n"
    "%                   |                       % %\n"
    "%       +           |        +                %\n"
    "%       @           |  p     @                %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    "name = Just for Fun\n"
    "%                                                       b %\n"
    "%                                                         %\n"
    "%       -      @      -                                   %\n"
    "%         % % % % % %                                     %\n"
    "%  +                                  W                 % %\n"
    "%  E                            % % % % % % %             %\n"
    "% % %        +                                            %\n"
    "%            *    X   p     % %                         % %\n"
    "%                                                         %\n"
    "%                 % % %                       *           %\n"
    "%     %                                                 % %\n"
    "%  S  %                                 -   @     -       %\n"
    "%     %                                   % % % %         %\n"
    "%     % % %                   % % %                     % %\n"
    "%               % % %                                     %\n"
    "%         X                                               %\n"
    "% % % % % % % % % % % % W W W W W W W W W W W % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %\n",
};

static int const g_map_count = (int)sizeof(g_maps) / (int)sizeof(*g_maps);

