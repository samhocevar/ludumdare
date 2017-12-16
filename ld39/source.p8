pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
--  ld39 toy project
--  copyright (c) 2017 sam hocevar <sam@hocevar.net>
--
--  this program is free software. it comes without any warranty, to
--  the extent permitted by applicable law. you can redistribute it
--  and/or modify it under the terms of the do what the fuck you want
--  to public license, version 2, as published by the wtfpl task force.
--  see the copying file or http://www.wtfpl.net/ for more details.

-- xxx: begin remove
-- this does not exist in pico-8, we just emulate it
function dofile() end
-- xxx: end remove

image_list = {
  -- [1]: the background
  { file="data/background.png", w=128, h=96, tolerance=62200, scroll=true },

  -- storing 16x1 sprites compresses better than 4x4 (22528 -> 5226 vs. 5505)
  -- also, tolerance could be increased here but beware of artifacts
  --
  -- tried to store sprites in a more efficient way by moving them up, but
  -- that would compress to 4526 bytes instead of 4550, which is fewer bytes
  -- gained than the array to store offsets... even moving frames 2-10 up 24
  -- pixels, so as to create a .png 24 lines smaller would compress to 4590
  -- instead of 4550. go figure!
  { file="data/owl-indexed.png", w=512, h=88, tolerance=10000 },
  { file="data/owl-power.png", w=512, h=120, tolerance=200000 },

  -- [4]: water; water-indexed is a 1x12 sprite sheet, but water-transposed is
  -- the 12x1 sheet we use, it's a lot better, since it takes care of scrolling
  --{ file="data/water-indexed.png", w=160, h=384, tolerance=2000, scroll=true },
  { file="data/water-transposed.png", w=1920, h=32, tolerance=2000, scroll=true },

  -- [5]: some mountains
  { file="data/mountains.png", w=288, h=48, tolerance=2000, scroll=true },

  -- [6]: foreground trees
  { file="data/trees.png", w=336, h=128, tolerance=60000, scroll=true },
}
background = image_list[1]
water = image_list[4]
mountains = image_list[5]
trees = image_list[6]

facts = {}
global_rom = {
}

-- xxx: begin remove
function get_mem(address,size)
  local a={}
  for i=0,size/4-1 do
    a[i]=peek4(address+i*4)
  end
  return a
end
-- xxx: end remove

-- convert array data to bytes in memory
-- dest: memory address
-- src: array of u32, indices start at 0
-- size: bytes, must be multiple of 256 (0x100)
-- offset: number of u32, offset inside src
function u32_to_memory(dest,src,size,offset)
  offset = offset or 0
  for i=0,size/4-1 do
    poke4(dest+i*4,src[offset+i])
  end
end

-- import our custom zzlib
dofile('zzlib.p8')

--
-- copy to memory from lua
--
function blit_bigpic(lines, dst, dstwidth, src, srcwidth, xoff, yoff)
  local data = src[flr(xoff % 2)]
  xoff = band(xoff,0xfffe)
  srcwidth /= 8 -- we read uint32s, so 8 pixels per value
  dstwidth /= 2 -- we write uint8s, so 2 pixels per value
  local dx = band(xoff,7)
  local xoff = flr(xoff/8)
  local srcoff = yoff * srcwidth + xoff
  local w1 = min(max(0, srcwidth - xoff - 1), dstwidth / 4)
  local w2 = dstwidth / 4

  tmp_mem = 0x5e00 + shr(dx,1)
  for line = 0,lines-1 do
    local off = srcoff + srcwidth * line
    -- read line + special wrap around case
    for j = 0,w1    do poke4(0x5e00+4*j,data[off + j]) end
    off -= srcwidth
    for j = w1+1,w2 do poke4(0x5e00+4*j,data[off + j]) end
    memcpy(dst + dstwidth * line, tmp_mem, dstwidth)
  end
end

strlen = {}

