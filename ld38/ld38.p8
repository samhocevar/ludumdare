pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  the chamber scrolls
--  copyright (c) 2016 sam hocevar <sam@hocevar.net>
image_width, image_height =600,252
facts = {}
big_data = {}
rom = {
[0]=
0x9aed.9c78, 0x451d.684f, 0x6f7f.c71c, 0xfba6.f2fb, 0x1e96.de6c, 0xbc35.43d2,
0xc45e.342e, 0xbe96.a9bb, 0xa351.82b6, 0xd0b6.29bd, 0x4a45.50f4, 0x4324.14cd,
0x8b62.c853, 0x5a9a.1ea7, 0x5d07.7850, 0x40f8.7d41, 0xc721.4143, 0x56bd.0b44,
0x636f.68a9, 0x24b9.fed1, 0x7b06.8c4b, 0x666f.e7d8, 0x7979.9b77, 0x16ee.ecfb,
0xcbef.ea54, 0xccec.ec9b, 0xdf9b.f3ef, 0x7676.66fc, 0x7878.010f, 0xa6ed.5bc4,
0xfcee.4cdd, 0x1b6f.ace6, 0xa214.cdbd, 0x81cc.015b, 0x44ee.4ad3, 0x46ab.cda7,
0xd885.2b6f, 0x8bfd.39a8, 0x07e0.6182, 0x0c07.c00f, 0xefbb.b54b, 0x87f0.f2be,
0x31db.6cf3, 0x6fc1.b2df, 0xc6db.41db, 0xefc3.b896, 0x4be9.c3ce, 0xdfe7.c743,
0x745a.ec79, 0xe63f.8337, 0xe636.6c04, 0x4d8d.8045, 0xabc5.60bc, 0x63c3.aada,
0xa9e1.5266, 0x7657.27f7, 0xb5fa.fa1d, 0x2e54.2ee8, 0x0da2.06ee, 0x9598.1d20,
0xd17c.77cc, 0x7d56.4c92, 0x607c.c3c7, 0x9398.0cc7, 0xdaf0.6082, 0x9e37.87d8,
0x87c7.b858, 0x5551.0b70, 0x874a.eef7, 0x4d60.e6d7, 0xaa12.aa3a, 0xf531.368a,
0x2e87.a7fc, 0xecfe.9f6d, 0x865f.832d, 0xca1a.0ea5, 0xa09d.2925, 0x5659.d4b6,
0x54d4.aabc, 0xa7fe.06c7, 0xbf93.2333, 0xc466.fe1f, 0x7519.aa68, 0x4fe8.9719,
0xdf0e.4e8a, 0xd7ea.38b9, 0xbd23.74ee, 0xa6a7.4cbe, 0xf272.be9e, 0xcc2f.cbd1,
0x7dd3.ed9f, 0xbb3e.dd5f, 0xef89.e6e7, 0xdb31.1d77, 0x6063.e14e, 0xe836.03f7,
0x67f3.23e0, 0xe2fe.9f1e, 0x73e9.a33b, 0x9bae.7201, 0xa73b.6a17, 0xf8ea.fcea,
0x7602.470f, 0x5346.34da, 0x2d23.cdd9, 0x476f.f9d2, 0xd5f1.de3f, 0x5b9f.978b,
0x65b4.096f, 0x1bf9.26d7, 0xf8c9.fabe, 0x7bde.a78f, 0x16f5.e7f2, 0x715a.f5e9,
0xd14a.a3a1, 0x3cdd.2f2f, 0xabeb.fc3a, 0x99a6.8ce7, 0x09be.cb14, 0x8ec2.f378,
0x2f0f.77f9, 0xd7a1.9d98, 0xdf97.da6b, 0x97ed.e572, 0x5726.4657, 0x53d0.b6cd,
0x9bb4.300f, 0xf570.3020, 0x48bc.4704, 0xcf6f.c399, 0xbc1d.9f5c, 0x86f7.717e,
0x6699.10e1, 0x911c.da5f, 0xe6a6.c840, 0x6352.1255, 0x4350.9148, 0x1e18.4282,
0x3c44.1f04, 0xe795.9e03, 0x6a8c.bd4d, 0x968d.98d2, 0x67df.c51d, 0xd02b.750f,
0x7c26.4b7c, 0xca35.6088, 0x7a07.265f, 0x9e25.a1eb, 0xe105.5565, 0xe28a.d1a1,
0x97f3.4c87, 0x5af8.1b1d, 0x3047.420d, 0x63c4.7fcd, 0x0323.a55e, 0x508e.c32f,
0xe1e8.7b8f, 0x076b.a98a, 0x6ac3.1ff7, 0xdbfd.fada, 0x9bae.bbaa, 0x0388.ab14,
0x8452.92e4, 0x5270.38e7, 0xd90c.f10a, 0x45e2.14b8, 0x4b88.9ddd, 0x3042.7e11,
0x78c5.2937, 0x053a.bf51, 0xf8c5.2aae, 0x5130.2a37, 0xc229.5577, 0xe062.9d5f,
0xc989.db6e, 0x8ebf.c82b, 0xa0bb.d789, 0x5f10.b3b4, 0x435b.aa99, 0xfdf5.7147,
0x3ebe.217a, 0x9db0.e751, 0xf331.e515, 0x8500.be15, 0x20dc.4c79, 0x8ac8.381f,
0x7a3d.5fce, 0x0ac7.2bd6, 0x7a55.dfcf, 0x2aa7.fc80, 0xa002.6bf3, 0x4426.bdf7,
0xaf8e.739e, 0x95d3.eb1b, 0x3d96.5bab, 0x259e.1c00, 0x5c28.548e, 0x9efc.c8bb,
0xaf11.f652, 0x9a33.c486, 0xe766.7573, 0x009c.59e0, 0x4be9.df16, 0x1098.1e76,
0x6304.cf31, 0xe5f4.abc8, 0x801c.45e0, 0x64c4.3d9e, 0xc6b1.3e0e, 0x73cc.4598,
0xb9d7.8f91, 0x1fce.3cd3, 0x6bff.d7f3, 0x2c00.5fb1, 0x371c.7d5a, 0x1f27.391e,
0x395e.192f, 0xf1f2.00e8, 0x1d0a.0f7a, 0xe7a1.d707, 0xd0d4.0079, 0x1108.cf7a,
0xffb5.c8b9, 0xbe1b.1923, 0x7fc2.47d8, 0x4482.c3ef, 0x2448.9122, 0x2244.8912,
0x1224.4891, 0x9122.4489, 0x8912.2448, 0x4891.2244, 0x1fe9.1224, 0xfedf.6952,
0x71ff.8d03, 0x6dad.56d9, 0xaed9.b2de, 0x4aac.540c, 0x0ca0.cca9, 0xb160.9416,
0x409c.ca54, 0x59fb.3180, 0x8fa3.61bb, 0xd512.a972, 0xd031.ac1b, 0x3c6b.d4d8,
0xe96f.fe96, 0x2b43.4b7b, 0xaad6.1fd6, 0xa579.67f5, 0x2a5e.5cbc, 0x845a.cd63,
0x990b.5cc5, 0xb68f.b8c7, 0x41f2.0f92, 0xf907.c83e, 0x83e4.1f20, 0xf20f.907c,
0x07c8.3e41, 0xe41f.20f9, 0xf1f4.61e3, 0xa085.9517, 0x.0035,
}
obj = {
  { "painting", 1, false, { }, { }, { }, { { 26, 95, 53, 139 }, { 53, 101, 75, 139} },
    "you look at the painting.\na beautiful painting with\na lot of emotions in it.\nyou can almost smell the\npixels." },
  { "painting", 1, false, { }, { }, { }, { { 209, 112, 228, 129 } },
    "you look at the painting.\nan impressive painting. it\nmust be very expensive.\nit must also be very\npretentious." },
  { "painting", 1, false, { }, { }, { }, { { 422, 115, 455, 137 } },
    "you look at the painting.\nit's ugly. you cannot\nunderstand why people\nbuy these things." },
  { "painting", 1, false, { }, { }, { }, { { 258, 88, 306, 126 } },
    "you look at the painting.\nthere are a lot of such\npaintings in the room." },
  { "painting", 1, false, { }, { }, { }, { { 520, 104, 544, 128 } },
    "why do people buy\npaintings? clearly\nvideo games are a\nlot better. ever seen\na 60 fps painting?" },
  { "flowers",  1, true,  { }, { 3 }, { 3 }, { { 99, 146, 118, 166 } },
    "there was a crowbar hidden\nin the flower pot!\nseriously, what are the\nodds?" },
  { "flowers",  1, false, { 3 }, { }, { }, { { 99, 146, 118, 166 } },
    "these flowers do not\nlook healthy. hard to\ntell in this resolution," },
  { "painting", 1, true,  { }, { 1 }, { 1 }, { { 107, 128, 114, 133 } },
    "you look at the painting.\n\nthere was a safe hidden\nbehind it!\n\nclassic point-n-click\nmechanism, but damn\neffective!" },
  { "safe",     1, false, { 1 }, { 7 }, { }, { { 107, 128, 114, 133 } },
    "the safe is closed.\nyou need the combination." },
  { "open",     2, true, { 7 }, { 2 }, { 2 }, { { 107, 128, 114, 133 } },
    "congratulations! you\nopened the safe and the\ngrand secret will be\nrevealed to you.\n\nthere are no scrolls, the\nscrolls are a lie. the\ngame is called the\nchamber scrolls because\nthe chamber... scrolls." },
  { "painting", 1, true,  { 2 }, { }, { }, { { 107, 128, 114, 133 } },
    "another boring painting." },
  { "pillow",  1, true, { }, { 5 }, { 5 }, { { 51,159,70,176 } }, "you found the key behind\nthe pillow. you're pretty\nsmart it seems!" },
  { "pillow",  1, false, { 5 }, { }, { }, { { 51,159,70,176 } }, "this pillow seems comfy." },
  { "drawer",  1, false, { }, { }, { }, { { 245,146,314,158 } }, "a drawer. it is locked." },
  { "drawer",  1, false, { }, { }, { }, { { 245,158,314,172 } }, "a drawer. it is locked." },
  { "drawer",  1, false, { }, { 3 }, { }, { { 245,172,314,184 } }, "a drawer. it is locked." },
  { "drawer",  1, false, { }, { }, { }, { { 245,184,314,196 } }, "a drawer. it is locked." },
  { "crack open", 2, true,  { 3 }, { 4 }, { 4 }, { { 245,172,314,184 } },
    "you crack the drawer open\nand find a plastic chicken\nwith a pulley. what a\nweird object." },
  { "drawer",  1, false, { 4 }, { }, { }, { { 245,172,314,184 } },
    "a drawer. it was cracked\nopen by a vandal." },
  { "lamp", 1, false, { }, { 6 }, { }, { { 441, 100, 452, 106 }, { 130, 90, 144, 98 } },
    "why are the lights on during\ndaylight? clearly i should\nhave downloaded another\nstock photo on google\nimages." },
  { "use plates", 2, true,  { 6 }, { 7 }, { 7 }, { { 441, 100, 452, 106 }, { 130, 90, 144, 98 } },
    "the photographic plates\nwere hiding the secret\nsafe combination! kudos to\nscience once again!" },
  { "lamp", 1, false, { 7 }, { }, { }, { { 441, 100, 452, 106 }, { 130, 90, 144, 98 } },
    "why are the lights on during\ndaylight? clearly i should\nhave downloaded another\nstock photo on google\nimages." },
  { "look", 1, false, { }, { }, { }, { { 130,118,162,152 }, { 389,114, 402,154 } }, "the weather is beautiful.\nvideo games are too." },
  { "chest", 1, false, { }, { 5 }, { }, { { 503,177, 514,189 } }, "this chest's lock requires\na key of some sort." },
  { "open",  2, true,  { 5 }, { 6 }, { 6 }, { { 503,177, 514,189 } }, "you find old photographic\nplates in the chest.\nwhat could they be good for?" },
  { "chest", 1, false, { 6 }, { }, { }, { { 503,177, 514,189 } }, "the chest is open but there\nis no longer anything\ninteresting in there." },
  { "go outside", 2, false, { }, { }, { }, { { 493,123, 501,156 } }, "why go outside? this isn't\nan escape game." },
}
function u32_to_memory(address,size,data)
  for i=0,size/4-1,64 do
    for j=0,63 do
      dset(j,data[i+j])
    end
    memcpy(address+i*4,0x5e00,0x100)
  end
