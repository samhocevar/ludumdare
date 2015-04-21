
include $(top_srcdir)/build/autotools/common.am

bin_PROGRAMS = ld32

ld32_SOURCES = \
    ld32.cpp \
    game.cpp game.h \
    level-description.cpp level-description.h \
    level-instance.cpp level-instance.h \
    thing.cpp thing.h \
    test_maps.h final_maps.h \
    constants.h menu.h

ld32_CPPFLAGS = $(AM_CPPFLAGS)
ld32_DEPENDENCIES = @LOL_DEPS@

