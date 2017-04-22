
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

TOLERANCE = 10000

TMPSOURCE = obj/source.p8
TMPDATA = obj/source.data
TMPCART = obj/cart.p8

CART = ld38.p8

all: $(CART)

$(CART): $(SRCIMG) dither source.p8
	mkdir -p obj
	@# Implement dofile() in source
	cat source.p8 | awk -F"'" '/^ *dofile/ { system("cat " $$2); getline } { print }' >| $(TMPSOURCE)
	@# Create global data, starting with the first 0x4300 bytes of the cart
	$(ZEPTOOL) $(TMPSOURCE) --todata >| $(TMPDATA)
	@# Dither our image, compress it (lossily), then uncompress and add it to global data
	./dither $(SRCIMG) $(WIDTH) obj/world.png obj/world
	cat obj/world | ./fork-zlib/minigzip -9 -l$(TOLERANCE) | (gunzip 2>/dev/null || true) >> $(TMPDATA)
	@# Compress global data
	$(ZCOMPRESS) < $(TMPDATA) >| $(TMPDATA).Z
	@# Put first 0x4300 bytes of compressed data in cartridge
	$(ZEPTOOL) $(TMPSOURCE) --data $(TMPDATA).Z --top8 \
	    | sed "s/=.*xxx image size.*/=$$(identify obj/world.png | cut -f3 -d" " | tr x ,)/" \
	    | sed '/-- xxx: begin remove/,/-- xxx: end remove/d' \
	    | sed '6,$${s/ *--.*//}' | grep . \
	   >| $(TMPCART)
	@# Put remaining compressed data in ROM variable
	sed '/rom = {/q' < $(TMPCART) >| $@
	echo '[0]=' >> $@
	cat $(TMPDATA).Z | dd bs=1 skip=17152 | od -v -An -x --endian=little | xargs -n2 | awk '{ print "0x"$$2"."$$1"," }' | xargs -n 6 >> $@
	sed '0,/rom = {/d' < $(TMPCART) >> $@
	@# Create PNG cartridge
	$(ZEPTOOL) $@ --topng -o $@.png
	@#rm -f $(TMPDATA) $(TMPDATA).Z

CLEANFILES += $(CART)

