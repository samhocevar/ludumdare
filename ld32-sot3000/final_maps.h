//
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
    /* Just reach the end */
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "% %                                         % %\n"
    "%                                             %\n"
    "%                                             %\n"
    "%    S                                  E     %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    /* Must jump */
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                            % %\n"
    "                                              %\n"
    "                                              %\n"
    "% %                                     E     %\n"
    "%                     % % % % % % % % % % % % %\n"
    "%                       % % % % % % % % % % % %\n"
    "%   S                   % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",



    /* Must jump more */
    "                        E                      \n"
    "                      % % %                    \n"
    "                                               \n"
    "                                               \n"
    "              % % %                            \n"
    "                                               \n"
    "% %                                         % %\n"
    "%                     % % %                   %\n"
    "%                                             %\n"
    "%                                             %\n"
    "%                     % % % % % % % % % % % % %\n"
    "%                       % % % % % % % % % % % %\n"
    "%   S                   % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


};

static int const g_map_count = (int)sizeof(g_maps) / (int)sizeof(*g_maps);