function _init()
  -- clean startup
  cls()

  -- init strlen array
  local s = "\151"
  --local s = "\140\141\142\143\144\145\146\147\150\151\152\153\154\155\156\157\160\161\162\163\164\165\166\167\168"
  for i=1,#s do strlen[sub(s,i,i)] = true end

  -- decompress data
-- xxx: begin remove
  print('reading data...')
  if #global_rom>0 then
-- xxx: end remove
    local rom = {}
    for i=0,0x4300-1 do rom[i]=peek(i) end
    for i=0,#global_rom do
      local n=global_rom[i]
      for j=4*i+0x4300,4*i+0x4304 do
        rom[j]=band(shl(n,16),255)
        n=shr(n,8)
      end
    end
    -- append rom to our compressed data and decompress into lua memory
    print('decompressing...')
    local tmp = inflate(rom)
    rom = nil
    -- now copy decompressed memory to the proper places
    local u32_offset = 0
    -- the first 0x4300 bytes were our initial cartridge, copy them to 0x0000
    print('unpacking...')
    u32_to_memory(0x0000, tmp, 0x4300)
    u32_offset += 0x4300 / 4
    -- the remaining data is our images
    for i in all(image_list) do
      local u32_count = i.w / 8 * i.h
      local pixels = {}
      for n=0,u32_count-1 do pixels[n]=tmp[u32_offset+n] end
      i.data = { [0] = pixels, {} }
      u32_offset += u32_count
    end
-- xxx: begin remove
  else
    for i in all(image_list) do
      local pixels, w, h = {}, i.w, i.h
      -- random noise for testing purposes
      for n=0,w/8*h-1 do
        local dy = flr(n / (w / 8)) % 2 * 4
        local x = flr(n % (w / 8) / 2)
        local y = flr((n / (w / 8)) / 16)
        pixels[n]=bxor(((3*x+2*y) % 7 + 3)*shl(0x0101.0101,dy))
        --pixels[n]=band(shl(rnd(256),8)+shr(rnd(256),16),0xbbbb.bbbb)
      end
      i.data = { [0] = pixels, {} }
    end
  end
-- xxx: end remove

  -- the music is now decompressed
  --music(0,0,1)

  -- compute off-by-one-pixel data
  print('postprocessing...')
  for i in all(image_list) do
    if i.scroll then
      local data, w, h = i.data, i.w, i.h
      for n=0,#data[0]-1 do
        local off = n + 1
        if off % (w / 8) == 0 then off -= w / 8 end
        data[1][n] = band(shr(data[0][n],4),0xfff.ffff) + shl(data[0][off],28)
      end
    end
  end
end

scroll_mul = 0

owl_page = -1
owl_mode = 0
owl_x, owl_y = 10, 20

fly_cycle = 0
water_cycle = 0

function _update60()
  rnd()

  --if btnp(0) or btnp(1) then
  --  char_speed = max(min(char_speed + 0.25, 2), 1)
  --end
  if (btn(0)) owl_x -= 0x2.2
  if (btn(1)) owl_x += 0x2.2
  if (btn(2)) owl_y -= 0x2.2
  if (btn(3)) owl_y += 0x2.2

  if btnp(5) then
    owl_mode = 1 - owl_mode
    owl_page = -1
  end

  -- we wrap at 4 because we're also using scroll_mul*0.25 and
  -- scroll_mul*1.5, for instance
  scroll_mul = (scroll_mul + 0x.0018) % 4

  fly_cycle = (fly_cycle + 0x.07) % 1
  water_cycle = (water_cycle + 0x.03) % 1
end

function draw_world()
  local data = background.data
  local image_width = background.w
  local image_height = background.h
  local world_x = (image_width * scroll_mul * 4) % image_width
  local n=6
  local lines = flr(image_height/n)
  for i=0,n-1 do
    local srcwidth = image_width
    local dstwidth = 128
    local dst = 0x6000 + 64 * i * lines
    off_x = (flr(world_x * (2+2*abs(5-i)/n)) + image_width) % image_width
    --off_x = (flr(world_x * (1.5+0.75*abs(n/2-i))) + image_width - 64) % image_width
