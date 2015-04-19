﻿//
// Ludum Dare 32 Entry
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
    /* Level 6 */
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                      #          #             \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                            % %\n"
    "                                              %\n"
    "                                              %\n"
    "% %                                     E     %\n"
    "%                                      % % % % \n"
    "%                                             %\n"
    "%   S       b             X          p        %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",

    /* Level 1 */
    "%                                                       b %\n"
    "%                                                         %\n"
    "%                                                         %\n"
    "%           % % % % %                                     %\n"
    "%                                     #                 % %\n"
    "%                               % % % % % % %             %\n"
    "% % %                                                     %\n"
    "%            *    X     p   % %                         % %\n"
    "%                                                         %\n"
    "%                 % % %                       *           %\n"
    "%     %                                                 % %\n"
    "%  S  %                                        E          %\n"
    "%     %                        @            % % %         %\n"
    "%     % % %                   % % %                     % %\n"
    "%               % % %                                     %\n"
    "%         X                                               %\n"
    "% % % % % % % % % % % %                       % % % % % % %\n"
    "                    % % W W W W W W W W W W W % %          \n",

    /* Level 2 */
    /* Level 3 */
    "            X     X       X       X            \n"
    "              X       X       X      X         \n"
    "           X       X       X X    X            \n"
    "          X   X       X X X        X           \n"
    "                                               \n"
    "                  X   X       X                \n"
    "              X           X   X   X  X         \n"
    "                                               \n"
    "                        X                      \n"
    "                          X          X      % %\n"
    "             X       X                        %\n"
    "                 X           X                %\n"
    "% %         X                           E     %\n"
    "%              X                              %\n"
    "%                                             %\n"
    "%   S                                         %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",

    /* Level 4 */
    "% % % % % % %\n"
    "%           %\n"
    "%         E %\n"
    "%         % %\n"
    "%           %\n"
    "% S         %\n"
    "% % % % % % %\n",

    /* Level 5 */
    "% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 E %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "%                                                                                                   %\n"
    "%                                                                                                 % %\n"
    "%                                                                                                   %\n"
    "% S                                                                                                 %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %\n",
};

static int const g_map_count = (int)sizeof(g_maps) / (int)sizeof(*g_maps);