end
local reverse = {}
local function bs_init(addr)
  local bs = {
    pos = addr,
    b = 0,
    n = 0,
    out = {},
    outpos = 0,
  }
  function bs:flushb(n)
    self.n -= n
    self.b = shr(self.b,n)
  end
  function bs:getb(n)
    while self.n < n do
      self.b += shr(peek(self.pos),16-self.n)
      self.pos += 1
      self.n += 8
    end
    local ret = shl(band(self.b,shl(0x.0001,n)-0x.0001),16)
    self.n -= n
    self.b = shr(self.b,n)
    return ret
  end
  function bs:getv(hufftable,n)
    while self.n < n do
      self.b += shr(peek(self.pos),16-self.n)
      self.pos += 1
      self.n += 8
    end
    local h = reverse[shl(band(self.b,0x.00ff),16)]
    local l = reverse[shl(band(self.b,0x.ff),8)]
    local v = band(shr(shl(h,8)+l,16-n),2^n-1)
    local e = hufftable[v]
    local len = band(e,15)
    local ret = flr(shr(e,4))
    self.n -= len
    self.b = shr(self.b,len)
    return ret
  end
  function bs:write(n)
    local d = band(self.outpos, 0.75)
    local off = flr(self.outpos)
    if d==0 then
      n=shr(n,16)
    else
      if d==0.25 then
        n=shr(n,8)
      elseif d==0.75 then
        n=shl(n,8)
      end
      n+=self.out[off]
    end
    self.out[off] = n
    self.outpos += 0.25
  end
  function bs:readback(off)
    local d = band(self.outpos + off * 0.25, 0.75)
    local n = self.out[flr(self.outpos + off * 0.25)]
    if d==0 then
      n=shl(n,16)
    elseif d==0.25 then
      n=shl(n,8)
    elseif d==0.75 then
      n=shr(n,8)
    end
    return band(n,0xff)
  end
  return bs
end
local bl_count = {}
local next_code = {}
local function hufftable_create(table,depths,nvalues)
  local nbits = 1
  for i=0,16 do
    bl_count[i] = 0
  end
  for i=1,nvalues do
    local d = depths[i]
    if d > nbits then
      nbits = d
    end
    bl_count[d] += 1
  end
  local code = 0
  bl_count[0] = 0
  for i=1,nbits do
    code = (code + bl_count[i-1]) * 2
    next_code[i] = code
  end
  for i=1,nvalues do
    local len = depths[i] or 0
    if len > 0 then
      local e = (i-1)*16 + len
      local code = next_code[len]
      next_code[len] = next_code[len] + 1
      local code0 = code * 2^(nbits-len)
      local code1 = (code+1) * 2^(nbits-len)
      for j=code0,code1-1 do
        table[j] = e
      end
    end
  end
  return nbits
end
local littable = {}
local disttable = {}
local function inflate_block_loop(bs,nlit,ndist)
  local lit
  repeat
    lit = bs:getv(littable,nlit)
    if lit < 256 then
      bs:write(lit)
    elseif lit > 256 then
      local nbits = 0
      local size = 3
      local dist = 1
      if lit < 265 then
        size += lit - 257
      elseif lit < 285 then
        nbits = flr(shr(lit-261,2))
        size += shl(band(lit-261,3)+4,nbits)
      else
        size = 258
      end
      if nbits > 0 then
        size += bs:getb(nbits)
      end
      local v = bs:getv(disttable,ndist)
      if v < 4 then
        dist += v
      else
        nbits = flr(shr(v-2,1))
        dist += shl(band(v,1)+2,nbits)
        dist += bs:getb(nbits)
      end
      for n = 1,size do
        bs:write(bs:readback(-dist))
      end
    end
  until lit == 256
end
local order = { 17, 18, 19, 1, 9, 8, 10, 7, 11, 6, 12, 5, 13, 4, 14, 3, 15, 2, 16 }
local depths = {}
local lengthtable = {}
local litdepths = {}
local distdepths = {}
local function inflate_block_dynamic(bs)
  local hlit = 257 + bs:getb(5)
  local hdist = 1 + bs:getb(5)
  local hclen = 4 + bs:getb(4)
  for i=1,hclen do
    local v = bs:getb(3)
    depths[order[i]] = v
  end
  for i=hclen+1,19 do
    depths[order[i]] = 0
  end
  local nlen = hufftable_create(lengthtable,depths,19)
  local i=1
  while i<=hlit+hdist do
    local v = bs:getv(lengthtable,nlen)
    if v < 16 then
      depths[i] = v
      i += 1
    elseif v < 19 then
      local nbt = {2,3,7}
      local nb = nbt[v-15]
      local c = 0
      local n = 3 + bs:getb(nb)
      if v == 16 then
        c = depths[i-1]
      elseif v == 18 then
        n += 8
      end
      for j=1,n do
        depths[i] = c
        i += 1
      end
    end
  end
  for i=1,hlit do litdepths[i] = depths[i] end
  local nlit = hufftable_create(littable,litdepths,hlit)
  for i=1,hdist do distdepths[i] = depths[i+hlit] end
  local ndist = hufftable_create(disttable,distdepths,hdist)
  inflate_block_loop(bs,nlit,ndist,littable,disttable)
end
local stcnt = { 144, 112, 24, 8 }
local stdpt = { 8, 9, 7, 8 }
local function inflate_block_static(bs)
  local k = 1
  for i=1,4 do
    local d = stdpt[i]
    for j=1,stcnt[i] do
      depths[k] = d
    end
  end
  local nlit = hufftable_create(littable,depths,288)
  for i=1,32 do
    depths[i] = 5
  end
  local ndist = hufftable_create(disttable,depths,32)
  inflate_block_loop(bs,nlit,ndist,littable,disttable)
end
local function inflate_block_uncompressed(bs)
  bs:flushb(band(bs.n,7))
  local len = bs:getb(16)
  local nlen = bs:getb(16)
  for i=0,len-1 do
    bs:write(peek(bs.pos+i))
  end
  bs.pos += len
end
local function inflate_main(bs)
  bs.pos += 2
  repeat
    local block
    last = bs:getb(1)
    type = bs:getb(2)
    if type == 0 then
      inflate_block_uncompressed(bs)
    elseif type == 1 then
      inflate_block_static(bs)
    elseif type == 2 then
      inflate_block_dynamic(bs)
    end
  until last == 1
  bs:flushb(band(bs.n,7))
  return bs.out
end
function inflate(inaddr)
  return inflate_main(bs_init(inaddr))
end
function blit_bigpic(lines, dst, dstwidth, src, srcwidth, xoff, yoff)
  local data = src[1 - xoff % 2]
  xoff = band(xoff,0xfffe)
  srcwidth /= 8
  dstwidth /= 2
  local dx = band(xoff,7)
  local xoff = flr(xoff/8)
  local srcoff = yoff * srcwidth + xoff
  local w1 = min(max(0, srcwidth - xoff - 1), dstwidth / 4)
  local w2 = dstwidth / 4
  tmp_mem = 0x5e00 + shr(dx,1)
  for line = 0,lines-1 do
    local off = srcoff + srcwidth * line
    for j = 0,w1    do dset(j,data[off + j]) end
    off -= srcwidth
    for j = w1+1,w2 do dset(j,data[off + j]) end
    memcpy(dst + dstwidth * line, tmp_mem, dstwidth)
  end
