
include $(top_srcdir)/lol/build/autotools/common.am

bin_PROGRAMS = allturdbeast

allturdbeast_SOURCES = \
    allturdbeast.cpp constants.h \
    actor.cpp actor.h \
    game.cpp game.h \
    levelmap.cpp levelmap.h

allturdbeast_CPPFLAGS = $(AM_CPPFLAGS)
allturdbeast_DEPENDENCIES = @LOL_DEPS@
allturdbeast_LDFLAGS = $(AM_LDFLAGS)
if LOL_USE_EMSCRIPTEN
allturdbeast_LDFLAGS += --preload-file data -s TOTAL_MEMORY=120000000
endif

