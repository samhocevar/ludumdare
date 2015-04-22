
include $(top_srcdir)/build/autotools/common.am

bin_PROGRAMS = sot3000

sot3000_SOURCES = \
    sot3000.cpp \
    game.cpp game.h \
    level-description.cpp level-description.h \
    level-instance.cpp level-instance.h \
    thing.cpp thing.h \
    constants.h menu.h

sot3000_CPPFLAGS = $(AM_CPPFLAGS)
sot3000_DEPENDENCIES = @LOL_DEPS@
sot3000_LDFLAGS = $(AM_LDFLAGS)
if USE_EMSCRIPTEN
sot3000_LDFLAGS += --preload-file data
endif