end
strlen = {}
function _init()
  cls()
  for i=0,255 do
    local k=0
    for j=0,7 do
      if band(i,shl(1,j)) != 0 then
        k += shl(1,7-j)
      end
    end
    reverse[i] = k
  end
  local s = "\151"
  for i=1,#s do strlen[sub(s,i,i)] = true end
    big_data = { [0] = inflate(0x0), {} }
    u32_to_memory(0x0, band(4*#rom+0xff,0x7f00), rom)
    rom = inflate(0x0)
    u32_to_memory(0x0, band(4*#rom+0xff,0x7f00), rom)
  music(0,0,1)
  for n=0,#big_data[0]-1 do
    local off = n - 1
    if n % (image_width / 8) == 0 then off += image_width / 8 end
    big_data[1][n] = shl(big_data[0][n],4) + band(shr(big_data[0][off],28),0x.000f)
  end
  for i=0x2000,0x2010,2 do
    poke(i,16) poke(i+1,17) poke(i+0x80,32) poke(i+0x81,33)
  end
  memcpy(0x2100,0x2000,0x100)
  memcpy(0x2200,0x2000,0x200)
  memcpy(0x2400,0x2000,0x400)
end
world_x, world_y = 0, 0
mouse_x, mouse_y = 0, 0
mouse_speed = 0
mouse_type = 0
mouse_shake = 0
fog_t, fog, fog_dir, fog_color = 0.5, 0, 1, 0
state = 0
function _update60()
  rnd()
  fog_t += shr(1,7)
  local new_fog = 8.0 * (1 - cos(min(fog_t%3.0,1.0))) - 0.5
  fog, fog_dir = new_fog, new_fog > fog and 1 or -1
  mouse_info = nil
  mouse_type = 0
  mouse_shake = max(mouse_shake - 0.25, 0)
  local clicked = false
  if not down then
    clicked = btnp(4) or btnp(5)
  end
  down = btn(4) or btn(5)
  if state==0 then
    world_x = (world_x + 0.125) % image_width
    if fog >= 15 then world_x, world_y = rnd(image_width), rnd(image_height) end
    if clicked then
      sfx(2)
      world_x, world_y = 170, 190
      facts = {}
      state = 1
    end
  elseif state==1 then
    if not btn(0) and not btn(1) and not btn(2) and not btn(3) then
      mouse_speed = 0
    end
    if btnp(0) or btnp(1) or btnp(2) or btnp(3) then
      mouse_speed = max(min(mouse_speed + 0.25, 3), 1)
    end
    if btn(0) then world_x -= mouse_speed end
    if btn(1) then world_x += mouse_speed end
    world_x %= image_width
    if world_y - mouse_speed >= 0 and btn(2) then world_y -= mouse_speed end
    if world_y + mouse_speed < image_height and btn(3) then world_y += mouse_speed end
    for k,v in pairs(obj) do
      local context, mouse, important, facts_wanted, facts_notwanted, facts_activated, coords, message = v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8]
      local wanted = true
      for k,v in pairs(facts_wanted) do
        if not facts[v] then wanted = false end
      end
      for k,v in pairs(facts_notwanted) do
        if facts[v] then wanted = false end
      end
      if wanted then
        local inside = false
        for q in all(coords) do
          if (world_x >= q[1] and world_x <= q[3] and world_y >= q[2] and world_y <= q[4]) inside = true
        end
        if inside then
          mouse_type = mouse
          mouse_info = context
          if clicked then
            sfx(2)
            for k,v in pairs(facts_activated) do
              facts[v] = true
            end
            message_info = message
            if important then
              fog_t, fog, fog_dir, fog_color = 0, 0, 1, 3
              state = 2
            else
              state = 5
            end
            break
          end
        end
      end
    end
    if clicked and state==1 then
      mouse_shake = 5
      sfx(0)
    end
  elseif state==2 then
    if fog_t > 0.5 then state = 3 end
  elseif state==3 then
    if clicked then
      sfx(2)
      fog_t, fog, fog_dir, fog_color = 0.5, 16, 1, 3
      state = 4
    end
  elseif state==4 then
    if fog_t > 1 then state = 1 end
  elseif state==5 then
    if clicked then
      sfx(2)
      state = 1
    end
  end
end
function draw_mouse()
  palt(0,false)
  palt(2,true)
  local x = 64 + rnd(mouse_shake)
  local y = mouse_y + rnd(mouse_shake)
  spr(0x40+mouse_type,x, y)
  spr(0x50+mouse_type,x, y+8)
  palt()
  if mouse_info then
    box("\151 "..mouse_info, -1, mouse_y - 20)
  end
end
function title()
  local blit = function(i, j)
    print("    a pico-8 game", 50+i, 85+j, 7)
    print("  by  sam hocevar", 50+i, 93+j, 7)
    print("for ludum dare 37", 50+i,101+j, 7)
    print("press \151 to start", 53+i, 120+j, 7)
    sspr(24, 0, 80, 32, 5+i, j, 118, 80)
  end
  for i=1,15 do pal(i,0) end
  for i=-1,1 do for j=-1,1 do
    blit(i, j)
  end end
  pal()
  blit(0, 0)
end
function box(text, x, y)
  local l=#text
  local w,lw,h = 0,0,1
  for i=1,l do
    local c = sub(text,i,i)
    if(c=="\n") then
      w=max(lw,w) lw=0 h+=1
    elseif(strlen[c]) then
      lw += 2
    else
      lw += 1
    end
  end
  w=max(lw,w)
  if (x<0) x=60-2*w
  if (y<0) y=55-3*h
  rectfill(x,y,x+4*w+6,y+h*6+6,0)
  rect(x+1,y+1,x+4*w+5,y+h*6+5,7)
  print(text, x+4, y+4)
end
function draw_world()
  local lines = 128
  local dst = 0x6000
  local dstwidth = 0x80
  local srcwidth = image_width
  mouse_x, mouse_y = (flr(world_x + rnd(mouse_shake)) + image_width - 64) % image_width, flr((world_y + rnd(mouse_shake)) * 126 / image_height)
  blit_bigpic(lines, dst, dstwidth, big_data, srcwidth, mouse_x, mouse_y)
end
function draw_fog()
  for i=0,15 do pal(i,fog_color) end
  for n=0,15 do
    for i=0,15 do palt(i,(i+n)/2>fog) end
    map(n%2, 0, (7.5 - (7.5-n) * fog_dir) * 8, 0, 1, 16)
  end
  pal()
end
function _draw()
  if state!=3 then
    draw_world()
  else
    cls(fog_color)
  end
  if state==0 then
    draw_fog()
    title()
  elseif state==1 then
    draw_mouse()
  elseif state==2 or state==4 then
    draw_fog()
  elseif state==3 then
    box(message_info, -1, 20)
    box("\151 continue", 72, 111)
  elseif state==5 then
    box(message_info, -1, -1)
    box("\151 continue", 72, 111)
  end
end
__gfx__
87c9dcd9fcf6b194697e94da8d73304d4b9d7330c634e9bd003378eeb910e814900a00a849b59ed3526a6616358e543bbe43aab4716ef58930130ce146f5889b
59befa8dae3510ea5333b063a2bd711a109182cce18de68b10d873edfa887119199c4ad5eaed4759441f74664e72fbfe5cb7f22229f5d75f5dce738bd7d6e1c9
f76f36f6f55e37a3cff6ebb2273d69f1db10d47bfdfcc012165f7da67ef68965e971fff33b2389eba913cafb65b2dc1fd05a8e69fc87bfb253dcbd08599dece7
c725760800874f87b4ce66155a8b1f33f75706ccae7ff32f5abcb0b80c79f4152f89404d24b9f6867adb401c6f30c902873ffdffef7c4453b24925ec4e9d336d
779959bf0214ba006a09aeba0a6b45f5897f96939eae7c2054c92e71994fd6cbcf68d70942335cb669332ca321e9cd2d7f2d9185fdfef74a8412f4becfe0678c
f5d6665f995830cb665c6deec4b98e65cbe34c3554d53cc7e1fd16e5c62f63fb180eaebad4ef8ce648ba99b0b8c39ea5ef15d8ac03ac597b51f300f0235b9686
97ad0ec98485d4d1284306efed631c7e19d7c2c5e9f688b48439427c0d8841cebb92b2cd3a890e70e996ef174c53367bad47fc9b47c5d0fae3605af5f6e77293
eb377f8f3ccdd21da9f70de3cbd093db78c537b2fadcfe50f85b1d9bf95847e780954ed0772d42f88c7b2d358f1c9f667ce8b1911efe63de03c670c35f1caa08
6264fcf88d06216c114bb0e032a76a33d7fa6185d0014ba73614655f043e764eb90dc8ae00095eec4f6d0adaa7f2e26f5f737fc46121b68e8973f1efc637793b
926db955d5cfc5e9f955e67e41a343adbb5a4cffbeeed5d33e3fa29378de6b0fa4d6cdb1801aaf5fa225f9958557a02166537c7e869d2d942aaaa43c765a3bfc
e30c5144cf8c60fd2fb136f359f26d0aa3f3bcb2257a07ba5374ec5535fd0d260d2d2fbbe38c96e38436e0aaefc8b6855e5d1a41a50c63d6d95cce17663318d4
c822a7b6c171545ed59d8fd0dd654af1ca761762ee26b4761e99bf95e544cb19f052397da2875d6fd551a66bd1f5cf5ba3904560c033322dd0d68da169ad8ba7
1e38a425b9e70b36f45f613965c3ae8d4dc2361859f69a137aaadaa26545de8a6c9b967e0de1747411b0165a5ad630da6471f8c9555b31d46b3d045cbfb4149e
bf80b8baa6e9f3a2b292b894b268b6b7a596dbbab3bde065edcedd9fbf80b27defa3d82c8684b2da134cf0a39bda0654b74d8ebf6b516988ac9da5915404b29d
c2daad65c950f770727132d1d3ffaa42ba16830973d73adf04aa2c4acc9317712a73585e1fa294b2e5f6c3f87ffd12ccfc6b220955db45eb64bdab147eaaa860
ed9a13c2fa915bed8a99dc437bcafcb9f197b11610a2b2aa0944c3c486eaca2ba30c86a4d87412444945a7b533f8dbdc9ff639db61a2e0f66a1aa67fe52a5e1c
214476a73a7aa9a06a9158daceaebd6eca27f3e47f7ba76511d55986dc572257ecb59a4f13b6cd5c531c0fde67efab139dcd5f4f543385a31c1fe9b83d2b3c11
766119e3e3f39dcfcec7fadcf17fda77bca9053dea0d5f08b906504bc11980b2f0610a159a2b6beb37562851516d27b8d64f87ee677a6fe7ebdaca8fdf6b0fb5
53e0daae1c963385acba598e52510bec38dc3510c92e99885a90f21391f7e328c893ec6b7651b98f1191cbf4383df88b42f33d1bce8e162ae30591c9ada8a97c
a4bb675650b94e505e44c15eb22367e1ef5b1cfba17ac06707436e91cf71a0fc5abf7e9e1d25a3b4c765aefca48537b05ecdb13e0b3e145427eec4234fe3aec0
804765d5e02bd8868dba23d8a9af68c00c4e52a0d486146b8a52653ca4bbc2b79a2e53fa9d9974b261691192fa0c6ec205a17e4a6b1179b1bc1c044a2edec5c6
ea179e59e3bc337c4c7655d4bae8313d2abc765e71a7539c48451ca5eae8d3870f47d71d15762eb9a72c99aedf632da23ca4c7d552e1ca29f1997c74dc2847b5
079d80cc19288b028ae63a68cf4e5dfa8da9da23870f3ca8d8db14e1121bd0c27d71691659dc0b9e637f24b0f8456eb01d6eea587dac4cf8cf2a4ba410817630
147e318ea296eca4282d09558754b285de977e9ea6ea56db9b09e554e49bf4aa82477546575992fc92d692952642f9a70595690b2b28db59ead43756552ba030
dadb0045114c12e3706a5e56242dfe593ae5f9659fac6964763a3774b63dc11955486d610bcbe00d5b3dfe5136eb522a688b4b243f3b7592cd2ad6d294ba2a20
35f5899709af60859798ae065ae90926cf28e7b63f5c0fdf69315d9023c8c000450ea4d5ff898baa365ae7631ba68d70653ca4c1e94c3654f04beaa9f10a40ba
88ade6ce3b9ae3915f772238695d51d9a3785972d83e580e0f959d6032ca63898432c53f298a6bad95ae7f09898155a75aa36543cf7bd1aaca4d36aa8305036a
51ca636f4baf012adaa045d47f9a5a5b12635a28f9a7d3895ebfe1ca2a9a162101bad123b64cc487937f5e5333173a52b9673e9956d4f57ec9b70126167c2fe3
2bac492edf85431d18cf78f65e8b33e02a994ba90ca0959d8783f46b2fceab1a6f8c27d55ccfc1ba8beae30865d06868ca2da4324976e10e8d807e75a16d384a
9ac89f8751da058a2465f300eaa1f45dc9693ee2392a3e5cd23e0ba49c8adeb5290e0c5b7cb2f3748a9e11b3ba29ffaf1e069a7e47b9b9a3da223bec22a5026c
c1a4721aeae2d43e11d8959fe0d9b3fb08550185df08668562856a5d406519ac272cc3632cb76949b66b7656955393892f95e3ba420bc3f2b4cf06c50cbacf4e
694b28d5975be178dc837f37d5d9d82ba627c2fff4165a3b4a44801ef59e63d1261bd3d2fb9db1e40cde8c588b5a13293379386eab4c1942b52c25f831e2119b
f45212baccf8cbaa9141d4abcc24f9f653faadd8fd692b516ee3c2910a0f2a93e16c947bb028de973bb0f420f758f95e6c49bee0131509454edd963a92c4d845
a5b0b0f0cacfbb2055a11a12a643018b9c56a5e49179b4c3b1b44dcf327629e500f98bd758782b50a7bca2da218515a62d6b0ba82f7e459c7c5a6e1977e94cab
1ed0743d131466b2e6466ced3f19a1344eaea8de51e1baa5d6515ad94d0d2df6f228f81772daa68199fd93055c63826d6dc1cc3d59222555a3f8aeaa2b816e4f
412ba22adc922b46b265e1bd228fc1e17caf7f91fbca069b5d2bae40dfa757c961f9fb5625e5321ad60349e55c910739d1ba2cd3e27b9a885dbaa90ca48e0810
c27a965e4a21b3ebfeed646f192fdc802bdc0b4517463f6b9959fa1a421521b2a295561d27c63585e1e2dfa8471429c89b508d959eaf4388a52ee1aaedc05ffe
a5659ab9ea16bd958d794f937a131753185c7a9ae3fa959e1ed4fe865495e85e6659065659e1aa2989ac0a3e7206ddab645951143aa8435baf3b7edd80651ef9
2488e252f5e8d85fd3660745778c4d13fa665bd172cd2b449d2653caca0d282bde2d2da249fd8f001650f72eeb5a2edc75630d659e2f438e4afdb839712c7d0b
2f4331afa096a6a632dd2d5be7f065c078e9cc84656db4a3f561e76a8d8628b9d9a7d80fae57596806c3539fa7a2a4a5b2a90ca2aa490582baac26882ed3ed64
7ee1846c7b08a3c596d192523929eaa4a63f9196c89e625659590636a596087431d504c9551b14651100e179699d6a7215555a945f9a41ea14e9fba22426effd
568bb116977a754919598660ab2df11bdcea834506454b57a52b97cba413b6de0159d327212727d0a2b2ac79c9e0b636b9f258850d65444a5870f2fe5b8a7765
1aff120348884c3cf6b6bc39e3c5e98555d7211355561e33959c599c986a696177455b7893de68d2158fd3656bffd0fdfb995986585f33e222dd7a0e2f16199d
69169b39843209a4627c054bbe2ffc6a2c1dbbea30a378e5fa772efb343b251ecbd0dfa13ba2927ad98ab28cdd786f608fe925c8f1d0b1c765e50ce10d1bff97
2daa0855e30522f2344823f2208559ca2da0f75d0055adf6d9426b9f6fcbcd922f722b48086ab1575959c603b23eaa2654bb056d763688a8371c35e92ee249d1
a4ce6e9913c56eae8436329a4c28aafd86762df26626fb1dbed56c0ac8f857b51ca2ce7d47c0359cac850e32817fb9bd9b9a9279d0221cdaf243fa1d55ca8f15
b7a729533254bfae814b19b731451ba05355a8b12430c0fc1ce98ae6a407e527b04b9fcd92be027f0f8bf36e1dee13eb95140e9177e42ccbda90d251aa26e585
59134c7f39a7afaa9e89a84d75141105a2ce1f022318abe90cac2938aa925ce7ca2d4161b6428332c56d337cf537af51e5d46d2a40e05e0a4df033b804c5e3a7
f4a511bb0ea4c57e4a36633e851bdc16857238638de52f0fa8554495b9b446145b39d159c9d0cd7a199e4ecb1ef937e7255f0618126a5de5bc31495a6e97215c
48f404fea2946a8b9a859173f871836fcde2b69ed940cace12c913755c12270575a16415577aae446ee637ca66ef39afc9388d4b6855aaf3688a4454824a256d
1e5bfbdb32dac0de9b78dbcc8d68759b3654e0ef0ba7edd0e10ae0656e1ba483c9a81ba82ca9bf6a39676ae7095193ca304e4f5927c5aab782e6f96941e3b0ae
da5f5a2f60f56540be43f68caac0bcbc98d745c626337cace6e3b2d0c8fc4cee5b8295f4593d2f575e3f15d4f463182657180c1f16ea955b9561510bc36552c5
e051aababafe46d3717b43374a468bf34969234c3d61a9e9eec0b4ca2cdcaec282559c740f1b9752b644a44c558e587744b6a7a789651bac4d1caccb23f15574
3a210328a6637184566537576d0ed4c938773ab7a859f725e598647d9ac6b6da3ba6e4a283d016554a2ca2dc22b5c16524fca3bfb493042fe02377ff4415e855
cd019c0521f60611e88e49517fce92df55519028ad6b72512bacd2ba6c6682f4766575997aa2b64737f0896c55634c0069ad25f6df75957516e73673f264051d
1bf0303ceb9b5fba598a895d8f4493e98203b9b7a7ca21d8ac98ac33b3fc4fcbd6e15655233c25495189d979e166eb908bf05b2b878bf588faccdab380079d96
55805d0ba4632c27a52bd67fb3049bcde2840f76f65e1aaba6175724651a2b2c08d3392935ce217c94dcd571c37f859bf2ee0f48541937adecc18a620b0b5eaf
3372a77e46479708a2aaba959155a52334f059ec295515c2e307a2bba880922ce47b22f00513ca3d2a07dfe8cf4eefab2959a3313aaa9ade8c360bae6b9fc3a1
a960aca4206599be98a88c01a87d4e0c35932590d7d99ce9dde150de8cbc0b0855f6aecbf8ed217a3391bec085924537904a04f2d40490ba95c1693fb06dbcb3
c5e42463282db9d71ad9486f78155ad19296b09a657ff9b4227d79bd1bae877af2c8c27a433f537ed62aaa0cd45348510eacb60698132da05ba07d024a8d7aa6
05cdbe5f43227b5fe19645292950ca6c549a56ab39bc4f8b459747a20f559737bfb916fe237f2a3593d2831dac1444a9da9ff49a35451a8556676cb508a43b29
147b317b5f2b02dfa23a26651b69561f1e67deca215de1685bd82b06d510fcced0575553c8f42ba772b88136eb10f398db379cd7b5b0cd3624e4657bc76559ab
a884e3a35288baec165612c0aaa9a7ba91fd31a8fdfad1614a4717859c53dc92777f392f859a6ad94a11656e481bcb78df5c92d64ab87411651aea654b3ae454
3da6635ea351ba854e95fca21c581949f6b265510bef4fe075d289beb1919549685445529fc7fa3c132976947be6d32fbf992ac9fe7123f946bc9b560d229b47
6d1263564a955a231659faaa2b2c81a84958541243bfba2db1b48a06fac1d722b2ffbdfca74ca6e63aeb959d1611ba9f62651f790a18969955361513b2b7e93f
80badb0f894c5e3f75ba3d4dbbd42983b2cdb54d759d66a1a4f02425a959e0af4535d9eaed34856b065978abad6d601bbca67f89690ca89bcaca47ddc6f38a3a
e14459600a27bcaa3f020951e811c327d3874fc80951d7fac4d5f2d1bdc93bacfd3d005bfb28e98826c1d268c23d7646ef33d3897d648812b756a8de85ca0216
2b3657070453618d309fb2797a69f4a0e3ab2baaf8239a8d2445d836aa29eae4915570746027feb37251c26c4e5da32d5153b302811304e1832868a2d5d3a1bd
c4a29e93658d43a2b29ab0b335efa6b31658903f6517597ca0733d2fe182be4290485898d7889c2b297a6ce59ae3cab28d146b995d5575c60b7e1b2b25a849db
13660591e780b0704176feed59869f8ae30855f82e147151e433f227052a9ca6951d8af59959e800662efa6f6ad9e9b399e559eace931b3c7805c492e5de3837
aff758d2d257cc161c8fd7959c1fc0cae2856c4bbad284c80571f021c8d3dbad595a6dee681c2ccd950ec4855a6fc2f4b7655df8cb8d0b46382ca237de27ca23
bcae339fa49b0a4c715659bf7beb9d8ca42d23ccdf985d944691058548955ac0a860cb8851952469561565c209e99e17bdd377e92589974e9727f4658eda095d
389a385d9e8e6b1663afe085117254b0c80228a0d30d3ad28516736ca92ac3d07cec37f56590f0788b928516944de847566b5656775ccaad96755cc04e7e3eab
2d1df89791475d935b0bab8f9781cdfea85fff9c09a63f590285c7b41d2bbb2ccdae43b6089485d45c3605affb77209da5b5b750125192a8e8d2f0e1a7e23ba9
bb87143baea8824c49addea7f75933ba9a0c24165b9b7d15a36af54c036eda877e363f2ee676b365d3ee00b7c658d5e60450c21e3ba0555546ec3db6fce61593
f118ca0169de25c36559ab2ee6b5623403888d8a70f5ca41a767f78209e809203fec65aba91bcf7f8d7602bae6bd9eaa0a9cbf20a2238ece7b033435c0f9fc34
6564e1dd69b23fd98265556389b66595d3a2bdacc468408a913f28d52e967e060d2a475cfbb0cd60654e969cbab1c40ca02dd1f859ccb798c6365f8ba8554575
4b986a1c03df4763c8eac1ba4b8443caaddc3b0c3d103c743f4e797b165d5ae409a73c63ad067accaa9c891761732cec43465d216563006665a375e8ad0e003e
384a92c2a0859841419178c1aee092f8ed69557585dd484ec6f07e8d97ab2d0b651f6258ca4f396677d5fa3b67cac55dd1b1099711260ca83b32aab9fe0f0134
381f437126c1a111cef5b565c1fdc039d295197c29920988b4f0343415fc9ea6c13262109586388db58365cab23efa052ce0513ba970ebddef182ba70d3e45b0
da0a0fb36e8e6a4750ddfed6bca4a68bb7b51b2b6d7d5998bd8fc9fcaa0732bc4fe91201b51d659ab295791da2cb291cd0e53148e71b3e1baa6d5dcd2463d375
bde40d2f53c53ab2c213e0ee93b1c46b7d593f450d01094d415a63f21c2ea27f02935f7b125847169610cafabd2ee7bcbabd11bad3bdf0a154f94cdf59fd6d70
d3e504487516ad946c5ba9a085ddc1cececdb085df9efbf9c631330892093c28e8c1d190cfe39cd7850704c0fe028a8d7b4967cc635e59152b4b2da51adc9bbb
10b22b1ce0747d4eddb317d597d6d695656ea38e814921f0ad56bade724b8c335ce3eb4ca6bb8fa211650af2e57370ca29c53c296214632812b201ae3cf28d0e
463927759e66bd4bcf227fd1c34c947bde26b3c3dc80b2dfc4ad1bca6e4523b9abba243ad881622d9240d49e7f9e9ebe095d69638410616fa481230a159e29f9
39a32da1f09737628abae55265dbeaf3b77ee05a8e35e94ad4521ae5ba6d603729590ba73839f6ad10b2add0839c026cbe3f58d168abaed6fca8cf502ba1428d
e939c51ca4bc9238c0cb264eb8d78615ad6a830510ec52465c93f6fc611b038aba5d516728e85dce18b97284ca451efad10ba1b4ae60ca07f6c9637f6b4d55f8
db70f53930cb3cf01ba27fa207a6fcf37af8a5f0477b7e1ba04759594758511c5d4ef8fae51c8605a27e7ddca6575f0a52bcb2eff0d2c39f4eee73e85939eb9b
c7732465d9d1b638e5981c48197038de57529b3f10d4f6fa265fb031792e901dde711f128b3fd35d6d0955a18f67ce20b3e6151392abdb1855aa851e5daa0650
d3191659be25834f8ce3bab92560a38dadf598fc0265ff86e7450b28af3c7eeee7b84f53e3fbaa465c3595d7fde4ee7d0027653906c475bdf028eaee83657e9f
73a85d3b81b2bdc70d51b59ecd3658db4c67cac61cdd6003bb59ababba851fdd507efcf97c2923a997ce1b2a39ee5bdaa9c478265e55bab2265980b283676f33
7efa41b2c3270d21411f459372165059cd6c389a8efa8e2da165851009b6c138508a41b22d59165ee2170ca0b5435f95dd86b2d55fc5c2a5b1f5dc1df599e9c0
c3d8fca6e1365634e9c195de0d5d81e53ded2d4866350ea86dde85171b142cd18ddec2a0be71722ab27f57810f5b1b156525726aa338fcaab22c2b5fba4221f5
97abae9989e67215abaf5a00231e35f424bce1504748987d9300b2c89978e859d1c8d3d6a8a8ae7525891a9eb94dd164051c43332f756fb09a105d9dcfeafca2
da5650375dc7f55caaeed32fca1c7656cbf0082fc60f18d02938b73747a5a659426c530113b9e05c365c87f47b2b1417758ca82d4016597985d37f851efcfab8
8bf6f69b6a3599187c7cdf24abd4f065e7bc20659f38e3fefeefa485dfaef1bcca6ca8590fa3cb33048535bca07a604f7081d4f63ca4aeb025921a0943fa0b1c
2c2ba99cd7f4dc9ce3f317fe9095575c9f9d9a245cccb1570bbce5633bae36fc38f5a540f49265efc1105ca079b5c003913d6387f93de8d9d6a62386e7ce9a82
d62ca82782b2a259a665a57555ca88cf4db28b74629ac3a84bcaccaafe851a7c4665371d55f235246e90f34b4e9a37f0d365b49ea0b72cec69efa874b9f48df4
1a50a1fc052fde492beda085d7e8cae93f4ac825661d6aad08665a6c23fd03788ec182fc051ef02654653764ebd5855b7aef4a8c69838424b924564671683fc1
b2ce52842ad89518d02bf0ed3a1e06a2869fca0f0af86e63668095997af3f0cc592660e0cb89599376c2e7e18212df3d7a54e59ca47c2a6a723f855e974855fc
36509296bc2b284e9567e83d446bbd06c70585d90d81105d49ee37b75984e4895d7712b20bd40db55d2e115b87896d1f7aebf3d1f1ab6f8df13b9594758c3c36
52236bebd9b4792d990475cdd28a849bb8107cb7e4bf07ca4a7dedb48aa5277e67f1ca8d571537dca2f0df5df6ebbbb11d51ea775e39657ed7898ec1ce358f17
a7332d2b979d605c7b37f3809222f1ba3351be3aa98361cc27a9a4f352658edd783dbe7f76533b3f0842976ab0438466a7a07b7638978efacc3d54fa4a5247ea
a6ea39cf17ae99020ca166ab9467931586386df556ccae797bacca8bbe5e4410a42803b62f7e7bd8f16465baf02656d607fc5e388aba9b265c76fe1b2add0425
8fdddda265ae85cf7087a81ad64c7a80be16cad7ab231000ff618517cde263821376bba85dd0a01ef634e64bb688e703bae62ea839cdbfa8958e5fd7933abcf7
7a85d933baf5596994aa96993793f5872e098cc7a2bdcc73b0bdd4ec308d922ba35dcae756959abb1a16ae7377ca236656cf599d3c70bea6ae6a5f9de15a4caa
0bdd2efe20f759b0baa4959e95a0605dbbbe736b910ac2f7a410fc00908515c75a3f1c911ba2c2b24702d6dcaa8f90648d3bd1e0b3dc6f9eb70a27efa8b46eef
c2ae3883b2aaf1b0baf33f776133bac34856b743d785858407d1ccd03bddf1fab9d23b2c8fa609a3657ec6388dca6ba2a12514141bac03668b701b7e61503e80
0b4066254aa6318551cae9b2d5df9daeaa09987ea63f6cc856b3b951f5cfb2f7cef5de712931aae477e1a90afca0389c307ca4c7bbe53fb37b71a8061dce170b
143cac5cdefe90bce1642402ac9d6643f9559fb28d26caec085d3f254755137d71de7cbfaaac53ad52038162a754bb665371fde4efa8ec8f7947b151e67bc437
3f6d62fd21f757702f4ed9f036557b1ecdf5f1695b1c3b21ba640bcc35b46d5db1bca650efac447d3e5d03cb9d6826509e5a5b1440efb4575997d5a40b6dd995
1d054ce72f11959a864da6ab0ee70d1ba33dcae1c64d55e3e7781599dfa40288e476032673913600f371d67985993555caec071a8a36533df9b085de8876f554
bd4f382aacd3657ee5cc0cca87a70d62656e4bef24b4ae8ab2cbec19f248d8685d0d2ba99ab1bb070ef6afcf351f75cca02167f7509752b2e18fd7fae60b11b2
132c23ba336857e26388169d7273a6951d4fa1865fa78431d6a0d348d881c96428bb33cfca5b3f9c96b4bea4a3f5d5de981b2c8fd9529f1f8558aba28fb5a74b
d0ec895d43065190916f872b48cc7b4c1876a9810c3aa33d9ad4e62cb19502b2d133cc8b3415973aca7f6bb1e4111c2dc81650eedf361a270b484dc4bd0a665f
d190be997caa493dfd867b12de44c4b347adc939c49aec807bc04bbc67a057ba03f85dac9eaceae1b0079d091ab49b3fe39fbaf8febd5cafe140cae335ca0575
b7a955ca714a1d5b389629a73ceca6090f9975cb1befac2ba35f4759583d1cb4cae40d60f63a59f7c5d594c2a211b611565fde77079e4628a4d0ba706d931f25
8b2cdcf85e253e72e75ab2065bb6377e3f0955e584f6012b282dc06075f15955ee85514503b4bcca0bf1cfeee272395bebd58555f670f9853aa80ba76d15ca8c
60d542a708fd4f510b2c26f3aeae06712ebaf8813307ec0f777783bf92beaec5cf598d0ad923357aba55482d04859db5b0ecac638d256387e0b6a3e441ba40da
cf443e266545291055e7c4659b331cc5475f99d27e3f7f22aee701c97750ca3b70e2c380841611f0e5af403205eda4ab2c9b16d9595f750df8a808f62e808893
cfcc765fd8265bf3c0bd4f303b2c519c6ecd1c1b3c418f0361588f91485916b4d4796dd4b6d601782fa48a6f82163abffe499518d311ba180ba37eb730a0b285
e7cf0c2b2efc8265bbf159593951dc6e3e9c6c881b826c2366b8ca0b4e835a9a4996d9d06c051ec05d1a3d5980a53ba4957570d1ea5f13b2e950178030890147
265fb5ca89b027017bf744659e3a99db999d49a0b592fa573c6cdd9b3774d2fd0e297f49b04957ab23f6c148638d1a59e62ca44853f80b2c73ec8afd97e99c18
0dafef117eb258cae999007585d7c0fde6fbabe6ee5fae72a753087ba00ebebbd651e2d4b6d60962601b2c0b32f12cc52beb3f75e85dc53ba692d515bde93dd7
f1875aec41b87add2c1ba704ca6003c56f1585179bf677ff19c05e4223d4a4c1797fefc1aac0e1b2982b2eca675051ce2985d09aa5e10ba9fcde8e40f8ab1e2f
948336a826e9fd2391f1fdd24e0ce8c337b71dbe3e4aa53cf670841c4168f1a141d42c935b73f83a1ab076381e76c82debe23bac33f7cca885d1d2499e143f70
30ba5b35f959b321d503c11f747e3fc965050f2685a7fb46d48596eea4a004d7dc0a503eecbb7fbfdfb7f34282cb31704502dfb5b68d968251ca22ab24787ed2
a48f4f72496cc1837358165d0c5cd038f76165c9256e616994de0610add78e70f7685f6037c53703e0f0a5c37cd1d2551ba612b24d51b72df18831f6d7c95f2c
__label__
d5dd5d5d5dd5d55dd5d55d55ddd5d666dddd555555d5d5d5d5d5555d5dddddddddddddd5d5d5d5d5dd5d5d5dd5d5d5dd55d5d5dd5d5d5555555dddd5ddd5dd5d
d5dd5d5d5d5d5d5dd5d55d5d5d55dd5d55d5d55d5d55d5dd55d5dd5d5d5ddddddddddddddddd5dd5dd5ddd5dd5d5d5d5d5d5d5d5d5d5d5d5d5dd5dd5d55d5d5d
d5d5dd5d5d5d5d5dd5d55d5d5d55d55d55d5dd5d5d55d5d5dd55dd5d5d5d5d5d5d5d5d5dd5dd5d5ddd5dd5d5ddd5d5d5d5d5d5d5d5d5d5d5dd5d5dd5dd5dd5dd
d5d5d5dd5d5dd5d5d5d55d555555555d5d55d5d5dd55d5dd5d55d5dd5d5d5d5d5d5ddd5d5d5d5dd5dd5dd5dddd5dd5d5d5d5d5d5d5d5d5dd55d5d5d5dd5dd5dd
d5d5d5d5dd5dd5dd55dd55d5d55d5d5d5d55d5d5d55d55dd5d55d5d5dd55dd5d5d5d5d5d5d5d5dd5dddd5d5d5d5dd5d5d5d5d5d5d5d5d5dd5d5dd5dd5dd5d5dd
5d5d55d5d5d5d5d5d5dd5d55d5555d5d55d5ddd5dd55d5dd5d5dd5d5d5dd5d5d5d5d5d5dd5d5d5d5dd5d5d5d5d5d5d5d5d5d5d5d5d5dd5dd5d5dd5dd5dd5dd5d
5d5d5dd5d5d5d5d5d5dd55d5d5d5d5dd5dd5d5d5dd5d5d5d5d5d5dd5d5d5d5dd5d5d5d5dddd5ddd5dd5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d55dd5dd5d55d5d
5d5d50000000000000000000dd5dd5dd5dd5d5dd5d5d5d5000000000000005d5dddd5d5dddd5ddd5dd5d5d5d5d5d50000d5d5d5d5d5d5d5dddd5dd5dd5dd5d5d
5d5d50777777777777007770dd5d55dd5dd5dd5d5d5d5d5077770070077705dd5d5d5d5dddd5ddd5dd5d5d5d5ddd50770d5d5d5d5d5d5d5d5d5dd5d5dddd5d5d
5d5d50777777777777007770ddddd5dd5dd5dd5dd5d5d0007777007007770d55dd5ddddd5d55d5d5dd5d5d5d5d5d50770d5d5d5d5d5d5d5ddd5dd5dd5d5d5d5d
5d5d50770007770007007770dd5dd5dd5dd5dd5dd5d5d0777777777007770d55dd5dd5dd5d5dd5d5dd5d5d5d5d5d50770d5d5d5d5d5d5d5d5d5d55dd5d5d5d5d
5d5d50770d07770d07007770dd5dd5dd5dd5dd5dd5d5d0777777777007770dd5d55dd5d55d55ddd5dd5d5d5d5d5d50770d5d5d5d5d5d5d5d5d5d55dd5d5d5d5d
5d5d50770d07770d07007770dd5dd5dd5dd5dd5dd5d500777777777007770dd5d55dd5dd5dd5ddd5dd5d5d5d5ddd50770d5d5d5d5d5d5d5d5d5dd5dd5d5d5d5d
5d5d50000d07770d00007770dd5d5d55dd5dd5d5d5d5077700000070077705d5555dd5dd5dd5d5dd5d5d5d5d5d5d50770d5d5d5d5d5d5d5d5dd5d5dd5d5d5d5d
5d5d5555550777055dd07770d5dd5dd5dddd5dd5d5d5077705d5d07007770d5d5d5dd5dd5dd5d5d5d5dd5d5d5d5d50770d5d5d5d5d5d5d5d5d5dd5dd5d5d5d5d
155d5d5d5d07770546d07770d5d5d5d5d5dd5d5d5dd5077705d5d00007770d5d5d6dd5ddddd5dd5dd5dd5dd5d5dd50770d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d
50155d5d5d07770546d07770d5d5d5d5d5d5dd5d5d55077705d5d5d5077705d5dd5d5ddd5dd5dd5dd5dd5d5dd5d5d0770d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d
ddd51155dd07770546d077700005d5d0000005dd5d5d077705d5d5d507770000dd500000000500000000000000d5d07700005d5d0000000d5d5000000d5d5d5d
d6ddd5115d07770546d077777705d5d0777705d5dd5d07770dd5d5d507777770d5d07777770d07777770077770d5d07777705d5d0777770d5d5077770d5d5d5d
d6dddd5555077705564077777700d000777700d5d5d5077705d5d5d50777777005d0777777000777777007777000d077777000500777770050007777000d5d5d
ddd6dddd5507770456d077770070d077700070d5d5d5077705d5d5d50777700705d0000007770777770777770770d077770770507770007050777770770d5d5d
ddd6dddd550777055d5077770070d07770d070d5d5d5077705d5d5d50777700705d5dd5d07770777770777770770d077770770d07770507050777770770d5d5d
66d6ddd6dd0777045640777700700077700070d5d5d5077705d5d0000777700700d000000777077777077777077000777707700077700070d0777770770d5d5d
66d6ddd6dd0777045640777000777077777770d5d5d5077705d5d0700777000770d077777777077700077700077700770000070077777770d0777000770d5d5d
66d6ddd6d60777045640777050777077777770d5d5d50777000000700777050770007777777707770d077705077700770500070077777770d07770d0770d5d55
d6d6ddd6d60777045d407770d07770777000005555550077777777700777050770077700077707770507770d077700770d07770077700000d07770d0000d5d55
6666ddddd60777045d4077705077707770555555555550777777777007770507700777050777077705077705077700770d0777007770d5d5d077705d5d5d5d55
66d6d6d6d6077705ddd07770d077707770000000d5d5d07777777770077705077007770007770777050777050777007700077700777000000077705d5d5d5d55
d666d6d6d60777045dd0777050777000777777705555500077770070077705077007777777770777050777050777007777777000077777777077705d55555555
66d666d6d60777045dd077701077705077777770555555d07777007007770507700777777777077705077705077700777777705d077777777077705d55555555
666666d6d60000045dd00000107000500000000055555550000000000000050700000000007700000500000d0770000000000055000000000000005555555555
666666d6d6d6d6d45d4ddddd50700555d5555555555555555555555d55d555070555555550770555d5d5d55d0770d5d55d55555555d55d555555555555555555
6666d6d6d6d6d6d45d4dddd000705051555555555555555555555555555500070555dd5d50770555555555500770555555555555555555555d55555555555555
666666d6d6d6d6d45d4dddd07700550555d55555555555555555555555550770055555555000055555555550700055555555555d555555555d55555d55555555
6666d6d6d6d6d6d454ddddd0770dddd5055555555555555555555555555507705555555555555555555555507055555555555555555555555555555555555555
666666d66d6d6dd5d5ddddd0000d5ddd555555555555555555555555555500005555555555555555555555500055555555555555555555555555555555555555
666666d66d6d6dd5d5dd6ddddddd5ddd55555555555555555555555555555555555555555555555555555d555555555555555555555555555555555555555555
666666d66d6d6dd5d5dddddddddd0000000000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555
6d6666666d6d6dd5d5d6dddddddd0777777777707705555555555555555555555555555555555555555d55555555555555555555555555555555555555555555
666666666d666d6514d6ddddd00007777777777077055555555555555555555555555555555555555000005500000555555555555555555555555555555555d5
6666d666666d6dd5d5dd6dddd07777770000777777055555555555555555555555555555555555555077705507770555555555555555555555555555555555d5
6666d66d66d6d6d454dd6d6dd07777770d507777770155555555555555555555555555555d55555dd07770ff077705555555555555555555555555555555d551
6d666d6d66d66d645455555dd07777770dd07777770555051555555555555555555d5dd5dd5dd5d5d077700f0777000d55d55555555555555555555555555555
6666d66d66d66d6454555555d07777000dd0000777055505155555555555555555dd5dd5dd5dd5d5d00777070007770d5d5d5d5d5d5d55555555555555555555
d666666d66d66d64545650500077770dddddd507770505055555555555555d55d5d5d5d55d5d5d5d5f0777077707770d5d5d555d5d5d5d5d55555555555555d5
666666666d66d664545555507777700ddddddd0077051015555555555505050500105055555555555507770d5d07770515051555555d5d5d5d55555d5555d5d5
6d6666d66d66d66454555050777770ddddddddd077051505010000015555555ddddddddddddddddddd07770ddd07770dddd5555555050505555555555555dddd
666666666d66d6d555555550777770ddddddddd077055555555555ddd5dddddddddddddddddddddddd0777000d077700dd5ddddddddddddd5511111155d5dddd
666666d66d66d6d555555550777770d5ddddddd0000555555555ddd5dddddddddddddddddddddddddd0777770d077770ddddddddddddddd5d5d5dd5d5dd5dd5d
d66d66d66d66d6d5555555507777700555ddddddd5d55555555555dddddddddddddddddddddddddddd0777770d077770ddddddddddddddddddd55555dddddddd
666666666d66d6d5504555500077770dd555ddddddd5d55555555555dddddddddddddddddddddddddd0007770d007770dddddddddddddddd5d505155555ddddd
6666dd6d6d66651511555555507777005d5d5ddddddddd5555555dddddddddddddddddddddddddd6dddd07770dd07770ddddddddddddddddddd05555dddddddd
d666666d66d6551001555555507777000055555ddd5d5d5d5dd5dd5ddddddddddddddddddddddddddddd07770dd07770dddddddddddddddd5d505155555ddddd
666d666666d551010455515450777777700555555dddddddd5d5ddddddddddddddddddddddddddd6dddd07770dd07770ddddddddddddddddddd05555dddddddd
6666666666551000055555555077777770000000055d4d5d00000000d00000000000ddddd0000000dddd07770dd07770dd0000000000ddddddd05555dddddddd
66666666651000000555555550000777777777705555555d07777770d077700777701110107777700515077700507770dd0777777770dddddddddd5ddddddddd
6666666d5500000005555555555d077777777770015055d507777770d077700777700051507777701515077700007770550777777770dd5ddddddddddddddd51
66d666651000000005555555555d07777777777000010000077777700077700777700000007777700000077700007770d007777777700dddddddddddddddd020
6666d6551001500005555555555d0000000777777705d077777077777000777777770107777707777705077705507770d077770007770ddddddddddddddd4000
66d66650000155000155555552dddd66660777777701d0777770777770d0777777770d0777770777770d07770d507770d077770d07770ddddddddddddddd4502
66d66d50000155000155555552dddd76660007777701d0777000000770d0777700070d0777000007770d07770d507770d077700d00070dddddddddddddddd500
66666650000155200155555552dddd76666607777701d07770dddd0770d077770d070d07770ddd07770d07770d507770d077706dd6070ddddddddddddddd4502
66666650000155500155555552dddd77777707777700007770dddd0770d077770d070007770ddd07770007770dd07770d07770000d070ddddddddddddddd5505
666d6650000155020442445555555d77777700077770077770dddd00006077700d000077770ddd07777007770dd07770d00777770d000dddddddd6dddddd5505
666666551200500205555550000ddd77777776077770077770ddddddddd0777025155077770555077770077705507770dd0777770000dd6ddd6ddddddddd5505
6d6dd6d00205555001555550770ddd77777776077770077770ddddddddd0777051555077770555077770077705507770dd0000777770ddddddddd6dddd5d5552
6d66d6502005555555555550770ddd77777776077770077770ddddddddd0777051555077770555077770077705507770dddd607777706d6dd6d6ddddddd64520
6d66d65020055550255555507700d666676700077770077770dddd0000d0777051515077770555077770077705507770d000607777700d6dd6d6d6d6dddd5450
6d66d65020255550255555507770d667676707777700007770dddd0770d07770515550077705d5077700077705507770d070600007770dddd6ddd6dddddd5502
d6d6d6d020255550255454507770000767700777770d50777000000770d0777055055507770000077705077705507770d07000d007770d655555555ddddd5504
6666665202005550255454507777770767707777770d50777770777770d0777055055507777707777705077705507770d07770d077770dd05555d00ddddd5504
d6d6d6d025055555555454507777770767707777770d50777770777770d0777051555507777707777701077705507770d07770d077770d501515101dddddd505
d6d6d6d020055550255555507777770000007777770d50777770777770007770055555077777077777000777000077700077700077770dd51000005dddddd505
6666665020255550255454507707777777777770000d10000777777000777777055555000077777000077777700777770007777777700d55555005d6ddddd122
d66d662020255552055555507707777777777770d6dd500d07777770d0777777055555555077777055077777700777770d07777777706d5d05500dddddddd222
d6666d5020255552045555500000000000000000d6d3500d00000000d0000000000000000000000055000000000000000d00000000006d5d055005ddddddd222
d666d650202555520555555552dddd777777766666d3500ddddd6dddd6d6d1000000000000000155555105020000000d6d6d6d6d6d6d6dd60551010455566204
d6d6d6d020204d520555555552dddd7777767666d6dd500dddddd6d6d6d6d10000000000000101010111100000000015dd6d6d6d6d6d6dd605510105dddd5504
d6d6d6d0200111550445455552dddd7777767666d63d100dddddddddd6d6ddddddddddddddddd6d6dd6ddddddddddddd6d6d6d6d6d6d6d6dd55105ddddddd222
666d6620202555520455555552ddddf666666666663dd05dddddd6d6d6d6d6d6d66d6666d66666666d666d66d66d6d666d6d6d6d6d6d6d6d155005ddddddd222
666d6d5005555d520555555552dddd7d7777777d663dddddddddddd6d6d6d6d6d66d6d66d66d6d666d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d155005ddddd66454
666d6d50020444420555555552dddd7d7777776666dddddd6dddddd6d6d6d6d6d66d6666d66d66d66d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d155005ddddd66204
66d6d6d0020024550445455552dddd7d7777776666ddd5dd6dddd6ddd6d6d6d6d6666666666666d66d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d155005ddddd66204
d6d6d610020064500555555552dddd7d777777666dd35ddd6dd6ddddd6d6d6d666666666666d66d66d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d155005dddd6d6d55
d6d6d610020064520555555552dddd77777676666dd3ddd6ddddddd6d6d6d666600000666000000000000000006d6000006d6d0000000000000000555d6d6555
d6d6d610020064520555555554dddd7d777777666dd35dd6dd6dd6d6d6d6dd6d60777066607770777007700770d66077706d6007707770777077705dddddd504
d6d6d610020064520455555552dddd77777676666dd3d5d6dd6dd6d6d6d6d6d660707066607070070070007070000070706d607000707077707000dddd6d6224
d6d6d610020064020555555552ddd667667676666dd3d5d6dd6dd6d6d6d6d6d6607770dd607770070070d07070777077706d607000777070707705d6dd6dd514
d6d6d6100200d5020555555552ddd667667677666dd35dd6d6d6d6d6d6d6d66d60707045d07000070070007070000070706d6070707070707070005ddd6d6224
d6d6d610020064500455555552dddd77777676667dd5d5d51156d6d6d6d6d66d60707045d07060777007707700d66077706d6077707070707077705ddd6d6204
d6d6d6100200d5500555555504dddd77777676666dd3d51055051dd6d6d66666600000155000d0000000000006d66000006d600000000000000000dddd6d6204
dd6d6dd11200d5500555504504dddd77777676667dd5d5dd5d5d5dd6d6d66666666664115556d6d65151151666d66d66d666d6d6dd6d6dd1111101dddd6d6204
dd6d6d500200d5500555554502ddd667677776667dd5d5dd5d5d55d6d00000000066450515000000000000566000000000000000000000000000005505555204
dd6d6d500200d550055055550455d6666666d66d6dd3d5ddddddddd6d077707070d6d1511007707770777056607070077007707770707077707770d000505204
dd6d6d500000d5500555554502ddd6676d66666d6dddd3dd6ddddd6d6070707070d55045507000707077701dd07070707070007000707070707070d000504025
dd6ddd4000015555050505520444d66dd5555dddddd3dd1d6d6d156d6077007770654505507770777070705dd077707070701077007070777077001500202012
6dddd55000010510050555520453d655100005555ddddd5dd5dd5ddd6070700070d1050200007070707070204070707070700070007770707070705110104004
6d6dd550100001510512504504ddd610055555555dd5d551010006d660777077706000000077007070707000d070707700077077700700707070705110104002
6ddd6d50000105100505504504ddd61dddddd6d5d3d5dddddddd06d660000000006000002000000000000000500000000100000000000000000000d000020404
dddddd40000004100555504504ddddd6d6d6d6d5d3ddddd1dd5d55d6d666666d6d60000020002025555200005d50101014555000d6d6d6d11100002000020202
6dddd5500001051005025020224ddd66d6d6d6d6ddd5dd5550000000000000d66000500000000000000000d5500000000000000000d6d0000000000000150002
dd6ddd400000041005504040201dd66666d6d6d5d3ddd3d15077700770777066607050707077007070777055507700777077707770d6d077707770d000020020
6dddd55000010410050250202245dd66d6d6d6ddddddd3d150700070707070666070507070707070707770d5507070707070707000d6d0007000700000140020
6d6dddd000010410050202020055d6666666666d3dddddd110770070707700d66070507070707070707070d550707077707700770dd6d6077000700000d00000
6dddd5500001041005020202020526d6666666d55555555550700070707070d660700070707070707070706dd070707070707070006d60007000700000101001
6d6dddd000010555050505050504d6d6d6d661111dd5d55100704077007070666077700770777007707070d5d077707070707077706dd0777000700000100001
6ddd6d500001051005000101000546d666d66dd55d6dc11000004000000000011000000000000000000000501000000000000000001000000010000000105000
dd6dddd00001055505000000400246d666d66dd55cddd55100005000000015000000202020204000150501000045515111155550500000515550000000100001
6ddd66500001055505000200500026d666d66dd55d63d3d00000500000001502020000102020400010402050002025100500010050000051555d100000000000
dd6ddd500000020202020202000015d6d6d6d6d0dddcd5510002400000001502020020202025500550404020104101155555555550001005555d000000d00000
6dddd5500001041501000202002005ddddd66520ddddd55000022000000015000000000050000000002020202040001555555555550000000000000000200000
dd6ddd500000041505002001000015d6d6d51155ddddddd110022000000015002020202040000000002000000004d45545455555500000000000000000000000
ddddd5500001041501020202000015d6d6d544444111110000455420002050002020202020204000000002000002020202020000000000000000000000000000
dd6ddd40000004100102020200200006450000015555c10000004002442040202040020202002000020202002020000000000000005111010100000000000000
6dddddd00001055505050502001000500000001502011002020520020555555555502202020202020202020202020202002001005155d1110101000000000000
6dddddd00000150505050502001000500002050505055002050404020254425555504504d4140404040404040404040400000000515551511111111111100000
6dddd55000515555020202020020000202001000000002020202020204554545555552540404040404042404042404020200000005ddddd3d155555100200200
dd6ddd40005155550020020000055002000000000000055502020202025244545254045454240404042404042404020202000000515555515151110020020000
ddddddd0005155500120200000015550205100000000000555555555555455454555545454240404042404240420510202020000055555500020020000000202
ddddd65000010550d0000020010001d12d5015555000110510000000000000000000000004042000000020500000000002020000000000000000000000000002
ddd6ddd0015500015100002000005155555d00100050000000050777077707770077007704540077777004200777007700220077077707770777077700000020
d6d6d6511051110101000200405555ddddd555001001011111000707070707000700070004540770707704250070070705500700007007070707007000202025
d6d66d50000155000502020020202dddd6ddd0050505010000010777077007700777077704540777077704254070070700400777007007770770007000202040
ddd5d550000002020202020020055555550500200102000500550700070707000007000704440770707704254070070700450007007007070707007002052040
d6dddd50000001000001010020055555505000000101011555550702070707770770077004440077777004554070077005250770007007070707007002042550
d6dddd50000002000002020050002000000001010101111515150005000000000000000044444000000004444000000045450000500000000000000054042550
66d51000000015001100020000000000001100000100000501515154204244544444444444444444444444444445454545454555555552442040202444444040
5d010000000002002000020200120000000001555555511000055555504244544444444444444444444444444445454545454555554545402150244444444442
__gff__
e3a1c616f827089701870ce0aac0aa3f74e37768822d5416a4ce2b9854e4e6161b561832903b5f3a34e3b03bbca4d78f46d221dd33b460d477a7dc5c80ed84c5af9087e893bff258edc747bfe3b0ccbee235872e56b679335687b9181ef6f6ae4d2bf09d46516d999587d5311e3e2077c52b6cb8b675c0acf0bf75108b821b67
332c070f0b8f963766d012b90d431bdc8769d95d6cab4cd0cb0abb04744b56435a6652272b8c947548de37ba621c3b012b5be835c2da1556b0f20e8aa1331ccb964933c8eab7282a090f4662914b856b34bc5c5267b824f3aa4a393ec1b1ff89d99b767bb832044ca2c539302f90a51e6a0b54026b7aab74ec6eab2b339e0cab
__map__
2b910a99359fc852bd08abafefee955881117d03affef6738f95cfcb8f46a79fb87b5315b94605fe0a7585ac50b7e8da6f5856fd3e5699615e28e5e2e2af90d43ef53b271f08abb06b90eef4d5022a5930b8cad43d2a2a75556605d3ee326685e3362616c5bd409379c13e2d85d5b9b338a9b9a7ab82a6dddce4f8ca8e937cc3
3103b26a312b5a5344ba6acb5298fdc47d07ce7be21acb942d3066ecefa9f2a8570af2d7c19c54b32a94ae5aceb7132bbe5bc4b9ce9d1d1cbdb5e55e90c12d9db4bf8276721a440de35587d0f7e22c71c8c21d2b5ac14d364843875567d10c158c7180e39b9229f04a331750d1bd79dc5d4cfd5d9017febac4ea114762f8f33c
6005b8baf6d62c6a4ede279690afabb9e86a30c0a880748545339c1d31c738a593d09a17c50a6db08f333f60cd54df7e8fd996bc0ead8702c7475696241eabb1f82bfe32882a56dfdd68aba51019ce5ac3337d33c749d13eab88b7629ff589d25551d2d54dd25526fd24b1422b3c1156a4ab13adab5d1ab2e6c9c87df95a2eb9
cf5a0352e0a6b8c31ee08a44ca050edcb79373547e8a5fcd84b31e2a7505acd4b7acf14a949fcd290138d7ba2aa538ceb9f7a79eae72c70a263a222b385fea5def9a77a0249fe5d606a13f4a522cbfe2ec67ea10810f5e4a84c57d40a23c7025ae9467f43cd8d9b93740499fca34f0fb58843b907ba4e1776af14a2e94eeb36a
5ddd72ac605ac15d5c488c037ff3c2638513a839be3a154c848f59d9715c3be6a07485c68423f978ae986a112b1e64066b85f976b0d8a6a0bb7374b12f119f85415da236be114e80091b2bebecefe0a256376763d5c1dbf1a109726845f7b4e9d32c5f1364c75849eedc7637eefdfbee5d9cf28ee6a774c51d09a474d85cc70a
6f0202d7ed1bcdaa70ac4857fccd302b4af530be1ae0e00347721d7c7448a5ea139a494feb0e5af269961654ff926096bd774ec0d05ce7314e1683f997abb13f7b96632c453c295663f2877b15bab2acbc1e8deea18069bfeb0791558b35e48250b03db40cababdcb3c1b98eaf64a102f4afd0a10c40c6b800e3840d0be655d3
1ace16dfc904d7d0da55b4b43e0ed72177bc5509ea948c7f7a8433e60ec98fe08819c7500600ddf667b53a0d5865605a5445b8ff8c2201ab445736d7813be7cf28ad5fa589cf8a129b219b0177c3b82a6988ba52532a94ac0aab2ba0738f587d874bc4292820d6b4a2724029d994e378ab2b7a75877a455eb6dd57b4d4845f63
0c0ff1df98598def3f6257952382d36e722aac3a76dc209300f567c2ea76d08fc1b34142483750105a736783eca53037c33a03ca8a16d80a2bb929ac0feb01b30213625d3d7fde625670eec88a248afa2356b7fc080e21f5091879f91dbbdc3f64453688b91abe9c0aab3174b63baca61eac44e7909dfa8a6f707e7446b3c56d
5706852893f3a2c85a740515ae7fc0e77fc15ff7760eb38686e2d4a10b46b3416c400ab2109c576f0705c5b793ae526b45b07ace6ccfd0f0ef312b3c6f0abf06ac14647043fa4169599fc3adbeecceddfac96345779cfcbb39b3cafcbbfc24ee66029ce0ac38fc00b85cd8a677c1aa170675df9cf8d75a579e19921f340f6037
b7f0ba270ed7406486059301af494752b37911e907c986708ec29d67f8dc6db641529898228584dc9abed728dc30a0b4e863ac700601fcbbc1ac56f43569b242bf6defbb606f3147b643a564fa0316768c29c3c6320a74c4e6b5af7dadb7ba7b22ace7f85d8be82879feee5465cbc3031d3ef01acf2a5dddc4fb98a1ae7a3802
b2c7ac089170613fd28a6f547880285eee2de1d65078ac0ee6c46ace85051a4ae6e0bc6d57f414ecc4382eca6f99ed445cf40ade0bbd16d4d0d05b4f49e33bf66c648ac2239ccbf22b1272cecedc38b396eff128ab9d4a38106165752536687640cbfef75bdc8b32ad1dd64b052980c56e0adf15b74158c609a4e68e55069d14
95822d2bfad88a55c5a35b80ea847b70d1de3d7db2771277e81d710ded3db869139603b00a7e67a0d9e09283834ea2aa0cec89cae195cd07dbe4690e7152c7ff6e63afb83f004cd605f5fb5640ed763c49c719156d4e136d4f78223110d4a2c1eae7078e15aef7259dd077434c9353a5abb15bd6839aa4c823c5ceb29ca00cd9
53a2eff96f1616fea32a087c1f17747643bfd2d07593c6e19db952133fa2215d1b4d76a5f3db4353220beaef781bcd23b1b0fa2a2045582709f507ea6b0ff5bad8bf7d06512830c89915747969e61669b6f81bf5209ac298db8e03e2cd9390798237523b1dfb4644751d9c8d0256f9d3b6559669eedfb70b1a5de48206cbeb6f
6c14287be924d34c8691a1d8e7c6718855b7e358a1e9b4f8d2dcc7b2d6cd5db7110f9e881eb877dcf6f82b35db76bece54dbe033d014f0425673eef8f0ee26ab44be351b237f49283fb337decc398b843b1ce49a55ac6470f3a7722d7f4a6b9ae52ed9d4ff9d90b6d4b6bb037e1e4ed1b1522500ee07490c6c6a189e9086c893
df2748fbf81fbaab8c0a11ed7e2beabc706464aa5788cd7d564e572ee9436abc4c6370d0e199c9e662dae5df3218ffd9b7a7e0a4419eee44c7e318303ea77fe08e0f4b2d1d13b043008a7da81bfb8260b443a3523f8fb1127f05acf0bc13397962779f23977d856a47befa63af0a1529cf26d1a9bebb13f82b9f15af1cc5bb79
ede942cc6aae8475ae618d134aff4ec7828862f1c86c8e5d2a16fd3d79addb786078de1812860a03aabfa1a468e63af6e46ede87ad26533f880bdf5a3f076b3a31e9bc5e5682c21256fb18d4ee5041ae45a0a2bd223e2765c6d4bbd3a863955a565db43ccc0bf1891b242a7616d9ccde88416899a41bbe6882605528ca6e03ca
237031030e0d1dd86905c608a1f3bab74be647abfe14abd9cce98a67ad628ec321f8373fc7a677dbbcd88a8d9040419da9cfac2476a88920dc4d7b7c567702563c47936abe32d0f45056eb274e4fb498e4b33cc1fb318ce7c970acfe55c38214845051cac79b714e70426443944643bca258a990419243baeb22b869b0ae1bd4
1b0210982788290480dad9a77dd3700487102a4e3d29c3ea79ac78c01a2386038f1547fdf65e06fc6580d46d3d529e0a37fc1aa16f5351d546650d87181443b64a1110c5813cbe0563c3e4eba9c1bb5a57735f57d07c8a97a488cb37eceae2eaa403c5ea006b7903462599a2cfca1f3c1261cdb5ae4e51593dbc553af5833d4a
1032755311bb069d136f6587b7fe85581d16ccaa4654bc19f7f453d3b2db7d2aecd0d5615b84b07f7757acf1804b9e544480b98b731d69d17d8a282a429975f866c454b853acb0e2434e9b610d068a8bffdb63e5e67e77699401084bcc403773a212db8abf18c2de7cb98d590d2c03b14b1c78bad5834356d5665cfb7d5c1b8c
d7d645a143f2fd036d973842f20dde321592b5ae9d51c433505a1c23e0d8028546525783cf5346c9babac7fd1b0fe06856a79e6f2fb3e21bdb9289533ec839969c08fef9904b093c438d582923fc36a5bed0246d3434767838de28ace12f7e8185b73ead751c3226fd0e286049110a831ef2b95482cd79f628e4ce6d2aaa2458
c8e3dc040be8b615038eb6eec8083a39ae8055df3744cd6a6e6fbccc73f93b734ab85058e800e5eb65e53b12c7e83c3d1bb4ae7df5107485bde5abc9465670db35e6e142d0764b7cfd60d78ba6c1b388cd646e4d00b3dab17755e4a480eeeaa2b1ef5a95622a01c6b8ab594dcbbebd250394f65b3f6779c7da97652577ea1bac
6816ed2b76552bba72ae5248acd0d9630d7e4c837fc5abc834596f7bf8cb7f48d897082bcc4a141ebadb3e9d76df6e7c432c99b486374f825b80ef684dc0b5de1fdc0bd2533b688069b50837ca4a6ecb4cac642a45ae58a58f2c2c1ae5dff91fe342e6879127c3f434c39b84236e64f52f34f510e61ace2cab5a97b558dd3d91
4bde275626ff83df26f9e31bf5e2a9e2a0129d0b5497f1449e59567ccf2c4e6f6c14b987f653c58a6c109ff99b3d1fd18ef357242afa9a6e3737aec7f5bb42be864c58f5b1d2f80ab64346d8e7c6dad92a28abcfc9b50f6df0f3dbbc2cacd191c72ae1674cbed7b7ac1c3638a116d633b163044e560478adc4fe2c2b5534c030
a2acab534d6b3fc6aa6c82fc5d912ac3924833c5684fbe0b109a4ef7a97985f6b792fe54ca49acabec73bae5d4906ea9409de2c36a2b5cf2cf914c50e3f9c034843b70dc3014205668277daa4175bb346b4d6ae5382ed1b2f112673195ac86d423c233f1329682d516561c35146e6de2d8de71ac6559bde28b8843f272e10a8f
15051d87a739df2a08f7fa5063a1ff5e38912d16fcacd89eb01a0cf8571f02f136e523bbc00826670d48417043cb0752bc2356080b4f9f92beb20506b8aa58d99a201afe3727d65f518265b4655319aa2ed88f61c080921bf758e3b0af7dc5ea41061de96c4cb105c712d765612dd5a311fea46724dcb4b80e18555faa2d144b
709e82ed7a34d6c111b11a70c1bee52a3215b8f6a5769be8f551d18d9698a999cfbc864c6e62a7da000116b82bfcae29b7edd865099f9d255cbee7d94212cb5f7bac16a506232d82858b87fe69788703c413a72cf8b1bbe3e22e301c8ab8a9b6a358c18f01c986cbb0c39a4d54570f8ab6ae8ddc39d75b49b2e595ef8109f9af
71c75530dc3c0b5a30fb00515d437c6159fda7b01ad5f586448b1dfae2744035268c3bedbf5dd1956c6884d4981dcd6a20ac70464405ab204ddd8d8bc9ffd37474fb34dec9b3306732cce7b3ba7f48f7adefaaabb86327f09c61727858483d09f6c1ab96af1fd65d578d0a6071c4d3c2284b1c174d6dd8c575026ac46317b248
68e46da52b529bdcc1fbf64ebfe4af2ab646ca92d4f29a6fbac0b67843f33579c201758076ec88bdc1545556ff9ca1ae78e2b9b0d246b8744638b24fd1cf232024752b310eeaa406543828cdcbdac5a0feb67316c46a47c605885544578a9ea0545eaf7283fe17dfcf77fbcbecdd51a460cf5870f4b1af50dd2633016151d5ef
cf6f48635c4064567f701116757a23afd98ceaf1c51067b1b38b020b3122b39365785cf2f6ae3f706840f4e9a639aea92d4ac98415e6dff7ea0b43b46d56159ffebdffcb8103f68310158d8306607588021bb4c3dbec52707509dc30c76cd87f62eecc36f86d2ea13b215983ac9ccc586440ef31fa0c1b3fddc35ba9e3c81a8c
12e2641174e7ff16086b1f5edab7eda4ffa7f67bd63ab498aec95637bcaa7465b647aff8b60773fe52657fc2948c13d928907a224ac1d322a1db2f41273ae471295e94fae97f1e4eb48ad6b1662e962830dbdadba22d1cb9c521ecfe8ed4b81c5f0a0bfa85fdaa312caff65d61a0ca06a3dba011ac7bf778c02471dfab71ffb6
ea8dedc411f7c4bd218fae24f44d9dcc0af6f1080354aa999a2b70bd72ce69818ff45f2cad2530749d91b5c4dbb77926e6404a53129e4d18d6bdaedcdc1226aef7adae8a6d590d490e757116488586664f75477a0f6b91c2da9a1e67f1d81f0ca89406f127ce38333d25cc5cc6af9ffdc3a7c4ea8f069692d232587133b2bf28
68d08d4aa8d26b158d570ba347b30ba5d52edf1fcfc60d7dc70abed4ae312b8655bd91b7e241b43bb4c1e768506e47b17265242245f14e82b3d5b0b6476b1981d4f7d7720facebdffe976525908e988f8eb70caa2b0627c20535c140cebe320d38f2d1e4a5d7414cfb368ee9f318965b2d44894013d7ee60c595d5b5f3772862
__sfx__
046b82a00b223183741851416646090390b35d2526e2a5303872d3c235275281122c0a3653f6790864a307353c60a3f21e1b14a3a7420d60a34507314070543703766344043d40c3323c1966b3500a0c33b08266
56af4558260213706225573097690446c0633e25126052451664b07632326632c65f1e50a2e62a3d5780c14e26550341502a54d394333d7081e70a1c117231171c2290d0363b24e14108154502b71d0b5722b602
ff4e859a17340205682654b0052e180450b12635327293022d46c1f474195072025a1731a2b020006703910c022140606101036165303b66c114430b53013112276263742b2c24d251232232d3752e3917907437
42d81c540d1740347235209150721c7752d22a3426f1b521301592620e1907424060053733112322125282492b60d2b77b206183747f16338297151415d13502353273237e0a264107783b03a3c4091131b2a707
1650320f190350b5532d0391542d0e25f033782d65e2375b11533282721a6312b2530221d2d5430a2103b1382b11635568036481f21e3d4790f6381e578350670c17c1b66b3560a042702b1101e1601f44917109
1c122ce33e31f3676e176743533f257392674f116632d07e1140f2b265062042b53011649366781f7301666d083192821c0136a0603f2065b225752c155272771c11b1b53b1a1271703a3a32b20567157642a03a
76779bef3226b31704302042a45c0c1051700f3f73f3816f2301732712121313c6763835d204033f77b1d55f3027b3405f020450717713053095702707b091182d5390d46b0f04a1123a055122d17c3d36822003
9f76c8213c531227201824a2f4163110b1627c2456c3f147150742814523619064172345c1b10b0f3570d707013482c06014738067360c17e2d2191671e0b41f126070167603600197593472c3d4531c52610254
8e0aadf20b2592d12c274243d22c2964e185670f5650a33c0f56b015390d4590911a3f6731c7711032b1804f1f47b1147c2420d2136d0f050055351875f11433287000f642003280d41a2741e1b7682560807213
6c2862311845f07722167740d7143333b073752340d3f407316670034a3a66a0130f3d33b112151640d2a6363562e066752120f075540646a103282c72a092133f23a384003e73a1e270027200323f2a34023530
43d2d5ab3d612381621e3780c22b105292672a230051721d06067286541f71b0237d0a0443517d1312514459107213052d3f47e2d45b03523021181e37f1e30d0e66d2d15d3f07e3733f3d61c3706f183652e71c
e0eec5901255530603130561046f3b5401e750185650c47829678032793076a1d378041662c424104390b01d303561036e34079103432e1422a25d133162d529020381a6602f427386242b04d264271c64d3f070
fe8ab6be1e3612b335315642f72016434114312526c132160d0291624f331102e4613b7043072524262226543206b0403a1e65607227064383854a1e2383577e3e75f1a7793451d043522245a356631746f2123e
468495b50b5361062d313571d4422f6711a34f1b41e10702052452b12e08469237033e22806143144641162d22620025743a50e2f70d30251133532f041186530815531464157790c37c2d52f0742f3225518151
0b3fbb76116623643c0a0362b6002c65c0b5651160a23164300341f5053a53c3020a02203042191f0381a23e1171e270213c1190f31e20561205290757a0f12f2a37f1337520365224592f4481d20f0572037078
16ac959d0725a3372703130063440651c2d15f01307037062e41e08132316482a570095311017a33015195543c4761e753025651d405334721734c0a30e1122b064460e4252a7641b7442655c2066e3817c1a46d
d984033d166172903d171680420c2211a1f618146161917d0922c0867e0906e183662b04f194472d316017211017a0236438663001391a442292023853330126123372c54d3131b1434a030752714d1f31205131
c34399a0280273a0023775c2345e34645181411451e1541b1363c065550855a3c3341805e327450904f353092f04c0b04c0543d186403270d1055504540123710a64a1e473053530e72d08274012123e32d2e33b
878f258628234233010b4320204f11406057202044e356752314f02605017221725f1725335513187783640a2a24e3450c0d5491f4722853b2b20f0d6503221c236223141c0c107023313650f0760f0531c12314
2ae08a85073493c4752257330245040371d7393b02d1573b3600c3106a2932e071311607b3b34e2d02325722143431c30a1405b1515e0e2063746c0d10d2b7130d7022e0030e043344443114d067091834f1144f
97f8b7db211600a0681044e094522d04f3923f0a3453575a0b0510041616369031201f6240c514157413213e2a11d2a65c176721f26b3b5402150f1703c3110729117215530d3382172d280611117b1841513232
33a185f50b317081390757e3f779130050d7223807634307180091923e3d2672860f282151652f1c23e0320f2760f1d5252937b363231273b09652125772d46c1975335306090202b368044560473a3322930316
d83377711223f3d102276501712e135362752c3f3070153019559305403d0313d71a002682f6012c405310052926e075503c15937123157251104d161671a658183701703d216621c53a02234394412161b0023e
c12561c52b10b1762a3e7543f6043b66639508185612b4720a57b0d6672541c374543a079016103c14116739177741733b1d23e25148190603614a1c216045782174d1133e1c65a1e72709609391511d1462312e
e9d8f0a31f049105631634e2a314312191331f1d75b2f5462342f3a141323492d3150f554333740e42b3f3142a0452b7233b5023441c375741731b037580b616136103e465133380823d0b1181a1141354825079
a06f30493c6622c77c112402b1132245f1f470171491d66306219116433554f3c020097223f27312518063390231c1d27b052180a2552a339396690d207122331451138035024483d030160212956f0735d0e02f
98858644257531272118246332633e2341515e256091d63a232231f0791a34c2676e201203f23407253216560b3303823b23776303772727c0565d2f34c0e540020340b7202f77728049380531f05d1400c3203a
4b0545a9315702b7143a571024490014a0e408020372323015077372010965e1d31b3636e0f55c0f52936074392423340a1941e2320e2c2610b720390762c70a2945605660020732c4682354d2d34c3a5471500e
b66474fc2f1223a1550e43d167622d02a2b0753072a23125222761306a1065d0141f1f51d051570503f37402313042842b063381a40b1b0172f27d2d67d096023646d241143b0350271c0d0550d54f1e43b1f255
358cc1da2c44313553163381e711015063751f057152e35c2561c145490e2283075025615092041c04c1134c3b7083145f256633262a0515b1a40c2847135562044500a53c1876c1c1722435f194650136d0a12a
746c9391144641566f150711c21b107283a7042d5532242d3b541043140611c290570633f1d1060c12b067690d1652c52427154322050412e0240d0e6681610d3864b1e1080f67a1607e0d31a0615d117142c152
ca2dc9b60424c2602d020473060f043301a4353d77a3507337600093053b050262410d0512c5363f50c17047246723e7092703811251047223712022218367061a72b067772a2580a7301021e283192211911671
b97a7f3139715120220875e1c758283120f44b2f1433075911402032483d7152c71e380713e07b3a2101610e1d7322f33c1b64505120167421325522772331330c3583f10f3921a0472a2d3352d1431c4381930a
78a7a1aa2d114057701f26a290561f24b34334396423571d33052141013551c301601035c0a6643c7482807d0b2242871d1062e190731440e3d4043f10f0a04c005251443f0a25b3a774235282a4103713508778
1cb398562224f3064e170221621c392052f209202633e31c0d35238560392020625c0b1401e6051f13a3d14e2807908158213740d520297520e071160672460d2834f0264f0c1622b0203750b341172273929603
92163b8c204620c5610074d3f64f0f041133533a1181d0600e4073d6581830e0841728242162413443c2a12b3807b206062d7311e1062e2532b0743e42a1f63a044502b2561012e3665d1021218050237472a77c
a092a37d04423390760e2633812b383442a7173032d3107c2130a2a15b346281a14b1021c224053b56c2133a2973e002730e76f006311e76b2137d0102d06418327221452a0170a0664c0f434142493237b1441f
3a8362a20f7091c20b353363c4130501a2c01b02126351203a21a0a63f1b72e105603e3461616d1535826334186741a37c0f670375481c37a300163a2513114e3b3453c232224002d4002b001137211530d2f24b
1a89399e1800d302572d16e127692f31f127492154503551145270431d064123a3142251712153175443946e3254b1e44c2f703371632f60a0f4183a23b3977e356083640e3430709561002021e1072934c3c353
beb01d952c0022a52c211263c5330d00b0074a1f475115233d7033d0113147a0562d080520c0630672f3a35f0b6220f7170057a2a1051924a0a3662f675230620a77b280782f118272122d139391211457815442
15d51ddf1c0242c5740245a2542419107213753e62a2e67e2d40b3a557044202e151227613943c230581c15b223112e70e0a0301307208711222600f60e004783102f3e22c0f3732651e2371e0e466086180174f
25bab741205063d3582e6303634c183613034a13656184093573e1b343125592e10021605021340c17c010593b4090e1780d6151c2021850c0b6292252b007520e6110700417145234291f006036741623e13570
308e2161193503a47c2344a0561c2e1753034b0b07b3e31604700070372867829307347043b742262742c2722800d025723572e2315c392393c41a2854b267472955625367317780a2402252e306242d61d1677b
889551ce0910c0d536394092e3582a779023582b74d1864d237163055517143354200730c17754064563b274381083d3730706418013226163a2091216d373250900c1c5191850c0034a2313f1865e3516506167
e3e9044b281791a2401d455342020d11e24141086210875d1e134183211644c010210103c031710011e3b1761510b1a14a3804628252115123703223151044691c70b3815508176270433900832161126310e721
ea92510d3652e364023f73f2f068223473072e22562364240914b3476a1412c3873714430041663833733168092240136d050062340a127372542619412256333f12c3a3011e62d157292d20a392050852239024
bc040ac20542122716016241300a0725a1b7513921409469253590d6160d2723716724425060691c46815405286073b24b2176d0861c37143136010f33b032700a210061110d7220e5133821235175316673d028
c139d182303630a7212f4603e23817721070441763c12655122471f57238347304192f72e272450402a1e247342401624414222253052575216678370122966611339052280f40807351116601e63d125753a558
b06002110b47f18416001690010420200007113a7503e73a2e711181600b4493c7570961226325391450f275033702f2421c5302f4161e5652370511358302060047a0267a3e0211b02a39504147052372c39154
75f404cd1c03d381721c23013541324633c2752d647107101e00e0833f213493e1782537d0855a0820c16239100733a2710a32e1e72117663170633b220026633842b0b60f0312a0c466166443d2212f61427227
7a3eb8db3056806440396783113e2b6211845a3415032064370242733b246450d2471851623672213181c41e14742287050173f231000661b3c0473b166073740152f0f44a2420c3f0723117b070200c05b2620e
66d7eb2b0635d3e4070c1193b26b2e06d3d02a1005d18125266262532d3423a1905a3250d2f27a3803a0770a256502934a0d12f37506023281505c0036302374190363737f3a5683d22308456025773d62c09627
cd6b5aea1e64c0943a3c339066470e2461e53a3954e3142e3920d3a51b2b639204120c3582171a0435e0a4601911b2665428305260123f14e3917d203620f048260032e141211403a32e297513c646041531f610
273c465c2307d0503720118121613e1231711914124121160156a045430e24d253153060c126741c25c244250e6313601e242400266b307203814e37572077163230e130690f1701e21609731357540842e31513
0adf6150202021c0643c012097053a4180457b1067b0032221262006493403e3212906616001500625f101450d24a205640131f0a3631a46a2121b3e34d2453418076025190051a2c321163211574d135240e511
a62bab2b2d72d0a21a2f6033d578364492135d390722104c1120f0a60b1d1163250c067370570a3a3243a7363056a2b1723707b0622e0f36e32777015750551f32440150411e716387591c46f17221293023912b
596dfc553c53b0d0072f202282142156501671246093516d3903d3b100193493a20d35474350372b4721f1140a630113300e331194250f073205340e61a3422c2a3153c0213211a2f50f3b073046550a50a1735c
357a42812471e353093736017307095133c50e3833e372582f54a1416b24379070593e739372093e00c1c6791734310253217472113e021770103e3f1483524c2f44a1326522222270490670625656021393a357
4612a8b40602e330063c04c2a5083501004720320570d21c023552442c30041067603966e1673e3c5770162a2c00b377161c0401360e15113386543465232316077393c057181611a1253f1083b37b3d0230f40e
127c019e3945c2a1681840f2c032161360045f381172441b0c42f357493065827271072503206e1620f2e046130620e30e132230e32f0441f310622a478043251f5711974a0b24a1b10b2b410335641951c1b602
8aac39ae2772f1a1102c638381613c25428062201301f26f3473d07327127113b2542e30f1025a2f47d0341a2f72a1345b14401117433354d1d0712076c176050553d387661957a0c7172314d077232632417366
001000002320f1c45817046374200d243221632453a003062c6663a2533050a2031b0f6421d3142f17b06530317222a3401e07f3f44f0c7480c20000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
0d 1b7d6f45
0a 3e3e742f
03 6f3a522a
06 37763d1d
0b 030b7b04
0c 213e4c7a
01 00522e64
03 18440a63
0b 5a7f5a2f
0c 753c7542
01 747c6b4f
04 514b725f
01 465f2d70
0a 7b3a7c2c
03 24652e0e
0b 2f62352f
0a 1907051f
0e 592a0618
02 7341316a
05 1a05594a
05 643b1229
04 253c5816
08 56303f19
04 75655f43
03 2c7a0a15
00 665e3c3d
0c 0536781e
08 283b0635
04 2b774a00
0e 3f456950
05 7d3f0d7f
09 5262562f
0f 04557135
03 474a1059
04 2f755b08
0b 54780916
0d 7c16242b
00 232d2d34
0c 3a077708
0a 36737b69
0e 706d7678
08 6b42776c
06 60731867
04 0a486573
0a 5b1f1518
03 21480a5b
0e 62644b57
02 5222535b
09 2e10567b
0d 5e303a60
0e 722c0c1b
00 20566f1c
03 2b7c7872
03 6d21411a
00 0b312010
04 1a4a4420
01 2517617b
07 7204632e
0a 2f6f1d51
06 767c7a35
03 401a2c1c
0a 6a131d41
02 78132b41
0a 52213e23
