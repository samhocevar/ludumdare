
include $(top_srcdir)/lol/build/autotools/common.am

bin_PROGRAMS = grunx

grunx_SOURCES = \
    ld33.cpp \
    game.cpp game.h \
    actor.cpp actor.h \
    levelmap.cpp levelmap.h \
    constants.h

grunx_CPPFLAGS = $(AM_CPPFLAGS)
grunx_DEPENDENCIES = @LOL_DEPS@
grunx_LDFLAGS = $(AM_LDFLAGS)
if LOL_USE_EMSCRIPTEN
grunx_LDFLAGS += --preload-file data -s TOTAL_MEMORY=120000000
endif

