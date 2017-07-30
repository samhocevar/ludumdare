pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  ld39 toy project
--  copyright (c) 2017 sam hocevar <sam@hocevar.net>
image_list = {
  { file="data/world.png", w=128, h=128, tolerance=62200, scroll=true },
  { file="data/owl-indexed.png", w=512, h=88, tolerance=10000 },
  { file="data/owl-power.png", w=512, h=120, tolerance=200000 },
  { file="data/water-indexed.png", w=288, h=384, tolerance=200000, scroll=true },
}
current_image = image_list[1]
facts = {}
global_rom = {
[0]=
0xe958.0112,0xe4f7.e335,0x9206.76f1,0xc91c.ea7f,0x187f.661d,0x6fc7.7189,
0x65db.bb77,0xa664.0651,0xbf00.c308,0x57ef.1eac,0x7120.9a81,0xdb0b.0582,
0xf62e.2c58,0x2b69.7eb2,0xbdaf.9af3,0x950e.aa31,0x6624.2d44,0xe333.5704,
0x4c61.66bc,0xfef8.7042,0x72e2.dd28,0xd78a.893e,0xdbf6.5224,0x33c4.058a,
0x6805.768,0x9af3.eed8,0x8f1c.04a3,0xd7b8.2ead,0x60eb.62b3,0xb6e4.2aef,
0x2266.ce81,0xc222.a38b,0xd0e6.bce,0x698.b51a,0x5275.3452,0x9d12.79d4,
0xde46.45cc,0x1efd.bce4,0xe0a.92b4,0x65bb.496e,0xc3c5.50e,0xd9d8.49ad,
0xa0c6.f798,0xa437.cee9,0xc24a.bda6,0x2d45.12e5,0x297f.2e97,0x9539.0712,
0x68b9.c0b3,0x7998.a806,0x6ea2.735e,0x5ecb.88a4,0xf930.1d06,0x77cc.c6a4,
0x17d8.ecc,0xdc84.5d02,0x6df4.3c82,0x9e00.9416,0x80cf.19ba,0x40c9.c2e7,
0xa784.a537,0xc9ef.f0bc,0xf243.e88f,0xf017.2675,0x590.afc7,0xb322.30c9,
0x8a5.002,0x96.3446,0x4c15.8737,0x94d5.1e32,0x1ff2.0d99,0x1613.a13a,
0xf3f9.953b,0x37.4b9a,0xdcb6.d62e,0xdfbf.d1a9,0xc1d8.ce9e,0xe4f7.ee1,
0x877e.a8db,0x15be.23dc,0xec7f.7774,0x76e2.29f3,0x35fb.893b,0x2832.fa2b,
0xc91c.2876,0x5997.4b6c,0x1c0b.9d8d,0x56c4.b266,0xa8d9.8d74,0x9ebb.1ec4,
0x2d6e.cc62,0x6fd0.5c42,0x76e8.3503,0x8c9d.0356,0x504b.8432,0x4b55.1c78,
0xdf99.65f,0x709c.fef2,0x2b45.d981,0x4dcf.7742,0x1273.791a,0x1d5b.726c,
0x582a.6394,0x23ab.ced,0xc5af.e865,0xbdc6.8a29,0xa915.5256,0xc713.9af3,
0x7cee.0641,0x8a7f.6413,0x1382.fc46,0x3408.54dc,0xd270.269a,0x7337.0369,
0x95ea.735e,0xdd59.c8ae,0x2e69.d26f,0x8806.4a7a,0x4886.2862,0xee42.e303,
0x8ed7.910a,0x5ba4.ec77,0xf148.689c,0xe00e.8952,0x6a14.3c05,0x4a82.416,
0xe7ec.34dc,0xba6c.f3ef,0x9cca.a5f2,0x27c7.ecd7,0xda7d.f8b6,0xcf01.c2fd,
0x4fa5.ce42,0x91c6.ece9,0x471a.358c,0xc719.510b,0x3e00.c23c,0xdf99.600e,
0x7944.0b2c,0x5201.3349,0x5be4.f7fa,0xe859.6b94,0xf3e0.7822,0x6795.0d66,
0xa93f.3e14,0x272a.1cca,0x3a20.02bf,0x4316.3781,0x551.480b,0x8ae5.7c3f,
0x6654.48d1,0x7332.c784,0xce0c.b02,0xacba.766b,0xbc12.010e,0xcf84.c792,
0xc979.3df8,0x5c54.d75f,0x28ee.45ee,0x7ec8.a879,0x3cad.fa36,0x11cb.3814,
0xc478.e056,0x7d2c.ca7c,0xf8ee.75c4,0xfd34.8712,0xf11e.4245,0x66bc.f8a7,
0x183e.0ba9,0x5c77.246d,0x112d.eb3,0x5a5e.ff34,0x1170.b0f2,0x9047.bb5,
0xc7f2.45d2,0xa629.f8de,0x55af.253b,0xb790.8ee,0x64c9.709c,0x2bba.6473,
0x7c94.1a71,0x5e73.2b95,0x2d45.b4b3,0x416d.ac2b,0x95d5.d2b2,0x1cbc.4b6,
0xf137.f644,0x64ca.65a2,0x22da.5f27,0x2742.cfab,0xf135.237e,0xe242.8bc3,
0x9e4f.7fba,0x79f4.c396,0xf662.34cd,0xfda3.e6bc,0x8253.02ae,0xe351.ac43,
0x65a0.e3a2,0xee75.3db8,0x1c6b.d8d9,0x6bce.e7dc,0x4618.ea3e,0xca38.323,
0x1366.084a,0x7af2.1196,0x51b2.14a3,0xc89c.6e9c,0x438f.522a,0x59ca.14ea,
0x2a7f.a4c8,0xf7f3.b27c,0x67b9.fde4,0x4ee1.357,0xbdae.5bce,0x765c.3f3b,
0x3794.8843,0xf961.42f1,0xb95e.cf0a,0xf006.eaec,0xa04d.d68,0x15c5.ac3c,
0xe0b9.87ce,0x6475.00af,0x5c23.b237,0x2176.4125,0x5e0e.c1e8,0xf2e6.bcfe,
0xcf9c.e72a,0x8fc6.6706,0x7b97.d546,0x5cd6.69ef,0x718c.1117,0xc96e.99d3,
0xe165.cfbd,0x3ab7.14b9,0x6df4.8c6a,0xdc7b.1389,0x906a.4583,0xc922.9312,
0x2ea.9a1f,0xc9ef.e667,0xf3c2.787b,0x5caf.dd9a,0x13a3.f389,0x8ae9.3eaf,
0x7572.4ea8,0x117c.9eff,0x141c.d79e,0xa3ee.34c,0x2a39.af38,0x1bc4.6949,
0x4037.655a,0x77ba.2b1d,0x7618.6124,0x3e75.f634,0x53e4.0908,0x5134.5c2e,
0x9641.0e3,0x6de1.9062,0xc778.e3cd,0x808e.08b8,0x49a4.8f42,0x445c.d79c,
0x338f.35e7,0xb855.41e1,0x2bd4.1c97,0xfb26.1a6,0xe925.c0d8,0x1ea9.c2c6,
0x96a1.e124,0xf539.af3c,0x470e.2fcb,0x1b91.8ef5,0x7e28.4c47,0x2d33.9e4f,
0x7155.c7ec,0xe0e7.531d,0xdc20.753e,0xb742.38ed,0xd071.dc6d,0xb2e7.9c6f,
0x2222.9409,0xd20.7c6a,0x3a9.9779,0xefd3.f672,0x33c2.a581,0x3efb.23e9,
0x5471.2bbd,0x92e1.0071,0x768c.042d,0x6307.598a,0x2614.c678,0x1f35.e744,
0x3565.5185,0x7065.c1f6,0x99db.aa3c,0x138a.b8e7,0x3c8b.7e31,0x5b8d.15ce,
0x8e95.0ecf,0xeba3.5271,0x6df7.e87b,0xdd34.3bc4,0x238f.27bf,0x1040.708a,
0x37b6.3c3b,0xd573.5e7b,0xd7bd.9181,0x3918.d54a,0x9e6.2997,0x1d63.3fb3,
0x85b4.09b6,0x6670.09e,0xaeec.d79d,0xa9c9.e134,0xfa55.ff8e,0x7327.1648,
0x3e23.1ae2,0x8aaa.022e,0x89.9af3,0x94cd.79f1,0xf6dd.62d5,0x3909.ab46,
0x9001.73e,0x9304.b11d,0x1b8d.4067,0x439f.07c1,0x922b.829,0x9710.4c2c,
0xb66d.65e6,0xba89.555f,0x3136.222d,0xfbcf.87d6,0xdcaa.5009,0xc7e1.0bef,
0xe3cd.79fc,0x94a3.4646,0x3cf0.2fb9,0x1f6c.84ea,0xfc19.ca25,0x1145.92db,
0x981.68cb,0x3a27.cf25,0xaa6e.88d6,0xf6d9.fe6c,0xe94b.3979,0x6a19.ac97,
0x9ace.581d,0xf944.6a8a,0xc9ef.d77,0xd1db.22b7,0x4fe4.a6b,0xecf5.69ec,
0x2344.966e,0x7a5b.68dd,0xa512.47cd,0xb92f.4ee9,0x2f52.366c,0x678d.d77c,
0xa349.9cce,0x699e.2349,0xbc77.989c,0x21d7.e86d,0x1a54.984f,0x4cea.018b,
0xb24d.34b7,0xe499.96d,0x1dc2.e3d6,0xb9fc.6e35,0x9f27.bf19,0xb23a.465e,
0x4b14.e93f,0x4969.ef4b,0x8b7f.0d9,0x24ae.0564,0xe4f7.e274,0x6e6b.ce3b,
0x48db.dafc,0x1070.3842,0xcc21.f741,0x5875.8511,0x9142.9c28,0xdc2c.bf2a,
0x6e7f.f3fa,0xdde1.2e5f,0xad5c.ff49,0x2ffc.2edd,0xce77.4c02,0xe5e2.eba1,
0x6cc9.878f,0xaed9.abce,0xa5d0.ae7e,0x386b.0175,0x3896.3c66,0x2d5e.47c8,
0x14cb.ebeb,0x60d0.d142,0xeb3e.f876,0x27c.e6bc,0xb234.b2e8,0x3b1b.b2b6,
0xcf3b.956b,0x694d.ce6b,0xf2fb.0c7f,0x991f.a4e,0x4f11.fd91,0xa66b.cf65,
0x3912.fbc5,0x2791.0ba9,0xc5a9.fd91,0x9fd9.cd79,0xd2e.2b33,0x87c4.c5cf,
0x6df5.51d6,0x3c47.3363,0x8116.4329,0x1a67.5d63,0x8352.3aff,0xbcfe.4f0c,
0xbcc9.a2e6,0x70ab.2643,0x47e2.4266,0xd24.4f45,0x2a41.a587,0x7a24.156b,
0x855.4e6a,0x46e3.9512,0x8393.7b1f,0xf93d.f82,0xb931.8164,0xeb6b.b15f,
0x4216.2501,0x4f8e.8fa5,0x7948.02b8,0x390a.499c,0x4f7e.0849,0x42e2.a6de,
0xd577.38d2,0x1a78.4b87,0x4110.aa4f,0x53d4.7bfa,0xfa55.fe35,0x785.e4f7,
0xca87.422a,0xdcb8.2b15,0x4400.be5f,0xc7d8.5216,0xf8fc.8ac2,0xe2a.9c7c,
0x6cc.8ada,0xede0.392e,0xdc3f.b345,0x7b3a.2e95,0x2a67.99d3,0x9944.5e46,
0x1e0a.209e,0x6d29.f98c,0xdfa.0f23,0xe9d9.ddfc,0x115c.5c9f,0xa450.f096,
0x28b8.82e3,0x3a98.e43a,0x2c80.63e6,0x4e3.4251,0xb622.1565,0x1436.d0f5,
0x7867.c4cf,0x55d2.a92,0x7d37.99fc,0x8275.851c,0xa495.3f67,0x5cf8.fc4c,
0x32ca.00c3,0xfa88.8f21,0x3ca3.b381,0x26c0.19c1,0x67c9.2c3a,0x35e7.921f,
0x978c.2217,0x2347.4999,0x91fc.900c,0xf979.12de,0xf36f.c50a,0xd79f.4984,
0x8b0c.8c2c,0x4c74.a267,0x8596.a1c8,0xff27.bf19,0x6c53.26cb,0x2572.01c3,
0xe5f2.5592,0x5f13.c515,0x2639.c317,0x1456.bcc9,0x832a.c989,0xcbf4.0738,
0x7635.d28a,0x33c8.b1fc,0xf54f.0235,0x8cb.5256,0x7d73.2234,0xa8de.cb94,
0x643.1afc,0xcca3.86c9,0x6d27.c9ef,0xea2f.4553,0xb905.e7c6,0xf2b6.0be1,
0x21a5.12c8,0xda4f.31b2,0xb6fd.7ad8,0x793d.f8ed,0x2c5a.352f,0x99a7.1ffd,
0x3887.f671,0x33ea.f9e8,0xee4a.0e19,0xcdc.c9d9,0x1758.494e,0x66bb.7f1b,
0x4630.6cae,0x62e6.bce6,0x664a.3246,0x8de4.823a,0x69c5.55e4,0x56da.70e1,
0xbe13.611d,0x903e.1644,0x8b99.af38,0x324a.f569,0xdc97.a64e,0xe9bf.2a78,
0xa35c.621e,0xaf67.8b6c,0xf955.92ce,0xaf38.98dc,0x941f.4739,0xb308.a3c,
0xd8cb.8d96,0x87e2.227b,0x4e38.d4f2,0x2ba4.58c7,0x84a9.6ac5,0x448a.c55e,
0x57f0.bc5a,0x5592.bdfc,0xfc20.1f89,0xbc85.c2ff,0x.0a5e,
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
owl_page = -1
owl_mode = 0
owl_x, owl_y = 10, 20
fly_cycle = 0
water_cycle = 0
function _update60()
  rnd()
  local image_width = current_image.w
  local image_height = current_image.h
  if (btn(0)) owl_x -= 0x1.a
  if (btn(1)) owl_x += 0x1.a
  if (btn(2)) owl_y -= 0x1.a
  if (btn(3)) owl_y += 0x1.a
  if btnp(5) then
    owl_mode = 1 - owl_mode
    owl_page = -1
  end
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
  local frame, page
  draw_world()
  local water = image_list[4]
  frame = flr(water_cycle % 1 * 12)
  blit_bigpic(water.h / 12, 0x0200, 0x80, water.data, water.w, world_x, water.h / 12 * frame)
  palt(8,true)
  spr(16, 0, 96, 16, 4)
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
  print(stat(1)..'%')
end
__gfx__
87c9ded7d4f6c19469857f4f07677c8d5b78c6bc0d16881808530d7960ab12bc72f26dd3b42cce38c46bb92bd78536e264a2f09370fe1855702144734d559304
90abec561afb2bd85c61be09c3056dc4171062af2edbadedd5e894e1a147cb87fe54cb71f1954254a4496a2433dca8accc887fd1fedb87915fedb73f63f63f63
f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f63f6
3f63f67bbbdbff3ff3f59fce7f8fffb4ffcef9ff1ef1df1ef8f74b0f3af1cf8edff1ef1cb7f3c7fe70fedbffed7bfefbf71620eb7fed7ef3e5df1f76f36336cf
0fdff11e7efcef0e3b58fce388f6efcf7c9c13efdfbfffaef1f70fffe707cf383bf1ef3ef0fffcf0ff7ff0dc7af1c7bfed7b79264e56e6ec4bf9cc7c89f813f1
36e36cc7c89f813f136e36cc7c89f813f136e36cc7c89f813f13ed5c13e395cc4bf962efff1c70fded1cb6f7d4f9dcffff2e7a4de34cef7bb10ff1fdeb07f7fe
f7877078ef0fe8f76630ea3e34f924bfdc707707a3ef7b0eefed1c7ef35c989f1afb03ff781fce5fdf56b01cdf866ff4fb5a1df8efdd79a6eff250ec77218dbc
beb8b8f7bee31101674bf2de08008ff418430379f9ff1d3af287eff35b0af38b327e737b3ff386f74e626f85ff1954de7ab0c4fbf65cf338dbd17e3cf92d35f9
22eef73e7e70891abf5c38f902016008f96c40066086e9f70eeafbf7f509f10702efb3ad32baced128aeb165c1c2ee67cef211e592006bd72f0efa190ff18392
15c57fd41ff1b91a1332580ee7129ef2b95659460c72b169a2c0cd7a18c0832cf30b071e0ff9c7ae560ef8f34b8539c0cf50e05f9832f3e8e6bdfde7a44e2323
af7a27efd0eb5eb5939a49af704a6774c420b0533ef6fe3b899dbf098d2100b49dfdcfd0a82c32d8fbd6fda74a2daf06a58c60e6652489b0cff5333e18b68fdf
72cf1c6b56e6cce7bff0b7f74b0c230bce8bf7785a1884570b8cff09cf7fde0db043281455e4e8a58a6e760107a778ebf9ccf4eeffe712efd1872b8d9b9450e1
c32f33bf9ef311488f3e01d7b4b276958124f39fbf061e810af23402e10a47a262c719b6f56c3af32cfa52a41001f1a767487b1d4fead7a9a9a99da130047ffd
fcd56ef8f101009a91ee82e9e3842001f8f2bd6cd7df0503931d7f15ae65748a74e06c4210c34d1f4e40cddf7499684d7effc799eb7e183b159c18e1c729b1d1
963f5e64ee604a8d30f394af68f0e14e62089d9483732d3dc7940446073bd6161e30f39d5a00023c2f827802ccdf9c72c01c262781e1c358fbdfe18234ffff23
86c68de39f298d0f02c68000f38f96071f30cff83ea643c3f4ee74b86ef70f52f0f9a9cded2b147fcdff438f7b04fff74e70fbf1efbf02739bb10d5761f3d410
02fef0124940bb31f8e1ed1928063ab68f917d76c0f1fd01e4f14bf4377bf6cc0006166ccfb0336afd8cfcf20f7810fe7aefff825c08bfa50a61ab008e89f73f
228f769efac8147dfb07475f0c6e793b6ef74b0d18ff3a5018f4abd78dd8f77f4fbad98ff38b80efb1f84ede128b44eff034dfc70334eb5c88dd04c68abd2a1d
6363ea43f786fadc24d95ce356abf243ff24e910a19a9dc28b3ee6f439376ecf129f3d8ff56adc6eff2c5e8cf79d9d50f74eafaa52b0762bff5941db6b9ed9b1
6f0abefd7833008bc7bd4ef00e288cebf6d9ec5d5b43dac1ba98f7e048d47f73284fb8cd0fce4667380d939f2460c8b6b6e08b4000baa62e8ffd28db24e3a66e
2767c7624e660410dff1c1b753d3fb30065f2d8631d1d238e72288a1ecee19b46b585858e220915f23dab07777d3ddcf8f989cd088e5e32d7991fb5c4e40b1ef
affbcfc652d3dfaa6a0ca443d77048b1e2bc0e38c193df68fb1238bf28392bd8c32f9abafb3f4bd42d7d95f52a1588d3e4df00d7bbf4362fe283803d8eb05af4
fcfb1e7e622dca8e62611a4c55895ff50d4dfb8cdcf0448ff6f8233db49efb3f95c39ba5cf75752e9ff719e9930812d3ffaaf9f9c607a00874c4285c590100b8
fb7314f95e7effd57010cb3009c90cf20cf95afaf284304f72afae687bd2b11297f7eb2e6e72d0809ebf0c210822cd81df51faa7b0948f042f5a07df98abac3f
bf5103d3cf283d08eabef825c021cddb39c9f73cdd16ff666c7fa16af60f4e7f75ff79af72628b36910ff15dfbd05d254ff501def5760f7f0e5deead3164f5f0
fb6aff503d37a4d612a6f0c5e6f4f31e76f7f3d9db1173fd9cf568b6f31539748afbf22fb7e78c004cce4e9ece79abef31ec7b6c8d3c8db0e230ba0ff742ff5c
31831fe46c04a7a758efdf410126eef7a80f7791a5f64d3a1f514ab029931ecff0289ad0eff9a40063d1b4f712fa788f97de2d8eff912808eb9a53e74628edf5
070e1f8acc0970ceaccd773a298dffbdf1d207af34cc3b1fbbf72f6b5fe39f7583e3d296b1ff4e37a8ffd1f3efdb739f003ef9df9f7046a5e73e3af37635610f
6401652317f318ff8f89ec7e6d01808479f307b26d2c62f84c9ccbf73ccdf7084203677fef28f51891a5e4911fd58b64effc70f8c3c6f9ac4e2cffd74c15f262
aad5e25febc4e39d47edfdbe48629f71cddf057eb681aabf2980edbe8bf84b8bfc4218bdff3b8499caa89dd5200872bf065971f313eb89f73cddef8e19b53293
246777c6222fb1c3c8fc85284cc686ed0de2e879007a60e235949947a70d3f4efcdb7898bb4189236f3ef68765d32e037f15dabd94dfb7ddafbbf6a1287dbdaf
fc467685f9c4fd8182fafb10eb341dfdd7a5fececb1386e5f7bdd76d738235334c89a1a74bf6210a7d9daf3c3d9e0f0b7e8ffdfd9a77ade7bfb738ffeee4f77e
96fb57cff399e16bde1648ffb3bbe1c411f54cfd89dfd96f9afebb6fecda70bbcf741eb7a353d981ff31371e5b348737dcfaf6645fbf88fe758df6f92843c2b4
cf77189fbbfee8d387666d7befe2eaf6bbb3da0c7f4b6baa07078e8e10f5e418853d7760ff399e9e4bd352c7ccf50eef1c1e100eb6611c679da43c2b0b78b3f4
771e6a7350fe5f6309463b8b1eaf664f0a5babe48fe414bfd0d2e0ad306d78318f21884f4b378d7b5a5fb73c34f6fde46a64bdf0eb238de185ef7f195f6bc1f8
ce12c2d86924fe60ef64fdb61afeda56df120eb075d86ff757869a17fe009ff7235b6f1adfacbd387b8bd9c0f07a61b930b2fd7a6caad14dd24d36edb38a14df
f01902bcf205f10495a5bb02eb31cff3dddd16c0b50c7ec77c8c2098b7b86b0f0b5b4c8544efb17d809e54af1f6b7338cc757065ebd2e3353b8085481a99bc04
513ab0b46efd2f295ef3014cc280ede1cb5ddc8bc760512e830e3d22fe10dd5aad6f15716119e30ad2f51318ede7eff9e41c8995c0fe10e30e2da347f088c30a
bf64bf79e5c353ae2ece189f6fd65ef7bbbde7f6ef77e0efe911070c56969f585cf670a7b460753200f2ca674d7828e102ef57bc41a7b19ff723dfeb7689eff3
c899fe1871b784ccfb7b86dedb959db58ee22adffe7b4598fb40a0187d79b64b70b4b4f612ff77181cb40cfe5685fc00d54ce696905fdbebb48fe2d291ef3887
029709e1352380b8c6f0e676bf265e81a4032eb06c7796fe18aafd38ffa5b774b8b14fdea770cefb7cdfa15ffd8e308680bfa465a1e504ff6b5b5b5fd53ee9c2
5b677fed7afe757d7d7dd6fbfbb8adeb4ccfdd5baff8f54beeabfe3c278b869e58af135b2f070e4f546b7379f163cf6068b1cff8fca7681cb8b94cff5b3e39e9
1e8bdd1768ef122b7d2e36de95d8aee0c07ceb137748fe14b8aeecae0b481ee129bcbeb04b3dad6cfcfaf3e1c5f7ebb610c5d574e7fadaf3ba1483d03cdc756a
ffcfb3bcd63717ddac3cea367b5ffec23cbd52b8f8defe29d3852aef49c00852095970bbc1c105f9ad9c0f4d4448f602f107c7c726536737509ffe43898fd0c0
7ba2f6b2720f23ad233eeeb5077a86fcce71ee17fd73dc05305360afb324f505fff477f95fd6440df7301f008ab3ca7dba7e8afdb67e6c2491bfef0f1186c3c5
f3f370b70bc6eb95d5df6cc31dad50069dafbf032c1e9fe8aeb1c756fb73545810280e574b50b8e4ff124403654b599f1a7d6d65e981d75380a16fe130fb75e8
fc6af1d1080489e20fbf8fc63fed10901b9b9d2648e0d21ffda4485b107086ebe40afde293c7fe2aeb36c3424f705e16777f9185c4470afd48f300cf63cf2057
70e7b1dff6150005ff7dbef5fee77bc0220d21c778822c60c72e77b617a6d1ff77ded0cd76589546a71afb44af1647e96930f9f187d9de4fcc0bbee91ef916ff
1b1e7fa85f8e1c7313cef36b77c1ffa095a70f1b3df4ba3fd6be6b770eab9ef454f1eb0cbe7a6943e4f30c06a1f600bf7a46d00d0ae5ecf183d5f575dfdd0af7
a7e71814c8effeed50b0eba86fed8c3ee2a8328ebbdb3e95d7e7efddece08ed31ef8b6cbbe283df65c1cb8f60df92ae302d3e0bd92ab4808ff4f0861785c48f3
014b5b722b77c767cb92eb8353a8af23cbea9e176981375c077da1c63ce60bfe0befb5d67bb628b1abd333e5f7b35248e013ad3fcf7cce6abeb56f7b24e3a605
e754f26d79fea5fbe5a0f7025de938e6ab6fbe3f5f5ffd8728fad37ddfa3ce3887caf731d0abece1bdfc7594fdfc16532a40e0dd3bebcf757ef3bfef97bbbe9f
fda0c7af08e8ce3af00e1fd9604f831bb62c108ebc4d9770b8cef356ad1f9dac6a7c7e4fcc47580cd991e6fb4140f3e0eabdbfdbd79b7cefe99b03d9e7c70643
e1c004d671489a5d670011f6e3c79de1f1fbc3b3bf783bf51e858b4e7b42fc69ddace1c41d4e17fbf1aeb05c40d2bfb465b569e548bd107e7e28fdb60cf4f730
0b7fe8f70ecd807caff6cdaf1b68d7f31ea3cdf0fcfaf9bd00ee5caad2cbf7a6718709440f8f7df770776d47789f74cf7302a976d8b307e86060eaf290dfed5a
5e067cd47861fc5fb78e3231db0c0ca49789ad4f98df241af681ee5fb19fddafb67cb9b2f279b5fd53cec307208768d76a781506b7fb118b363bebb7f7fa5baf
e6614b5680749cffb338b3e363f5dd36f74e0dcdfb866c363824aee70e0fd0afc2f1eeafd5457716e359d7ceb5afd250bd3a0c057d3068ed178fa56fafe34c66
bbbebaf2880eb66faa9e31ef8cc781ea54f7fdc2530efdf3a5d618fffc6708b10b8095ffec850036ce79ca48e7dc0e9d5f067861816d7fd904ff9bf8922012f0
4cf694f205716df14a7a9f2e448d370e0f182e7f6ebcf8f089fbb97c353ceb92904183d60eea3210f4d84aca0c717087df4e4e81e68673161c1019289a1cdb33
3008ebb197c56438f7f06e3330d98d82fdde75d4969bf6f12e280724cf56e7d90d2f6e4cf680e25a0e7b6a7c9a377920df96f1a7bfc7a6856bad27db099ec776
8f5ce07a1d9d786e2fd1c10f4d8e6a172d75f1dd1cdf79373d387af19d90dc7e5d55b2e06afda386e7e6dfdb6fc7df9d9a1d7ffe84fdbda13300bbfd18408318
44706d3f3f0d44c02bf1aeb7fb55df3d96d700bad3f0735c019c1ff7a35477af0c7cf765ddf56b4cf63afb3dfe73d1fbffb813ed68d9b9b970849a593606136f
f4f4e4cc553b68f34baed6f2ca8d81e14fff9e313efe14c3f70631c3b2de9c91cdc6818f1f1c7c64fdd2eff4ef1e8fceb7303e4dde752bdb278f09b7ba4eb5bc
3080397d76baf1bce5f5c0d3dc75b3f0f9932f9520b3bf68a1cba4e01eada36b55c1067d8e0f34bc0df6c6f65c4f77cabb6f4d8dee5fb363473baedf53c3a019
bbdffa167f358767712d77bc633a3dea9d7aff2770c0000c8fc16285f5ff9de81908d9fb4240677780efab6dd7d2fd20fbbb88f94a7ddb651d3a5b201d2bc306
8300cfe53b60abd67394f3b6e81d7588fd720acf8d73abc767207f185b7bdf39d432a46d58b7887df8fce40d3c0b90c9a1463687003bf628fbff4d833a66ddf3
1321863a0e383532f2f4ccd86080337e4f926182d1244f270eda1d125cff533fbf0dc2f1dafbe671086f083c18ddd14bffb3f096df4bbed6b0e05b3278dbe60f
f5d57b9f61b1f7faef2e7369c7b20ce488fc79d2fbf1da298300fbdcf97867d47c0fcd8b8cde3c57fcf7e5febd5dfd16c7fbe7e5bd5ee6916db73300cdef757e
cafed6d7e7e83918d09d9d532f2fc49bba8cfdd5287d1ebabf82f06eb17efaa5d7f389eb4c11e4a7700e0712fb101cdd928ab815ff30bee736eb50cf1785f0e4
7dd033caa730f3f465e5e344efadef9e66d78f016d4f39514e7b156aff66dc301ffd8eeb53738faa29a8fee8d6e37eee76f2fbf3b3b67ad33ee8a1d7f53817e3
33badc999672350970324463cbb30f1ed5b6506d1d302268549d743f6c8f2eaf8bc0984274f852b413a08fe76646fca24de895f9d03e06d2856849bd3ba1df67
3e9b5b65fdbf6c9eb78befc983c679b834bcfefe0236b6bfb4b68bed36fdaeb383716fb9a12e68d12feed8815db45f2db00b90b3bbbbb3665d732f0b66d1f78c
efdfcecf9f7709f02034409ee70eff37468d2bd801db7f9b30625add171f7edd6594c0818f6d2f71bf766823d20930bf76f9f4f00d0ce47d0ca8bd47bcd30f7c
e90aabb161e347cfda1c7734bfff405917397df78ef74f51856f3e9e7ff932fbf8b68843c8150ac7ed1365f10608f660bfa0ee13b0481d7f3488fe8633fc8bcf
f2d60096502e8da94a9a1f51e4ece90ca748d7647f417dbf92bfbaf778b0683eff930ff69776990fdd5bd73aee85f0c689563a18d1b602141fec9dff2ba0e7e0
bebf7749f770607df37c5fd98fd0b26b9b78af7e0b69f3c74e3f7f82d7f3f550b0264addcdbcb14f6eabd0937d0c90876bb7edfdd7a7716f3303631332eaf770
2e56cfa0bcb408f00830090d220be7fa156c70de59189779ee7b8fd9e9f9db4051cd149773d50f4ede5f9adee6a5bdfd6f0e2b1d3e6dcadfda152de14eb5e41d
02895fa7396f36e32bb27f1f133fffe10f8e8ffee4e3f512b7fdb61dfb30e7fddaf896db7a8fef3336ffd6c77b803621ff65cc213665293d391adc34c10ea6ef
2f33befe3fe5e3897e6d0c38fa6eeb48ddfb79d2caf076727c65e167a5270480fbe95c7bfbbfc1c157860afd0ccf55b9b044e7bdba89d10bbc3ead73d28abf3f
ddfe677dfeeec333b61faffcc6afd95f7da64fe8d540c6ffee7d0ababe6de6caadba0cb02ffeb67efe3ea7f5f2d7d687db38bf5bb4c1fd5d0bfb3fbe3f7e6480
eea1380d765e53cfc52addd7b00e230f3f096343d2cfd6fd8fa8fc1c04097c74d34c7c851b313ee8d621df0c20003ff525f08c36c7574dc732b0cae4669df393
efc7a76f9f1a987003e53f6fbb6c5b9da7fe6de7fd305e5018833bafd7c46fe94e5c80b816a28ef34287d6c7f669be9e125eced3efb27a7cfba35c8fef09cdb3
3f7e909830288b8d2614703a3bc7070039a34fcc5701f0eeb98a26ab68abde4f7a6ba9f4d0dd12ab8eedd003c208c2ca55ac573f96717ff508bcfb08b2017c95
180ccfc1628e9c1cba1fe7bb870ac7890fe06dbf56b610e778acabbf4770bef0c7ebd7deb133fda15eb1af0aedd2cd3f4fee7d5f183871d2ef2fb061f00b7678
d6bd23686faf16be0f5bdf69a636c99bf697042e7f1e2287a53de9bcd5c7569b4019a91df3039a7fc6a7607db6035f0bade13fefc10db16de5e5fddadb73f00d
57c5fef36b90e5ac7ee9d9c07aa3eb743b266e32bfd64a67a0657014a3172f0b33dbb6c28a58fd2e3080d16b46e2ce570cf61b5cf26a810f211b0a12ebf7986d
19db3634263a63eb21cfea0896516db6bec5f346e7e37b9fa1847d9dc7d18e7b4d776fec1504a6c5fe1653101004bf1be7ed7877110c7e0990785ff6a6fefa91
88cb7beb365c104e102de3e2ab34b76534eda869f2b81edd5ad1ebe8bd50703d9a4dfebbf5d1a1d0c927e2552eb98e38ffef11ced0c62aef2c2df350da42ef26
c60e7d7835bd7b9cc1cdfa30b707f46e37750651f126a8f28df6019f629de0da082c31f4f3afa0bb61f1b22cf1d2e9a39f0bcfebbf51628b6ae8fbd7bec593df
60a8e9729fd6bd2d7d2a3b68bf130ee121fb7d192ef09de1c93663ee7ec2f16d9708df64cdfb3886ed8abb18d9aef406747ecd6ec7ad386f9ae9a7d2d8fb9881
c060ef6ee385c1b241f4da301b3bb42f188e2c7160166fe0fe205cc8245e8fdf150c48b72bf602231d181592c51c10e34f6bfb076f0c81010d046d7732037f8c
ed38ebfad1f1ffac81478cfed226e37dc097c767a0b60448f7eb93e626fe4042815ad10a504f8c7bff861def9d1f7fb52ab3a605f5435cf6e11d7b7e7ebbded5
bbc5f3488706d0afe21870730d68228d3857bb27c1ad8eb84e5cc7164bdbd7185197444d5fddeb1908d9bafe73f123b7fe2263681ec34588e58ced8e685c0e68
04fff8fce56dda51003121e39530f706916148d4cdfab35c5e00cefb5d77f6fe7117ffecea7fbc8600e36209e8f9c928718783dba2ef9f6773247346f688f78a
f0afef5fdd5fa770757d7166dbe538efd5bc062b70cafeff98cedf92cefddb0cd1d1b1f85fd8588345bedb95ae7ddafbfb37df8f74d2228ccaebe6f11afb68b5
ce60f73c36b1fbb11003afdf4cadff30bafe64e108fd7c639936f6ff31b6fedda7fdab5fe1dfdf1e98a7f33f68adc267fcc67aedf5b5efa7de95d8cfd6140065
12e38768ea8d2f34edfb3bbf9bf2c648f0fcb1f01af49fd31bf14beb60210fc2f3ded6967a7676f4e014206119f701f0ed3bb2cf710be187d7f30aa7da3ef59d
f2ee14e09060032527a726dadb85fe7d63f4f8f9c91de7eddae66691fada40c295ef95ef2c67bb5790eb1b2e1c2d181f004c77deb0fbf77cbedba5fecafbfbef
630ff7d0cd5b96f1420e06af51cafef403e77a7f9004e184fdfe9d8f09dedf1c18b5fefc86db756fe75e9c1f176cfd9bd4dc86cb9830bf0210d7bcf7c8fddee7
dd2f7d65e1e766d20c21de7db98fe67f506dc9ae5fe387ff275d6dafdbd0dc0bcd89a6ccfc1073f4cea707063e736ffe0c020e6790bdbf547fe79ca18aabd7e5
bdbf5bc8fbf7bda18508570120bbe5f9f93da70f2cea7e0711d99f718bd1c6402a64b7ff2cfa7f7efcdea7f10fb315f027b1b1446ef9f9e9cf783d310cff814b
9d7cfeb264e1a78bfd2f1b5fdb1cedf457c77b264a4e4d6e7f4f0c9b877e6b538460dfa1c80ca303318594e1d95f5177fc77bf4b20047d8dbf7e8210f2c9ebfa
1ca7ffcd811873682cba533a9a6c8081750c62c7043cb57efc24fe4c65c606df0a5b7f536c77e6dbf5185fef4fd685fe3dd0211863f180b0cfa1da7e77d2f77d
1403cee03a0ffef430b7fb609cd93f7b16dbfc5b53cc702a3fef93874741fb95ffea76cb30f6fe65c6c773c6bd7b07dbfc5b538cfc1e60b188208537c8fd7d65
c8ebf3bddd971e23ac6b667f91448f21ff5b72f6bca7f9d6631a7093d73be9f310e9b5cfdaeb38c383ff673d6c7762e087b37dbfc6b53cd0b2bef00ee7d1e7d0
f5c3befec1ac8fe0674febf08fdf6bca773ba14a180c9af31c2fc0cc7ec9e984b77b26cedfb698fefdc4b5f576f70c6fc877002f0ebef5da2b7ff9fb5eafe9f6
0be9fa85f700a1aebf9d1a2e7fa81fc0ed1197f8b1de7d9b28b831314efab6ffed0eff6bbdbfec6cef08d66c23a197804fdf4fd6e5fe7663fef04d4efd5d1aeb
fb521fdd51bd312f708a912148afeff5fd56ef7decf10aec735fbdcefdf59a9a71c7cfefdffeb6b5b77a5fd767b775cfbd97bfdf86f8f29df7bdb94c7af9aef8
47ffd1b612a4f8b73ceee733aafd9a6a4e97098efe9fe625e1ed27a703ebdfe7c8f95cf9af3994d13d7ae7bb1d704950e330095712fe3a2a1dcff6212ff397bc
80018c7b7cf7834cef365df983a7c864949ffaa6ddfb5edaf2de95f52b7118f1f679ebfdf7c3a15fa34ff1adbd66f0d1b718bb06dd7b8eb00c77fa7e0f7386d8
0ab21ff109c04a6c3e67ba9c1f85aa7f0d2bfb498f38efb048626016ebc6f2e8caa105b803d09433baff64a5f190061b5b8ba34072382c63ae814db10a7c85c3
b0ef048be388e2c80dcd02cefaadafdbe1d7816dd3b8ef6132002806d49b52a8544688c16cbee0b676e0be9d6f0386f685556860b61024f20578dae95a98ceb5
3ef4801e2683a98412697bf8a672b5eadd6b5b1581b3bf1b7ce00081eb2183fd72308397c46c095b16c6fff08e3f014f178103c915e940df73dd00756b17ec0d
5308425fbae5dc4714c7b812fdaca806dd10f6f0c2bc72ade164c2f10dfd98cbb4f5ab9b6640cd9486f89bac00d0640c2f9ce9be87598256fb67b01ce934f603
2d0ef8e2680db671681a2197639753a6bf4ca5cfd3ee3802f460652e7442d0ed142023959409e037931def2f4cf747f9cf77fabb5faf20fd1ace3cfd684ebd22
a344fcebf48fbdffe6906ae0c9d14afe602fa4d91c7745f50c948b9a60afe3473b5fc5fda95fe32accbebd3644cd1eb3e2b67efe043b884f70eb303c2aa8063c
966015fb71010a8008417172fa08b62bd36f084dca7c6d5e3a5ad6f0449da1170d6703b0ca4f31b2a1c84fe1b19b112e4103c78e067a002cb11802d3031582ed
8b3304afeecfdb270df21fbeada8f3e2c7cdf12a0503e75d0d1f0dad3890b4c33fc74cace99cf99d7a5859489a36ad864afa1df569e8b4d48e8b5fc0f361eddb
bdbdb1d08bf3e1a39c6fa4e3299909a1fb634f3500a1919297e3bdf9c5607abee851682f39565b77d7959d1004ac9783f4f0f3c04bcbc81d9b3bebf973b030dc
fe90e70da67e9c13c0eb7b4cd98ebf24d18ba69ac0bb9367c0a4b6098e5f937c3ecd63ac97c63c302c740721047d9903b53aadb2df84b93c00527d6233139be5
de75e78394eabc3f14c07a28a7ae7fdd3bb557354000bfc274f30bf7ac6ef826700df041b5cbbc60cc715a2e05669747c4f3901f3bdf98ac273061588be0f5ce
98ebf80a742d36217ddac780b700e384cee2af639c3e2e1b8ec6323e9e253111d2bb776598b1a6a3765bd32d0e91e7a4371e475a11d796ad22941ef0711b8612
6516ff2aa61818dbb5fc9980502febf496d00e80641731df8bcd4e0097e0af3ae301c2de3e8fb439015ce54d7d3da8c49c5adaf3dd0e50edf5236c6c54da5726
fc262a288343b6587908dea96d34f91242d78d277fb857bb472b43b6dbbe2c172d54c1ebbf13807b43c5689ae3445610f1a69122b7f82dccea0849f73a3c16ad
2a47b2b5fc7e5844fd388f85a1647fc7a5a8923729723c4ae47365d620e6844907aeee03774022c69fbed65a3a18d1ade85ed92232a593d436aa6953d24f6132
0710b9864dd3186467d47674246b8237021b65f5494893b93bebccb5a0a783e2acc14007f20c7bf36daa88428ebbc791964d0a4e130d2209b2cb7c8094a4c405
1989809a639ca94feb2e772afe11f46e3eb494ade30d44191b69b0ef028be8e30301f68e9d4bdedb7624c72ce42691486c3176b1621326d9b6a599ee7f3ed6a9
d697b1afa7a4d0596ad65da7fc30e1e8276b18dbfd6198176d731bed955c26bea4153b390adb00f2fae6326719e289c2a1808f45f7b3cd39ad212fb8cffe777f
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
2b476b0d4cc0b42c3896b0a9552461c1c6f13c2959c8cc154b70788b78ceeae2ad8956df7c538ee4ad220cf885b7089e5cac9df9fa06dbedc945d9d6014ef91ac1f093a21d782373275a595cdde2dc0812d6b676675c2e70a12b45727df07092290392a7eb35f27b3679b2d900014f3244bf42c3503b9fffc1b5751003a4d420
3fc6cc74cb2075ff4c8062dcddf77e99ce806c97f30b8edc757fd935a20b940678806ae2164e0d517c96053691f788f32df22ab724e2cd40f84b82f8ee7a93ce91b901fcdc413014c36ed351916b540631a48e5106c1c895ba2f018d4cb4ed7bd7cc866b830455e099a394331b3b7989b03e1ff337918b7c1478fb95182788e9
__map__
03866b0b31ecef05fe918ee1464a53f3ebff64168261136cb24d68d25009837b8298af16a46093caee5784550c7d6db6f1f284fa10f878e6b8f55ff05f0ee5f0876458389121f48cfe58eb04c105ec5144f78913c09f1778db07fe6c0d659f3676b079fc43ade8cb206fc47359fbce0e045383e969f77b94a2da999c4cf7a27c
ab97cc6ae8bd0801a84a279359f3e0434ecea9df84f1377da70c96ff9a1e13e9cff7d369698693feba1179bfaf61c011148f867754ca00c1bd201f8a49c46d274a948a95a9c21eae57dcc817ef8bac15924cdc84f67a28c272daa7ad857f23b66db7460a2f27adf192c058e03d624d1c04f418c91070ec3b6eab80507c3ce058
d93d8ae24c0da69cc82e344fbe82977523dda55bf5b66b99bd71f6694be51f46d1366d18e1f5837d7b47f2ad00ce6df1f540916dc0a1068d00034e84e50c5c5a9a71e4e2879effe4d6f78988e41abed58671cc00d27fb5dec9dcec1e7c642f7550ab1c46c79a13a894920774919a9ab565e242dd6220230334bddbc188a4cb72
c05a7c6fa47d18f6fb3d3989734f2c8fd01eabfea4163cdb43349cf40e89ff01bece8748391d7d693f657f289264eebf704118461cd90bcae34c5f4f2921d37a519288d35d14bf6966895589f0976e47125fb1e4a93a2fbceec5a1576bf12134511c6abd1e34b5376f2e36080de85ed40ff11f04f2ad23b489ceef9436f9e695
79af746858ec86130146bf56b07a7cf3eca20d1e4b76f8408674cc0695e8bf3d2c7c9838962c7a1c989bbd60d9df0adc82edfe96b422b835d32804c5ee94cb593abea2de380a3d0ef0dff348fb368a42606db5c1d9f53b0376040a8e7c9cb0cd1a8b4091133eb0fbec41d8ae8a48b6fa3a3cc1be9c7fa2d6a2bdc49e12e018da
1572099c3ce88c02623c8917e79eead77e35269234c6619236b8cf9b6713e143f5441fb799948ba429b5a75762ab7abd8e7ed58ca4c3b73591364e96649423bfcf47dcf352a9fd9d2892efbbfe162d501ee05ab99c8f5dc4c0eb06871bbcd552ca4db33d593250a71833e92eca86cf22c9c8a235d4f69fe47f22d57052ab9802
9d1362fb768f01c45498b377e8704803dc575b8014033b41825d66a13dd2360f534bd396769dfa55105f7032c60fd81b0a936b0c55e95d2e0bcc84a88604d81be99869a83ef46bf2ed1d6cca77a3916a0e183c9527321e9575452858d2bc6f05be5715d0a7ef8b0ef9aaf45eb682bc9feef6fb41daafa7c3d34988f81e8f8254
2c0b1dd6b1e94593e3e54102ace48fecbe206b5faaeb7028acf5d0f75d831a93606b5ddb877eb01ec86484ef7baf6b44955a7abb6e4baee7a50c54b792fd600725b007927f4142600831a1cfd0f8742235eb6a78f705dd475139b21de6ebfa9a60106f8c14ff55913ef61b55a6a2f113da33ae456c2b93f823612ebc97499a02
0c160bc758fba7ce77ee4b7ae8e55426e81e5bafdaf7fb4ea5a94ff917f70df80732e0add4760d91142548e4c62601be817ecb68a30e1de0de5087b9c43f1c88182cedcd48161693bbe2b6fe2dbe02c1ed895efffbb83e96fe1be310487bb33592be19c54e939ab3101434f67dd98e4ddf8868cb03b025fa32e1c8023c515de8
597990e9b6a0a89256e6c7cafdd2cb252e8982dc5a54fb138921e768a4fe7b7f90ae3a7a97a4b78dc868e193ce804c9a2d4e97f386af25b8f047fb529c8d60b86451ed5623cffef1f68012e51301d140c9b3a251bfd65b655c8ca168e8f60718fbc607e6bca939e6fa9d3d097d4910f5084ce456945710068b9c710608a46d22
86eb63951c120fe1d1e1c7402e6013d6d7d29153e71358013d3fe1febe1ccf6f59f59cff342a5c11c6d61655ab502dc2b6afd8675950c15bbc60d4aae937227ac29e39e6903ed9c951c59cdbcb66938c4e5327dcb7e160465f8260e37bd280a1a337c79fe62aed6b37134c95a034fbd8abd481c8446d2dc25dc17658e9d60657
2945db01a5ed4c00af11c81dccb1371409b801e59a877e151ba15969547ef971ad9793bd40c4948344f90d121276b67b1c74b03c4cb8dfc3ec901f7f5b6267d30975d2a3f4f38fb7ddf24a61d1b6dff8b252878b2c2b7b9f0be71b96833d9a1c33b17b52a1b643090b92e4d02f864a1f680d116665c4dbf905c714632ecedbda
52f685ec5b309fc45f7e3192516ced7d3d3691dece8e4432921cc46dbb0cf87a88d20ee1f32f139e2edcafaaa2fcdd3028a3d972e135a62fc6a07fc4ed8133a9a36d4e927aa71fcb9726d29c4f14c31be92d18e0a940046774c107f5fd38764c9776d31c1cca08a09f72f9264a1f2896a899e458483771fb13443885ff1eed6c
f7fc6b6a23b68e6cb69cf1d72bf648254170ffd8251d0b6713acd573696e5111c86bee365d939b1cb507c6e3df2bf47e4cb040e97aa3be4fa3d178b86dc06424fc1b15847b3f673464745d72bcd4e6f4b174b0487369c380116e86db13b5c34de2e7c39c8940d8484dc55058fcb9647040f8b13d1dd15d6a1b1fd5cffbf34e7a
dc7a0fdf5210e270695c5fc6b3b420c1e0721fe7b15fd39124020044b322a33a6e9c79b3d42336a1f8ca8c7b901f933ef7908517f1f7f2edf1efc7fb37b5da6f7ccc3141dfd71ff57d293293b7107d7a65c397fa14229e1a7214e0dd08573841e6ba117ef616eb8e424f725c65a487143d3349ed8e79a9b1f10669c4db55817b
3d744f63fcb0259e6e6a17676a4b33513b58da94f17e11baaadc673fbf7016dcb1b751ec76cd5082fa4e6b4bc57ee7b272d24506c4ce9f63db613114fa4ffbd37d7fbfddb6e194c764580b460ad7735bafa551fdb5d772b5a539117dde6b0db81bf5abbeee075dc37ebd41a13294e4208cb58ecaba874a52a854799861d0f7e3
1a7f4fd76e10502215938435c46f522b76e17723dd9f559b61395e32bea80d32938c390b25efcadf8724e8d0d3033c4857e33019fa204a24dd6977cd17e297988210dbafecbe7a4074f34962d1c29b2eda800432733281d0864624ebe00a02c1272995bef7f57e3dbd69ea55e5b157099f24c534d340f0cae112f2ef865bdf7b
8cd05cf2037bfc7690036aa4fc3d0ce3fcf61ffbf3ec060db9de98d407062be1e31ed854bfa74edb0bdbbcc74b73b90d78da149ed4f585ea8d2fd7d069162519aa3f117db57f5abbfa237d1d032cc61f3d568a3c6a9754288d44d9f12d3522f4f60478e9a03325eba1b948998fb8517ecf1a01ff3e0936d107e0acadd9f626df
6512fb62eb72223c8860bd5386c2884968ab2699cf576817c31d9b4def31a8bda17ed7ebf1800da07b9f6ea01c308cd11cfec36db18de9d677749425648d4de729777e328b8174eb759b8861bfaf89e0247c48eef34414c53cd665e3d61531b2e3ae8f6a72819ca738198c06c1de801594062c4928c82ad6aa15ae335632d7ca
c45861bf94dff7877e19b58bc140b8ee434e924f7c01e2406459d0ff76166382350db528001ab858869dacb21c98d85a1582a6dec295b93c716b67ff2a6d38746108025cd34625d90608f29d60f7f5abf59cf311f25389fa22b123d51441896fd35c40cd6f02dfc42432af35f41e2b5e360ab227d01a0d64e4b68de2ee5f1a6b
d854f4c5f6a11db060a6a22f54ee69286800e75e5efbebf8795ac2270a1486580542292a17618e5ce66a42399f3d86a21cb0d73894a5a322f56d63b791f71c26031116e02037c2d78b367482f83d51abf003797e00573f22cab6aaa92fdf162c7a7a11c1c494c2b70afa937ab6bf5fd2df0ca3cbf4d7576bfda1ac1331ff7389
385afd9ad2f15fe1cbf49169890acb9e7ce8890b5d2f70db2ffcbed5eb697d372fa56cb0838945a7e294d07f2ca23924894b55960dbd9d2fb67d30bf2eec3f0c658723d7cb89802b64c6b1f8c3e4faf18d1aef1a080b20ecbbdf4c708acb06cc2c925b7e7ddb632740f421e0112f2222be817db35726f481fe96c1f589b89655
0cbe7e55311ad246100de0370549e5b1acab27eab4c805a4ad2aa8e318497daf54ddc2248b5cc61fee7afde0e6c24591d8e1c436e28f5bef7dd9ef0d443e87f696266a6760328c7333a36ce7ea2dd81e51ed12f2d097c6509faf44fb54fdedda9fb742a1ac8c6f7da547204e82ac43edf935f64f8707fcda9a757245fff1a0a7
0b0afdb68e4f0305684d74bd72e215e900337f7d92036b46ff559b8a30d47933fd00ffb290f8635993b0ff13f8abf57d9478133d8306f74bfa3bc9dc47ed660464380cf3e23a4f341ca8576f559fb2062abf358a5faf4f4d7bd118d8b59b34807272087a1ebb296dfe5da58286aa9275acd73b9708a30ab460fd93fe60970183
9b2e1a055f771bcad296a12fa467900623518c109d1f11a584fab54ef541539bcbfc60e67316cc0bdc73d1a672ebbd60efabd085f06523f57b1c14b2297ad86ac689e72e3f357183fb4fd06667f0a9d949f4fb7533e97109f591a57d2a673294f9dcdae792fcf52d12197e7862ffa4f85d530e91e197edb5e402f2ad7781da0f
d9ef2cfdae45dfac9c18f0537fc2370c822fde842b205ae77b67a3f04dd478d9d28fbb0639e4ee5cdf6446ea227de5da9bb707c95db77ee0c074f4abf4f519ca1a3a4cafbbe5e497daacadc87e7f567f1871afa4bfa3d480f4d88cfe24f5d0b5b4901ebd19d71bfd35aabd28372202b25b883b44b25d85ffe5159eb9600bf11b
ebae6257e2adac89ec2782815270d26eff97ba2f07b04fcfa2ffa47e5d2d9c19b70b72f1ce3081cec4df510cb5e9847892238b54ebd8f6a0c12fd52e6260af34e570e6dfababb6bff2e6cc83982aa64759e77ddb61eea151fa42d898dad72c0837d894be2476052f0d6969ff7b6da23aab5d41c84a3db772802617dbfc2c2f0c
dfed68922a1762c3207e2ed5bfc87821fd5eabec9797343bafd366dd16425d031c5daeff8da3f92a13bceab3934b3f153551f3777558bada8ce72e24f2c3ccc5b7bc25d0515f4d64e735e963f97aa6f1edd28b836e1379df247fdf5bd57278bf63f2ffcaed96250ae7ed22ed1a569cb75dbf3bda45457a22bf7c07e99154dd5b
edecbf5a9b6bc5e55a979e94ef2025e64bd98c56166f6a875c37de86bd25e0d44099e2d650c7425315b7061a0007da2d8327078e6563797560cbabc0338b5d5d57cbce19bbaf66e099094ef60e5ba657d0cb66592a5e5216c633e0c913d0556cd80f99510a575b78a1568a73e42f79077e59105dcad44dc5a595a5f06f3077c3
d3445f13d50438213cfce82500a2fbc3d9127734f1d716c892278e86a16f9b0e8988b0e01f344902e440896ef1f3100d1240bb7baa1c40e153a5984e73cc53da8f2a412a041e85a7c4bebaa56d0a0150040dcf61db40f7db5603e400085a5584d704798e08000d9fb83114b7b1ba3c567fbc16c5f71a688327da0c3cee46df4f
801e8eaf873bf22dfdc49186a789e7180700c947ab22006e3fbe380e6f8dc6afc4976dab476a651b07b46bc39bc6e326bc3b35109054e0959b350150088e1a20bc555e4d60b13f6eda843444b78637ee07e0edc7e27094badc841742808a70e08c1a8d3567e309352c0909299214d03027999601a54a82bedf64242f27888add
4af2db58001a8123b5a3a4a884325678842504c1df71308602a68de434a27ac8a98042011752929516250b40f0a988c8161247133225750134095de8d0d0903f21e4093ee5a436396095d7ccacf509e89c5b94da848148ab40919b2aa244fea6229699cc73293aa44c54923c4d6ae01430a9a772b7859ad3a697d284ecc44f45
__sfx__
2bd4685c3f0080e74a381723922930445097212940a10743281503f5650a02e115521b41c156263a113054512432e291511622a2322d1005410063392590c2002630a09126264112e31e2b546376320b2073b65d
878913f7275500134b3e24a373551a76a091172055b02043176772231423236066693945d2b1313b64d301312a77c3523b1c5480f5493a3711a2443c16533130120340e5641b6202502827653013373905e2521f
e0293ae01241d101102826e0e17f144652532239047022280b01c0326c0a73d3a6251c0061b72f334270b0781e7091f34c26729343070c0711761d2431f2317b381263f61205717346790d776045161706135222
0dc58189294501f6242801f254232a5163c40928742124460f22000507011741c15f1446e0d43a2b1481406d0e47a3020a2721d2036e2b1193a5723904a0b641041490527b25674382583412d3804b0155b1f221
792a1fe03c6531703d0771f1454c342041007c397471d40d1b5400f6173e55a241722940e1623c3532026716156412105a3934c0714f3165f3e031331432f7251133c3d41e066052123c186182e2253a73236709
89452b290d61e0846b2937a0e44a067663646f1326c0852b1e454190391554a005420a309155243a468132360c528314171c26808303330693243c3c3320a04e1b225047541345c2816a0a52c2a5341e2693a03d
985fdb371b6010976720461131232434d3821f0032c32255354042e0352774d067021d317186332911315564182212816321167313143a201304290c111332311c60f2165b240472800f2117c3402e0e51c2334f
177ea5060e6041344111326080753166433777077642445716419384411c2300120637318085741451e1443d154013d77d2246c126672607411040262260d6663b7453354c1f3461353d2d6322c04b3444d3e464
280b4e35313313c16d383552d43220012157193a3702556d2b145285261c22429133140190437c2e14e2207b10435310470a5733d36922405126622c05e300382d5193203715343094681f6743125b313621733b
6a0906ad26172250171a1743011c2246c2437f037052a17b24006233323726507731224742f33e1b7620b62d2776e2d276372223f03c2d35e35270177750c3253e25d1373d0e14d32277050492e5411f65c2b742
155cce732f22f264550d60b2a7252f5423a0792d47a162072b467066123b570255772203b2671b02522254033e5472914325757174132e5402960c0b3273e409330393775f3b353247250061d3137b1622f1b22f
66f56e450f5681530a2240d11608262601c57d0400e2e3393d301224690364212740202343d26b3504427037022221d25837114201282b556272700b037346151e35a3c478355390637a2233a124183171003474
fe3a7ae51866d0912a08219017680c355387042b6071867e20235354041370b06478240752c60f0f35a2c7741161f044783245b0f74e301763f4793d74d17657236213d57b1f303081562b1432d3011303332161
171478602040f1d50a335453e71e181351a75c376040637e193351755d242652953c2d23b213441370303766065780315a1073c0a1781e43e3315938074367052e6772141208364384401077a1654f2112410321
645d2aca1240a12377220620c12c1f7400970d395483c15b2525c041493e0471474d16607146010825c1510539216262251c549275041b45008215144363b23a123450101a212022024a2b5460c65e040281014b
ec2c95210c122050122b203160370f54e0d14a366252e0452f544030242a44e0844c2e3441c07b2172b1f522133441201902725011323945d144241104c1a07b2d0422c0221d53f296730655d2d619292270417b
68fdb3e0197371d3140a717233131f5401633c09404387770221e2337a377481216c3d05c1b153350431126c1971d3660d15745192610d2451631d29771270491a03b161262664d3634411435065132555419079
f4a0904c04549312521761f1d7763426c0846e2c1630562b3161d290390867c0e222026073a20a0716a1155f090461c31429000230621316e2c01001109203032b025365461c26d167440b636252390657c10278
68883c972740c1943a303321b7620b42e2676e3731b1567e067543e533151480550a1172e1f06b210082e25f36345367612e6352c1400f53c253673662a333053965a02756171582e61d3111b0752a3451a31523
92e99f5a2e66f1964b2846511526090691c3370765c2f1010c0790e628134532e437117701273b176280726b223602e6261c432242000d4062d64f305020114d2c46b1426b0857d334072b264175093303e1e16a
544637fb2112c2502334319165040f02a006420b438283080521d393530900c392130a547126230f77c314290b6742a5290005133675170260023005263066323514e075292c07f0957e143571770b154311b051
99383a4c07112091132644c2077f26363381503331115711197321d41f3c67e2a76f0355e3f4310170e2804c13226086293075619111040571017304637330042e23a270663c1620416e2121f375483d16c0a612
722b1d69136731551e2460e104441802e0944a0526c0a4681512d204742034e2821e2f37d3d13931468035121d5333612d0655b28337304292a5072323e2023d297710a66e0517b300091f53c1113e111221344c
b9d8b8111a34f0d2301710e22436040630204a0660e272620026a0241a3824c310150c5543233d26670130161561d3512638334112500b56b3d20f130330d67c2c13a0e6242136c0161c0607b033182b22802771
b91788da2f20911363142053324b0444b1b2641104535036194700464a09019164252a2392c064372610572c205252647f0372e311463b22027514093641676f0457f2926b055150f67e2731b143551642b26730
37619a09056450475b0b43f2827405135093611411535013297710d200096780f1283405b3c6193f02a120501211a3415b360620a4221811a0a3213a149154230815203733292211c126336240244b2b5672922c
6b1ac6b901342226223b409317240a0350d1273e4552720d175452a4713517d0043b244582d1190734231253063440d3543e323212700c6590657d310312b34b136483846b146752631c246091806b3851729779
0a3c9df93663b240782747c361070b10c296563a47a397640350c2d24b02705204330a06f1510e3960426375095712b60f0c6042f2500d6413a64b0211c2565f09635127680e71e311132f750016032c3440a26b
b33192933127c3a5091b018073553e32c052112940d1113d116513213d0922d1d20e205541247b2c3670d34c2e122264381c4352f2051d5361b5492400510225293282722d0177b2b67a19604274533b26f2260c
e58374562a2690a6671617b2e221007150965a0d2420b54e3a5150f448311293a47a39573243492c66f1165107307091531a0633063b225052020537561060742e6583c5630c263152401a22e1e3061151f3c462
fb0a5cd02944902052224443410b3032016773165021d5011757f3401c074501e515295113e133166030c6111e00b1d74436724095060c5690e4033d76e2c75a3b204170451065a227740e45525776327053d277
28f12e5f247501605c31427213361c2182273f1525d38625146073051e244783e2090f10f1177b21545042083b6691145a193741410b3f0783727e2536e3a44b116632f645081312653d2415f2e4623c13a3d31f
bd10837b35039197020f129141693275c224312f15b160501b52422762121580924d1f1461242e0753c0932a091253c71a2026c1e63d1c72f111412345c1b40300200102720673609324250073203f0a46405608
72c5150e2557f2d1620f71617170036750925d3722c192242e4122052a030181d32c3956c0251c0b4772e5782047a3b5282424c121331766a2911b297792307c3d428014072416c1a265116380b52d0567a34228
2f3b36e21217918250224031606b1333d2432d2616923366156011b5540c50b3233a2a425125441c21e086411943b0a2390322b1d0661d0560c43a3000e2462a0462402335352742c72f2801a303640f2383f515
dc59ba98394600f51e2e4231243f021363834f1b3021b21126568341102440f067152c0352e1023a6291e5660a3623422f2d41413036042361d63d0c62630139103711e50b1320e2877e1e3170e4722505c25310
fbfdcd12103683e61b34400095101264d164293734b045493306d2c6601234d3915a0541e361470967a183763826c2731b27723176331945b076131d3391c00d2531e256512634d257522e17636437156773b422
9de05d852864c3e27711649373342536a23228234602536201777157313f41b090023000709007325460f05b3e35a2f1071561e2e63b2511935233201293354e2860c2b27b0004d391690e1733b6092a00b20007
453086e012569247430a5211a22e20701396280b0152842f1b3763c22206533336731e410340742573c1a447262640134139369101101c2101d1763d76d182180b2413657e141281714b2c424202363955101035
2808307504047395383b0733b7491d246266093855b2f05c113480c1510d564127342401f1f21430166282011f63d1c332213623207c0e150101140a77b360320b3471006d220472f56c386450e7680b67c2b137
1cc5f5093c60a0a14e1d73d3a01c2d01a3d0761b7441516c3870b3d334305253876c1432c195392a27c264071c3743230b0f66f0000a2e7023034b0f33215003214643363c0d2240834e24105346391a56c0857f
c988223a23306376453d3240e41817020141443637e347743605d0e5792130d391753310e2261329778343042d1523d03b0f7441001a202640823a0e1112e2192f075095071450b3747f04061070620d43019534
544dd3d817432194263370d3c06b3176a0967514449333590305c197421a5201421d1a2323e57c2a6292825a374463273e354350e0713d175331400e5292a402107013c6522c65608327094472b267126782176a
eca455e52b04730175337052a2262f34009471274001244e3a044247240952c364271e51f1155d2645c1c1200716f2b00a0971d2f1580c75c146402b132041320c7340920f1d65c0913c1a6020c009145383410b
1427585a077431313a0c6100d065255780774c24715154262225b214341e07112645084772b4393745c275772e0091f217385133a369154091c652247690a446192233e7621f1441727f145692441e246283b26c
e13bdcca0c1643427c047360b61a182053e132116370a73a282113241e324031032c2f75c2513f390781845f3857322646327112303f297142376725775112351a261231530101f3a03c2246a32046012110627b
1883543d374333c75e0f530351791736f2611b13156125201f7510c539152700640f2550f06478055743d5352412f34427337562810e245380c41a1f7192f4763c176387781e26313276196092e16b1a7433b40c
3554a532035402e6253e738282112330f0f51b274753105b04043203701e163317053657f1e26b2372e050112d7463420b3e3121b5741226b3d4470050723378120520332a1e5271971f1a672142251110806510
46b23fa230537391013a07c2b170193190e5533934823248043630504a3c5182f103301722c6180777035007377162c33a056091f06635770365211170b0f37027479066410571c18775134510c012206431b10e
a5193ad206713334430a15d152741c63d3c0730a3200e7203f246165473c7490522d2a34f1742c3243e3547135211244450170d045372761d3b4040325c3522709328180252522d041492d47d030150875b2843c
87abacd93f464271530a634080143e37c280420c504396441b22f1664e3e50e23702374681c063357573274f20018115480e7563617e3351e0f076301211054e1f26d0b25214635321743d0772c059147521216e
5f2978481147c0321a037090142c3174f1f4661943e3f10b2b441325263c67f38053157183a31b23243305280c4141502824064322250a72b1554b182493f26c0a13e1c1213821e372271755d212440c6053060f
97e630e02f2201a1391f06f195262116f3163329618205192f319066231545f0d5090f32b253770f17d091490a05f37744217451a4432570e00707100351c23e220582b229214700b675392421355d1e60b3b625
210ccbc53a72f2a45d0674f333590736913752140492d6622b648236252444a3d6690e5512a21f3f6321f317164341c17638427237260b3771554b0833d01572347230e7183822406250116500f6130f37e2843e
cc71a94d26179173690a71e387013b4583f1181c634387573274f246713d519290762901b2f21105046040611c6090c2192b5362236b2676f1c5632a674330573a02b1651a3c4092325c1336d2f74c2b21238208
5aaa4ea31b46917362135460e51a3675924267217793464d245661172c3f0541e329082190d3220e428152272e26410758040512126121719097711121c2d6762e6293704336368217760b54f0d6763723a22040
32a4af663c5110020d147242204f3a5601333e260521e34c0b6091d4282a4640c5791b6763613c241142725b3c004296062e65a156352073d35346235452721f0851e0c46722651057220f47c2c36e0f1331d04c
568a212a12371360770d7052124c3e3793c1652204d3d175331630747e0e23c397791c54f1862f17730186120b27e290582876b2a2323760b012740f7053c0042e7363f21d2f513226380263f0752e3840c2c373
8b3858a61c72c30730107153f6141615c2952f050621b251385751877534178366591335f21464341733701a2b3611d5302324313410086083947231378165112604c1c6530e77b27470352753a407243340b058
7d9484f4340110e506255260c73a3532c297710f5231f40e0422e346643d3772e6112f5081f5493210c2d71a2357e0f25b13607092000715e3776a067282b5052543414278027712a13d2907a1c7470d74e13537
9efd2a28337023610e3631b134591d31b260092550b1121f04755192262821d277231744d1763c0a016002593e6491527f295113f4423612e097190846d1252a393131550e2446c066162d218152422e67b21352
2fe3c496172173b12c0e04119402193422241f0a775136470d35c071753224f0a27e1c45829262036623d1610b02b342052020a125142e3300c4691a23d3d3683711f2d5621f0592922f0067d1a376182493047f
5aa1ce6b13421351791413e3c23e38761192321537814458026101d5163a32505251136382826e0954221041125091a11a3c6510014a0a11a38074302750462a162731866f091203e3711e20a0024a087691736c
6a950664265502472e064732700a005280b16f1e2671a575250692d13e3c23e316520201e013460940e076491b14c115653e5053871b00329114562477837525222710913024341033571d4370b7081b54438547
__music__
09 78161d2f
06 241f2812
01 017a187c
00 23364162
06 29692a66
0d 6119273e
0e 484d0d1f
01 0318210d
05 4f6f0348
0a 200c4f14
06 5828300c
0d 07097d78
0c 1c5b0231
03 23382702
0b 52535967
01 65786e15
06 7e595464
03 005e511c
00 0a341e58
03 7f110442
04 3d304e3c
0e 4b4c2e1a
03 38692024
04 24421400
07 30772672
0a 717b016d
0c 62390e73
08 3f683e46
06 29780e04
0c 71055f2a
06 30311245
08 33523c4d
03 277d3c3c
09 144c4a4b
0a 61442f4e
06 34284c48
04 2c3c113d
09 09443850
0d 1f224c7b
0e 04594314
01 25292845
0e 102a2100
04 30521736
0e 527b0441
0a 68142c4b
0c 744b457c
01 5609174b
0b 49043426
0e 39355f24
04 391d254c
03 471e4a52
00 54325212
04 50391b50
07 48190428
0c 0d105846
00 4c023371
04 672a332d
0d 4d04714a
01 43132653
08 626d0f00
01 15640e4c
0e 4c204e49
01 1c49727d
00 480c4d6d