--off_x = 0
    off_y = i*lines
    blit_bigpic(lines, dst, dstwidth, data, srcwidth, off_x, off_y)
  end
end

function _draw()
  local frame, page, off_x

  cls(1)

  -- background
  draw_world()

  -- debug
  --do return end

  -- mountains
  palt(0,false) -- black = opaque
  palt(8,true) -- red = transparent
  off_x = water.w * scroll_mul * 0.5
  -- args: lines, dst, dstwidth, src, srcwidth, xoff, yoff
  blit_bigpic(mountains.h, 0x0200, 0x80, mountains.data, mountains.w, off_x % mountains.w, 0)
  spr(16, 0, 60, 16, 6)
  palt()

  -- water
  palt(0,false) -- black = opaque
  palt(8,true) -- red = transparent
  --pal(7,6) pal(6,12) pal(12,13) pal(13,1)
  frame = flr(water_cycle % 1 * 12)
  off_x = water.w * (scroll_mul + frame * 5 % 12 / 12)
  -- args: lines, dst, dstwidth, src, srcwidth, xoff, yoff
  blit_bigpic(water.h, 0x0200, 0x80, water.data, water.w, off_x % water.w, 0)
  spr(16, 0, 84, 16, 4)
  pal()

  -- character
  local owl = image_list[2 + owl_mode]
  frame = flr(fly_cycle % 1 * 16)
  page = flr(frame / 4)
-- hack
owl_page = -1
  if page != owl_page then
    -- args: lines, dst, dstwidth, src, srcwidth, xoff, yoff
    blit_bigpic(owl.h, 0x0200, 0x80, owl.data, owl.w, owl.w / 4 * page, 0)
    owl_page = page
  end
  palt(8,true) -- red = transparent
  local dy = frame >= 2 and frame <= 9 and 24 or 0 -- optimise how many tiles we blit
  spr(16 + frame % 4 * 4 + dy + dy, owl_x, owl_y + dy, owl.w / 16 / 8, owl.h / 8 - 3)
  palt()

  -- water layer 2
  if true then
    palt(8,true) -- red = transparent
    -- args: lines, dst, dstwidth, src, srcwidth, xoff, yoff
    frame = flr(water_cycle % 1 * 12)
    off_x = water.w * (scroll_mul * 1.5 + (frame + 6) * 5 % 12 / 12)
    blit_bigpic(water.h, 0x0200, 0x80, water.data, water.w, off_x % water.w, 0)
    spr(16, 0, 96, 16, 4)
    palt()
  end

  -- trees
  palt(8,true) -- red = transparent
  palt(0,false)
  -- args: lines, dst, dstwidth, src, srcwidth, xoff, yoff
  off_x = trees.w * (scroll_mul * 8.0)
  blit_bigpic(trees.h / 2, 0x0200, 0x80, trees.data, trees.w, off_x % trees.w, 0)
  spr(16, 0, 0, 16, 8)
  blit_bigpic(trees.h / 2, 0x0200, 0x80, trees.data, trees.w, off_x % trees.w, 64)
  spr(16, 0, 64, 16, 8)
  palt()

  -- debug
  cursor(90,120)
  print(stat(1)..'%', 90, 120)
end

