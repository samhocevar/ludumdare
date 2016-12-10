
include $(top_srcdir)/lol/build/autotools/common.am

bin_PROGRAMS = dither

dither_SOURCES = dither.cpp
dither_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_FLAGS)
dither_LDFLAGS = $(AM_LDFLAGS) $(ZLIB_LIBS)
dither_DEPENDENCIES = @LOL_DEPS@

#SRCIMG = data/test.png
SRCIMG = data/pano.jpeg

all: ld37-final.p8

ld37-final.p8: $(SRCIMG) dither ld37.p8
	./dither $(SRCIMG) tmp.png tmp.data
	cat tmp.data | ./zlib_lossy/minigzip -l30000 | (gunzip || true) | zlib-flate -compress >| tmp.data2 && mv tmp.data2 tmp.Z
	../../zepto8/src/zeptool ld37.p8 --data tmp.Z --top8 >| $@.tmp && mv $@.tmp $@
	rm -f tmp.data tmp.png tmp.Z

CLEANFILES += ld37-final.p8 tmp.Z

