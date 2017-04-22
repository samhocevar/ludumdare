
include $(top_srcdir)/lol/build/autotools/common.am

bin_PROGRAMS = dither bluenoise

dither_SOURCES = dither.cpp
dither_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_FLAGS)
dither_LDFLAGS = $(AM_LDFLAGS) $(ZLIB_LIBS)
dither_DEPENDENCIES = @LOL_DEPS@

bluenoise_SOURCES = bluenoise.cpp
bluenoise_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_FLAGS)
bluenoise_LDFLAGS = $(AM_LDFLAGS) $(ZLIB_LIBS)
bluenoise_DEPENDENCIES = @LOL_DEPS@

ZEPTOOL = ../../zepto8/src/zeptool
ZCOMPRESS = zlib-flate -compress

#SRCIMG = data/test.png
SRCIMG = data/pano.jpeg
#SRCIMG = data/world.jpeg
#SRCIMG = data/sony.jpeg
WIDTH = 600

TOLERANCE = 31000

TMPWORLD = obj/world.tmp
TMPDATA = obj/source.data
TMPCART = obj/cart.p8

CART = ld38.p8

all: $(CART)

$(CART): $(SRCIMG) dither source.p8
	mkdir -p obj
	@# Dither our image to some pixel data
	./dither $(SRCIMG) $(WIDTH) obj/world.png obj/world
	@# Compress image using lossy compression, then uncompress and recompress it
	cat obj/world | ./zlib_lossy/minigzip -l$(TOLERANCE) | (gunzip 2>/dev/null || true) | $(ZCOMPRESS) >| $(TMPWORLD) && mv $(TMPWORLD) obj/world.Z
	@# Extract first 2kB of data from source
	$(ZEPTOOL) source.p8 --todata | $(ZCOMPRESS) | od -v -An -x --endian=little | xargs -n2 | awk '{ print "0x"$$2"."$$1"," }' | xargs -n 6 >| $(TMPDATA)
	@# Extract image size
	SIZE=$$(identify obj/world.png | cut -f3 -d" " | tr x ,); \
	$(ZEPTOOL) source.p8 --data obj/world.Z --top8 \
	    | sed "s/=.*xxx image size.*/=$$SIZE/" \
	    | sed '/-- xxx: begin remove/,/-- xxx: end remove/d' \
	    | sed '6,$${s/ *--.*//}' | grep . \
	   >| $(TMPCART)
	sed '/rom = {/q' < $(TMPCART) >| $@
	echo '[0]=' >> $@
	cat $(TMPDATA) >> $@
	sed '0,/rom = {/d' < $(TMPCART) >> $@
	$(ZEPTOOL) $@ --topng -o $@.png
	rm -f tmp.data tmp.png tmp.Z

CLEANFILES += $(CART)