__gfx__
00000000777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
43434343434dd111111111111dddd11111111111111dd11111111111111dd143114343434343434111111143434dd10005050505050543434343434343434343
105450143ddcdd1c111111111dddd11c111111111dddd11c111111111ddc43343434345050341054111143343434d550303030305dd433343410543453343434
031145411111d111111111111dd1d11111111111111dd11111111111111dd1434341450543430533111143114343433505050345114343433505403343434343
1333333333331c1c1111111111111c11111111111c11111c111111111c1111353535353535355434153334343453543030303051143334333333333354345334
4324314305434343411111111c111111111111111111111111111111111143434311434343430343434343034343434303000505434343403343010305054305
50505154341031341111111111111111111111111111111111111111111135353535535430303030333434345354345030303050505050505453345350505453
05050543014111054145411111111111111111111111111111111111111143434343333333540543050543034343435034030005050505054343433505050005
10505453111011315434151111111111111111111111111111111111111135353535355133543453343331335433333553505050505050505434103050505050
05110315111111111143111111111111111111111111111111111111111143434343334505430345353545450505354543000505114335050500050505050505
5012111c1111111c1012311c1111111c1111111c1111111c1111111c11111134143410305050505433333553505434105450501c113434503030305050505050
0111111111111111111135111111111c111211111111111111111111111111434343434500050503450305050543434500050511114343414505050505050505
11111c111111121111111c121111111111111c111111121111111c11111332335453505050535050545350505453505050535c11113535353550505453505053
11111111111111111111111111111111111111111111111111111111111143434133333333351333034503055343350505000511114343414505150005050505
111c111c11111111111c111c111111111111111c11111111111c111c1c1135105353345c3454505350505434533434341054501c111134343410545050505050
11111111111111111111111111111111111c11111111111111111111111141430345432443030305054333434343434500050511111143434335050505050505
1c1c11111c1111111c1c11111c1111111c1111111c1111111c1c11111c1111133433313354333335503514333433343410545011141111343450305333435150
1111111111111111111111111111111111111111111111111111111111c141430345434505430345350505434343350505000505114343330545054343034503
11111111111111111111111111111111111111111111111111111111111113543434345354343350505050545330335453505050343434343453543433505050
11111111111111111111111111131111111111111111111111111111111111434343434543334505430305050345034300050505434343434335430505430305
11111111111111111111113531414111111111112111111111111111341135535431345334345050505050505035343050505054333335535353535353555050
11111111111111111111113343434341431111111111111111114343434345433345433345433345430105330505434305000505434305430505050505000505
11111111111111111111111131343434111111111111111111111135353535353354333335533334345050505150505050505050353434505050513433505050
01111111111113415403011135313411111111111111111111114343434343434343434545430543050505050501054300050005134315331111434343330545
111111c1114535c4313330511433c3c1113511c111c1c1c11111345334333133545534345050c050115050545350505050505050143334345014313533505433
11111111111543243143414343434343411111111111111111134343430343434343454305050505054005433505050005050500134333434343434341430505
1111c134c1313451113531343434535434345111c111c11111341054345334343434553434505150505433333553305050505051c11130303331335454535050
13054343434343350345353345433345330143111111111111434311434343433354553400050005134335054335050500050511111305431543434545430543
11113433343334341033105054533343434354111111111111353535353535353535353530333033545053543433505050505411111101431133343333333333
11434141434305054343050005311111131545001111111113414324433333355333340543434335050531434343450005051111111143434145434343434543
c111c154c334555035343450501453543111c110c1111111c3313533505433333335533334053453543434513330505050505111c1111111c111343433343410
11111545434531050505350111110341115515011111111111434343433345054345353345433305054343434343430505051111111111111111434343454343
113030505050505054c0505011c1c1c111c110c111c1c1c1115433333335535050505333343450505153345330505050505054c111c1c1c111c1113535353533
33450543451005050101011111111111111111111111111111434345053305534335353113503333111111000505030005051111111111111111111343434335
5453505051505011c11111111111c111c11111111111c111c1113134341055303354535013543434511111105050505050505111c111c111c111111111113434
10050305000111111111111111111111111111111111111111154343454535050505050503434315331111c00005030500011111111111111111111111111143
14c05050c111111111c11111c111111111c11111c111111111353030333031505453515154533050115111505050505050511111c111111111c11111c1111143
11311111111111111111111111111111111111111111111111414303454335054303050001100505105111000500050505051111111111111111111111111111
c110c111c1111111c111c111c1111111c111c111c1111111c11150545330335450505050505050505111c150505050505051c111c1111111c111c111c1111111
43111131111111111111111111111111111111111111111111135410054343054305050505151043311110050500050505051111111111111111111111111111
5350314141c1c1c1c1c111c111c1c1c1c1c111c111c1c1c1c1c114c53050505030333031505050505050505050503550303111c111c1c1c1c1c111c111c1c1c1
54531135353101111111111111111111111111111111111111114301100235434335050505050510511111000500050505051111111111050511111111111111
50505011511111c1c111c111c11111c1c111c111c11111c1c111c1353054555453505050505050505411c153505050505050c111c154533054343111c11111c1
01111111111111111111111111111111111111111111111111114143034503334301030500050505010511430005050505051341430505350103451111111111
35c1c1c111c1c111c1c1c1c111c1c111c1c1c1c111c1c111c1c1c1c14343414550505050505050505051c1c15050505050533354505354305455545311c1c1c1
41111111111111111111111111111111111111111111111111111111113535130101053005050505050011110505050505450543453533033345333111111111
c111c1c1c1c1c111c111c1c1c1c1c111c111c1c1c1c1c111c111c1c135305455c010505050505050505051c1c050505035343050505453303354505055c1c111
11111111111c111111111111111c111111111111111c1111111111133433454343050505454c43430505150111030005050543050543030503054333431d1111
c1c1c1c111c1c1c1c1c1c1c111c1c1c1c1c1c1c111c1c111c1c1c1353050545350505053505051505431505111c0505533335455513554533333333333c1c111
11111111111111111111111111111111111111111111111111111334050545050105050505000505154505134143050535034343050505353533543305111111
111c111c1c1c1c1c111c1c1c1c1c1c1c111c1c1c1c1c1c1c111c3410303450505053505050505050533c505c1c105055505c50505050503050505030531c1c1c
111111111111d111111111111111d111111111111111c1111111110533050543354305050535353341351005110305354343350505050505010503450111c111
1c11111c1c1c1c1c1c1c111c1c1c1c1c1c11111c1c1c1c1c1c1111353054503553345350505453555350505053505055545350505050505050535050115c1c1c
11111111111111d111111111111111d111111441111111c1111111154345150333434341014545050535453331500543353505050105430005330505051c11c1
3c1c1c1d1c111c1c1c1c1c1d1c111c1c1cf9f4f4fc111c1c1c1c1c3530533334345054505011505c505055545350503350505050353434505050543305111c1c
4341d111111111111111d111111111114f9f4445d11111111111c143434343454305330505051143450543433505430505050505013535353551054145411c11
3c1c1c1c111c1c1c1c1c1c1c1c1c1c14fff4f45ddd1c1c1c1c1c1c1c103335505035503550355050333354555c35545355505055545350555350505030531c1c
11111111111111111111111111111f9f9f4445dddd11111111111111053305054313450343000505350105050305053505354533454543430505053345333111
1c111c1c1c111c1c1c1c1c1c1c11fff9f4f451d1dd111c1c111c1c1c1c110533535050505551351c53505054535050505053505054535553505c10543453341c
011341111111111111111111c14f9f4f45454dd21d11111111111111d1111115050535050515011111153311c155050503450305050105050505054505153311
50501c1c1c1c111c1c1c1c1cfff4f4fdf45455dddd1c1d1c1c1c1c1c1c1c1d1c135434345c501d1c1c1c1c1c154345453555505050541551545350535334111c
11351011111111d11111111f4f9f7ddf4545457d711111c111111111111111c111111311111111c11111111111353535353305000505430345353505353c01c1
545c1c1c1c1c1c1c1d1c14f4f4f4f4f4f4f454d7dd1c1c1c1d1c1c1c1d1c1c1c1d1c1c1c1d1c1c1c1d1c1c1c1d50505050335050555c351c3354545350531c1c
c111c111c111c111c1114f4f7f7ddddd4445451dc111c111c111c111c111c111c111c111c111c111c111c111c3050505450501050511c1114305011500014111
1c1c501c1c111c1c1c1f44f4f4f4f4fff45454d11c1d1c1c1c1c1c1c1c1d1c1c1c1c1c1c1c1d1c1c1c1c1c1c1c505050503350505054101c1c101c1c131d1c1c
1111111c111c11111ff44f9f7d4f44454545454c111111111111111c111c11111111111c111c11111111111c1155050005000505055c01111111111c111c1111
c1c1c1c1c1c111c1f7f4f4f4f45dddddf4545551c1c111c1c1c1c1c1c1c111c1c1c1c1c1c1c111c1c111c1c1c135353550505050505451c1c1c1c1c1c1c111c1
1c1111111c11117f9f454f7f7d7dd444444545411c1111111c1111111c1111111c1111111c1111cc1c1111111c55050055050005000551111c1111111c111111
c1c1c1c1c1c1fff4f4fff45df4fffdf4f454545511c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1cc11c1c1c1c1c1c15505555050505350c1c1c1c1c1c1c1c1c1c1
1111111d11111f4f9f777d7ddd1d15444545454511111111111111dd11111111111111dd111111111111111d1111550505000505050001111111111d11111111
c1c1c1c1d1c1f4f4f4f12121215454f4f4f45454d1c111c1c1c1c1c1d1c111c1c1c1c1c1d1cc1111c1c1c1c1d1c1550550505050505051c1c1c1c1c1d1c111c1
1c111c111c114f4f9f7ddddddd1d4545454545451c11111111111c111c1111111c111c111cc11111cc111c111c11550500050005050505111c111c111c111111
c1c11111c1c1f4f4f7ddd121212154f4f454f4f5c1c1c1c1c1c1c111c1c1c1c1c1c11111cc11111111c11111c1c1550550505050505505c1c1c11111c1c1c1c1
11111111111144411111121ddd111d44454f44441111111111111111111111111111111cc11111111111111111cc550505050500050501011111111111111111
c111c1c1c1c1c1c9ffddddd12121d454f4f45454c1c1c1c1c111c1c1c1c1c1c1c111ccc1111111111111c1c1c1111c550550505050505051c111c1c1c1c1c1c1
1111111111114f9f7fdd12121d1d124544444f4f11111111111111111111111111111111111111111c1111c11111115540054505010505c11111111111111111
c1c1c1c1c114f4f4f1c1dddddd21d1d15454f454c111c1c1c1c1c1c1c111c1c1c1c1c1111111111111c1cc1cc1111155055505505050505111c1c1c1c111c1c1
11111111111441111ff77ddd11dd121d154545444111111111111111111111111111c11111111111111cc11111111111554005000505051c1111111111111111
11c111c1d1d1c1f9fff7ddc1ddd121d121d45455f1c1c1c111c111c1d1c1c1c1d1cc11111111111111111111c1d111155050505050505111d1c111ccc1d1c1cc
1111111111114f4f9f4d11dddd11dd121d1215454111111111111111111111111111111111111111111111111cc111550505050500050511c11111111c111c11
11c1c1c1c111f4f7f4c1d7ddd1ddddddd12dd1dd1111c1c1c1c1c1c1c111c1c111c11111111111111111111111111155055550505050511111c1c1c111ccc111
1111111111111244117f7d7d1d7ddd1ddd1d12dd111111111111cc1111111111cc11111111111111111111111111115545000505050001111111111111111111
c1c111c111c11111cff7f7d1d7ddd1ddd1ddd1d121c11111c1c111c111c111c11111111111111111111111111111115550505050505051111cc111c111111111
111111111111111f9f9f411d7d7d1d7d11dd12dd11111111111111c11111111c1111111111111111111111111111155505050005050505111111111111111111
c1c1c111c111c1f4f4f4c1f7f7d1d7dd21ddd1ddd111c1c1c1cc1111c111ccc111111111111111111111111111111550505050505055051111c1c11111111111
111111111111111444411f7f7d177d7d1d7d1d7d1111111111111111ccccc1111111111111111111111111111111550555400500050505111111111111111111
11c111c111c11114f1c11ffff4c7f7d1d7dd17ddd1c1111111c111111111111111111111111111111111111111111550505050505050505111c111c111111111
111111111111111111114f9f417f7f717f7d1d7dd111111111c1111c11111111111111111111111111111111111115550505000505055505111111c111111111
1111c11111c111111111f4f411f7f41ffff4c7d7d1c1111111111111111111111111111111111111111111111111155050505050505055505111c11111111111
111111111111111111114441114f941f7f741f7fd1111111111111111111111111111111111111111111111111111155050005000500550500111c1111111111
11c111c1111111c111c111f114f4f1c9fff417f7f41111c11111111111111111111111111111111111111111111111555350505053505055545c111111111111
1111111ccc111111111111111444414f9f417f9f9f11111111111111111111111111111111111111111111111111115505050505000505010500c11111111111
c111c11111ccc111c111c111c1f4c1f4f4f67ffff411c111cc111111111111111111111111111111111111111111115550505050505053505055111111111111
11111c111111cc1111111111111111144447614f45111111c7611111111111111111111111111111111111111111155505050005050005050505111111111111
11c1c111111111cc11c111c111c11174f45611f4f4c1111c66661111111111111111111111111111111111111111155555545350505050505050541111111111
1ccc111111111111cc1c1cc11111676666c611444411111666c66611111111111111111111111111111111111111115505050505050500050503051111111111
c11111111111111111c1c11c1116666c6ccc21c4441116666ccc6c61111111111111111111111111111111111111105550545350505050505050541111111111
111111111111111111111111cc676666c6c6111111116766c6cdcdc6611111111111111111111111111111111111550005050500050005050500066661111111
1111111111111111111111116666666cccccc1111166666c6cccdcdccc6111111111111111111111111111111115503550535050505050505050506c66661111
111111111111111111111166666666c6c6c6c6116666666666cdddcdc6c661111111111111111111111111111115050505050505000505030005000dcdc66666
11111111111111111166666c6c6c6c6c6ccc6c666c6c6c666cccdcdcdccc6c6611111111111111111111111111555350505053505050505050505054dcdc535c
66111117676666666666c666c6c6c666c6c66666c6666666c6cdddddddcdc6c66666671111111111115553666555050500050555050005000500550555050505
cc6c666d6d6c6c6c6c6ccc6ccc6c6c6c6c6c6d6c6c6c666c6cdcdcdcdddcdccc6c6c666666666666655050505050505050505050505050505050505050505050
ccc6c6c6d6cdcdcdcdcdcdc6c6c6c66666c666d6666666c6c6cdcdcdddddddcdc6c6c6c6666666c6c50505050505050505050505050505050505050505050505
ccccccdc7cdcdcdcdcdcdccc6c6c6c6c6d6d6d6c6c666c6c6cccdcccdcdcdcdcdcccdc6c6ccc6cccc55050505050505050505050505050505050505050505050
cccccdc667ddd6ddcdddddddd666d766666666666666c6cdcdddcdcdcdcdcdddcdcdcdddcdcdcdcc550505000505050005000500050005000500050005000500
cccccc6666dd7c6cdcdcdddc6d6d7676666c6666666c6cdddddcdcdcccdcccdcccdcdcdcdcdcccc5505050505050505050505050505050505050505050505055
cdccc766c667d6c7c7cdddd6d6d7666666666666666666d6ddddddcdcdcdcdcdcccdcdcdcdcdcc05050505050505050505050505000505050005000500050005
dcc6666c6c6666dc55cc6d7d6d666c6c666c6c6c6c6c6c6d6ddddcdcdcdc6cccccccccccccccc550505050505050505050505050505050505050505050505550
05666666c665550505c67666676666c6c666c6c6c6666666d6d6ddd6dd6dd6c6c6ccc6ccc5650500050505000500050005000500050005000500050005000500
50506c6555555453507c6666666c6ccccc6c6cdcdc6c6c6c6cdcdc6c6c6c6c6c6c6ccc6665505050505050505050505050505050505050505050505050505050
006565656565000505c66666666666cdcdcdc666ddcdc6c6cdcdc6c6c6c6c6c6c6c6666665550505050505050505050505050505050505050505050505050505
5555555555555550666c6c6c6c6c6cccdcdcdc6c66dcdcdcdcdcdcccccccccc6666c6c5550505050505050505050505050505050505050505050505053505055
6565006505050505666666666666c6cdcdddddc6c6666666cdddcdc6c76666666666550005050565050005050500050005000500050005000500050005005565
55505050505555506d6d6c6c6c6ccc6cccdcdddcdc6c6c6c66666666666c6d6cdcdc555050555453505050505050505350505050505050505050505350505555
050505056500050566d6d66666c6c6cdcdcdddddddcdc6c6c6c666c6c6c6ddcdc6c5653005655555650505050005050500050005000500050005056555556505
555055555550505d6ddd6c6c6cccccccccccdcdddcdcdccccccc6cccccccdcdc6c55505055555555505350505050505050505050505350505555565555555555
050505000500066666d6c666cdcdcdddcdcdcdddddddcdddcdcdcdccc6cdcdc6c565650005005565050505000500050005000500050005656565656565656565
505050505050566c6c6c6c6cccdcdddcdcdcccdcdcdcdcdcccdccccccccccc6c5555555555505350505050505050505050505055555655555555555555555550
05050505050566c666c666c6cdcdddddddcdcdcdcdcdcdcdcccdccccccc665555550555555056565656500000505050505050555656565656555555565656555
50505050505c6ccc6ccc6c6c6cdddcdcdcdcdcdcccccccccccccccccc05550505055555550555555505350505050505050555655555555555555565555555555
005565000505cdcdcdc6c6c6c6ddcdddd6d6ddddc6c6c6ccc6ccc665656500000505050565650000050505550566050005666566656665666565656555656565
55565550505cdcdcdcdcdcdcdcdc6c6cdcdcdc6c6c6c6c6ccc6c5555555050505050505055555550555050505056505055655656556565666555655555565050
05050505000dcdcdddddddcdddcdcdc6cdc6c6c6c6c6c6c6c6650055350565055055050505650555556555050006656565666566656665666556050005656565
505050505050dcdddddddcdddcdcdcdcdcccccccccdcdcdc6c555555555053505050505055555555555555555556555555556556515065556060555555555053
050005050505cdddddddddddddddddddcdc6c6c6c6cdcdddc5556565650005000505050565555565550005656566656655666566600565656060650500056555
5050505050ccdcdddddcdddcdcdcdcdc6c6c6c6ccc6cdcdc55565555505350505050505555555550505555555555555555555555555555555550505555555050
0505050505cdcdddddddddcdcdcdc6c666c6c6c6c6c6c6c555650500056505050505056565550005656565656555656555006555555565550505050555050505
5050505050ccdcdddcdcdcccdc6c6c6c6c6ccccccccc6c5555555555505350505055555550505555555555555555555555555555505555555050555555505050

__sfx__
00010000120500e0400c0400903005030020300102007000040000200001000017000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
004001160954005540015400903005020010300954005540015400153001520015100000000000000000000000000000000000000000000000954000000000000000000000000000000000000000000000000000
0001000032310363103431039320323202f3202e32034310393100130001300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 01424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

