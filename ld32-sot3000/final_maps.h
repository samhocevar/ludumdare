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
#if 0
    /* (Test) */
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "% %                                         % %\n"
    "%                                             %\n"
    "%                                             %\n"
    "%               -         @         -         %\n"
    "%                 % % % % % % % % %           %\n"
    "%                        % %                  %\n"
    "%    S                   % %            E     %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",
#endif

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
    "%         % % % %               % % % % % % % %\n"
    "%            |                    % % % % % % %\n"
    "%   S        |                    % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",



    /* Jump over spikes */
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
    "% % % % % % % % %             % % % % % % % % %\n"
    "% % % % % % % % % W W W W W W % % % % % % % % %\n",


    /* Must jump more */
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                          E                    \n"
    "                        % % %                  \n"
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


    /* Use the blue gun */
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                               \n"
    "                                             %%\n"
    "                                              %\n"
    "%                                             %\n"
    "%                                        E    %\n"
    "%                         % % % % % % % % % % %\n"
    "% b                         % % % % %       % %\n"
    "% %                         % % % % % % % % % %\n"
    "%                           % %     % % % % % %\n"
    "%    S                X     % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n"
    "% % % % % % % % % % % % % % % % % % % % % % % %\n",


    /* Use the pink gun */
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
    "%                      +     +                %\n"
    "%    S                 X     X          E     %\n"
    "% % % % % %     % % % % % % % % % % % % % % % %\n"
    "% % % % % % W W % % % % % % % % % % % % % % % %\n",


    /* Practice delayed jump */
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
    "%                                             %\n"
    "%                                       E     %\n"
    "% % %                   % % % % % % % % % % % %\n"
    "% % % W W W W W W W W W % % % % % % % % % % % %\n",


};

static int const g_map_count = (int)sizeof(g_maps) / (int)sizeof(*g_maps);

