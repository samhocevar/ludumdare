
include $(top_srcdir)/build/autotools/common.am

bin_PROGRAMS = weshgrow

weshgrow_SOURCES = \
    weshgrow.cpp \
    game.cpp game.h \
    levelmap.cpp levelmap.h \
    ship.cpp ship.h \
    constants.h

weshgrow_CPPFLAGS = $(AM_CPPFLAGS)
weshgrow_DEPENDENCIES = @LOL_DEPS@
weshgrow_LDFLAGS = $(AM_LDFLAGS)
if USE_EMSCRIPTEN
weshgrow_LDFLAGS += --preload-file data -s TOTAL_MEMORY=120000000
endif

