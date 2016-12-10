
include $(top_srcdir)/lol/build/autotools/common.am

bin_PROGRAMS = dither

dither_SOURCES = dither.cpp
dither_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_FLAGS)
dither_LDFLAGS = $(AM_LDFLAGS) $(ZLIB_LIBS)
dither_DEPENDENCIES = @LOL_DEPS@

#SRCIMG = data/test.png
SRCIMG = data/pano.jpeg
#SRCIMG = data/world.jpeg
#SRCIMG = data/sony.jpeg
WIDTH = 600

TOLERANCE = 31000

TMPWORLD = obj/world.tmp
TMPCART = obj/cart.p8

all: ld37.p8

ld37.p8: $(SRCIMG) dither template.p8
	./dither $(SRCIMG) $(WIDTH) obj/world.png obj/world
	cat obj/world | ./zlib_lossy/minigzip -l$(TOLERANCE) | (gunzip 2>/dev/null || true) | zlib-flate -compress >| $(TMPWORLD) && mv $(TMPWORLD) obj/world.Z
	SIZE=$$(identify obj/world.png | cut -f3 -d" " | tr x ,); \
	../../zepto8/src/zeptool template.p8 --data obj/world.Z --top8 | sed "s/@SIZE@/$$SIZE/" >| $(TMPCART) && mv $(TMPCART) $@
	rm -f tmp.data tmp.png tmp.Z

CLEANFILES += ld37.p8

