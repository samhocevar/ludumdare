
include $(top_srcdir)/build/autotools/common.am

bin_PROGRAMS = ld28

ld28_SOURCES = \
    ld28.cpp ld28.h \
    game.cpp game.h \
    thing.cpp thing.h \
    starfield.h starfield.lolfx

ld28_CPPFLAGS = $(AM_CPPFLAGS)
ld28_LDFLAGS = $(AM_LDFLAGS) -O0
if USE_EMSCRIPTEN
ld28_LDFLAGS += --preload-file data
endif
ld28_DEPENDENCIES = @LOL_DEPS@

