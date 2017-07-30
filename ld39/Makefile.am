
include $(top_srcdir)/lol/build/autotools/common.am

bin_PROGRAMS = dither

dither_SOURCES = dither.cpp
dither_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_FLAGS)
dither_LDFLAGS = $(AM_LDFLAGS) $(ZLIB_LIBS)
dither_DEPENDENCIES = @LOL_DEPS@

ZEPTOOL = ../../zepto8/src/zeptool
ZCOMPRESS = zlib-flate -compress

IMG = $(shell sed 's/--.*//' $(SRC) | grep 'file *= *"' | cut -f2 -d'"')
IMGDATA = $(IMG:%=%.data)

SRC = source.p8
LIB = $(shell sed 's/--.*//' $(SRC) | tr "'" '"' | grep 'dofile *. *"' | cut -f2 -d'"')

TMPSRC = obj/$(SRC)
TMPDATA = obj/source.Z
TMPCART = obj/cart.p8

CART = ld39.p8

all: $(CART)

%.data: % dither source.p8 fork-zlib/minigzip
	@# Dither our images, compress them (lossily), then uncompress them again
	eval $$(sed 's/--.*//' $(SRC) | grep 'file.*"$<"' | tr -d ' {}' | tr , '\n') \
	 && ./dither $< $$w $$h $@.png $@.tmp \
	 && cat $@.tmp | ./fork-zlib/minigzip -9 -l$$tolerance | dd | (gunzip 2>/dev/null || true) >| $@
	rm -f $@.tmp

$(CART): $(SRC) $(LIB) $(IMGDATA) dither
	mkdir -p obj
	@# Apply dofile() in source
	cat $(SRC) | awk -F"'" '/^ *dofile/ { system("cat " $$2); getline } { print }' >| $(TMPSRC)
	@# Create global data, starting with the first 0x4300 bytes of the cart,
	@# then our images, then compress everything
	($(ZEPTOOL) $(TMPSRC) --todata; cat /dev/null $(IMGDATA)) | $(ZCOMPRESS) >| $(TMPDATA)
	@# Put first 0x4300 bytes of compressed data in cartridge
	$(ZEPTOOL) $(TMPSRC) --data $(TMPDATA) --top8 \
	    | sed '/-- xxx: begin remove/,/-- xxx: end remove/d' \
	    | sed '6,$${s/ *--.*//}' | grep . \
	   >| $(TMPCART)
	@# Put remaining compressed data in ROM variable, and
	@# add extra newline so that size is at least 1 (ugly hack)
	sed '/global_rom = {/q' < $(TMPCART) >| $@
	echo '[0]=' >> $@
	(cat $(TMPDATA) | dd bs=1 skip=17152; echo '') | od -v -An -x --endian=little \
	  | xargs -n2 | awk '{ print "0x"$$2"."$$1"," }' | sed 's/0*,/,/ ; s/0x00*/0x/g' \
	  | xargs -n 6 | tr -d ' ' >> $@
	sed '0,/global_rom = {/d' < $(TMPCART) >> $@
	@# Create PNG cartridge
	$(ZEPTOOL) $@ --topng -o $@.png
	@#rm -f $(TMPDATA)

CLEANFILES += $(CART) $(TMPSRC) $(TMPDATA) $(TMPCART) $(IMGDATA)

