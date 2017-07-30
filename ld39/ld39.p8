pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  ld39 toy project
--  copyright (c) 2017 sam hocevar <sam@hocevar.net>
image_list = {
  { file="data/world.png", w=128, h=128, tolerance=62200, scroll=true },
  { file="data/owl-indexed.png", w=512, h=88, tolerance=10000 },
  { file="data/owl-power.png", w=512, h=120, tolerance=200000 },
  { file="data/water-transposed.png", w=1920, h=32, tolerance=2000, scroll=true },
  { file="data/background.png", w=288, h=48, tolerance=2000, scroll=true },
}
current_image = image_list[1]
water = image_list[4]
bg = image_list[5]
facts = {}
global_rom = {
[0]=
0x3489.1faf,0x990c.eda4,0xeb28.5889,0xe23f.a6af,0x40d.c486,0xc5b5.50af,
0x8a8e.456f,0x23f6.6f73,0xdea4.8412,0xe6d2.3082,0x8c9c.5d5c,0x8f8a.5f13,
0xda54.bb47,0x9073.1d42,0x59d0.fd94,0x1e95.4361,0xc951.d4ab,0xa5e0.32ab,
0x9c27.7b5c,0xa7a7.3994,0x9a2.8c6a,0xd3af.ba3b,0x6634.a597,0x6f2b.59cb,
0x687.1ed6,0xb382.5b67,0x8dc8.c329,0xc77a.8613,0xc4a3.2eb4,0xda49.9f83,
0x2fac.c672,0x4bc2.84d2,0x61e0.50c3,0x7e64.ea65,0xa69a.4c83,0x3fce.9a7a,
0xa4aa.12a4,0x42ae.dcf1,0xa127.2052,0xafc5.5fb8,0x4c2f.09d8,0xd222.28dd,
0x8444.bde6,0x1a3.652,0x8f6f.b2d2,0x695b.1db9,0x4864.a2f,0x9869.16f6,
0xaf35.a6c,0xf6f5.ab5,0x855c.6c38,0x2895.2358,0xab69.3231,0xa7f0.8516,
0xca55.cdd1,0x9667.091c,0x411e.41b7,0x8768.9c17,0x458a.7a26,0x3422.faa5,
0x3094.c3e,0x260f.6138,0x5040.942c,0xcd5b.1d18,0xc22c.ccab,0x18a3.649,
0x1844.ae06,0xfc4f.8946,0x5d8.d6ba,0xea1f.f9be,0x4011.c5fc,0x7750.c378,
0xa0a1.4894,0x3e2b.8a8e,0x1b8a.716d,0x4ea.afe,0x1fa1.5a77,0x8269.a765,
0x20a2.cd2a,0x90cc.489a,0x4406.92ab,0x7692.ade1,0x1cb4.f1b2,0x9739.138,
0xa8b5.6f36,0x6c50.e5b7,0x59d3.9edc,0x1469.8fea,0x9a17.10aa,0x1c4d.389e,
0x7d62.38be,0x6862.d6b5,0xc2fb.724e,0xf11.532d,0x380b.d8a4,0xb651.a8d6,
0xc38.e7d9,0x5f80.e24a,0x31dc.b28f,0x3b52.76cc,0x9ecf.4afb,0x3728.6bb1,
0x6893.7f2d,0x38b4.90b9,0xe611.f871,0x320c.e9d2,0xf520.98d2,0xbce1.dca9,
0x2811.e44,0xf462.486d,0x6d96.a03,0xbf5d.273,0x18a9.d31f,0x1166.dc25,
0x347.25fe,0x6248.961b,0x921b.e872,0x5f82.de21,0x2d74.e396,0x32d0.8692,
0x15f3.d4b,0x5e1c.30ab,0xfa4d.4d35,0x33d1.be66,0x5bc3.1b4a,0x8922.11f1,
0xe988.ae39,0x9276.7c14,0xc2e7.0d2,0x3b9.b573,0xc4a8.083c,0x7bfc.98c5,
0x6d66.e72c,0x739c.13a9,0xaec8.ee7a,0xb6b9.4433,0x10e3.06d4,0x6f1.d58,
0x546b.4917,0x65b4.c5c6,0x56b6.b365,0xd0c3.8e9d,0x7146.eb58,0x2aa0.5255,
0xefc7.6386,0xb68a.86b9,0x9c54.eead,0xa639.3897,0x4211.4a36,0xf06c.e569,
0x339d.de0c,0xa91d.9d84,0x30f3.05fe,0x75b8.8301,0x6c4d.63e,0xbf31.d298,
0xbdb4.ebeb,0xdc56.a66d,0x91d7.d7f8,0x6d55.a438,0xb155.cc5b,0xa132.8434,
0xd746.de55,0x6180.e1f3,0x6905.2fa5,0x4c34.e9e5,0x4e8e.28ee,0xbf48.8e83,
0x6a82.9492,0xc118.d231,0x2b18.b04f,0xe292.f867,0x6f09.e668,0x78cc.6ba6,
0xedf9.87cc,0x24c3.5876,0x6576.096c,0x4458.dd64,0xb53.5938,0xa3ce.0dbb,
0x3085.c534,0x8e19.0a26,0x31c9.f44f,0x664e.55e7,0xcde9.7939,0xd686.6d24,
0xb85c.72f,0x9b6b.e9a8,0xa8e1.3063,0x6c25.5ea1,0xe1f1.c615,0xb986.da82,
0xd757.d6d6,0x182b.e5e4,0x17d4.2f59,0x416d.2d07,0xd871.d572,0x4066.f2e,
0x438a.982f,0x7c50.5297,0x3c41.389,0x2961.0afd,0xd876.5a84,0x7a9c.5ee2,
0xe08e.2d4c,0xb8b8.2562,0xe50d.6aa8,0x110c.ce9f,0xe12.2b45,0x386e.0314,
0xd432.6e47,0xe23.383b,0x6913.5afb,0xf14b.2d95,0xf721.d4cb,0xf08e.9a7,
0xa515.1523,0x62b4.351c,0xa5c9.55e5,0x7067.754a,0xe2c5.ee54,0x2770.f3d,
0x4692.2e31,0x1c49.51a8,0x7b90.6ce1,0x9242.8e99,0x15db.389e,0xda05.12f9,
0x752e.7e88,0x1980.f689,0x21f.a348,0xf1b4.adbf,0x3725.42c8,0x2a4a.9488,
0xbe27.1076,0xe9ce.1d35,0x3491.8d23,0xd845.c628,0xef16.9036,0x7518.3244,
0x2051.b164,0x2f5.163a,0xad91.c3f,0x91a7.5522,0x2a8c.2a83,0x3483.621,
0x8ebc.a6ab,0x353a.8fd7,0x95fb.342e,0xbbba.47ed,0xe883.c10d,0x6d7d.06fb,
0xb8c2.b3ca,0xbaec.073a,0x7948.2c91,0x77d1.8383,0xdde6.439a,0x718a.3a96,
0x2bf8.19a4,0xaaa.b433,0xc93c.3cfe,0x10d9.c4a1,0xbc9e.55cc,0xf7e1.5248,
0x618c.354c,0xb573.6828,0x154a.e955,0xe80c.04fd,0x5e9c.9a4c,0x3f8.96a8,
0x21c3.56bd,0xf8a9.9682,0x25ae.b507,0x5b5c.5518,0xbcfc.1ee3,0x8b80.c938,
0x9051.b69c,0xf333.1d8c,0x2633.d6c4,0x4716.54b4,0x36ba.d271,0x560e.81d3,
0xa04a.c88a,0xcb1b.821d,0x15c1.d2c3,0xed25.847a,0xf2f0.ef24,0xdaca.1c22,
0x339d.de1c,0x3342.0972,0x11d1.442f,0x7a6b.6243,0x3845.68e,0x52cc.f98e,
0x5c0d.396a,0xa414.c6a1,0xa74c.1e54,0xe922.7526,0xabd0.369a,0x7afe.6356,
0x3ab5.255,0xaf92.7ed5,0x8d91.7e39,0xa963.ad88,0x99d7.2a1a,0xaf44.71d6,
0xc384.8c68,0xbf1c.c21,0x7dd0.90e8,0x5b99.4cd2,0xee89.5ea9,0x62fa.1787,
0x2a7c.169d,0xc2d2.bb66,0xe0c4.b1d5,0xbc21.c58a,0xd791.2c3,0x8afc.34e8,
0x7fe.91d5,0x1644.a8d3,0xf137.1624,0x2c05.e4e5,0x1f6f.016,0x3fd7.6f94,
0x7cde.5e45,0x5f27.dd78,0x9737.2109,0xf5cf.89af,0xd505.9909,0x59f1.75f2,
0xb383.eebd,0x5e5e.5ca,0x47bd.767e,0x8d8.cdaf,0xd374.78aa,0xad7c.b3e3,
0x136b.ca85,0xa112.af12,0x6d7c.bcb3,0xf75e.6e7c,0x9b9d.08c1,0xd092.8d76,
0x9d8e.be59,0xa948.4254,0xf2bc.df1c,0xa337.9b22,0x9f19.57cd,0x7101.e86b,
0x61c7.91f6,0xf3df.f975,0xeaba.bfb5,0x8ffc.9f22,0xeb95.f378,0xfe0f.43e3,
0xbeaf.e2ab,0xd9f9.64fe,0xf9e9.78d7,0xeee5.afcd,0xf1ad.4bf3,0xbc66.e0e9,
0xe36b.cdf9,0xf83d.09f3,0x5ecd.f9ec,0x7079.6801,0xe7de.b215,0x9aae.c765,
0x1901.38f3,0x98fc.d853,0x5e1e.59d1,0x3f01.9f19,0x3d67.f959,0x7171.ee5a,
0xd53a.d15c,0x5d50.62e3,0xcceb.d14e,0x61af.459,0xc059.c2b7,0xbb1a.d005,
0x3cb3.af01,0xe3e6.fe76,0x5c71.ac4b,0x2c38.e7c3,0x1bc7.997a,0x116.6296,
0xfcc8.ea26,0x6c5a.4bc7,0xca7.c359,0xe0da.5e6b,0xe3f3.118f,0x3c33.72c1,
0x465c.2116,0xf86a.d603,0x2e75.86ac,0xd214.d0ad,0xa893.9bcb,0xc522.5d08,
0x29bf.2cf9,0x3ebe.3f7b,0x4343.ab3e,0x143c.24d9,0xcd46.bc7c,0x199f.4b5d,
0x73e3.ae3f,0x35b.0369,0xd8d3.7595,0xdd41.f063,0x25c9.9e3e,0xd9f8.e679,
0xe1ae.3edf,0xbb03.6973,0xdcec.7cb9,0x3a1.a74f,0x8f67.e974,0xda7e.cff7,
0x31c7.98a8,0x7cb4.7f3e,0xae59.a71b,0xe59f.165f,0xe9fa.3fe5,0x6f96.7474,
0x7c7b.cb1b,0x66e3.e77c,0xc62c.ffc6,0xe5f5.9567,0x25d0.b363,0x36ef.de0d,
0xae88.7755,0x7f8f.d23f,0xb040.33fb,0x58fe.8ca9,0xa9e.22d6,0xff9d.763e,
0xfc7c.397e,0x68a.966e,0xb7ba.027c,0xa51d.e671,0x913f.58f4,0xf326.7e34,
0xb9f0.1ad6,0x2eaf.42a4,0x13c7.81cf,0xa32d.fee8,0x3426.7ee1,0xc73e.231f,
0x6e3.f33a,0x77d7.6e7c,0x3e1e.be3e,0x884b.c9c3,0xf1f7.63d,0x1175.0fc7,
0x7dc9.12b8,0x509.9f02,0xd534.6d5a,0x134.f8b9,0xe5c.366c,0x80eb.0e4e,
0xf0ca.68e3,0xb095.c4f1,0x6183.3b29,0x95b3.4203,0x790c.0a79,0xa7c5.a1af,
0xacdf.92b6,0x9490.6b46,0x8449.e0b8,0xd2e.1262,0x3c6b.de3d,0x9f04.f71e,
0x8367.9cfa,0x1487.f59b,0xdac7.1efd,0xa684.7567,0xc0d9.e5fa,0xc23e.9fc1,
0xd57a.cfda,0x861e.87dc,0xe671.9f4d,0x45eb.9fe6,0xd0f5.de99,0xc107.a189,
0x79fc.d9f8,0x3380.3212,0x67b3.fd8a,0x32f2.2a51,0x5976.79f,0xf53a.3326,
0xea1a.cfe9,0xd302.d791,0xd080.9b32,0x95e7.b4d4,0x3b69.c3c,0x9d7a.cd1a,
0x31a.6cf,0x6df3.4184,0x54c2.e5e2,0x7fc3.3c06,0xa375.e352,0x29c3.3cb3,
0x4e51.b778,0x60aa.f9bd,0x5ea8.53a6,0x602c.f2af,0xfe18.6f01,0x9218.1a3f,
0x.0ae,
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
world_x, world_y = 0, 0
scroll_mul = 0
owl_page = -1
owl_mode = 0
owl_x, owl_y = 10, 20
fly_cycle = 0
water_cycle = 0
function _update60()
  rnd()
  local image_width = current_image.w
  local image_height = current_image.h
  if (btn(0)) owl_x -= 0x2.2
  if (btn(1)) owl_x += 0x2.2
  if (btn(2)) owl_y -= 0x2.2
  if (btn(3)) owl_y += 0x2.2
  if btnp(5) then
    owl_mode = 1 - owl_mode
    owl_page = -1
  end
  scroll_mul = (scroll_mul + 0x.0018) % 4
  world_x += 0.75
  world_x %= image_width
  fly_cycle = (fly_cycle + 0x.07) % 1
  water_cycle = (water_cycle + 0x.03) % 1
end
function draw_world()
  local data = current_image.data
  local image_width = current_image.w
  local image_height = current_image.h
  local n=1
  for i=0,n-1 do
    local lines = 128/n
    local srcwidth = image_width
    local dstwidth = 128
    local dst = 0x6000 + 128 * flr(64*i/n)
    off_x = (flr(world_x * (1.5+0.75*abs(3-i))) + image_width - 64) % image_width
off_x = 0
    skip_y = flr((world_y) / image_height * (image_height - 128)) + i * 128 / n
    blit_bigpic(lines, dst, dstwidth, data, srcwidth, off_x, skip_y)
  end
end
function _draw()
  local frame, page, off_x
  draw_world()
  palt(0,false)
  palt(8,true)
  off_x = water.w * scroll_mul * 0.5
  blit_bigpic(bg.h, 0x0200, 0x80, bg.data, bg.w, off_x % bg.w, 0)
  spr(16, 0, 60, 16, 6)
  palt()
  palt(0,false)
  palt(8,true)
  frame = flr(water_cycle % 1 * 12)
  off_x = water.w * (scroll_mul + frame * 5 % 12 / 12)
  blit_bigpic(water.h, 0x0200, 0x80, water.data, water.w, off_x % water.w, 0)
  spr(16, 0, 88, 16, 4)
  if true then
    off_x = water.w * (scroll_mul * 1.5 + (frame + 6) * 5 % 12 / 12)
    blit_bigpic(water.h, 0x0200, 0x80, water.data, water.w, off_x % water.w, 0)
    spr(16, 0, 100, 16, 4)
  end
  palt()
  local owl = image_list[2 + owl_mode]
  frame = flr(fly_cycle % 1 * 16)
  page = flr(frame / 4)
  if page != owl_page then
    blit_bigpic(owl.h, 0x0200, 0x80, owl.data, owl.w, owl.w / 4 * page, 0)
    owl_page = page
  end
owl_page = -1
  palt(8,true)
  spr(16 + frame % 4 * 4, owl_x, owl_y, owl.w / 16 / 8, owl.h / 8)
  palt()
  cursor(90,120)
  print(stat(1)..'%', 90, 120)
end
__gfx__
87c9ded7fcf6c195a78dccec27ded06d9c293150c38885800708934608114150e3ce2c9953980708824d468a4270b1b790aabe0dc34c7067d18401a986bba618
6147ddb81af75c2b3e66d1aaf0d2b69d430df03798fa94c137342f0306ed7f3fd7faababb94e8e7f6f7a911bf55dba7febfdfbe5535f1c70b0850c20610b0850
c20610b0850c20610b0850c20610b0850c20610b0850c20610b0850c20610b0850c20610b0850c20610b0850c20610b0850c20610b0850c20610f673c78f3ff3
95ffcf778fff59f72ff4f7ff74fbff3cf1c2df0eb7f38f0fbffb7f1c7ff38fed70f1e70fce3cf0f2dc0cf0e38f2e78b1f3cfcf78e7d8fef78f30afcf9ffed7eb
4f9f743939fb8f163ea1ff6f3cf71ff7fb7fffeb772fdb3ffefffdfefffefefffafebff4fdb76f1c3bb2902fa2397a0cf871b6c26d85ca1b85361b6c26d85ca1
b85361b6c26d85ca1b85361b6c26d85ca1fe3ea1f9d2f418b9d0fff74f1d3bb147fef29f3bfffff4f623c7c43e767f1efa00f5aefcb3f1fd0a5af3eb11e99bf0
7f9e1abd00fb9f8e60d672f7694f7ed0a7ef63d6c2f0df9afff16d3cbf38534c0eec4cee7bf91fae3ef9e751deff591a9f64305f6fef2f2ffd8e72642075bfa0
71404cf620b606fa0bff3870f5aceff3344dfeed0bbfbf9e2f700e74ab170aaf7484addc521efd333f7c35f8bec7c739f9abd44bff578df107681e7977f7c484
8740e6e423044001bccf32dbff1ed13ce70a185efacb72151ec03c5fbf8ae084b3eadf511eb651001e3bbbf794c8ff845b4229a70884ef40e97c24411abf5a5e
fb504159510c767f19b228cddea9e0823efe22e54bcf767b38e0cf1c7c8453be0cf92d25f992bf965748fb9bdcce2fa3af33bbffd7992fcce6a65befe2b9dd85
850885b0df83f0923c974cc6b800276f73f7d4aa0f026af11e9502aa9de1c34d5c0208a1222509fbdfe83450abef99c7048531011f3ef1a1df86944706d45af7
344b189553c569f34cefb38b4f21fa0e945bb9395164bfb0a04bdb29f163b0b978f9f5a9f33c0c61cdb9d40eee380b378def333c88f38a39f8cb25fc228168dc
f340f07280d755742ee296764248f27a1c7539baf30abc694aa121f170174d7a1f6fa07bb96b611be4220c3ffec4bbd2f1f32640a9678b119c4fe6322039beb5
8bf772e78a6b933f7f143d45564d305c1b191010be9cdc919bb3f06a0017f5efafaa97ecd55f15d8b0dddfc6adae4cb9faeef4b904c1bbb16396e90f1ddd96b1
0ceecac97fb97b9fa8198924b12c2d2d74163bb2120ce85e1c432016fefce331c069b179195cb98e7cbe0c91efffbaa18836bfceb2613cdda301202f0edeaddc
f88ef259ae4c2f2b9785d626ffbbf59c2fd4b93e49bfc37eecdeadf952efff1485cfe4dffc743d637d50570bc7bb9010b3fbe81a568dd89c5dbe33a9038bf3b6
9f937f7ec2f3931aebd7d0e6f4b9e7f7e020b4376ff5a93bdfdf9ebfb1af161cb3d4fff386210cd9851a6966120336ffdebc0df359ff1933895f7aeba74f0c6f
753f6ff70b4338ef70b468e9668f8763df3b7bfd8994ffddbc0df7ff18d9e574799dff17dde3feec1df63b2ec642ee743d6265bbf7ffa5bf7ddf5bf04d359af6
27dd79adf796ab00262a6eb80e68e4f6667ecddfbecef66affa203f5efb47536ff5577732f1b1f536dc2ad90ff6bc1d796bdb6a167776df9f87e0207578d69f0
09288d1708999c5db4188d8363a1ef82a0bdaf37203df27ad2f2946ec64166e6eb4350d87960a8c53020b11d6c39f7690fe07e8a35e6f4d5f5819bd53e04cf71
dadb1dcbfb220b17562b99f8820af1b16a6d77f04c532c2d2d2dc260973f2f03b867dbfdc016df68dcd3a814f3a9f6b0d7bcd8b1cdf07fff9f7ebedcbdf64cc1
85f98de760687f5bbc01a8c1bbdfdf0316a0deb4aa567f7a31fd477f7b187bd8cf55febcc3aa35f4b5fd5acdee6f42b779413c662fd81d73fef7f3cedcca95f8
1c401a68bb0bbef33edaf713d6f7062cf9d3892bdb5defb1f9f4e6e150ffd85f9cdff71dcb37d0786edf732cefce38b9018702c285e5fa32084f70714f9f4fdf
f7b33810121086cd02400efcb9fef295704f781fddbf1c7bcdfa3b7f7ebeabf3b504d9fb771910c51ee429fbe1c4f69a11f30dc7bac5f781dd59df3440c6e5e7
94d2066ddf70d420232ddb1d8bffd7d918f37acaf1c2c2e9018df1eeeffc8ef89d0e60a00ef344f7ee740d4cff5230ff27a0df10db24fed3212f3e5e733ef35b
de5a5a6b4310775b7b71f31167ff0b9bb73662fd89e7b1eedf83adc7284ff0d4f7f2c2953417ae6edcddfa8eeff85afda394d3cadb4ad18d88ef706ffc4e60aa
edd85305cbd744efd96242ccedff8314fb67863835f985f32c479ca07aebffddad6de9efbd6118d6519ef2cedfa3d71cab262fff89050acd41d9f1bb0af07941
d395554027752599b3aba2badffb9f1c294bf3cce37ff7bff81c7bed1ecfa86d7e0967fff134f41ffb2d7cfbf0e2f107cf3ef39f88d5bcf6245f7ae356986228
2b2bb8bf13cf51a6ab0db532420ad5e775326d2d6bca42dccbf7d22dfbb4c20fe77fec25880c28da4bc846615c8cfbdbbf020e67bd6371effc309aa79a15dadb
4db36b9f48decbfbf8b1a9c9f58c0f3e8bf53285dd1bc480957cd12e5cd11690c4fff46a562b16677d6008c66f1d6840f33beb9dffebe4f70f04364a458ca336
b988fbf2bc48e85286ccdf8563c7a8314304dc04b359cd947e7038c4ef42468947a414d23e0befdf02aa70256ee3822683d2e77a12b3873d81cbe58ce98d14e5
c9e8ed81a2faf108edcdc8f0e171bfbff6c0b97df070f423f42338766c8c3f3cdb9448e572469f9d82f3ee8acf3bdf26fd56ee7768ef38dfc6ff176e45ef7a3a
367ee8728ef7f63e1c888e52afdbbdfd77f83c851edbb870702f322a7fc64e70394ff9afb1fad13c757012eb973dfc88ed784367f814b16dc2df7002cf387f7c
f1c31f1fd2b30a8f670bfec0db7650a92c0f859f1071740cca1db734ff9e8ec64eec89e1ff314af3c3e120dbe380ab534d68533ef07ff1f10c4a7358febc500d
46f1cd82eb97b30786bec4fe80cafd3f268e6826f07a0711894f876e2bfea046d9cf838f7b3d197b6f1e34f4de015ef9198e1f57c36f7801a11934fe70dfeded
b036fee054f7c04f2cd5f6dff0f819b17b6842ff3d11af707f038f387781e43f3e11253344dfe33fe5d6858387f13f6d0b003ff36268cad372b70036178101fd
b09ff9d1ceb058e08e9b8d7fab0caeee8c71e1b3466c239cfd7a644cf26bf877d1c313f0788afd84fc8c701042810cfd60ea87b5851ff76d6505ef0c01f10128
f3877a1c7ac7e94169830d3e846f04eea418362b58562ef085bc34160dbbf2ff3b1183334a0f610d3092da29b3466f08deb7bef597ef8db9b8af30f75fd559fb
b307fdafffe202fd3fa0e04bcacad374af6f164b2e965fa00fc1da3a8363cf005ff2c9078ed549ff9e8ebde871aff73fe6eb3095ce13b0ff6d23afb7f19dd1c0
799cff76e8fd4cf510380abfb6509f3859597705ef70020e51097fa14c3302798ab59512b7f26599ed5951f2f705f026f01f364ce01695cf1cbd90f5eaf90cb2
813973c7ee2ee6189afd28fb1dfd170738136cb301ffd2917146ffede10c24427524d687e03e7bd0637be0c7a72b2e0f4fe34bfe736b6b6b07c9d1095bfa88c7
f00def9e283dbf16c01e07919f546f1324d781aadb858737df16f2f6018b7aff4ecb3e50cbcbdc2ffdc393de87983e9833c8f894cb84f0af3b28ccd140e436fe
ee89ed1a32377137851a27f88d51ce500eca0caf9f5f7d38b5f4f0011cd8d2297f6e6d3920493db0cdf52f3e7afd0a4bdfdcd24d783051736e7782077b284f0e
8f08df1ca0f874ce0009148af081e068c36683dcfcc7548f60af1072727a861bbdbe42f75b06697380c1d4e1fdc90abd4ebcc7abf88ee88cf91e50d7c3c8d387
e6095c0c87fd8db09dff9d1c39c0b228ced04d3006ee01fa73e28ceb73f2cb782fefdfed300b878bf71710ef06dcf59d8d8f5af72c1600853cc7f16583eb8df8
6ce9e5b3eec88c06081247f9c71c2badf34980edb8a3bdf1a7d60bef8cbdba720db87f404edbe727e3af4680a01e7802fe393fdeb5346526f391922a48695ef8
a118e30684eebe416ce6549ed552b77aa78c8df09e3c1c1c310f894904fb98c7004ede5e506ee02f6f6ffe84108cef7ba8f5f1c73b60a20e81fb362516f8e3bc
bd12d4e45ef7083146c2603bc2cf2ac798de3cbdc378380df187d90767ee5c57bcbcfcb8ff4cbcb7d133a78cd4cb8ff4076c9cfa844a3cf45de31d6ed93d3ed1
8bfe7c323368b047ffc0953a6f10e03d763043e336f604e05fa69f0c9d6d6543e38ad8fce2e21b887bff38550f0eb14efedbe3e109a328db3ec8725c5c5c73bf
bf067fc4f35c87d1242df8ae014d7b63e119d301f3e8dd8825240af7434e0e0bcd09f04d063f19d1d9c9f9c6b9b076ed05f54dfe7ccf83f68537ddb471d16b71
738f7788ff86de8131479677ee3be7732628e89aadb02f7aee6ae815cfec8e74106cf11fb4ce5eb1712e5a9c70a90e928d6a2cfaf26b6be73181eb9f43e1715f
138a7c6df27261dd29c8de7eb1c6fe7101d88b183c376b6def2e2e72fde3577014efec0d39109367c493040a77453e7c926c48128dbc843b38569cf96a0c9c9f
af670a7ececdf0d82cd9b796fb03c0f39add7c9f1cfbcd29c7fcfd81d8e3d1a7b87070050604811a5b30a8439f8f58b3939717e7eff07efb2a5b824eb36d7641
774ef0644e2f46c95dde58b620729f21a5bcac3faf170c5c58197f628c33c4001fed80f0c5875e8dafd86cf8d4a178d07b06e3c3fb571850cd3fd0c71fef1360
870d448c8f7be7b033b0e91eff0bcfd3a8ef95f9e0c5093818bfb26cebf083c1cebe674e1f47cd1ac1999f50e06dae3c80bd72871222fdb0c38d739cbd58b772
bdbef26dc581a717e05510fc96c2cf0f60c83fdb2cd98f8fe12fd3786fee30ada1493ac9ffd93cc8f4df5ab529f8c1bf9fbce7d31782c6ee345a7b6361df0dbf
ba46ee6cd764ef1334efda4de874140aa32018ed05a715cb16c05b9d1c6d6c37668f62ed5f366af948f0bc93ac7fd78a18cfef1c68309ff39d709604012ccfec
b700fece750534fb614f03e1ce370811b7fdfa9dfbc89a54064f185ed69f506e226f34cf4f71e4d8f37090f03297f6fb8f47822fdde391971fd8851a02963847
d981876e5356d1e2c09eef9e9e90c407bd0107045a06b684fecf2006fee5f17d8c1efd28dfcf247a855ebe975d883cdbbb74101e495eb22fa35e0f6aae7934a4
964ed13f3ec43d5aa9df8bb71cf3f99719d68397f58cf0eb1f2f29483dbdced3f7bf60d2876ed63d729eb1f0e60d9fbc58f11c3df00734ff9736305d1cf8d926
3f37cc7fcd5c6d3933f6fefd0bdbbb28a30070fd08608a242520b14e97ceb260b3eabdb76e2a1f9d8a81244b795e6445229acf7432a47a781aef3437f71e85ed
ede774fde6bacbff3b77ede5c9bdbd342e4daf9088896c767a7aefeaf81e7f0dcb1f6ca36d0f06fff8f19fc7f0ae9f1263876ddd9e93c46f20cf478f9a7b774a
ff1df3c9c9f7be17c19e975a8fb25a783dbd84fb36d70056a06fc86f1b61ce5c3f3df5adfb7f449d78c065ff6461cb1c901e6e611c60d2070ed68fe1a04f7983
a57f3ed7c47de1b7fddb5730b47343fefa1e158acd1ff6f2ee7c0fce104bfe6d0b3a3e631f9ef3fd70700083e358d06b6be72bfe5306fffc990838d76cfb822e
17cafd68eb552afc2fbe69b88f1e0512c98e30593002fed4470decd63bd761253afa3bcbf41c8f96ced69fcf416e187b7c1f9e6b7552c41eee1ddf393f35ac03
0b183508e64e348dd7b12fdf7ce3915f17ff4db602651c3c33faf2f8cf44f848fd374f89e505a368ae5681cb1d137dff588cbf8d78f071ee360007349270e06f
9cfffefd3e8f981f6d1424dace0cbfe9efd8d2ce7b06dfdb1fb8fd02bf6d14c905f9fa1acbf1c60ba308cbdff8b7813d9ac37f922bbb7b514ef21fedd6cf69ae
bfdab8203cdda14cb7fb00c4ffb8b01b7775c5c50d660e346ff0cbebc3982d5529fe103eba4f6c362d70f7543f554b7f1e8e50da07ad91242c542f6020f06406
e2edcf7889e735fb502f17887076b5e58186ed02fc3d5f717f84eb83e3bde2e8fe14c4f3d57297b736af3347f0c2f7f6bf8ee68ebaa415d77728dfc95dfcf5c7
b7e7ee64d1f9e8a7b7fd4857e37f1d6ecd3c9e804f1cb21169773c05ed9345855e7045c0bc67c4eed48e5a8f8b60d8425e7ca027c8b0ebf987dd3438ad7f1f9d
b0e0261ca14bcde941497bbfccdc1adb76e39ebb7b5f4952c81e2e815edfd047c617cb2b941fe96c86fe09c50e5920ae68d7eceedba151b25cac370f90bf7070
bfe3aeb7d78d4c4cf1abf7f39b87afd04f380c1114bbf14eff49406b6851268ce37f1c5a8bd7daf375d54a130e0ed1ac796c7ee933e08d143e3ff26434270b3a
d40f2e8de69b509f8d322377f22cb7a2fd2027732ffff88c817b52ef3c8f39780e9df464fde7142fe3920a2d0fe418bf97724f6f10518fe71b78037c7080f6fe
7c05fd1f16e9f49ff5061098a01728e2964e37583d3f7401f886c24ee915cbf194ebaf77410345ef7102fb5bdf536a7f007cedcd9ed706f2c2ca606f1d14281e
d584ef5860e7101fdfb1eefb3808b8f935c77697344c6f3787c7101bcfed380dfb72debf9f608701fadee7eac10dbfbf8527e624210f4e0e22b387cba07e9145
b98f517beb105f2f9750ac210f304e00522f8026fdb9cd1f12f75e17e30e9f84fd9d5c9fb0031cd72d77f348c4e1fef8078bd8ebfd570e6b7b367e36fb3f64ad
18e7bc919340f1fa7b9fc36e31c8cd727222ffb5023a39fbb3df26d9dfd77c15e7702fe5d2e483ed37d7ff9b7fff85fdd23ca9c2fb57f126c74293b3dc1bf013
4a86ef2e37cc7f5ec2f1cd3b3f8f0d7537f50c9efdb0701f1ecf4f405f16fd17202c4f5709edce0e9242ae0006fd02cfd0ce5029cb1fe2577003c3e6ef2d189b
f3d38f6e06b657ff98f85cb5f31c6fbb8df2a54fe36010c1fae7d06bab58e73630fe28c283fbf243fd7a87f5cac7de56dbf47e5bb225fd5107eb3fbeb87ae590
65db348c4c87dbc3758f47f111c53097e13f18622efe23f9b2e350701c91f1f888e1fe5ce4d7a36bdccf30f0002cf71c3206f8fc5d9c2fdbe288939f0bf7a72f
5c8ecfb836f5f005db61cf77141b913b774ffd7b0c871412ec1debf48dfd3beb87561f2450bf7860f26d7fe3c5f8e89b76f18ef5f3b39f5d915d7f7cc9ed9ff1
f885d1805c5674f2478093b63c12c6aa4e9fbf0ae1236f555c8639c6b5de7a04bc760a4788f6ae7730cb800ab0b8649b5ef3d10d9fb0849f710770ae834580ae
fc1538e931cb286e360f02df0f5ed14cbf534f00fb5236d387cbf4fef148e7bf6ef2dfe7b9cdf68c0ccbd1cc97cbaf571345c79c3efad3715f00f767cec931a0
1fef1b35a717ce8fdd81577fe4614697f1f2346a53ae86fe2e12a490a253f6f70e25f616b7682e538ba7886b7227e370cf688db21fd1dfdbf708fe35cbff41b1
cbcdfcd3f3dc7417d7f4e65cfe7cefbdb6de80cbe01a47aaaf0bf3a55fe1411f74a7080a367cee20fe30d7bce8e2c88a0e56661001dbf7e4ed152b36fc26f663
1ed40f55383d604cb6c4eafe98c3f926fb60ad578dfa30bf6b6fe29d939284141fe12a9082009ff8dab8c0ebb8009378d683c6df2b809fa97c8246bebf8ae00a
f00d6f1daee8cf9510d7b2e0f5841eaeacebcd7a3e281e8646deb75f1e1b7b0c194f25d2dbd0368cfdf3183b18d62bf580df320ba469f25d6012e3c91e81b993
47e570ef0e69de7eea3441fc9a5c75b3f603df62b07c8a0a0f4c3ef4e12d019e1451ef469fc45f305edbaf09a1c53259f6689c59ad73074f2a15ed80b2f5b91c
62d97c04a78c2fed22e8fd31f70714dd8bf9b8e7062f007ed847e7705dcb7377f8b3fbf72072a3718d3f17347f83eda73b99e7f51387a02c4ec0c3e0a25c36c4
026ff085f388c58b0e9069ce0751836ed0a6a9cbf39a901e69d1b7c8c7570ed4a822830e749d6f79aef0cb3010b041b77fa037b8dfd38dbf6e9c9cfacb3478ef
ed235f37df29727e760130628ef9e0a2d4a1d92860396b306b04e17e6ff9c23ef8df03f199eacd0e1b1884ed2b26087a7170e6513c5fd38a706316cad0c3890c
70a80ef06b0327c1365f5caf2ef287b677fc9ed8c366ae6d146e5306ffaf7edc7c22ed552a6cb0c569aa397571fe4c485ead48a9dff9c9fb82c1a208f290f1d6
24e30b601016b9ecbeec82c108ff74b7f0efe799ecfe03edfa19308f4915a3974760950e1f8eab4ff4785d9027be2eda3df57b7887ef6d1c651bf41d5f9bf87d
b903e554103bf301b7fff8cefefc0ecfee93d98e06d36997f017c15cb7f1ae7b03fdfdf79f4ff40c40346ed8368f482f53a3267f4fb79136dfee510cbd7f324f
ff344b77faf002fe31c66e0e4ff344f7fa1fed96cb7ac7f3f3d8ebf99fa806e98b7e2c958c7d6debedc72509c7d1820c604d70f48251b5bb727e7787e9bfc1b2
c787ed7680917f7fcc970d6d62860c399ebdebd20767e7ef8e814306994e705f0ed2c80ff524c3806fe34e7f5be4e75871e614f090610fa52767a8eded4cbfdc
de3b39747ec7e97f6538f03e50a60ca0acf05eb07cde8921cf215d344b38ae108afecd3f07e7721fe3a87789fef6dbb02ffd4847d6491860c074f012ebf32aaf
d9fbf400af0c6fe7b0be341f7f3c1a6cbf37e87f19fbf5f747272352fd97b90cb5cbfa30330d08c05ef45fb3e97ddad7d8af0f314f00b2c7e5febebb387e4fec
96c1feb6fdfbcd0c77dfed500f227feaa9af3702dc35c87034cafd42fb3078047c522efe795fbf52b906ae8fc7cefe737a4ebff6b108708d20520c87d7171c1f
0e936c378b949ccf37a3e06fa01509fbf7e12edf5c35c87f539773cbf02f6320456ef5c9d9efbb3b350aff40ca934dfebee5f1a347ed2f926eed0efe7417d77b
ee5b4ec0bfb71f2c3daed97bd00a914fb60720b502c40152764789b2e1c5c146c110068edfdf352d087ea6feb901fef9a7720f6c848fe60ed25db310f9a0063c
70c2cd96e3b03a35c73638edf144f7f505d77a1fe7d12edf9dbb01feb910a1188df04800fb9c1fc7515ebb50a81872c862fbf3ba9fbfd486eec5cbb01fe7a1c6
25f309297ff2023a3eafd03fbbe8fce028fbb57cafe277eed1c87f3d0631af37470c60aa00edc9ae7fdc57f6fef4e06ff9b67491fd9dd72051eb5af73f1dbb21
fe7a20634f0a7afe3e9f3209932df86fe0af0a9fde636d77ebe087733edf458d4a30b2cc708ecbe8e23c58729def1bdafe0e44febda9cbfd598773f00ad04094
df92dbe914dfc93b35befe6ddbfbf7d25fdfb918dad29c70074e3b300d780fefb2a1b76f4fd17b7f9e001fc7d13f10002b7f3f3e84edbee33387f44fd7218fcb
e4f58b835f54ef65c9fdb7affd57f7f33142f1040fe91dbe34dcedfced5e87f37124e30507e7754ddedfd19afeea90f883f1060fc28abdbff797f95ef586e30c
38f561fe27e7f7d288eb0e31ecfef775163fdb6b7f9f0feb4e7bb08fdd086d517cfea385a72b6a17f2e1fb7605729a5d9c76f8bae51fe5144afcdd681f168163
ae3cb3ecf01a73bc629e34af97c5695c42f7a877b9c7029d0d3d50d573afedb4aa85ef5538ef79fe8130a6afd18efc37a17b2a179acf8e5fa15ffbd54c3e7bc1
23befc23b2e524ebfb7968176dae5fa333cef10ed53f78a2e509e2877fd5eb004fe16749e7f465f06869efe2be043da720f653b3a56dcb3741f7a69e70bf7340
59e9069bd873b78660c031496d9533f6cf64023260025b84ba2185673140e1872db20e74fdc3b09f04d3e38912ca05db24cdfbb246d9e0f78cb8e029fbb24008
220ab2746a0212939489eeb25daee0b89fef0b60f68d4527f45b141a353378dde02f4ce81d9f331441c0b75a5526b3db758ae692cbd61b1d83b3cf8d194000c1
f5a029fc8d1069d2676826d0d7cff18c79528f36e5318b09c56d6cf6a108651f17ae8ea202297cdee412c712a739c56aa81206a301cf10a8cbc8df1e488cbbcf
3b4b3b2eb5fae0cb28ba686744aa28057b7022f2f05701c4225b3e24301c1a297dde5c8e7fe2740db67568c3259717975095b798e1ff056c0a8c567153eb7cad
0121420631a628d4893d23ec79bc0f15f358b6fab1a3991a737b368f951be7321a93566f913df8f7fea11a675df02f5beadb35c41a7b75c522948755006fe9be
e6d1d13ab5fc884698f6d222c59ede7a586eb30084846dd0308569c448086b9ee4c8b35360425342dcdc2fb30dad80da08841267c892f1786b340556472e06de
0e614c8eb445d012af05c9c5f886aa90c375cd9b0880e40a6de1823221f597230c6fea9fe5addc25abc50aaf350e3917e4a4124f5b375912af382543e546ed31
36f92df33c7ad87948da72973131df213f56b98b41c4e86c33af89484fee0f0b7d5917f375dce064ed3bd90928e2b7ef5480a7d19456f3c179751a9e567da09b
df482ae09afa81b3028cd3f0dc4f8e34736d79e3527789bf507b0dd85ed52d788dce20b32fad5746e691fcbabd0c57f5591943707d0e6b60bae562d3e1d4bd8b
7e1b70f089c1145308feb03667b75403afe5cee0b64292493792979b6df15e1eca9bad7e38a1e2a2ae97c99e3bbb54594d01e0d5e8ca6eff22f9fdb9c4003c24
39e1feaa503f569b89bde2f4c53d7957af07c564d5e60a22137f1e2c1a9178a0ab76336237f15f3c8f308c14623d5c005e47a52051331a7e33d560351da4a778
64c5134cd3badbe5c8e9797a5771a6b25991b57d631a922f1e23e1dae455d7c7953b0a2ce53e9b0312129d76cd6d00980551756cf8bd34e00d7ead8b79103ca9
37c907baca398d99817cbda9e49c59dbf3f480a0f1e697763a55b61d0766156454c19b5b42860ce51c1f0347809de16757eb98bd9aae2dcb8773b86c27613746
67b049bda3e2f24d052aa8287e1be01bfb72d669450caefb7b1ea7bd225d8c6d90d71233e0826bca364d7eb95b89b3723d9d0561dc026adc8c5ecc9053775ac5
914c4dac5edb8c64b6e786f625fd9b232e8c9e148ba961c18e19228410ba9855f0d0913536ab42216162a37069ae8e24ac49b8b3bcc6fd2d0f345a86b70102db
a1db95f3635426146adf236b8ae6a2b609740e458f05802bc9829c094890d405e4579e9542fe681702cb1bf1f9a56d660c3988d858d08fddadd7ac1818979701
3de58ce9990f25294c4b65a179aeb1ac942c666c4b4b97c9d4e13dce9d9649be54668195ade611f9970c3c31d3bda9fbfd33d8171b7331fe0d0b4cbb275dcaa1
47853ab289b5f4254ab463b8ab60fb86cb75f339ad53afb42ffc66f8b620f8d344e9d16d2f3a8b68be5469a3d3ef793f80ca381131281b4ac32560d72858f150
4aad1251e9754dfd268c267bd47bb4e1341e31483a1ffd8cfde25a4f3433caeb19764fc917f36b906cb04c3113d343e408e7900f83609fce6e67cc70b34018ef
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
5ba3f912aa0fbf83496f31d3d99842f5e5f9d5be87a60a386df51bdc6696a30b9e6a1e592b2d6adf800cf7e09784c1afa6bd3cf2b8d7b4fa1c608ae74e93d906dcb49217486dab79ae26edb66662713d48b9c35ba31af2b53a51397cf7de57978d0cf2eb20059cd535ccc9b2cb9ffb33b4505da661de74236ba18a4d95a1d78a
e6100b65737ab54a3b4b9a4b0c3be56a2e17fe356cf80d07d46830787a6f3f1ed7dc129ee54cd71a9fd0caad97e7f853a8679aa8f6f1a86a370864d7635e35f853724579daed4ad536e19c3cfedde44af50c623783d669769a24d33c3eed9ee50de1775ccb87f0fb7f33d0cd129edf5469d477bc3ca45dbfde6e56635f037e72
__map__
ba5564b6c8ebc95ee8df2581106e083ff1bc273254dc4975ba33d16f0d9ad9ce431661108ddac9ecd602fad09353f32b857e3f566340f9c7fc286d3e9f35b7a5054ffea92bca795f2588132a818c90a8a435020f6bfd506a22eea92a712bd6b60a3b14af043817cf4cd78a58662691bfce4d59cee7b485c96fccb1ed6e2fa24b
b5753224081534c7c4c46e8d1f3d5b02f6c3408f0a98c456576a657d94d49901b62ced1020b02f91b0eeb53bd5a8b757d8ee8dfaa7dda8ffd09b38a6ad577859eddc5e59be5bc373cf5cee466ceb4aa9c12bc082a5f19cb5949677ec69fdd0099f34be97a692ab642a96712200b6ff28ded9deec217c942cb55b443d8c1931a7
6652913e508a5415622da596ba49d75606e47af76a2bb22ddb050b73dd6b7b5e1f671dbb89a6272823f2c7d1b82c8ccc0e890cd5de9ce55fa3577388a6a423b3fed38e73d324d3bfe186718cb4725094d69471bca5c52cb68b94559c6771fd160bcb4425a6dfa61d8df49a9017bde745f7833a748a587d984c5287228e075511
dc9bd60675077a3831aed3dfade9775ca195717f27c5e65b30e6c354c940eaf2d2a0911511ae81dee9e2e2031e643b7c6047da1787cafcdfcb935026f6ad885a357773580bfbbbb5b4602fdbb55e848e66aa8840733aa53d4b952bd98d72a855a3ff30101da0375102c75e1b92dd7032802b707114ea843db158428a93f02e9e
b3d7caf6e82592dd2c2e4f686cf72fa35874d870a60434d6fd0aa704aa0f714781282e278373271a17211a334b2a9f30591f9cc9e1596972a88e19d331539422c59c3a8c23319a5e67c6b85df56cc2b75b5a1f675fc9487be19c8fa517b432ce77262af94cc7bb1ca002c2459472b6b46290b821e5861cb5a4f6d0ecd0be3250
3409a69cfd52367c364d4651ad3cf6ffacffa535c3b2886a0a4a4e58ec7b1d41905a61eaef28e1b00e388b8e00b9065645825366633dd637e74da169374e9db276adbe90664c58b0931b97eb1d551a522e44a664ae11030e7b71cd94471fb282737bc52dcadd78a5420a86c0e5d2d6a3f6bd22522cebde776bb957bbc69f2cbc
7428776df6b25bebfbc5c32cabb5fd3a71795ad6093f9455888b69129775e27ac9e5047db00847fac77edfb035b3e69ae7c65be761ac00ef98d48ed663ff90d5e2816d468471c8ba7afca6567c5cb76be3796a0bd5ddc671ed04a5e60facfc6a0d811c6ac2d0a109ed44064c3542fa42e9a3797364afdeafcb628641bdd18be4
1fbda44fe32a7a4d25a6cf584fbf30b5ad6de2f78cbb0859265b0a08d8048e7e9c9f6aee9c597ec4e1d436e85a98558771a626cd63eebfe815c80f6cc1db8e8e6b98a5a441a63756d6e8add9b7ad368a7a02dcc9e33297e5470bb180adbfe9d9178b395dd1a37fa4d710b857c6f13fa3f898862b3e21b0fe66b7677333ae9dca
42ba105c3466e1b51d6cdf986a2b20b06bc6b6e1280a5c464318a13ed8765beda54a8eccad28fd8ac3258544c3ee5855b3d252283d1a6bff211fe4bbcaef94edb6321d2d7a521d4859ed4abb5c0e7c91e1261fcdac3a7bc5d06651a1d12888bfbfd7e546796930ea46fa1cf1282be2a332791923e2a19e0f08f55528cce550b3
2fefef1c5aec53c6a8c36892b426fa0ac66171322e0881b69566b98cde9223e6113e71f9d1b501ac147b4d959d713f410c30c813e66776bd7064d5d1fca997e84b18bbbbfcb60abf8bb017ded8175d888ab7c9805144107f23a263fc990a87ed09372713d3b457dc263b9daa6848dff2ee9cb14501eb7bb6805cf92df5a7bfcb
e7da5549ad12d2e6507ba571215246478b30ab761c966a6cd037a5f83820c5410974f540ef608fc3dc34e0badc6bce4314eb915ba9a2fe72ab88c3c9614dc5a20489fb1bac24926c77a4e8107d2865dca1ee50587fcf5287ed84a231a30cfbf7f734bc7259b4170ebe50eb28c88ab167f2e27c257a70c89b5327f6d01ad45e5d
c36a4d72182779640f1c438c5be9c9717e2235455f5ecedbdd8dfc0bfbb7da7e967e7ba167abd822e47ae222839fed99662427887b1806c2fb10292e11fa2fa56c573faf6a4ff4eff2da6b34bb5a5e53fba20ff6c7d2eeaa4beded49933424fdf4fa5269dd791909bcb2d982479e5f10a11db5f8e0715807d7d4b65b2cc1dc56
005953ca5746f6c0b544212ca717e94a3d9f60c645f41ff2c976277c4dad27de51dc963aff3862f7a226089d1f6bd331519f805e4fdbdce68d4089b97b7ccf1e72140199407f2789cf636a012a7edf280b6d345e8f8e0d848d4c7f1515e121cfe9e542ae36c7d3d89db66c82c596cb0706427095ef95d10937ab5f28734a43b0
d79ab66081f4cb2b835da64ffc698f6745c7f8647e219f57edd1780f57b908515a2a1ddb7a9603122c6ecf715a21a6134b0c0244669b9d6abf52f786dc633191fada8e7bad3f6673ee5c9497e80ffa1de8cf26cf6f8ae8bcb125354116de3fcac2abc8c2dec48cf92b1be1559fc4d453b95401218dd01727d85d5726cfde15db
89c8b3128f3ad23957cfc2523c314f636a8243eac971552dbdcef569aa1f76cdd355a17566ec69cae8042b7665725e44a9aa8c25cf4fd483ab78ab48dc0a9e133c56ab4d23f16bca2a4d175b106b3e27be032934f6cfe7d359988fc736d2f228f3c208d2a49e7b712c9d78ff3a587974a4599ab19cb5d6a43b316e67f1b836f4
e28f0f28a20e252708fdd846ed7b0f6dcba134eac3e4b57158d7e77bf1bb1b8c9469c534e25aa7af2c2271d1b55e3c9ef76e064a3c157ac91a6c27997a1691be47f93e3441f3c00fc820f51d87320f459469baf3e95a78113fa51684397e95f43520124368121ba84fba2c000b6ce7a484d2865764efa02f04424e9246f69ec5
e7f5fc4dd3602aad6012a1494a6da6ae9195d25297df2b862c648c00dafca0917c3b4891ea45f91e9571e1f84ff27949837279df98cd07164be1e321f8d470a6cec70b7b72c6cb7be9013c1f0a974571a9f78daf0694349b5732a27169c6d1f969a1ef1fc5f7a9c012fa2963e5caa3d0a642ea350ad7476e4c907768d06b2e3a
9b74bdee2e9adcc724707f0f9d40f83e0981190372e86bf682cbd74e62668e2e4b9341d4e25de428bc9ad47d5539e5f335e072b413607b4f50ede4f177bd5a5d7180fa7dba6e9480518da6f4e77be61853e33b25ca16b30adb79513a5fce13204f7dd92e22cfb29809aae139a7cfa57929a615bf368ea988d71dbddf2b3805d2
4cb1ecf6bab5b30154940a3c495d91a35aab88689d13c914d286b5eae3d45ecff210463118744dea9e4b93bc0c2f20764d9785f26ff51825bdd350981780ba5acb489295a65d5f5b472f82367d0bd7f6f2ccd499e3eb409e6b194208177c50c9be018a7c55ec2cfe6abdf47c8cfeb4cdfb45e644aa4a6aaff856d525ccfc55d0
dbb089ed6be52163a5dbde400e0d59bdaeaddcf648ddc397c62a711599393ec40513112ae542e9618c052fa0e9e54bff3afe745ec2272e14727a0b845b545a61f6b4735572cfe750b048bb9235e6f6d551d3fac6daad173287b26bca025ae495c8f5b24049907c4f140dbe6b7f7f80bcfd4824e35b4d99fdb660d289830835a6
227adbb57159cccff753fe3945d069f3e5eb4196dbf744fc7fda88e3e857a52aff885ee18f6d4bb4e9b5a7507a52a0ebd4d2f64b7fdfeaf540a6fb72cb8606d4585413e7867ecb5473c4126d55a6157f3bdf1cfb507fddf87f580a97e3d44b55405f64a6b5e443f9f2e99d003935301ec0f8f77098a0862b0ecc07c9dd10df0e
250930632878cc171189de9a7fc33b257fe09f69ed7e69ee4d350cb97f5d35caf92088170887826cf2f45a57c7bca7c529201f55c17b1c3d6befede8bd85722a7153f2e1595f3f7875e5a269ec48639be8a7a3f7cc8e3b5dd3cfe1b3a5323a1928f3c9de4c6feae0fa503b1e89e00afa90596718ff7e253ea7caf68af0fb56b8
94b5f56d78d3a3a64e86ad799cf955f8634606fcda00935c336e753bf10b85e15827b4816a6495f1fbca0d5f91ae5116ee97d3d09a33feae105518d1ef9bc96af4a789a59f5e6b32febf849fb1bdf71abe893e850c19a7fcb39c328fe1d528489ed7fbe2719f28ef465fbd8dc6dc3588fa5bbdc9afd7376d7bd91a58e1553a40
bb39143d2ddd12fbef512b288fde64edc7f14e1b61fc065a2dfed97c709603834997ad825f36e4f6d5963cbc482f28757be6658489df1f31d112ca8ab8d507101d2ecb83533e4f45f312732e0b516fbd533bfb4ae217e1d3cada77bff6225bc40f7c9bb10cd295a74a5d3c7c0298dfc167c04de2efd7cde5c715ccc7beda17f5
4c72dbcf2d422f29dcdf659591874bfcd124ef827b8882bf85d7d20b980e9d4bbcfb61c7335ffd2eccd8474e2af8795cca846eedc29b48050cccfcde59affe4dd4c9b0153fae003de4d9bdbe724eeba2f9ce4b87e00f1a4fddb25a023363dc6ebe3fc758eb09d3eb8669facb30ef2832cbe68df309e9a5fcb3d7b4203f36675c
363df452a0ce8fce9cfb557c99ccdebc6ec40c94b4904e882c5c47fee9359eb924d4e9ebc7c3485c0ddfca2aedb8a118488d24f1f83f8dc776017c7a1effcbe275417d673a2e9856efe40de494614692c7ae13ea49a92c9a60c6b1072f7e25b88c83bdd696f9dc9fd737ed70e7cdb907b3d5243fd2627a6e9b4f7ba8d77ca30e
c2ed97ac08af10227b693815bc32a629fefdd254751e5c43c9d278ef28012a2f77f8995e1abfb7032c572e2586eee4734de3cbac57e7df6bd5fdf48a6ee775faacb785512f018f59a9ff2b27f3bb6cf05d9f2daffcd4049877feae8fcb2c98f3dca5543e9f72f31d870672a24ba51dbc267b4c5fcf3601ae1c1c6228edbc72fa
bc770aa6d1fd9ee9ff7786b7ac51b880cbc04b8838efba7dcf80cbaa74692fbe87fc6834ddb73ad9ff6eb0b08aabc12c3b49df434e2c42d9e5c036132fc5b3745e576d01af11de8c9ae7e6efdf61d8edbe7937b34bbfd0867e3bcbee9c572060d2ee2526bda390bd052a795585e8be660dc25fea82da72693d78e33afe8aa095
4ffc92f03700fae58fb4d36a5d029bfcfd0dc079117fc9f64da020df2f68c2a2413c79fd2cfd954387bf797b195d2198f7baccbb004dbe2a69b7d3faf537e3abf0b77f4c6e3dc5c166d70fc0d779f23b6c779d9ddeec17d4baf151e8aebdd910f0e2b76b5f0bc0d7a4131f7daff2c855265b78c3ceb430afe84f22e2d990d479
df89fe59abd703d9c4f7eb04a65c4eeb6f2dbd4ac85fdf0913d235f7e5ca570b59545bc6bf83a935a12e977b75fbe5422be97bc5bd920aa4ad64fea44678d3e65bb005e7e2818c04121f7f27be99f806bc7f9ab4bb8d5ebcc96de2b4063d0a0fd12f039c424776e580b13b73b7970af82b3bbb6fbebaef8a1a74b228002793ea
22f35f2374db55bb7dc51ec864a0323043255003af56e1bfe48a348f5f0e359f7df8ed0f6a78bf91064adaf70eb5d59ae452dae4ef01c199e298152f73ac9cae44640b36bb7a9137f789867c08b69a7762578757e06fb117d1b0779af427c2184e49e7adf632c163d1afaeea52d349cc0de4f9c47be80cfe722bbd7ca10df0b2
bd3db698252936ffe64491b6dbd5b83db15b7716cb5f4574ce926a8a43f5febec18077a7dc08137c089e15c5a6c5e66680bd92abd74fd9ec8c2dfe056c04e9643e3417d36b5776b360caa944925435b667dd6cb78bbf4763c66a33eef14657d2f8b45d55753cec8a531e6acf38a2f634343f07bf47b37bb58c68a2a1f4dd20ab
__sfx__
4f6a136c000682c16c127422e3213d705172782841d1962228507054781a2572734515560312501860e31759347771e76f22560344033d63c1813705667095670a01329132267030077b1a033254532076120063
9b183815344082140029256372332605a3c44b0264a0170a3b46c0e66f2e02c3804a0c5362134e11166224432b13d332213912517240240120d21f2064e0d016023373513b0b47b233230b3050e711121301952b
037a3e76101180d54d1750c0945513227133503b5632d3473210422649391293010e2d2280f03e2732f375113024f0406d2a3250a2460a27f332510a4623e27d343680f2342d2770d7342664c2044e1f44b38000
3902fbb50d54c0726f3557b0a0150165d3541e1831a277512f70e1a72b1b1483830a1e3402f04b1070f0e4771223220704155541d02b2607c131631d06c0b64c1c4003813e17269111630f1021c26c3253f2c70a
d25492321b50d331392842d160530e0443317a3b3180212a3e5712f0700e63a3846d0f35c1216f3b6052d1040f1033c00416333182420d5272750d1864c1b4441357d01018185772221d05276094222c51939577
1f0f3b3b365470a73220462285511773e347110637a1943f0605628029360110b2480c0300d4023842c271691511b340422203b191173972a317060a02e3f1242f15c2954f1c61c0712f1a37d1b4643753a1945b
0c053d7316776016522e24e191611a7383655b3421624322134330634f0b753290351d36803225230372076d3a24f2f06d00147291590300d1e21e125592e522181381751e0962b3c61f035383f0790072033221
53cace0a2d40938539083703022f1e607143412806f1e5681141b1904c21633045120112c233481805f2545d2e2562f7283b4290d035291650d436095313950c1e5651037103263363401316b0544a1346f1b237
b4ac08f73e52b3c02a154210811b0142414236350342a01e051131133b1a31d2841a2a16517040053121443403710155232e60f2842c2b6573877e136272165e1030a310213965a19541113762c3471211d3f33c
a1a139850823a1003420427204250a2320b7340f604174570454a0d42c1820a02629346670e2001e2401c2420400a2943e2554239417325441e7683442400146111181b061145102f3511c2532e03f373070f061
6e4a11db0a6702b44400209330062876e3b04b162273976e2c04f3d55d2d01f0866f23259035281b0281d5393e70002145312323b15a0422226464183442b622217723c03833761221751f558294281b1610e206
016380a61367e203341874d3b63f0a4521c0372722502270021321121a2733f0f5251a5223502a2523333609107230d1512443a3e40b1d77a0c041317623c25e060693530e3a0612936719540290140b64b29657
2363803a0142d2a540145382d01e19516275122517413628377623701a091420d00d170193456e0e3081657e163351d02d0565d226610853c343742a01f1e0253053d364343152f0a00d2b52b32574304032b01e
708baabf1b36f0e5572b2311e64d0410833611094550a15b053412601f2403e2706f1061d3d707212583f410170110a55129567212411301214638374073454b14408222611247a355222a20b2b22a0034329561
448b1135316370d04e397190216d3d5280f507003023731c014781c5532e64404408374273c27c1841a3637a193140275d1e66d1b2721712b1c4433a24d174543154c157422c255035791e2183b5633b34822335
805b55a838570174543614d19514346023a74f190361d06e1a71f034731d46d3643800136371523b525181592e31e217160d3081330402578031441b6791a207387440272f3901e08268141683c1062411a04151
df0bab8b0b6142200e29529085570c36800634001583e0123025b082642331f27409207281a425350460c2541362e3c0712f32b0362e054431511a2d0543f5232652b10273062482366c3b30c0a3522f12e3c465
a815fc7d0416b1a7311466614509146493b2443152d2e176220222a6362c5020c6612b3751c270376073513c1d0472603f0174208524327440227b10271221362144b21523162231614f0014d0d04b2452315752
a74ca8361424410726371240667e287091c1220157403323323260e0003271f045692c0300005f2833034236321283f4781c4003b1322a26707045140280b6023a11e2a36b16533382570906a34466203233e209
14fdda03111602c6160f54f1940c1177d016540066122312343152f5513d37223108182603c420075340716f2c07a2e340051442e44621350022600521a0421c28579032232316e245053c436251442165d15316
af083d120c41a343211375d17546342623504c057121c701375360e41f1320b0a61b3234114134327673c14402766023453347d29078044070c0433125e1313e027080264b0d50e1964d147740274f3111c37124
d839626d0915a2b4530e56106404074463500c184440e74a317043c0400a41e295351524a18561070212a4483e5713c56b2a71a0222e1c4341120e244441851a0e22a034181420c1e54835634004781730809770
95f069072003934726202520d1111c04b20467113411d41a0434724707187092b22a2d1073934829622167781b31e2e40a1671b2040c0716d184430c5403b4662261c1765b34443382632f37e1d438201453421d
f88300f43e33a2d60b2b66b23342200401e4160a36e290682172a1d0422862c1551738512274282e75a0d278084343b4530261a0b0423663728561387591d6713a0671134d00529214751e4073a5142751e15354
ba648f2032635077323c3491c6123b407263712e5580451f3c05d0b7073d3330e4022753627664212091d07a0464a0062a2c27c1c1153b754181513b4530e0792717839429083451f2150e212361220532219451
9bb760940d0403007f2a6503c41e3f6051a04c3e5600a34b2411c3b625064343a61b0335f0406a0006e1a3542b25c2821d3041e081380943237165177321431a3077c17134331223f2063e612397021d30d3b008
d9879ab60607202341346441f13c0c53725050182453d50332638194160a5332055a2a0330f034103202052d2170b2a7532324c3451b2c6283711924253167571056c041193c47f0726b3e2181645a1853c0624b
440285912f13a0965f202130175b030373b62107006341570e131180432d62c023113821c11701062730775a123390903b315011b2730d300276443150c390410f00c0521418719274462d4071e3740301a3713a
620bd8990157f0861d0306b3b1222e1530e0542474e3826e0b2181105b3b53c376012f50a16207321782f2061851a1d2483e0550e66d355221115938014295641f54b3912a1102a3f1281f60621170250232f672
2f03c68f2023c12309043140062a200701f71f141100226a217430a365257273b7101306d3a3413514a1c16a245762262d0b51c3341d2843817655125390614a2b4302e344027473f04a0b639155712b51d23468
8c4e332d3843d170330420b2740c0b61d2e4211001e340052e647291253a2690604b2061c2146a3b014044222861e2757a012752935f2a4290a20d1346926262011102d615160073852f3012d17220105031266f
55529748047151a5763004118541124722853226771394510e46623352042680a3431823f182182007c0a44b375243f14d1f1090f61e3075e0c52e15525212082a5782b44a066420023b210083237f2231309745
5a5fd239007223742e032490130b225380627e1f76e2811b0075f2a11e2040604209351512473c2117b3864c364352903a3e1243c0370c56b0670c1f71f0574c3a15b12524233542873d28642214682b3223513b
7ba7a29a264160f50a0e1653252218078094533e63a2b32029105047560b5200a61204770022490a55d0d624321123e0690f479021451516f28212061730f6243e313014092a65e0b2202d2042b523162072b40a
0b8c510a0e11d03464070520c608120060670225718153651b5221005e1b50d3c2333316c0a51805651211420b7460f524133402e75b0c6241f14c220230d45a2a55229575074590305a102191203b2526b1f746
ae580d34246030437312746370781666d295542a401074572c73a37645031060c56c3b44c0c75f1c50e22142190440d630315621135506308042360007a1065f1a009047210a6732353329666111503f2703d359
57e44f293013f3925526766210441e46119603054531a3781a6290714113222280091307e2b56a3a6140e4641c07f204402b42f3921c205700e50e0d657237292023e3a3690404a3b56e1b15f197212305414501
6408c444204320c143175132144e100793774f397040820212049014503860613459012442a10a22448306443a35503503001123312e06061356220c670042122a66a106760614c1522a1a4100e4273043d2a600
545ffada386670412b1e44628513010792570a280322c2401e6552e34802744082183d564000432102e2a76f2834a2f45a121051d044075281555201167240571301a097092a750076760766b1c44e1934529160
5c65c8ea1d0013e6321c6090d068267441f71a2f14a3501f0016f36114375401374424021351283730f0105135034136600776b230550651c3244e042281f12a1c46d1c12e3a42c3d54a216143076d3142d07521
6e509d2a371223c2093b75d21535283611d53237618216641b01d2231634622284290955903744282391976d105222c6430202c19060254533b05e0c5272e2303456d0506b3704f2a57e2c34b203111756a0f130
8c3c92a01860533729317193651307220263792306c1c61c287183543123773163550711c2f2301870b1664c12207087110173f0a1463244a0d2090375e2810e223200174c3a13c2175037637280750d62a1656a
5b52384908409380202b50c0a5101246d2430f064011e40f3531e0810b0d069004530421d10039185141240d210441c2420100c0e7041b618362221b41e3626e152201c15a0062a0a5103114d094212752c29225
a6f31c94203433c64502352156302b3230547c206770e4171a0501d221246141f6383165a28447340692317e3661c0160418311281340d6041946e346372463802548174351a7020100e3b0341f10f2f53102119
4a4608dc3871f110381f17a07478187680a10a2443a2730b303290c7752a7013032d071211310d0d517150650547e043720b55e0a0170f3612164a0a30a251303c73e08363050711f6672545b364403f70238125
2709953808650153132434f117502a10e225352c42f151681907a075650c5481336c0140a1d4100411d273003c0043445f2166f1d2443c7063c32a0a52a065271f15c193053f117300323a022100460573c15703
6210ba073c5621d4090852412547107361e5472e3570a24d35632126071043f2b2582b13c204260a700060690804a2437806028210283502d114403f20d11201291200c4421d71d007321c744105653803211579
8f481a95143550631a30101243151906007029303200d0700a05d0771322174183062a1111d4443041b1941c2a0611514c3a04a3002a011611b75a1054b07467211653066b0d1151746c1103c0a230183402d635
02e00eb91453e021351f6502b50d0117b037461345b235071912e0e16139702365601a66b0f62c1115a0760a2060a0e52a226232a4070a341076321c42b146732c74424251165361a5483352207346130203c120
83bbb1e32a02711177244680b167314220e0021c372344080f410245283d5752a75a3267d0453f2c1332a5582b539351143c050151061b5401a4593421c1335e22060285213e746221612f7161b5781522a2b015
061bfce43d70d3d7532916c3765a3623b2672c3551b034391e5281616d3623b12061371290f124311431912b120762b575024141020d2944c0a522156630a5103b3201c54f123711401a2262f207491d0632c437
69250ec430467210611c3781376c181772d5012525c2301a2e21a2d2140534c3b625210000b56b1a07c145123114c0a26b03433146441f6052b3240e1223343e04516386712252a110113623b2212c175251f122
488e6b133a3140945928304203752865f0124536303030730332a3a3342a36c30154256600e560224290c34e3376d0103b1e52c274151d7201d2252a1001217e1f03f206271220322577256633b60c0051b3c548
94318bd92c4271541804607244770640c00669252432770035033134420d7301c349262053204d110532041d307000d7610520f1b2460d0720e2192852d26413044100a0061a60c2402b237053d741297700c003
6dea52431d25e39352072693e46d1e0052001a0141f0e01d2140907640150042b2361016d3c2271c7170815f216622132b3b1782215e0b379266632c6072b40e127351b21a0e178335143173c0d6162963307410
34d5f0101b0581b7612752a1105b0706a30059357430850d3a76739461076583813d00060104471c4462537c3b04a023052827e2b55b05558291462631c31024057263c261046702442519060060522537b30754
ad4b0d0e1f42604044193083c01e011191472a1122f2702a110590e35f1622c0062b2267d0f46f2d3281902e24443217100940c0112c090412a6141e70a20000276751c407390450975b1511e140221c2202f218
7eba41152d56a094231a6483b36d11303145440c61a367171b31425429053453a61a2436d3166b1c33627534152031c36d29532014213d531360060a53e1a3151d1140c62e2b70e2c4093160e3c41c0d6222204e
51e29cac3e417000562314d330263252f240743c6620e47523540175760a61a3017c04444195360c56b034423d260126081b5290402219605050271d2693a535061710c518384170a506044342966f243541b552
ce84874d20736311230674b0e105047171513c1d1492812a21103282492e1743f21c1d419063071d6380c04607443145060e26e057690125424541383441d347037561160a1013612321263402b527250632c26c
4af73540352281356e00733117640a00a0921a2833c311722441b0d03024548025350576f277691d41c330731a7071007b07017307410230c005741144f147623c204150561842f19211341302a325187630a56c
600f6b05326112663d2025f21326181611f25b1354c0c023286710961e190442a00e302101425b0d1611a231272533f1011a7481c57b100110e34320301142200530e2c4300123d1050c2a653253550654e18007
de032b8c0a52b3a4353e0492076d1770c0050f3312702079101621225e075792f77002532023073f67a0b52d381743505a1252a182491761b2474e00633176471c602302700c0030d00a1444a0f544016660545c
91067b5b301122e0420424924638200120d4181d11c284411c4301a0690c2432232f2e0242a45c040641101c263341e40a2242721570137481027c0e10d0a2243104038056023360e76b3b319302093c1522156f
__music__
0f 43677d0d
01 671b105f
0f 29224f27
0d 58166c31
08 7b255502
02 43132975
0c 38723d61
03 6a2e4f1c
09 3c18672c
03 591c6061
05 03682e3d
06 5a001003
0c 3f674507
0e 69451f7e
0a 73703100
07 4d66784b
09 68624762
0f 2b4e7e40
09 551d2a7d
0b 664e7c0a
02 0937204e
01 125b6e5d
0a 3d3e4c01
0a 041c6323
03 781b1304
07 443c6111
0d 69317a78
0b 1b365a48
0f 423a6b04
00 0a334d66
00 2b7b7d55
0b 70763366
0c 43333461
09 29563205
0d 28024d49
09 3057456d
0b 4557777d
0c 226a694e
01 363c4f0e
0f 6f114c46
0f 710a2222
08 5f1a5f0f
04 497e0f46
0a 7924383b
0b 592e0b70
0d 27057d43
03 2f2d497e
09 24695a34
09 3c7d5f61
0d 4c03045f
0e 50074b0e
05 0d7c2067
0b 7a356f1d
04 2b79704b
07 736b3906
0e 42504c14
06 2e4c531b
01 0838556f
00 767f067c
06 42521066
03 232f6872
04 2359564d
0f 21091a24
0e 13734735
