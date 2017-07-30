pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  ld39 toy project
--  copyright (c) 2017 sam hocevar <sam@hocevar.net>
image_list = {
  { file="data/background.png", w=128, h=96, tolerance=62200, scroll=true },
  { file="data/owl-indexed.png", w=512, h=88, tolerance=10000 },
  { file="data/owl-power.png", w=512, h=120, tolerance=200000 },
  { file="data/water-transposed.png", w=1920, h=32, tolerance=2000, scroll=true },
  { file="data/mountains.png", w=288, h=48, tolerance=2000, scroll=true },
}
background = image_list[1]
water = image_list[4]
mountains = image_list[5]
facts = {}
global_rom = {
[0]=
0xacf8.8ac6,0xa83c.c84e,0x67c5.5636,0xe717.d56b,0xb1b1.b941,0xabda.ba71,
0x8236.332b,0x7b6d.1e2a,0x9a56.367c,0x9099.5ca8,0x9d08.9678,0xf195.8d8d,
0xc5f5.5ed9,0x3b6d.9d08,0x6ce8.4947,0x9527.62ac,0x7756.521,0xb607.3a3d,
0x18b7.c5a3,0xa0f4.159f,0xe96e.c652,0xb3d2.e58c,0xf7e2.f194,0x5b18.47c,
0x8d44.49fa,0x6746.97b6,0xfb7c.5e3b,0x169c.f8be,0x5842.fddb,0x2fd6.055e,
0x2632.4226,0xcac6.f8b3,0x55e6.88f8,0x33b6.5dfe,0x6815.6476,0x5e8a.62d4,
0x5d26.5c5f,0xb385.6ec1,0xd5a0.2ef,0x99e6.4757,0xe1a0.bdb4,0x9309.f1d5,
0x46cf.8d2e,0x53ec.d4,0xc7fe.6475,0xacb6.2d05,0x3986.53e1,0xf378.3597,
0x34c5.046a,0xab61.b3d1,0x9856.e8f6,0xa205.6167,0x4f6e.5e9,0x2d74.22a3,
0xfdb.01ae,0xebd6.cf8,0xbc31.9bda,0xfd36.4956,0xe81a.e83a,0xe07b.fd3b,
0x9b28.6a73,0x1c02.cf87,0xfb4e.77d2,0x3616.7c75,0xd537.0c3,0x3e2c.742c,
0x9739.60f,0xb94e.f24b,0xae59.0841,0xc6cf.8a2f,0x46cd.5946,0x5332.e807,
0x9232.3356,0x8b67.c632,0xbeb9.63e5,0x7533.3e38,0x9609.e687,0x5a99.9fd7,
0x63e3.376d,0xe0d0.59e7,0x7533.12fd,0xe809.f087,0x4d93.e29e,0xe643.6391,
0xf09a.e7a2,0xe7a1.5059,0x99f0.0733,0xd29.5742,0xa3e1.3fd9,0xe037.6e4f,
0xdf42.a0b3,0xea7f.4f89,0x578f.1b0a,0x5299.a126,0x4ea5.c8c2,0x40a5.33e1,
0x9cf8.6ae5,0x8402.5c36,0xa06c.a6fa,0xe462.2984,0x575.3e34,0xd534.6ada,
0x269.f13b,0xc374.ec58,0x1eba.f3e2,0xdae7.0071,0x3b28.b095,0x8406.d383,
0xcf3.2be6,0x4eb5.e538,0x99b5.3e2d,0x5a35.62fc,0x5c4.a483,0x2b34.234f,
0xb201.de8c,0xa8ff.4556,0x36e4.56c,0xbb6a.a105,0x6f15.92fe,0x3f.48c9,
0x4eb5.a27b,0x13f3.5d21,0xca9.f1cf,0xa7a2.c3af,0xf7fa.499c,0x58ff.91fa,
0xfa18.9d0d,0xa834.1c9,0xba44.1d7d,0xfec5.19c,0xf452.34f4,0x74e7.c087,
0x3a33.2651,0xd0ad.c7f5,0x55af.3256,0x15a6.5661,0x8699.9a1,0x3d78.127d,
0x59a3.456b,0xb3a7.098f,0xff1e.a018,0x501.d151,0x5380.c19a,0x8d8f.1b74,
0xa71c.c6ce,0x8ac6.dde,0x301e.f0be,0xddd4.29d7,0xf0d6.1ae7,0x7ff.c365,
0xf875.03c2,0x.000a,
}
function u32_to_memory(dest,src,size,offset)
  offset = offset or 0
  for i=0,size/4-1,64 do
    local first = i + offset
    for j=0,63 do
      dset(j,src[first+j])
    end
    memcpy(dest+i*4,0x5e00,0x100)
  end
