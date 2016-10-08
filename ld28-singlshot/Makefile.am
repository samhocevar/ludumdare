
include $(top_srcdir)/lol/build/autotools/common.am

bin_PROGRAMS = singlshot

singlshot_SOURCES = \
    singlshot.cpp singlshot.h \
    game.cpp game.h \
    thing.cpp thing.h \
    wave.cpp wave.h \
    starfield.h starfield.lolfx \
    explosion.h explosion.lolfx

singlshot_CPPFLAGS = $(AM_CPPFLAGS)
singlshot_LDFLAGS = $(AM_LDFLAGS) -O0
if LOL_USE_EMSCRIPTEN
singlshot_LDFLAGS += --preload-file data
endif
singlshot_DEPENDENCIES = @LOL_DEPS@

