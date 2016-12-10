pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

--IMAGE_WIDTH, IMAGE_HEIGHT = 280, 280
IMAGE_WIDTH, IMAGE_HEIGHT = 600, 250

function get_mem(address,size)
  local a={}
  for i=0,size/4-1,64 do
    memcpy(0x5e00,address+i*4,0x100)
    for j=0,63 do
      a[i+j]=dget(j)
    end
  end
  return a
end

-- zzlib - zlib decompression in Lua - PICO-8 edition

-- Copyright (c) 2016 Francois Galea <fgalea at free.fr>
-- This program is free software. It comes without any warranty, to
-- the extent permitted by applicable law. You can redistribute it
-- and/or modify it under the terms of the Do What The Fuck You Want
-- To Public License, Version 2, as published by Sam Hocevar. See
-- the COPYING file or http://www.wtfpl.net/ for more details.

local zzlib = {}

local reverse = {}

local function bitstream_init(addr)
  local bs = {
    pos = addr,   -- char buffer pointer
    b = 0,        -- bit buffer
    n = 0,        -- number of bits in buffer
  }
  -- get rid of n first bits
  function bs:flushb(n)
    self.n -= n
    self.b = shr(self.b,n)
  end
  -- get a number of n bits from stream
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
  -- get next variable-size of maximum size=n element from stream, according to Huffman table
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
      if code1 > 2^nbits then
        error("code error")
      end
      for j=code0,code1-1 do
        table[j] = e
      end
    end
  end
  return nbits
end

local littable = {}
local disttable = {}

local function inflate_block_loop(out,bs,nlit,ndist)
  local lit
  repeat
    lit = bs:getv(littable,nlit)
    if lit < 256 then
      out[#out+1]=lit
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
      for n = #out+1, #out+size do
        out[n] = out[n-dist]
      end
    end
  until lit == 256
end

local order = { 17, 18, 19, 1, 9, 8, 10, 7, 11, 6, 12, 5, 13, 4, 14, 3, 15, 2, 16 }
local depths = {}
local lengthtable = {}
local litdepths = {}
local distdepths = {}

local function inflate_block_dynamic(out,bs)
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
    else
      error("wrong entry in depth table for literal/length alphabet: "..v);
    end
  end
  for i=1,hlit do litdepths[i] = depths[i] end
  local nlit = hufftable_create(littable,litdepths,hlit)
  for i=1,hdist do distdepths[i] = depths[i+hlit] end
  local ndist = hufftable_create(disttable,distdepths,hdist)
  inflate_block_loop(out,bs,nlit,ndist,littable,disttable)
end

local stcnt = { 144, 112, 24, 8 }
local stdpt = { 8, 9, 7, 8 }

local function inflate_block_static(out,bs)
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
  inflate_block_loop(out,bs,nlit,ndist,littable,disttable)
end

local function inflate_block_uncompressed(out,bs)
  bs:flushb(band(bs.n,7))
  local len = bs:getb(16)
  if bs.n > 0 then
    error("Unexpected.. should be zero remaining bits in buffer.")
  end
  local nlen = bs:getb(16)
  if bxor(len,nlen) != 65535 then
    error("LEN and NLEN don't match")
  end
  local off = #out+1
  for i=0,len-1 do
    out[off+i] = peek(bs.pos+i)
  end
  bs.pos += len
end

local function inflate_main(out,bs)
  if bs:getb(8)!=0x78 then
    error("No zlib header found")
  end
  bs.pos += 1
  repeat
    local block
    last = bs:getb(1)
    type = bs:getb(2)
    if type == 0 then
      inflate_block_uncompressed(out,bs)
    elseif type == 1 then
      inflate_block_static(out,bs)
    elseif type == 2 then
      inflate_block_dynamic(out,bs)
    else
      error("unsupported block type")
    end
  until last == 1
  bs:flushb(band(bs.n,7))
end

function zzlib.inflate(inaddr)
  local out = {}
  inflate_main(out,bitstream_init(inaddr))
  -- convert table to 32-bit numbers (instead of 8)
  printh("got "..#out.." bytes")
  local ret = {}
  for i = 1, #out, 4 do
    ret[(i-1)/4] = shl(out[i+3],8) + shl(out[i+2],0) + shr(out[i+1],8) + shr(out[i],16)
  end
  return ret
end

-- init reverse array
for i=0,255 do
  local k=0
  for j=0,7 do
    if band(i,shl(1,j)) != 0 then
      k += shl(1,7-j)
    end
  end
  reverse[i] = k
end

--
-- Copy to memory from Lua
--
function set_mem(lines, dst, dstwidth, src, srcwidth, xoff, yoff)
  local dx = band(x,7)
  local srcoff = y * srcwidth + x - dx

  for line = 0,lines-1 do
    for j = 0,dstwidth/8 do
      dset(j,src[srcoff/8 + srcwidth/8*line + j])
    end
    memcpy(dst + dstwidth/2 * line, 0x5e00 + shr(dx,1), dstwidth/2)
  end
end

function _init()
  big_data = zzlib.inflate(0x0)
end

max_x = IMAGE_WIDTH - 0x80
max_y = IMAGE_HEIGHT - 0x80
x, y = shr(max_x, 1), shr(max_y, 1)

function _update60()
  local lines = 128
  local dst = 0x6000
  local dstwidth = 0x80
  local srcwidth = IMAGE_WIDTH
  set_mem(lines, dst, dstwidth, big_data, srcwidth, x, y)

  if x >= 2 and btn(0) then x -= 2 end
  if x < max_x - 2 and btn(1) then x += 2 end
  if y >= 2 and btn(2) then y -= 2 end
  if y < max_y - 2 and btn(3) then y += 2 end
end
