
include $(top_srcdir)/build/autotools/common.am

bin_PROGRAMS = ld33

ld33_SOURCES = \
    ld33.cpp \
    game.cpp game.h \
    levelmap.cpp levelmap.h \
    constants.h

ld33_CPPFLAGS = $(AM_CPPFLAGS)
ld33_DEPENDENCIES = @LOL_DEPS@
ld33_LDFLAGS = $(AM_LDFLAGS)
if USE_EMSCRIPTEN
ld33_LDFLAGS += --preload-file data -s TOTAL_MEMORY=120000000
endif