end
local reverse = {}
local function bs_init(data)
  local bs = {
    data = data,
    pos = 0,
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
      self.b += shr(self.data[self.pos],16-self.n)
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
      self.b += shr(self.data[self.pos],16-self.n)
      self.pos += 1
      self.n += 8
    end
    local h = reverse[band(shl(self.b,16),0xff)]
    local l = reverse[band(shl(self.b,8),0xff)]
    local v = band(shr(shl(h,8)+l,16-n),shl(1,n)-1)
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
      local code0 = shl(code,nbits-len)
      local code1 = shl(code+1,nbits-len)
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
      k += 1
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
    bs:write(bs.data[bs.pos+i])
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
function inflate(data)
  return inflate_main(bs_init(data))
end
for i=0,255 do
  local k=0
  for j=0,7 do
    if band(i,shl(1,j)) != 0 then
      k += shl(1,7-j)
    end
  end
  reverse[i] = k
end
function blit_bigpic(lines, dst, dstwidth, src, srcwidth, xoff, yoff)
  local data = src[flr(xoff % 2)]
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
  local s = "\151"
  for i=1,#s do strlen[sub(s,i,i)] = true end
    local rom = {}
    for i=0,0x4300-1 do rom[i]=peek(i) end
    for i=0,#global_rom do
      local n=global_rom[i]
      for j=4*i+0x4300,4*i+0x4304 do
        rom[j]=band(shl(n,16),255)
        n=shr(n,8)
      end
    end
    print('decompressing...')
    local tmp = inflate(rom)
    rom = nil
    local u32_offset = 0
    print('unpacking...')
    u32_to_memory(0x0000, tmp, 0x4300)
    u32_offset += 0x4300 / 4
    for i in all(image_list) do
      local u32_count = i.w / 8 * i.h
      local pixels = {}
      for n=0,u32_count-1 do pixels[n]=tmp[u32_offset+n] end
      i.data = { [0] = pixels, {} }
      u32_offset += u32_count
    end
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
  if (btn(0)) owl_x -= 0x2.2
  if (btn(1)) owl_x += 0x2.2
  if (btn(2)) owl_y -= 0x2.2
  if (btn(3)) owl_y += 0x2.2
  if btnp(5) then
    owl_mode = 1 - owl_mode
    owl_page = -1
  end
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
    off_y = i*lines
    blit_bigpic(lines, dst, dstwidth, data, srcwidth, off_x, off_y)
  end
end
function _draw()
  local frame, page, off_x
  cls(1)
  draw_world()
  palt(0,false)
  palt(8,true)
  off_x = water.w * scroll_mul * 0.5
  blit_bigpic(mountains.h, 0x0200, 0x80, mountains.data, mountains.w, off_x % mountains.w, 0)
  spr(16, 0, 60, 16, 6)
  palt()
  palt(0,false)
  palt(8,true)
  frame = flr(water_cycle % 1 * 12)
  off_x = water.w * (scroll_mul + frame * 5 % 12 / 12)
  blit_bigpic(water.h, 0x0200, 0x80, water.data, water.w, off_x % water.w, 0)
  spr(16, 0, 84, 16, 4)
  pal()
  local owl = image_list[2 + owl_mode]
  frame = flr(fly_cycle % 1 * 16)
  page = flr(frame / 4)
owl_page = -1
  if page != owl_page then
    blit_bigpic(owl.h, 0x0200, 0x80, owl.data, owl.w, owl.w / 4 * page, 0)
    owl_page = page
  end
  palt(8,true)
  spr(16 + frame % 4 * 4, owl_x, owl_y, owl.w / 16 / 8, owl.h / 8)
  palt()
  if true then
    palt(8,true)
    frame = flr(water_cycle % 1 * 12)
    off_x = water.w * (scroll_mul * 1.5 + (frame + 6) * 5 % 12 / 12)
    blit_bigpic(water.h, 0x0200, 0x80, water.data, water.w, off_x % water.w, 0)
    spr(16, 0, 96, 16, 4)
    palt()
  end
  cursor(90,120)
  print(stat(1)..'%', 90, 120)
end
__gfx__
87c9ded7d4f6329469857f87c3bb3681685206c0d142c0a00f1af2dff1cd369065f1a02c815d0bf26ced29970ae0ed388970904453aa999300b057d9bc2ae7b8
e245e1297061a654d20c04ff30b1bb0da52d1a127cbfc8719c425425a29a45dc7dd55454e744cbfefa80aaebafa6d0b6853ca16d0b6853ca16d0b6853ca16d0b
6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca1e3f68faff4ff577fbbf51ff9dcf77ff1e
f6ffdffdefef77ff6f77fb9fdd7dfbdfb9fae7bf5df6ebafafba3dfafbe58918f5d75fdffe7fe7ffddfedfc1fbdfaf774f3f77f73fddfbdfeefdc4f3cfdffeb1
7e8ff2f5ff7af79fdcffbfdc5ef6e6e7bff2fbdffbfbdff3fb5ff3df6e4fba3d5a409bcc3c330ef3ea7e85fc1be936d37ca7e85fc1be936d37ca7e85fc1be936
d37ca7e85fc1be93eb4c93c9bd028ad7ab5cf37b3afc9cec27f93a6e5f7364b0e72d2b0f7f67cf9bdb0e7ea1ee90bdb4ff9dc9afc7004163759fcb7fac601884
9b6369bfcb7d2caf76b75bfcf512c349cdf9c16b95af1cbad6f27f97f740cef9de59e3fe90baa03f1c490653aaf168a732fcde55e3fedbe7d869744fd73b36ff
2df97f387249fb197e6fa4f9f0580c6cacf97fe5d5efa8f37361bfc701ae7556ef6f6f92f443aad7e9e28f93b9ee5ceafd712228616c52c7e340df57e2c6c23f
9f02208d9de5df375f5af4736a4efbc3c6cd31871f5948f35bcf2f2c89a907769cfcb7acf76cccb0ff93dd8bfdf72b8eaa4e7d86a3d5ef376ac77909ff9eaef7
2a9d6978846eba4f0289b9baf7e96d8da7abcd7e6fdfcffd6cd316b7eafffbbf3f4fee52eee5f71a5be355cf3b1fc77856aaf9b33df9b11f7e3ccafbc7ed3f04
4fb820cae9ffd3cc2fa22852f3f1406bf9e2ff7a5e71ea37e1ebef11a169ffc7010bcac5defb70642e904efb9bdbaf76113c551fba68cabf4d81c3e246fece02
f2ea6cf468ac3e300db9b9177fd617272f468dc3e347fd56e94660fcc81b7e78b7a448e1312bcfa7c9f54745ef9d94172e237fba1afbb729d9cbdcc9acffa6c7
1ecd5c41dff5c6c38131db44fb77bf72eed681b2c7171f0ab2f111db7d36f3896affacfd8747c0f3d1488f6ed4f332a7f53d8ddb50d68d1b4f77148fddf27cf1
cb3f1fd2be25c7bee98334fe57186a03ab05e70c5c1303b6cf5c0df753ebe1bbb66a7cf7284f7471320a7d70147b38ad0b36cf1e9cbde2c34f458fe3c20862bf
0e641fdcbd1834b576a77c06dfe971327321b78b28b80c4a7b377ad7e209572fb80efdea6cedad74fad35b3249f7642afd1006f7801a11934f560dfededb036f
ee054f7104f2cd5f6dffaf209b1f26442ffba13af707fa38f3876c0759f5c819a911ae7f5b7fa63a2c35b04f6106ef714c09d9f046f006c2e0302e7112ffbeee
98058e08e9bd31fab0caeee8c71e583466c609cfd7a644cf26bf87ee0e9897d324df64a76ce380021c00ef63075cbd2c6afff676315ef0c01f10128f3876d0e3
5e3f4a0b4c18e1742b702773b0c139d2c601f70ca5e5b038e9fbcffa7c0ecc092c7104f04a4ba4ee889d306bfedaf73f3cb5f6e2aef0cf5d7ea2f77d57fb8fff
f612fd3fa0e04bc6eec704afe4064b9e965fa00f10da3a8b03cf005ff2c9078e93acffa6cfb47cb0dff7b773fd18c26f2858ff2630dfdbf8cee068b14eff332b
600360ff78eefe414ef06373f91acfbb020ed4097fe04c3302798abdcd42b7f26b89eddcd4f2f705f026f01f36cce01634cf1c7e90f7eddbcdd75fae5d4fd0f9
bb8b7106aef20ef64f77c1cd06c81fe04cff246c509dfb7b700b019c5905b1e30c8f3738df38eaf4f463dde10cf0a797fe0e0e007c9579cad7354ebd54bf7ab0
e4fe7813483cd04e719d7c815f164a6f261e9eaf3ce5ed0207f4ff5ed47cb0873e51bcf7ff2faa3e52ebb0003eb021f22d38efca023770183d8dbbb36a774e8c
cd5cc1639acd326750b7108be20be7e7cfa70f0ed77111cdb30297fef1cbb20493db0cdf52f3e7ff33a4bdfdc304d78eaa8b13fb3418bbd44a707cd56f70b9c3
e13b3004601ae30683811f891ea2fb6f511e314f30e2f2fa0d26f5de29cf5d2895ed0207439ff338600dd62f56e3dd74477c4efc0f28ebe16ce1c3738c2606c7
26ce58ceffabbfe23ca802b728a700ccd12e5fedd29d7fefda7f05edfbfbcf10c2e1eefded28f38d1f756f6fe72ff683c000b389fe3cc0717b721d8d3db67cd9
1391c00348ee39f28d05bf78211cb71576bf34f860bbf6cbdba720db87f214edbb79733ef6640a01e7802febcb975f264ca4cef164a8821a569f3a640af08119
bfab281bbd45a77b8ced9ae1236f34af0ddeeb30f894904f354e3002f6f2f20377097b7bf774a0046ff705cf5bbf3fe08a0836cfe28458d3afc2f678439359f7
71f1091b81cc680fb82f526bf0f63fc1e024f70e131eaf6cb8be5879f971ff5a797fe2664f09b9871ff52e3179f71219e8eb55bf44b977e47b770eebf1f8dc81
e20ddfb646d8ad7083c4f9d00d8fa9db10934d5e2f18be383886cddad8faf671894cbdf777b0c38fe19fb7faf8d525740b77c72ed517b7bf3f9c908dd33df413
e578094f3aa3405fdad87c46f04cf8b0736a49018ef1f88383c6434e30538df73674797379facc58b6f68af1be7f36e7cd43cc9bbe5ab8e0bdb8b1cfb34cf74b
67c890a35bbb1f95fbb133147145de509f3577357c82e7764f3a003ef88f526f2f3bb01f2d4e30d40fe1c6351efa7b7070ff8181ebffe3e1715f138a7c1cf435
39e1846c6f7ad36b7fb58864cd0c1e76e067ef1e6ff8fbcb77dd02f7768e9c08c1b36ac1020db3ea1f3ea0362c80ce56ca9d1c684ef4330e2f667f550a7eaf6c
f0d82cdd8796f743c0fbcadd7c7e38f797129fe9fb13e1f7b32f61f0e00a0c080364b670419e1eb8f8ee2f2f3edcdcf3fdcf586e2a09fe85f915cd19f38139bc
3917657b71ea90c94eb486d2b9f1aebd107b7b64edbf02fc0f00887ff01e58b5fac170ff8a1f36f96c161c3087e1edf38b5c20ee3046b7b7f3cb5c00f0a98091
ff1cfb2c3950f31eff369fb741dfbbe3d18b5270307f73d8d77793c1c98e274e1f47cd1ac1999f50e06dae3c81bd72871222fdb0c38d739cbd58b779fa67f3ee
8b034f2ec19a20ed0d858f1ed081f97fa0779e3eb78c7fc1adbbf086b305e827ef7730f4c7bef2db09c74e2cf3fb1e7e31782c6ee325a7b6361df0dbfb546ee6
cd764ef1334efd66d6b74140aa32018ef149e541f68134d66dd38dbf0cc0fd7cbbe7cc4f390f16a3749febf05309fdff0b7e04effee404a1014803fb3fe10cb3
bfd44d0df150d3c87072c1064cedf4a66ff236a61181d70697b5e7189b88df01f3df58b23efc142c3a84edfae3e7b3219febabc1b71fd8951a02963847d98187
de535671e2c88eef5d5d52c30ee5140c1059285a12db3f3108dbb7d7cd1278ff206d3f31d51659fabf5536e07fee525048b269fa8cbea83cb9aaf5e0925a1977
ccf8b6d479a66f3ee560ffc7de546b7e4ecb09f1cfce5e52907a7b9d79ef6ff1862cb6f6b9e394fdbf1ef04bff27be740f6ff08b0aff97f6f05d1cf8d9263f72
cc7fcdde1cbbb6f6fef33bdbbb28a300ddf9143045129218d02fcb0f5138d17dded3371d8fa7c5c802adbc4736a21945ef3e135a3d3a05ff1a9bf747c2f6f6fb
3ef5e59acbff7877ede5c9fae5d88835bb790226a1f5f5d59fbbe368fb443f6cb1bb853c38dffbd73e3fd38a7e748d0e9d5775730f0b710e7b3af6dbdb32dff6
ef9f2f6e71f83e857fb25cf592d3c9ed64afd1be3082350b764bf8d906f2e9f9ef2d9cbc77ace3460baf732b0ed3e4807ff0806f8628ea7b1e79820df9074bbe
7c7289eadb5febbf0ef085ab1a97ff80fa245ee8f7b717fb5877bb0debbd1ce8e8bd7c7bffef40c1000e8fe16183838f3e987d0839fb7620ab72c8f7154c3e85
fbd0d7b544f95e7db0711f3c1a24831d70a27004edbf8e0ad18871de3b09a1d7795ed7506cf436f6bc73750fc187b7c1f5db2faa4892cdb4abf7973754916063
07a00dd8c740bafb28c7ffdaf464d7cdfb2fa188550f8eadbebcb1ff0a742cfa93e7b47049e20aa79150f6471c5ff7122feb0f1e3c58bf8100cd84ac18ee909f
ff3979c1f313eda3848a59d187fd3dfb7708df61cafb7fefeef119d7bb02e48afc7705edf3ce1ba308cbdf7cb4c89e45e9bf419ddbc3802f7987fe6fef59aebf
38bd203cdde04cb7f310c3eff07b26feea8bdb5a5c0c78c947dbebcbb82d5529f6791f55a73e139e38fb2a9fa2adbf86cf19668baec8021e22973018dd1389b8
73ff116afd4df618c7c12e1c5f187160a9738c3fa67f3eb429f2e8faf55171f2126af5de29cbdb13dff247f0c2f7f6bf8ee605d9e5545fdd526f376bebbf8fbc
dcd8b177c7a3aeded7f16e9fec74b9b1f075360d70fa4485edd824977e051659f10513c68d139b731a792e3ee0432949f1b98c13e28fef8e57f0d0ae4c7c76f2
838850b30d27b77505edee3373786fe99f4afe5e1cb7690368b8b0497ffc0d1b5c1f6ee35cb7a13adb34271875a08ab1e483bb7fa645c661b9f10c72c947bb72
e3aeb7d78d7c4cf1abf7f7cbd7ff334f380c1114bbf14effe9406b3851268ce3f40c5a8b31daf37bc54a130e0ed1ac796c73e933e08d143eb9fe7c32270b3ed7
0f2e8de697109f8db12377f22c79a2fd2027732ffff68c81f594cf781f73fa1c3bf5e8f79fe94ed795045a1ed9207f3fe29e4f10518fe72b7d0fc8f001ededf2
0aeb3edcc3f92ff74c2021512e21d52d8d7ea07573f602e11d858cdb6a87f369c75ff982068acff614e7b372b3c4f6717cedcd9ec30b71616530728e021c0fe6
52ff2430fb588fef337ffd140c5cf982eb3bcb1226bf7687c7b01bc1c9184ffe94bfef4b70e14cb6bbf765638edfd7c2937f1290877ddbdcabf67b06f338a631
f33e1cfc0ae5e3fa049520e708c10a44e114ceb7f9b3e34efac3ecd5e7e19ebbebdb9f80628724afee78099c3edf13e0f51afe77d18bdede8d9f8dfecb19670a
fd27d4e01c7cbe75cbf13fd064eebcb419ffb0091d5ef3d5d7fbbcefeb3e82fb3097f65179c1fe9bebffecbff7cafe6306e469fdeaf013e329c5f55e8d788115
43ff8fd16ebf2b79f0ee9d97c701118cd4a3e5eb01f1e6eae215f1e4c17202c4f5709edcabfe12157000bf601efe16f2094ed8779ab3081e17ff72706eefebbf
377f06be4ed9f85c70f74c6fbb8df2a54f906010c1f6df806ba708e736f0fe28c283fbf243fd7a87f5c6ef8e56d724bf5bb925fd510bfb3f7dbd7fe5906bcb34
8c4c87dbc3739777f111cd1097e50f68622efe23f9b2eb70701c91f1f888e1fe5ceac7a36fa89f70e10048ff19740ce1f9ba395eb7d501372f16ffae2fbf1fdc
7f71ebe10aa7d28ffe28263366fe8efbf5081f2824cd0ad7f52bfb76d71fac2e58a06ff0d0e5cafed78be1f507fce30dfbb7d79f79b6aafef283db3ff1f685d1
805cd07470a348c9d91d8061552fcfd705f091bfaa26cbf46bda6f350a5e3305a34c735fbb10e5400d58543ac30ff35796ff504acf770770ae834580aefc1538
e931cb28e97c0e14af1ebcb3887fb38e10ef59c85bbf6f48ecf148e7bfeff4e7dbd7ee734606ede0e997bb5f361325c79c3efec7015f00f7671ec931a01fef58
35a717ce8fc6c8abb772312bcbf263023da1774b771fa15a4059a97bf3079af20bd3341fa1c5d344bdb49df930e734ce598fe8efedfb0c7f92edf7b8d0e5ee7e
edc55e3e8beb727b2e7d36ffde5b67c0e57805ab25d78391f697f0a88f32d3040d583677187f18ebd074716c450f233b0088edfb72fe829d1b761b73b90721c7
bc0e4b701fa139be7922fc7f8dfa1867d16fbe0cebdadbb467e4a02505cb788620a004ef3e0e6338fe2204ec16b1e070f35112f53f8158c6df405d104f10ade3
a5dd19f3b20af65c1eb092cdadc319bf4bd503a1f8dad7f6dbeb0f618369e5aa5a7b16c09fbf730b730fa8ce7124ff81ca295eb45b1488f07d836c66e0de7d18
f38716bf9bbb015c37a61f5d6fb1c4fb9c2c50a282cb1f6fb97d4344a70558fb9d8b65df0497f6db6a607d855eb916275a6fd0c1dbd649732c6ef8660bf4bf13
09e12bcbf0883ef25cf1cd2573eef42af189c30ce732defd1453fedcdd3eec7ef406747e61b7e3e64eed6cb4fe733dfeb260f414878330f838a41f61318839e2
be7019b071c31c29d1e6107ccb14dc297f735312cb0b36f819fae0cb94154070cf82bdef3baf30fe040c205ceddb2ccb06f7f06febf7979f71fe0d1afb7b14df
c5f35e5edc534c0892af7638a43964750a1c4ade08d2097c9bdf734f597c390fc323d59b1c363019cb566c00fef6bbe6b03c5fb48a706f16cad0c3870873411c
f1c1064e8b0caeb85f5cf50f6deee30d98c366ae14733fa1072bafe73f588877b88a1f20799aae4e5d5cb35f0c64de18a9dff5edc7c2c1a208f290fdce34e30b
30101e51de7dd5358300fff86fe1cfdf60defd16cbfd12700fd23a479f6ea12b0cb81faa4ffc68da9227be2eda3df57b788f9f38ee1417241d5f38f87dbf03ed
24103bf301b7fffecefefa16ffee30de8e06d36997f017115cb7f1aef003fdf39787af7a06a81277d8368f682f53ad267f4fb79136dfee510cbd7fb14fff324b
77faf002feb4c66e0e3eff91dfdb6cb77a1fe92fdfcfa2afe76e7228bb4cd772c578c7d67e7cdf77509c7d1820ce14d70fe8251bd9792bf778bf9bf10b2c787f
d7680917f7fcce70d1ce3860cbb9dbce7e207d7373f6e204306384e705f0eb0c80ff7688701ced74c7e5be2ff2871e504f090620fa527d758eded4cbfdf757d7
9f6e687f3fe3b60f16cb04d08d449f1ac716bbd13528f905d344b38ae108afecd780bf7721fe3a87789fef1c3709ffe34ab63ec0430643e7d01fdfd05dfecfd7
200d706b7f7185f1a8fbf1d843edfd07cbf8cfdfeeb9bcbc919fec7e40ed2ed7d18918604682f7aafd17fbe67e744d78f32a708d4edfa7f5fd57f30d993d83ed
7debf79b7876dfe9308719b775d4df93096e516c38116df629fd18340ade211f7fb1afdf29d70357c7f36f7fbf332fdffcd00c30c1082106cbebdb5e870f103e
93cd4a46ef30d670b758828cfdf7801fef6fd36cbfa9cbb1ec38c7e800599f7f7d75ffdeafa08efb40b6e05fbfea7d78e0de7bc7b89b738fbf17c5fddea7d29b
6cefe5c31fcaa77e37308660df51c90c108031449c91d16ea8ddbde66c110068edfdfb72d08f0a6febf01fefdb7720f4642cdf0cb5aa7720e3510c68f0858b3d
c7616475872638ecf02afbf28aeb3d87fbb01fefaf934cbf660864026f30120cfe37c3fd249fe108260ee03a9cfefab6efe7f1a9b37bfc12edfc28d7ae70252f
efd34647c5fb16e77d1f9d140f77bb85fd5eecd33c87f3b06f1af374b1c60aa00edc9ae7fdfd5f6fefeab72f14b3ac87667fd1458f69efdf73fc52edfc40c68e
14f4fd7c3f7302374af1ded14f143fbd7585fd9fa30e976cbf990bf4b16589f00de7d1d568b0fe2b39b0b5fd1ce8edf25397f37987777104b18029afb2a3e914
dfc9beb2befe67dbfbf749afef960e0e042f10c19fce004f12c9f75436fcedf337b7f9d001fc7713f10002b7fb9b884edbbe3338f244fd7a187fbe4f0c5c59f2
2ff02ecfed3dffcddfdfc509c7001cb764faf053b7fbe7ec1fefe4809f041c9fd5157b7f7625fdda80f683f1060fc28abdbfffcf295ef586e30c38f9a87ec9fd
fa401d71c72cefdffa516ffb86b7fbb1eb49cf67d0fbe086d293e7ee069e9ca96cdf87cf5814d94a6572f9f3eaaf5c715019e37fa16c76168d8af0fcc9f124f6
69d43d784f3f8bc2b896ef41fcb9c7029d0d3d30d573afedf4aa85ef5538ef79fcc81053dfe04f7e93d8b51d8b45e74fbfd8affde22e1f76e0995f769951f212
f383e43c83b65fbfd9936ff00fcdcf1aa8714ab0eddf88f200db76d15afd395d781a5afb7ca30d43f90c76dce86953fec15cf9a5af1cefd0145a7285e63edce3
a9103c415a576dcd53e7218c881084d22daa4069db401870e94fa08f1303fe24e305f8f066803345f9017fbf246d9e0ff0971d142ff848000540475e8c414242
72903dd75aa5dd16177bf3ca1c31b9a4ee9a638247a66e074d14e98d13a3f762882816fb4ba4c6f1fe71aab5a0f9b5c643ece0f7ce842000e8f2509c76ce00bc
61b3341b6810ef102f56a0ef13fa90c584e2b63e7a600a55c7c9a3aba0884e17bb3580f588ed4279745c0103d180ef0054e56cef07a44ed3efc2de351fdaf470
e51c5534b32255148a7d70197976a3806219ad171a180ec49cbe5f364fbfb8114f8eac0974a2f2e2fa02b6f21d3ef99c81419bce1a6c7f95b1242840c624d40b
9037a56c9f2791e74df92c5b7c68e4668edcde81e3b26df642437acce336af1ffe32324de9af14eb6d3b77a8914f6fb8502948f45006fe9bea6d1d13ab5fc884
698f6d222c59ed14a586eb30084846db0308969c44808699ed4d8b35360425342dcdc2fe14b6324b2022588d136ac7c1adec04591d98385b38b5013af2155348
8e331727d72a9a620fc5177e20228318a5b70ac884cf4e9c00bdbb6eb796f2b49e2718aef418f46c9392580d7dec55688ef0a41d871997f5c8d764ffc0fd63e5
2169e96ed4c44f306ebc63179289c1d8764f36212dbb3b3be7f46c38c553b38197fd6724a0abce9f71128e5742595f07c5e2343d347da09bdf9054d125f51367
0409b7e1a99e1df0db85f56049cd16ee71cd24f2697794f34c66718d197dea3237bc8f9babd0caa745642dc1c938bda1caa7994f8743d63ee97c13cb0627405d
00ebf2c893ae711c8ebf1bb3ca194a05ed949c3ca5f749783b6ea6f9f0a68b8a8a7e176afee1515525348347932ba9ffb8c7e7f7a310c031d4b7cb56b06e549b
89bde2f4c53d7957af07c564d5e60a22137f1e2c999178a0abf6336237f15f3c8f308c146a3d5c005ec6a52051371afe33d560351da4a77864c5134cd3ba3ee7
c8e9797a5771a6b25991b57d635a922f3c22e1dae455d7cb8a950516fa1fc5890909ce33e6b608448aa8b23e7dde62708e37d6cdfc0816dc93e48b556d94cec4
d83e56d47a4696fefcf04058f07bcb3b1daa5b868d3b823a22e8cda521430e8b0e8781a348c6f074afcb98bd9aae2dd51fe6e1d85ec36e8c3dd205e6be8bcb05
3498a2a0e97ca34cefe94b952510baffed68bed6b84532b5724f58cc830a8d2be815fdf66d26eec9cc66349543388963327933724dcd5927560135b279f832b1
da9f1a3e96d77eac88327a701ea6a5070a74a80250ca6a66d33346ccc89e29848589aec185aa3ab09235e2eec23bd7b43cf0592ade14084fa64f66388d419850
996fbc8d2aa79acc14e118351e33128c272a423421624314933d5a7619cbb16c180f6ce7c7a695b910f4226361630e7fa67f9270606e5e14c47c12b7662cb494
213da596c5aaf6827a90b9b13d2d6e1763dbd437c6f13ac5f2233c8c2de8a887fc30e5e9ae9d6dcfdf1b96c8b8db9987786852ed59ba665d0a3ba1d51ccdaf29
22d28dc2ae91cf2a1f17d7f4ae8c8ef29cf3b9f3ea90c36f01976765bcf82ea1eaf195aece8ff5ed5406d1c88901c8525e19238eb1c2cf82025d639a07fb2ae7
a812b8dd63dde297c058f401e86cf732f7b3592df0dc0baf24e91d77c8701bd403e502e9889e1a17204fb4087c138c7e827b36ed8d12804f7dda223b54e5f56d
24ffe2904807348f98bfd3191a2ea4aa3dd99ae7b60dcc67e12b8038864de4667b610d78e9c9a9f5924fbf1ba130acf36e74963f9fca9bd2d2872f7aec82bfd7
5902e48a4023242a296d80c3ba5f349a9887caaa4cda85bda2ce05cb210ec5c333d5b226999788cf57e6ac27ed7ad2c4e7366bd6f8af11d5aada3d12148a0a76
c4c4ce5d8f1d7b520e02c047ba0894c65f4a656d7594d991069c2de01020bf2190bee5bb35d8a77c58deed8af7a3a8aff0df9ad6ada758795d6fde595e7453c3
f8dc5ee54c6be949a1c330c485a1fc95b496975ceb6df0d90f396c7f2d452759c3a856c98008def3a8776b73b760f3a469adb22ae16cc98935339a84f18254aa
a01b6925b4dd4a76b23027db7c5b919d69de48589bee5bd3faf83be8d5443d3149119f3e86c5616466764468a6f6ec2ffa1dba9344352d1995ff967c9b96299e
fd073c8364a99382a4b66c83e52d2661bd54aca2ecf417df61b0bc44526afd6ad1d84fa90971d93f2abf14d1a354cae3c4629a34117c38aa80eed4b638ab30d3
b9a17d9efe5d4fb3ea0dac8bfb39263fd2813f95aa46025797960d8ca8807d04fec6171f60f02bd1e70674a30178accff3ec390562e0ca88a553773765b0bf74
5b4b0e83b32be5486b66aa88043bb35ad3b459b29dd8278a553affc201d10af355207ce5b129dd0b330833071741ae48361b8524a8390fe1ee3b7dac6f8e019c
15617972436bbe7915c2a3b68d3520a1bee75835205d788b3a0441793d1c9b31d8b801d8995259f489caf0ec463fca4393457cc896b992a41926e4d95c1981d4
fa3376cdeaaf631eb3a2daf83b74232de78d7e369e50dac83fd99aa4e33d1f11708a0807115ac9d2da8142e6849b12b5d29add43b33b7460a8621c493ff0563c
fc6a9c82aa597ceff95ffb4b66856115d4149c90b8df8b328025b2c4dfd152c16d10761d61027d0caa840bbcc6ca7caf6ecb9243d15c9a356dea5d712dc89031
67273e27db3aa434ac588c49cc53260c95f3ea992f8e78ca0ecde517b82773e99a092812079b4b5f8ad37544a856ddbf15d27fa67d8f39583478277d66f2745b
ebf5c3cc2ba5bdfa31797a56d90f3399588b8962179572ea79c5e40d70b8074af7ce7fd0b533b6ea97e6cb57e16ca0076c4a6b5be1bf78ca61f0c63322c8346d
5d7e39a51f67dd19d87e9ad245f8a17c5bd149a9f30b2fba5340278a903478624b3191035d809eb05af86e4e8c17dbf5795cc038a73af19cf3a34af43ea2a36a
213d76ca760589ad6d631fbf6cd548c239d25040c6207c02ecf45377ecc2f32e07a6b147d2ccaa3c8335396e137ff54fa04e706b0ed674bd53cc252d023db1b2
b64f6dcebd65b154d310ee4e1799bc2f3a98850c6dfd4fde1c26e47547bef19e5340e17917cffc82e36a1ea8f480cafb93aebdcdc8b67a2b09e24071d895836b
38deb135d65040e8cc8d63c15418bc8680324d70bde6bad1aa4e8ccda82dfa83c5258443cee85553b2d2582d3a1b6ff12f14ebbacfe49de6b23d1d2a735d1849
5d194bbc563c7191e62f1dccaa3b75c0d66151a1d8288f707cd3e64979603ae54afc11f82b22eda2393c8111f057f7048afa2416e2b9a93093fb37661bf4913a
e03a942da9aeb281785c9c8b0240ad65a99e23a35274cc32c72e2f3a763085926fa9a2b33ee72881060972c3f99d9f2c6955743f7ae72a7803e8e88f4ba0f954
83e0726f54712a2ed6a30641114cfd888e81f76a2c16b72c5c9c4c43de517b9ce47aa2a12d7bcb777c8d2a085fd3b504eacf69af3dfd5ed7deaa4a659096378a
__label__
cccc6cc6c6cccccccccc6cc6c66cc6c6cccccccccc6ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c6c6c6c66cc6c6c6c6c6c6c6c6c6c66c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c
cccc6c6ccccccccc6cc6ccccc6ccccccccccccccccccccc6cccc6ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
6c6c6ccccc6c6c6ccccc6c6c6ccccc6cc6c6c6c6c6c6c6c6c6c66c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c
c6c6c6c66ccccccc6c6ccccc6ccccccccccccccccccccccccc6ccccc6ccccccccccccccccc6cc6c6cc6c6ccccccccccccccccccccccccccccccccccccccccccc
6c6c6cccc6c6c6c6cccc6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccccc6cccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c
c616c6c6cccccc6c6c6ccccc6ccccccccccccccccccccccccc6cccccccccccccccccccccccc6c6c6cccccccccccccccccccccccccccccccccccccccccccccccc
cd16cc6cc6c6cccccccccc6ccc6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccccccc6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6
6016c6ccccccc6c6c6cccccc6ccccccccccccccccccccccccc6ccccc6ccccccccccccccccc6c6c6ccccccccccccccccccccccccccccccccccccccccccccccccc
c01c5c6c6ccccccccc6c6c6cccc6cc6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6cc6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6
c01c5ccccccc6c6c6ccccccc6ccccccccccccccccccccccccc6ccccc6cccccccccccccccccccccccccc6cccccccccccccccccccccccccccccccccccccccccccc
c500dc66c6cccccccc6c6c6cccc6cc6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6ccc6cc6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6
61105ccccc6c6c6ccccccccc6c6c6cccccccccccccccccc6cc6ccccc6ccccccccccccccccc6cc6c6cc6ccccccccccccccccccccccccccccccccccccccccccccc
d101d6c6cccccccccccc6c6ccccccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cc6ccccc6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6
510056c6c6c6c6c6cccccccc6c6c6cccccccccccc6c6cccccc6ccccc6cccccccccccccccccccccccccc6ccccccccccc6ccccccccccccccccccccccccccc6cccc
0100136cc6ccccccc6ccc6cccccc6c6c6c6c6c6c6c6c6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6ccccc6cccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6
0500136c6cc6c6c6ccccccc6c6c6ccccccccccccccccccccccccccccccccccccccccccccccc6c6cc6c6ccccccccc6cc6ccccc6ccccccccccccccccccccc6cccc
0500136c6cc6cccc6c6c6cc6cccc6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6cccccc6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6ccc6c6
050551cccc6c6c6ccccccc6ccccccccccccccccccccccccccc6ccccccccccccccccccccccc6c6ccccc6cccccccccccc6ccccc6ccccccccccccccccccccc6cccc
050551c6cccccccc6c6c6cc6cccc6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6cccccc6cccc6c6c6c6c6c6cccc6c6ccc6c6c6c6c6c6c6c6c6c6ccc6c6
6d0551cc6c6c6ccccccccc6c6c6cccccccccccccccccc6cccc6ccccc6ccccccccccccccccc6cc6c6ccc6ccccccccccc6ccccc6ccccccccccccccccccccc6cccc
0500136cccccccc6ccc6c6c6cccc6c6c6c6c6c6c6c6c6c6c6ccc6c6cccc6c6c6c6c6c6c6ccccccccccccc6c6c66c6cccc6c6ccc6c6c6c6c6c6c6c6c6c6ccc6c6
61010166c6c6c6ccccccc6c6c6ccccccccccccccccccccccccccccccccccccccccccccccc6ccccc6c6c6ccc6cccc6c6cccccccccccccccccccccccccccc6cccc
5100136cccccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccc6c6c6c6c6c6c6c6c6c6ccc6ccccccccc6c6c6c6cccc6c6c6ccccccc6c6c6c6c6c6c6c6cccc6c
610101d6c6c6c6ccccccc6c6c6ccccccccccccccccccccccccccccccccccccccccccccc66c6c6c6c6c6ccccc6cccccccccccc6cccccccccccccccccccccccccc
65d5165cccccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6cccc6c6c6ccccc6c6c6cc6c6c6c6c6c6cc6c6c6c6c6c6c6c6c6c6c6c6c6c
65d50516c6c6c6ccccccc6c6c6cccccccccccccccccccccccccccccccccccccccccccc6ccccc6c6c6c6ccccccccccc6ccccccccccccccccccccccccccccccccc
6d5501166cccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6cccc6c6cccccc6cc6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cc6c6cc
65d5055c66c6c6ccccccc6c6c6cccccccccccccccccccccccccccccccccccccccccc6c6ccccc6c6c6c6ccccccccccc6cccc6cccccccccccccccccccccc6c6c6c
60dd5d166cccccc6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccccc6c6c6c6c6c6cc6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6ccc6ccc
d1d1d15d6c6c6c6cccccccc6c6ccccccccccccccccccccccccccccccccccccccccccc6ccccccc6cccc6cc6cccc6cc6c6cc6c6ccccccccccccccccccccccccc6c
6577d15d6c6cc6c6c6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccccccc6c6c6cccccccc6c6c6c6ccccccccc6c6c6c6c6c6c6c6c6c6c6ccc6ccc
6c76d15d6c6cc6ccccccccccc6ccccccccccccccccccccccccccccccccccccc6c6c6c6cccccccccc6c6c6cccc6cc6c6c6c6c6ccccccccccccccccccccc6ccccc
60dd51516c6c6c6c6c6c6cccccc6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6ccccc6c6c6cccccccc6c6c6c6ccccccccc6c6c6c6c6c6c6c6c6c6c6ccc6ccc
66666655c6ccc6ccccccc6c6c6ccccccccccccc6ccccccccc6cccccccccccc6c6c6c6cccc6ccc6c6c6c6cccccccc6c6c6c6cccccccc6cccccccccccccc6ccc6c
dd77d15d6cc6c6c6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccccccccccc6cccccccccccc6c6c6cccccccccc6c6c6c6c6c6c6c66c6c6c6cc6c6c
556761153c6cccccccccc6c6c6ccccccccccccc6ccccccccc6cccccccccccc6c6c6c6ccccccc6c6c6c6cccc6ccc6c6c6c6ccccccccc6cccccccccccccccccccc
dd5dd1dd16c6c6c6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccccccccc6c6c6ccccccccc6c6c6cccccccccc6ccccccc6c6c6c6c6c6c6c6c6cc6c
c67761153c6cccccccccc6c6c6cccccccccccccc6c6c6c6cccccccccccccc6c6c6c6cccccccc6c6c6c6ccccccc6c6c6c6cccccccc6c6cccc66cccc6ccccc6c6c
d777650516c6c6c6ccc6ccccccc6c6c6c6cc6c66c651cc66cccc6c6c6c6c6ccccccc6c6c6c6ccccccccc6c6ccccccccccc6cccc6ccccccccccc6c6cccccccccc
d77765055cccccccccccc6c6c6cccccc6c6c6c6c61dd5d115cc6ccc6ccc6cccccccccccccccc6c6c6c6ccccccc6c6c6c6cccccccc6c6cccc6cccccccccc6c6c6
dd77771dddc6c6c6c6c6ccccccc6c6c6cccc6c5151515100136ccc6c6cccc6c6c6c6c6c6c6cccccccccc6c6ccccccccccccccc6ccccc6ccccc6c6c6c6ccccc6c
5777771dddccccccccccc6c6c6cccccc6c6c01515151510013105ccccc6c6c6c6c6c6ccccc6c6c6c6c6ccccccc6c6c6c6cccccc6c6cccc6cccccccccc6c6c6cc
0d66d6566c6c6c6c6c6cccccccccc6c6cc6c105d516751510013516c6cc6c6cccccc6c6c6ccccccccccccccc6ccccccccccccccc6cc6c6cc6c6c6c6ccccc6c6c
1677771dddccccccccc6c6c6c6ccccccc00151515101dddddd5501cccccccc6c6c6cccccc6c6c6c6c6c6cccccc6c6c6c6ccc6c6c6ccccccccccccc6c6c6cc6cc
5777771ddd6c6c6c6cccccccccccccccd1d1d15dd76d766115c5150016c6ccccccc6c6c6ccccccccccc6c6c6ccccccc6cc6cccccc6cccccc6c6c6c6c6ccccc6c
c6777711666dccccc6c6c6c6c6cccccc5dd1dd167766666c6d1d50001ccc6c6c6c6cccc6c6c6c6c6c6cccccc6c6c6c6c6c6c6c6cccccc6ccccccccccccccc6cc
5ddddd0101d6c66ccccccccccc6ccc5165d5167777777777775101011c6ccc6cccccccccccccccccccc6c6cccccccccccc6cccccccccccc6c6c6c6cc6c6ccc6c
6677771d7c5c6cccc6c6c6c6c6c6c5515101dd76666c6657cd661010105c666c6c6ccccc6c6cccc6c6ccccccc6c6c6c6cccc6c6ccccc6cccccccccccccccc6c6
6777771ddd1c6c6ccccccccc6c6cc60551d7767676767657cd66601515156cccccc6ccccccc6ccccccc6c6cccccccccc6ccccccc6c6cccc6c6c6c6cc6ccccccc
76767655dd1c6cccc6c6c6ccc6cc01d15dd76d76d76d76d76dcd3d05105ccccc6c6ccc6c6cccccc6c6c6c6c6c6c6c6cccccc6c6cccccccccccccccc6c6cc6c6c
666666666656c6ccccccc6c6c66001d15dd76d76d76d77666661c615111c6c6ccccc6cccc6c6c6c6c6c6c6c6ccccccc6c6c6cccc6c6c6c6c6c6c6ccc6c6c6766
776666615d5d7c6cccc6cc6cccc11010d76d76d76d7676665661c65015156cccc66c6c6cccccccc6c6ccccccc6c6c6ccccccc6ccccccc6ccccccc6ccccccc676
dddddd50d7d566c6c6c66c6c67661d01576d776666666666665661153c001d6cccc66cc6c6c6ccccccc6c6c6cccccc6c6cccccc6c6c6c6c6c6c6c6c6c6c66766
776666615d55766c6c6c6cc66c6c51dd5d6d566565656565657655dd000151c6c6c6ccccc6c6ccc05cccccccc6c6cccccc6c6cccccccccccccccc6c66c6c7660
50d5dd511d167667666c6667c610155065576d77666666666565656500151c6c6c6cccc6c6c6c6c6c6c6c6cccc6c6c6c6ccccc6c6c6c6c6ccccccc6c6c6c66d0
776666615d5577666666667661151d5dd76d76d7566d65d55656c63155dd1c6cccc6ccccccccccc15dc6cc6c6cccc6c6c6c6ccccccccccc6c6c666c6c66c015d
dd5d56d50551d77667777777775101d56666566d65566dddd167d167d1dc0cc6c6c6c6c6c6c6c6c55c6c6ccccc6c6ccccccc6c6c6c6c6c6c6c6cccc6c67d0d56
777777770d550551d776156766156d766d6761ddd5dd6d6056766677c5d0056ccccccccccccccc66c5c6ccc6c6ccc6c6c6cccccccccccc6cc6cc6c6ccc6c1515
66666776566c0ddd1666d157760055d777666666651555116167d677d1c501cccc6c6c6c6c6cc655d5ccccc6cc6ccccccc6c6c6c6c6c6cccccccccc666d75001
6666666611511d16766765566d500057776676ddd505d51157766cd511575d6c6c6c6ccccc6c6615016c6c6c6cc6c6c6c6cccccccccccc6c6cc6c6cc676d1d00
767777765ddddddd7777666671015516dddd7777660001115ddddd776d55dd66c6c66c6c6cc6c6111c6c6c6cc6c6cccc6cc6c6ccc6c6ccccc6cc6c666c6d1d50
ddddddd615dd5d5d66661dd77661151d6766766d510013d567767676765505cc6c6cccc6c6c6c6ccddc66cc6c66c6c6ccccccccccccc6c6ccc6c666c6d601d00
777777770d760055d777d6d657777766667761115110001ddd55dd5ddd510166cccc6cccccccc65dd5c66cc6cccc6cc6cc6c6c6c6c6c6cc6ccccc66c6c601d00
dd5d66d1015dddddd777d6d65777776666d7715d11d50013d5677677c5d0056c6c6cc6c6c6c6c6055167cc6c6c6c6c6cc6c6cc6cc6c6c6c6c6c67c6c67611111
7676767655dd5515ddddddd65777776666d76d6551566ddd5775666665165d6c6cc666c66cccc1101016766c6cc6c6cc6cc6c6cc6c6ccccccc6c6c6c776d5500
76766661000100151515151d06d66666d666ddddd566666561676655d5d60116c6cccccc6c6c1015500166666c6dc6cccccccc6c6cc6c66c6c6c6c666661dddd
dddddd515ddddddd555d5001177777777757776666d76d65d6577777116551566667c6c6c66001d1560151c6c6c6cc6cc6c6c6c6c6c6cccc6c666c666765566d
666666667777666661676d661dddd65dddd76dd5dd6665d50ddd1666d100151c6c6cc6ccdc05d5dd561d5d666cc6cc67ccc6ccc6666cc66c6666c66777765d50
77776666666555510013d5675777777777ddd510015dddddddddd5dddd11d66666666677c61d5ddddddd566667c6c6c6666c6667cc111c7666c6c666666001d1
77776650d576767655dd55761dddd65dddd76d6d76d77777777777776615566667c667c661dd56dd566d51677766c6ccccc66c6c606d51677766666676001d50
77776601551d5ddd010015151515567777c777667ddd515ddddddd55d5500117777c6c6c755ddd17566d6556777766666666666c0555156d6777c7776515d665
667760555155d5dd0155651d5ddddddd50d777666100015056d505515175d0dd6777777666565656ddddd56777666666667777c70555156d6777776601551d00
6666d155ddd5dddd0111d5d666ddddddd115501561110d51ddddd5dd617775d77667776c611111111150001d77777777777777775777d5677766666001d10001
777766666d6666666515556666d7777777666665d01555677766d51055dd5567777777770005d5dddddd55d567767677777777775777d567776666100d6dd5dd
7777777777777777610d6dd5dd515155655677776661dddd1111111111505116666666100d67776666615d55776677777777776ddd766d5dd777d105515511d5
777751d65dddddddd0155567775d10155051151d6766766666d55d55110d6d6615667d51556677d1d67766750051016677115551d776765d66d51055dd550566
667d5177777777776ddd7ddd65566d65d55656515ddddd667677765ddd05d5d5aa5666dd77777777777777771155ddd7616666115dd5d55666505515dddd1515
66666677777777776655d56776ddd5ddd1d6066d15555515dddddddd6d501114aa45556775d776677777777777766155116777775777d50d505515ddd65d0015
dd5515ddddddddddd105d5dd66155055dd5515ddddd6dddd7651d51d6d50d615aaaaaa456dd776765d6661ddddddddd56015dd6d077761110d51dd60ddddd665
dddd5577777777776ddd7d77771d60d5d05155661515dd5177656666777661d54aaaaaaa56776675155d6015ddddddd7d15555d5177761110d511676dd76d76d
6ddd5577777777776ddd6577765dddd555dd1666d1001505766167611111d754aaaaaaa4a1d505515155776677777777776d1776d777601510101676567655dd
515101dddddd66666d5665656d5575515ddd576761dddd6d65d56666d161151aaaaaaa4595dd6666615d55155d1dd56666661d5dd76d11615d677d6656665055
110150ddddddddd55055157777510101555551d65ddddd7d6665d6755d7d511aaaaaaaa55d77777666dd005555555555565165d55d5555d5dd5561665776d5dd
dddddd77777777776557d5666655d555d0000566d155dd6d6761ddd5dd7ddd5aaaaaaaaa50dd5555555555555555555555555165505d50156d5d66661d7d5155
5ddd51d667776666615d55d66dd5ddddd05656dddd01667d7dd55dd66d71551aaaaaaaaa405510155556767677666655dddd015151d5115766577d6dd675dd7d
7777777777777777610d6d577666610001565777666ddd6d6761ddd5dd60151aaaaaaaaaa5d5ddddd6d76d76d76d76d7776515d665d05517d66666665775dd7d
777777777777777765151505d5015111655156d6dd55dd7d777567666d75105aaaaaaaaaa5777766d6776661ddd15dd76dd51655d5dd6d6677677d66667d5d66
667761d666dddddd515676d66615616551561d66ddd65dd67d01661d766154aaaaaaaaaa5d5dddd6777755d677667660100d6dd5516d6657d7676676667d5d7d
667d55dd55155566dd7777d776115d7d5057d7d777d5517d77d16d5151654aaaaaaaaaaa56615ddddddd550115551115dddd1111657d666666667d77666ddd6d
7776576677777777d5d77655dd000151101665d66155517ddd656d6d665aaaaaaaaaaaaa56d55055156d0d501111dd555555056d657d666666667d77d7715d7d
777777777777777765d777501015611101d76d56751115dd6d5d666665aaaaaaaaaaaaaa5556d5666666665576766d676176677d757d776666667d7651d05555
d5ddd6777777777765577661d6d06160156677dddd5055666661d76dd4aaaaadaaaaaaaaa5655065d50055555555555d016dddd1d5dd5555555dd55515dddddd
7777777777777777777777765ddd61601566d75001515dd5666dd6665aaaaa54aaaaaaaaaa56d5555155d5dd5055ddddd0151515556dd55ddddddd5501676676
777777777777777777767775105d615ddddddd0d6000011150500015aaaaaa4aaaaaaaaaaa565555100015151500d1d6565515ddddddd6666666666655d7654d
7776d7777767777777777761dd555167651555de611111555515dd65aaaaa5aaaaaaaaaaaa4166df66dd65d7776677667777616761111155555dd55515dde4e4
55dd55156677dddd505511057511515eefd5dd1d60d515dd5d016665aaaaa5aaaaaaaaaaaaa5566dd5ddd5d677d1dddddd66d10555d5556777666666d55ee4e4
77577755777777d11555dd55e45e4155ee6d5555555555555555eed5aaaa5aaaaaaaaaaaaaa5a56dd5dd6666777766667777655655de6111115555d55d4e4f4e
761d75156d5d5d5001515dd566451515dd6555d5515101dddddd5505aaaa5aaaaaaaaaaaaaa5a45777777777777777777777605661111015dddd66ddd505d5dd
7766664d54e4e4d5444e4f4ee4e555dd55e45e41451515ddd4d4d4d5aaaa5aaaaaaaaaaaaaa5aa5666ddd167777766d567776666100175561d667766d51ef44e
6fee4e4e4e6dee45111111115551151505d65dddddddddddddddddd6aaaa5aaaaaaaaaaaaaa4a5d655dddd0151515765577661d6555555015ddd776615566667
fe4e4d5ddddddd5d055055151015554d54e4e4d544d44d4d4d4d4d4d5aaa5aaaaaaaaaaaaa5a4566ddd55550000001555676767766cdddd001555555555dd5e6
d5ddddd5dd5151511005d5dd55dddd5ddd5555555d4dde4fe4e4e4e4e5454aaaaaaaaa5aa445566c6d15e515567661d6555555d155dd6dd0dddcdd6d151dd646
d444e4e4e44e4dd544d4dddddddddddddddd50141515dd55d5555d5d65544aaaaaaaaaa5a56766c76d6d6d77dddd6776ddd5ddd100151515c6c6ccd1010015dd
ddddd5ddddddddddddf4e4e4ee4e4f4e4e4e4e4e5555defe4f4f44e454aa4aaaaaaaaaa51677c6666cc66c6666666666c66666d155ddd5dddddcdddddddddddd
dddd455d4dde4fe4e4e4ee6d555555555555ded4ddd1d66feffeefe65aaaa54aaaaaaaaa566d6d6d77ddddcdc66cc6c6ccdc666d5c77c6ccccddddcdcd6655dd
dddddd515ddddddd555d5d55155dd55dd5edeeeed4d46ff6d55515dd5aaaaaa54aaaaaaa456c6c6c6cd6ddd66dd6dcd6c66c6c6c6cc6cdcdcd6ddd6d66c76d6c
4e4e4ee4e4e44f666656ef6d5dd76dd5dd6665d5d4d566451515dd655aaaaaaa54aaaaaa411d6dd5ddd66cccdcddcdcdcd6ddd6dc6ccccdcdcdddd6c66c6cc66
e4e4e4e4eeef6f6f6776776651670055115055dd000151610d6666665aaaa4a4554aaaaa415d6c6c66c6c676d6c66c6c6cddcdcd666c6dcdddddd55c6c6cdddc
5ddddddddddddddddddddddd505116cdddd001d65511d55055156ddd5aaa1115675aaaaaa116666d667ddcdcdcddddddddddcddcdcddcdcdcddcdcdd6c6cdddd
6666ef4f6666666666666661ddddc66666d1510551015ddd6050dd5d5545d667775aaaaaa51ddcdd6cdcdddd6dd5dcdcdcdddcddddcdcdcdd6c66c6c6cdddddd
ddddd5dddddddddddddcc511677dd67c676005d5dd555555c666c65665551677765aaaaaa51666c666c6cdcdcd6dcddcddcdcdcddcdcdcdcddcdcddc6ccc6cdd
d6ddd5d77766d66d6ddddd50d76cc66666d155ddd5dd50016d6c6c66d5dd1d6677159a4a45d51d6c6cdddddddcdd6dcdcddddcdcdcdcdddcdddddcdcddddcdcd
6ddddd6c6cc6cc6c66c6dc6515d6666666151d666ddddddddd1515c6c6ccd15dc664555555615dddddcdcdcd6dddcdcddcdddcdddddcdcddcdcdcddcdcdcdcdd
cc6cdddddddcddcdc66666d155115dc6cc155dddddddddddddddddcc6c6ccddddddd6651015dddddddddcddcdcdcdcdcddddddcddddcdddddcdcdcddddc6cddc
dddcdcdcdcddcddddcdcdddddddddddd155065d5dddcc6ccccc6cc61cd6c6c6cc655d5dd6d6c6c6cdddddcdddcddcddcdcddcddcdcdcdddcddddcdcdcddcdddd
cdcddcddddcddcdcddd66cc7c6c66c6cdddddcddcc6c6c656c6cdcd6c66c6c6c6cd500dddddcddcdcddcddcdcdcdcdcddcdcddddddcdddddcdcdddcddcddcdcd
dddcdcdcddddddcdcdcdc6c6c6c666cd6c6c6c6cd66cc6cddcddddcdc6c6c66c6cd105d5dd66cddcdccdcdcdddddcddcdddcddcddcdcddcddcdcd6dcdddcddcd
cdcddcdccdcdcdddddcddcccdcddcdcdcdddddddcdcdcdc6c6ccc6c6c6c6dcdcdddddd6cd66c6c6cdddddddcdddcdcdcddcdcddcdcddcdcdcddcdcdc6dcdcdcd
dcddddcdcddddddcdddcddddcd666cc6cc6c6ccddcdddcddcddcdcddc6c6c6c666cd6cdddcddddcddcdcdcddcdddddcdd6dcdcdcddcdcdcddcdcddcddcdddcdd
ddddcddddcdddd66cdddcdcddc6666c6c6ccdc6c66c6c6c66c6dcdcdcdcdcdcddcdddcddddcdcdcdc66dcdcddcdcdcdcdcddddddcddccddcdcddcddcdcdcc666
cddcdcddcddcdcdcdddcdc6cdcd6c66c6cd66dcdcdcdcdcdcd6c6c6c6c66c6dc66cddcdccdcdcddddcdcddcdcddcdcdcdddcdc6dcdcdcdcdcdcddcdc6cddcdcd
dcdcddcddcddddddcdcdddcdcdddcdcdddc66cddcdcd666c6dcdcd6ccdcdcdcdcdcdcdcdd6cdcdcdcdcdcdd6cdcdcd66cddcdcdcdddcdc6cdc6c6c6cddddddcd
ddcdcddcddcddcdcdddcdcddddc6cddcdcd66c6c6c6c6c6cd66c6cddddcdcdcdddcdcdcdcddcddcddccdcdcddcdccdcdcdc6cdcddcddcddcddcdcd6cdcdcddcd
dcdddcddcddcddddcdc6c6ccdcddcdc6c6c6c666cd6c6cc6c66c6c6cc6c6dc6c6cdcd6c66c6c6c6cd5dcdddcddcddcddcdcdcddcdccdcdcdc6cd66c6dc66cddc
ddcddcdddcdddccdcddcddddcdcddcdc6dddcdcd666c6dcdc6c66c6c66c666ddcdcddcdcdcdcddcdccddcdddddcdcd66c6cc6cd66dcdcdcdcddcdcdc6d6cdc66
dcdcdcdcddcdcddddcddddc6c66c6dddcdc6c6c6c6c66c6c66c6666c6c6c6c6c66c6c66c6c66c666ddcdd66c66c6c66c6c666c6c6c6cddcddcd66c6666666666
dddcddcdcdcd6c666c66c66c6c6c6ccdcddcdcdc6cccc6c6ccc6666cc66c6c6c6cddcd66cd6c6c6c6cdcc6cdc6c66c6c66c666c76d6c6c6cddc6c6c676777776
__gff__
7543ce7a701e8e74beac8414a1c5dcd4b5803140d3906ab504aac316f1acb1b39132a7c9c207961bd143280dd0179274edce9066efd5661dd685dba21548c7f44e2af21e5670d7364771f60ad06bb5724f30312be22363803adb7ca6bd550bcf6c22c0d9a9842d25dd620c137913f3137ec9e9fa3851c53f0317124a1b697ea1
1813229487377174b91481a21c12aff524aab0aba4c0386d1d708baabf89770de8f99342dc7d856f71c020f7c2018f5c3bce49048137753ccf04a3f6915942c2dbb15d9b2e57341d39bad8174b71c9d529cc5a439fde827b7dfb8ae25644931135780f274b0ed95943b421faf91d661dacdaf703ff38ba6d0e81ccee54d6aab0
__map__
bdd2b81029a3ad4578aab61d966a6cd09352bc1d90e2a004bafaa077b0c6596e1a703dee35e7218af5c9ad54517fb955c4e1e4aca6625182c4fd0d561249b63b5274883e9432ee507728cc7f6ca9c37642d1985186f507c71a5eb92c3a0e1b5fa8751464c5d83339385f891e9cf1e2d4893db306755cd7b05a931cc6491ed903
c710e356fab29d9f484d3190c3794747917f61ff565bcfd26f2ff46d155b845c4f5c64f0b37dd38ce404f118c340380f91e214a1ff52ca72f5fdaaf654ff2eaf1da339d2f29ada1703b03f96764f5d6aff589aa421e9a7e34ba575e76524f0ca660b1e793e20422b6af1c1e3300fcea96db75882b9ad00b2a694af8cec816b89
42584e07e94add9f60c645f49ff1ce76277c4dad2fde51dc963aff3862f7a32608ed1f6bd331519f805e4fdbdce644a0c4dc63be6737398a804ca0bf93c4fb31b500159f37ca421b8de7a36d036123d35f454578c873fab990abcdf13476a72d9b60b1e5f28681105ce5c765b4c3cdea17ca9cd210ecb5a62d5820fd7264b0c7
f4893fedf353d1363e995fc8e7557b34dec3552e4294964ac7b69ee5800493db7d9c5688e9c412830091d966a73aa8d4bd21f7584ca4beb6e35eeb8fd99c3b17e525fa837e07fab3e9fd9b22da6f6c494d9085f34759388a2cec4dcc98bfb2118efa24a69ecaa50a0869841e9c60775d993cfb486c2722cf4a3cea48e75c3d0b
4b71c73c8da9090ea92fdb55b5f43ad7b7a97e38326f5785d699b1a729a31dacd895c97e11a5aa32963c3f510faee2ad22712b784ef058ad368dc4af29ab345d6c41acf99cf80ea4d0d83fef4f67e179dcb69196479917469026f53c8e63e9d4f9eb60e5d1966669c6b2d75a93eed4b89dc5e3dad08b3fdea0883a949c200c62
1bb5e71eda964369d487c96be330afcff7e2b31b8c9469c534e25aa7af2c2271d1b57e3cbeeb6c064a3c157ac91a6c27997a1691be47f93e3441f3c00fc820f58c43998722ca34dd79772d1cc44fa90561b65f257d0d88c4109ac406ea0f2d0ac002db3929a1b4e119d93be88140c849d2c8deb378bf9ebf691a4ca5154c2234
49a9cdd433b2525aeaf2fbc490858c11409b1f34926f072952fd28dfa3322e6cff493e2f69502ee78dd97c60b2147e3c039f1af6d4797be158f678792ddd80e74de1b228163a6fbc1c50d26c8e6444e3d28ca3fdd342cf1fc5f7a9c012fa2963e5caa3d0a642ea350ae7476e4c917766d06b2e3a9b74bdee2e9adcc734707f0f
9d40f83e0981190372e86b8e83cbd74e6266b62e4b9341d4e25de428bc9ad47d5539e3e7156031da09b0bd27a876f2f8bb5ead9e3840fd3e5d2f4ac0a84653faf363b38da9f19d12658b5985edbc289d2fef12203ffad02e22cfb29809aae139a7cfa53914d38a8f8d632ae27547eff70b4e8134532c7bfd5e6d6f0015a5024f
5257e4a8d62a225aef88640a69c35cf5716aaf677908a3180c7a2675cfa5495e8603883dd365a1fc5b3d4649671a0a7300a8a7b58c245969daf3b5757410b4e95bb8b697671e9d3b5e05f25ccb1042b8e08d4af60d50e4ab6267f157eba5e763f4a76dce17991da92aa91df1adaa05ccfc53d0dbb088ed6be52163a5dbde40ce
0c59fd9eaddc8e49ddc397c62a711599d93ec40913112ae542e9598c054fa0e9e5837f1d7f362fe1272e14723a05c22d2aad30fbdab92ab9e7732658a43dc91a737b74d4b4beb176eb87cca1ec99b28026f924725d14280992ef89a2c1f7ecef0f90d38f44329e6acaecb705934e1c44a83115d1dbae8dcbe2ee7c3fe5cf1982
4e9b2faf06596ecf89f8ffb511c7d1af4a55fe11bdc21fdb9668d3b1a7507a52a0ebd4d2f685bf6ff53890e9badcb2a1013516d5c4b9a1df32d51cb1445b9569c5dfce37db3ed45f37fe1fa6c2e938f55215d083cc3497fc503e3cbd5320bb06c60318ff1e3613d470c581f9207914e2db992401660c058ff92222d15bf36f78
a7e41ff833addd2fcdbd998621f75755a39c37827882b029c8264fc7ba3ae69c16a780bc5505e738fad6dedbd1b98572267133f2e1795f3ff874e5a269ec48639be8a7adf7cc8e3b3dd3cfe1bda532da1928f3e9de4c7fe66075a86d8f44b0843e64d619c6bf5f89f7a9b2e322fcbe152e656d7d1b4e7ad4d4c9b0358f33bf0a
3fe664c08f0698e49a71abd7890f14866d9dd006aa9155c6e7951bbe225da32cdc2f67a175c7f8be105518d1ef9bc96af4a789a59f8e3519ff5fc2676ceffd866fa2cf2043c6297f96339e63f8340a92e7f5be78dc27ca7bd1576fa331770da2fe567ffaebf54dcb2e5a032b7c4a07681787a2a7a54b62ff3d6a05e5d149d641
1cefb411c627d06af1cfe683f31c183cb46815fcd090dba32d7938482f28f5fae630c2d4ef8f986a096545dcea03883697e5c5193fcf447381671685a8b7dea9ed7d25f141f8b4b2f63da81d648bf881a719cb205d79abd4c9c34f007777f0197091f8fb7577f26309f3b147fba29e496efbb945e82585fb47ac32f272891f4d
f22eb88728f85b78945ec06ce82c70f6c38ee71efd2eccd8474e2af8795cca03bdda85a748050cccfdde59bffe4dd4e9b015bfae003de4f9bdbef28ed645f39d0787e00f1a77ddb25a023367dc6ebe7f87b1d613a6c78659facb70d7566496dd35cea7a497f267bf69427eed8e71d9f4d283409d1f9d3bee57f165327b73dc88
19286921ed10595845fee90aef2c0875fa06f1301257c3b7b24a3b6e2806522349dcfe4fe3b19d00dfbe8bff65f158505f99b60b66d53b790339657822c963d709f5a454164d3067db83275f0a1671b02b2d99dff9b9ba69873b4fe71ecc52d3fc488bd9b96d3eeba57ef38d3a08b71f58113e2144f6d2b02bb834a629fefd60
aa7a17aca06469bc769400958b6d7ea60be3f77980e5ca4262e84dbfd7345e64be3aff1e55f7d325ddce63faaccf85510f80c7bcd4ff9393799f05eefb6eb9f45b5360cefcad8ecb3cb8e3bd85543e9f71f399430339d1a5d20e1ec91ed3c75926c0d2c12186d23e57ce7eee59c12cbabf30fdbf377c668dc2352c020f10719e
bb7dcf814555bab417bf407e349aee679decdf0fd656b11cccb393f40be4c43a942d06b699b810cfd2bbba6a6b7844781a35cfcddfbf6238ea3dbd9b39a25f6843bf9de5e88e2310f0d0d1020f3d53c83e03955c56217a8fac41f84b5d505b16d68327d7f14f04ad7cea97843f01e8973fd24eabb50036f9971b80f322fe92ed
53a020df2f68c2a2413c797d2ffd934387bf79bb88ae10dc755ce6394093af4adaedb47efd697c15fef68fe9a56738d86cf500bcca9bf7586e95959ef60b6abd782bf4c8de6c0878f1e9da4701f89a74e2a3ef32af2cf3b0852776a68539a23f8d88674352e77d27fa67ad1e07b2a9efd709ccb89cd64f2d7d4ac81f6f8709e9
baf370e5a7852caa2de3dfc1d49a5297c58e6e3f2cb4928157dca554206d25773fd4084f6dbe055b702e1ec84820f1f177ea9b894fe0fdd3a4dd6bf4e24d6e131f6bd0a3f012fd32c01974644b078ca3b9ab3d28e0afecec3d7d75df1335e86451004ea6d5459e7f44e8b5ab767bc91ec874a032304725500397abf01fb822cd
e3c3a1e6671f7e07c31ade4fd2404907dea1b65ad35c4a9bfc3d2038571cf3e2658e95d35244b660b1e58bbc3bdf68c88760a9bb76eceaf009fc2df6221ad64e93c15418c347d2bb667b48f0580caa655d6a3a8db9813c9f3a87cee02fb7d2c50b6d8087f6f6d86296a4d8fc9b1345da6e5793f6d46abd792cff14d1394baa19
0ed5fbfb06033e9a71233ce043f0bc28362b363703ac952c5f3f65f333b6f817b011a4d3f9d09d98ae5cd9cd8319bb124952d5d89ef5b2a31efe1e8d39b3cdb9c70b2da5f169bbaaea78d81967bcd49eb345ed69687e0f7e8f666fb98c68aaa1743fc8ead668be84eac3ef70da5bcc7536a6507d38bf3af0d05401a7ad4183db
cc7274c133cd236ba545ed1b90e11efc9230f8d5b48b238f6bcdaacf016678ee34996fc04d337981d496bacbd5a4bdd65c2c5683943bbc35aa215fab1395c377ef7d75d9c8203f0f52c0595dc33359b6f8be3f430bd56516e64d37b216aad84c197aad680eb15036a7cb55da59d25c62d8479673b9f0af61c36f38a04683c1d3
7bfbc9a4e696702f67b6d6f884566e3d9ce34fa19e69a2dac7a3aadd2090238f79d5e04fc915e569af2755db9473f2f8f792a5ea19c46e0eadb3ec344966797c5a3dcb1bc2efa4960fe1f7ffe6a09b25fc7c53a5515f7171487b7ebea3acc6be06fce486cffb1bf73720be52459fcfb02d58e3682955824d9319753872bde1ea
914f1cbc18e7ccd99c606183e84e7bb40021073ee7c58759c59ffe73f03180cde6f84be86247e2abcec1d0d51d2afde6ce7c8609b7204e925b6e2d1f5f664002ceb151fccd090262def08af4187dfc4d5b2d6461dd7542859926f395bd3e2b78fb39cf4333b4e1ad563283a802cdc9b05745edc5377083226ae9ceb73c4f0eaf
91ccc7714951d12f8dafc724bf46a33c527cbad9ae0bf0a705fdc3afad697ea4695ab4bc7d2fb1e701c26fa8c365c5463ed03b83dab7ce953cf8a5f9f55c032168664a17eed21b8838557f7e7f067c42d29066a3af68722359d64ba1899aa453cf4f6a0118d998a533dc29faa31e6d51a6734bd062098f9a7ae758550db10a98
e1f19bf67fdefd620d34f5789fb1ec09fb92fa23c8a4b998c700ff6ad88cec805780f03cad4db0d0148604a4aabdda98a8f2e40aa60687de2c3bf6ab10e3a0329d87a347b189e4ac59cf52e4515d22908834ca831e6f1013b6abb323f81da75986729e9232c8aaddc4c09980126ccabe0a4ed89aa49b56d8eb69c70f07249a99
470907de4a7863fe8efe6e02169f805b9d49113da2ffac86428baf37bde3a3516b50f39169324c06e72e0ec0809e8f5d33f2217fddcf8254e072cd38b6e8fdc67b3877ed16223eac37c20b2e74bcc39fa6097850d55207ad89f3147707f3623a47009ef929e714cf530827f3dc3d7b688ec07eee56f49e254ab585b603d29ceb
bea010a95fc78b83e3293eee9fca52fcbb516d404f303c40d6369c2a4d7565d198e91b4953df0182d860aad2856e09256cd3797fd25492327679ca3b202d681bd79f19248c5d33ee0dd450286d241611190e1b42708aef38ab646950446cb3e4f24be3c32390ff11bd29a7e5776c3ea2d7f6de68b63bcdd8fd78383cb47e0b5c
7145efe2d0be74d4a319232799b809c65f5e49b1ea651ca41ab103efd6c37fe106c24bd33300ed192eb5e95682657835999acb3b3f74f893295c304bc150d037d712897789ac00531f1b478d81c2afd518319b811c7a433412443c8e88a19fb2edaaf671b853d96095c6d57096f49017ecd505ed09c8e39830c55b903ad1bf69
37a3ecace057cb435a5181241b5044695613a4229e24136dab4d8d32aa267581502c427134bc5055931a8f52bc7a8cff3e590fba0e0d1a4391bb9a97111dc58e2725fd6f4ccb8a708f680a6104520752a5e861f9d163d0c31e516a433126a860256d9f23802702270a0168c67e594ace9c5c9277234d11105a94e00687d5d0bb
06a78e8bfd3ddc034768684ea1e2c34a1220e40c187a070eae253d3e9d05bf6fbb451e71705e73a87083b0ebd13f400833d6644f9590c4a4291b69b524fc85d7f0798798d7e7624ae11687237836a588edc9777023acecdd7b85150ebb532a4187219348d173fbb72aad921ad2529bd948e89a250d92d380d8ee67068cf8165e
__sfx__
412e9ee31740a172571b34e375410302c2414e290433f4732773731137071420211709511171012414214422140340706124641235321321e3e452031501d37a1641a2873e1e0161842a372491e7080a51a2554a
01c648720a24b3a4171867d046451c6290730b320191f00e0b1112e511063593937431122086160874815308324310e0210c7660a47c0c33a01111367781307b230570514e1124412569197072a3030c0530851b
e98bc6e80e5680f01e01105184743b25a0452c2a343242050912f3b30e2b7251f4212443e38058044320911c1a4272e4611802a0403d0a16a3d0103816b062643e10c0e7012b5103122a2f414155461220e10720
31a1cc9e18422067120f61c21265254660365c273642d40b3e11d164370942b1e620090732233c087060a14d295111d07b1c72a076180b71f2e37d31140066442b4690947d3610e2f15d1a45b1a7380e2100220e
dcc36591023411e153042181a16535438370171214e3e25d2834830127381423805b002163b309267083f64d3970a037310d660145413272e1543a3702f2916b1a5403f101002753635e383381f419331262707c
06b25f83281770e23d321653f6640214c390632c51528026076522115220542336131722d3e3111623c2170a0363f196160e5223240d37229232481d44431444260382e44523044030100c67b2a3100f34f2f129
89022656320741920f2a529017092e36132273014520045b3621d2a2132a2230c343126060274c1d43d35740352423c75f1560d1c44c2f0492f3443e1443702f0e00e267621842a01619300302d11d1764013765
762b0ec01f1682c70e0964025651302251545907412281103025e3032435769111263a6451631c3b444125612b76328236224441e67f0f26b3e2181645a1853c0624b390081a237201711343f01526026370706e
382891a72832f1c264300271a5580564230138337170c4670e636256221306623312364103a1101c23205720273063c02017050215741e32a3922c395530d0481e749124401403406618331740f00f2e74b3864e
f03d4f252331b2f0500614e2e7611f3343c6281a11c097433e21821568161123a3463a037177290454622340256230342e2674b06109017433e360134172840a273302203b00669090562c46009162040450a01e
ed5201212004c1c0792326c15179371033440c2d108115380a72c0a13d260553d2233c4130d2173854b25427291283a2172837c250690f0183a24719560302333d43d383132416f0861703406031403b1113c243
05adc4fc0e51425359172342561d291080b0531c01d3a61704105022533e36e3500d2b46d0052a125013a11a1332925044206270a3100e47a1e07c07019000520611b1e60d2913a052470a51f0d438035520311e
4343f7ef234360370a2d11505209115410741d1e2051002c272142e765117772c7720873c3114f3513a3235a2a2050052b274291451c140041b301005473d5071922e2c252296542400e12659327040c3061850b
4e083bbe0e4231910e355233110930014083530d01f1320f3c24b093331754226277041630e4643d23c0177d3372c093673a4150551e0a14e1734a294020d65e24427362551f11d3e03223574212741c11725041
003309292761f044461012c2b554050582302c0f018182541b76404117220733c1713e150215253171a0a241393631144f0b710082251d57524046050552b648046550946d07621153271227128153105060c029
ed615b521f06c2635d2a4081057d0a23e35649231351a0621c340035490e5572a059061071f7262205f0213121646185251b6443b353183611052814229306622576f2155520118121020d602367090e55b09123
fcdc8c2909243187163f46b0d351024162a17d091363e00e0a4310354c101563c0482b548163130602234410305283c00d002222e2053c7413b6442d5581214f3514e1732706356286083310c153132f4500111f
f07cc0ef1870d3212d2c263073492440401269303042b52d031172811e30738091492910c150303b1070a4761c7512f22035433203220056d2b30c1277c2e2411111a0a24b224770a500394060274b1a64009538
e0591e8a0f41404409003601810c0d459183600511503521091280d113103510a60012449335332434a2d4063c142144052d5283c5130217a2442d18017286182756a1a004062040c1281b73e0455e3923836411
9ef43d062211c0a20e3962e0e7421c2282804310320006110217a1e77c0f730324520542d2122714145352110473422633210591c65a3e207383371875c112790d62906305357262066d0140e3b11c1944d10346
ced1757206255234700477e30027172031d22402505071470d4712060523123193071c7532264634062132740814f0515c1176c0517a1316d172513a0201f714135671450c151382c27f1011c0b44b3f61436528
90c0dc733b0411a32b214622e0341b11812549346431c2282a5491d7601511c1a6120016901305321472827c14579153082e65a0063f064752d7691d4311c11e2a62f0d30c0d05a13520330563e2133e11d2e13e
a29b1cde04649331413d10b263163c7321a55e0814f153003b40d32445120703951238375094642642b11017381710d0651c202384490f3433c50e367020575a0922d2a629116341202121011072062d04529104
9da6e0192001c2307b1e1610903b016112053810151023112b1442205304448134220004d390463310d162262311d1662b122080b52130225291020e4382121e2c243152560b150274401c438374541852a32306
76a312283477c211740350a132183414e333033652125478066170c76d3614d300400b1100d34a310422361c3670a343052840f223543b022000670734e0b07f2d3140811d34179032113f3670e60e1765e01717
3570b12b0974e390623c422337393a1203c42f3942c140271336505435017533165c1235b0226d334342815a320461a6023f7372e17d024780f37b126651b2283f3013c0522541204076047282a5413216f28720
1830af3c1625f2a03c0c43e232722622c2913e0020d0e60022441301001e0121a6181037f0e1223e3033e11525215232572042e2c14a3f443184111d0110802b2271e2a349132280a1613e2390e2442421229263
0c86434a375630516e1a711093430865f1552c35416102132530003174040253253e0311c1001c1a05e082281f14e0814834010062292e746207112e322282721c41928674310601d7102a56223505380603254a
41bec36938118064300546120371314322c10f281112d5443041b1941c2a0661514c3c04a3002a011611b75a1054b07467211653066b0d1151746c1103c0a230183402d6350f7441a4291453e0213d006502b50d
981207101345b235071912e0e16139702365601a66b0f12c1115a0760a2060a0e52a226432a4070a3410763a1c42b146732c74424251165361a5483352207346130203c5200200e2144b2a02711177244680b163
adad79712e5311a20c076003221c3e672357251977622657364503562c3565c3c4021e4282a00b2d2200d1641a50e2952711030344503f1591843c2b34d167162544e0a22d20376223473d1273f3741a41f2d35a
2cbfb6881d36e0072a1750a1543b2d66a0443c0352e134051c0371646a0465d1a73900301240270a11b12544255781230c3e4001717b342300524a281733853e104330b769013303f1171827b100702e30d29316
d4fd402c1252e114051750d1250a2212e1535a10008252750d4572a6093802606175016510a32a0f34a351122701919617226031c7703121d084401b5553101e2b25a2f01934211070163d50a046643410230572
06c1809d3b1492147e211153d512351361872a1233027230112541e2413076d2103b1e52c274151d7201d2252a1001217e1f03d206471220322577256633b60e1051b3c548081782b5112c427154180460724477
1e5220a2252432770235033134420d7381c3492620532063140532041d307000d7690720f1b2460d0720e2192852d26413044100a0061a60c2402b227473d761297700c403146030b64d1d25e3e352072690146d
07ac309a0141f0e01d2140907640150042b2361016d3c2271c71708130216622132b3b1782215108359266632c6072b40e127351b21a0e13b335143173c0d61629633076142d15e125141b0581b7142752a1105b
4192d4a5357430850d0641019761076583863d00060104471c6562537c2b04a02305282712855b05558291462631c36024057263c2660467025425190700725225708307543442d303011f52604044193083c01e
350c5512112602622a110590e3570a11608355310410427f3611c0c01712269303380420e2001e04060157021f015100081d7720e24b1c06a2436615243054402740c2b2062b315036141b556025682611e3e470
5c3d89132334a3d36d3620509526314092e342394372c5723764d1970525060374701b744005240f31c06064295751b15a0b148312673d06e25013360692714b09224044650f5312821c0f3610025d1803f0c449
88fbaa8c2f5580373d1811c15759223421c61301115267491057e001542f4182410e16522014441e24a0205b0e1373d65223470266041c643252030261a143773252a2d629284070e1363077431123067361d20a
2980268a3b2031134403306105031d3693e5283b0320d60e3a4701900d0e0172821c3301b164370605211626207123551e0d47a051380254909515186122c62d1520f302132b4111e033153110e52b0347d04533
b0383e75226590474b102632d103204541405b2a07e3f4711e0511e60f163780320f3d0290d67c100300625b0b24c3b276213001514a2112d27154107412a6152153f284232b46d173000937418278015600237c
400743c52721919046105731743c330291410c21520284271b243344620e52f39706285323256f021443841e0061410111144183326106055035202b27e146561942a2314c016630c7212842d2a365393060263f
41441a060f70d0e0470250b0815a1f4673f1030c4690841c3d7080e525237431534a0a529221160e4360975d014762e41f3841420561180161a0042901d002190245d0a0393563816141215341c1050840309533
13b150d63b228111133807035043194070474e1d148141390904922028057683c0140515e0235126611214691d20a15448221013012d0466c2c7570f02221502393250235f335603633b1e573174460855d19013
9439a7bb1f5643f12c0d4481b0401e50a2a5581f3581c4212737d2c734240400956b054062466c3925b384412707b144750f2352922b05253213022945e2161b023382a46b1654a23219232132072a1c55f3006e
2aa14a1a2a168226403b05b2e61d033151a41b2557a156312b57402518336620174d146062433c094143d6161a5391111e0177e2446619716167183440a3031d3002138145192531967410644133253751d39714
28843f8d0f76e2a0220501b130582b7253c12c0e1472115e06501112332f72222020294510d009166673b11c2d34d0a518174220311b36244033203646a395281a56a376322150e2a02c1a44a04548116441b52b
174700e12e17a1213e081433326b0d01f0805b203243b023117152c05215731216001f13a0460c0945730406212200221c2832c2a1752517922060091330a60620354046061424f0473c352322e00f0d7772861f
7f4ca3500d4141d74722428022532a07a3832b057422e1083f25a1306d295283e1291d23a0905a343210540d041160626515223200502f529346190d63a253001c24c3e22b3942d2227d16614316073b1741f215
c38f30970524b1032f0473c0470e0b6121671a352310351b13653100761925838142053750070b065683266c3e63c21105124303c3571462e0e606366191a74d17157365781d51439646397590455c0522a05748
c27078d50e5361060906320296742537027720224780054603111236590142b2c5183944e064181827405342213330b20f2f4431f05d30224124190d57d10260313113c1450e61d352441a0140b30d1257c1716a
489aa3323442319049277681e6051a3410e52c07148240363b21226615307430c118340690b47e153791d01e06104250720632e1f711197332b5541d20e1c61d3d534365692105c3562a36049042002c2783704b
944ef8ac2e03a2d4131b64b3525e34161062321a5330a65a12210155031c2433e43e1a0521a33b3a615311752232e1825d284240842a1561b01713385370e3010e4702525f1706c037101802c2d6101f2462251c
9e13decc2f61d3633b3912b2233c3f2710711e1023535666314350531d1005c04235394682e65f03700033540f4202952e293230c1712a0780e5180e2443f219142182a503123410177430249284363831922346
7a95b05516349093283741f1b76e304380914d1206e0a34c3c60b0820f215642d06e3204f1c42a29072046031114c30667226760e1432f21732329136142f1322951334238037072131a2667a2d1780132823238
b586f24f1843c1b6502a551263551b5782e64c21752184452f023104302d46601117157071830e32336085300c52c21654290423e0441c2022e3770520b140142d4532c5072f0743d03a164343050b120651c125
51491c611f260114242b0110e02103176384342e11314753383241c03f35232123521b13a2271c14702373071a2783075215421252613502b2252e1954c2525435536301252e72c2230d3d307274032e0190614a
d828101d2f1093b5490e2141227e3845d1944f124201a3483e172355483630819044231010247b2d22b3155c0252237068142542a037104321e2590e45f34709063441a021233122c5510a55837152190683a01b
8e621ce90b2570104f0374b2d2121553a116182a0682a001225183445a2626107751045691a4311a66f0a33f335651d3382070634767036083642e195061c569030371e3441602a3c60c0134e1923e106473762a
c1ef8b930906f156411a525054771e07d24305223660803e2a4740e0191414f3d4150d416180501a3652d5253a41505579006002d7441361d0b42d1247f0053c2a1430410d344213f1052b355026050572b3507a
ade981a30c04b083761b4200934d314130f1663d4160255425507144322d6173346128306252482c2201a7023860b3c0621d065216341811d0a117066392740e1013d2630f2e369116541005939001055550c448
e83e69a61540e3840e3d4542962e34007052511310912547304691a22d0922a2b15d005342d2323c72f202542a5272a66f2447533167106680866a2354a1a05217749167440457a281680461c1001c1c47134144
4f42c8f63c455292750927e076103d50b0e5503e421336652950e2a345221070531e1007518039087033a4603f2163512a3f70c34052116200962c0d567394470d45618514111291f63d3f46f1d1763f2753576c
__music__
0c 343d424d
0b 471a0127
0b 01043e07
05 10363f35
0f 65701304
05 6b734411
0a 19291879
0b 40484409
0c 3400372a
04 50170744
0b 405b2a11
03 76041901
03 2f00147d
00 44607511
07 1946654f
02 22410b35
05 2a6a5018
05 15264b79
00 32396c07
09 4b0b722a
0c 445b147e
02 6a426a21
00 7d0c1147
0f 1b570119
06 555e4879
01 3a7e1c66
0a 17097835
0c 2f285b28
00 22293377
0f 11622a5d
01 5c444854
03 4f584218
06 3b563d38
0c 1d6e636c
05 0c3b704c
0b 6c035310
07 0a641304
08 7d213d44
09 4c427243
08 6a22692c
07 7001301b
0a 72496a2a
08 57502b78
0d 7b3c1120
07 4b6e080c
0b 5f512b39
0e 48025e06
07 47481339
06 00484f13
02 75321800
09 68473724
0a 3913737c
08 3c77046c
07 1928721d
00 6251102e
0f 06680933
0d 735c3d60
0d 6a253052
0c 63432771
01 053c6542
03 35096260
0c 1d7b4a6f
06 080e7e0e
04 5c026c10
