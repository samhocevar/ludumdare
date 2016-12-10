
include $(top_srcdir)/lol/build/autotools/common.am

bin_PROGRAMS = dither

dither_SOURCES = dither.cpp
dither_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_FLAGS)
dither_LDFLAGS = $(AM_LDFLAGS) $(ZLIB_LIBS)
dither_DEPENDENCIES = @LOL_DEPS@

all: ld37-final.p8

tmp.Z: data/test.png dither
	./dither data/test.png tmp.png tmp.Z
	rm -f tmp.png

ld37-final.p8: ld37.p8 tmp.Z
	../../zepto8/src/zeptool ld37.p8 --data tmp.Z --top8 >| $@.tmp && mv $@.tmp $@
	rm -f tmp.Z

CLEANFILES += ld37-final.p8 tmp.Z

