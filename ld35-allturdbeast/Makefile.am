
include $(top_srcdir)/build/autotools/common.am

bin_PROGRAMS = ld35

ld35_SOURCES = \
    ld35.cpp ld35.h

ld35_CPPFLAGS = $(AM_CPPFLAGS)
ld35_DEPENDENCIES = @LOL_DEPS@
ld35_LDFLAGS = $(AM_LDFLAGS)
if USE_EMSCRIPTEN
ld35_LDFLAGS += --preload-file data -s TOTAL_MEMORY=120000000
endif

