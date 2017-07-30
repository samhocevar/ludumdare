pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  ld39 toy project
--  copyright (c) 2017 sam hocevar <sam@hocevar.net>
image_list = {
  { file="data/world.png", w=384, h=128, tolerance=62200, scroll=true },
  { file="data/owl-indexed.png", w=512, h=88, tolerance=10000 },
  { file="data/owl-power.png", w=512, h=120, tolerance=200000 },
}
current_image = image_list[1]
facts = {}
global_rom = {
[0]=
0x.000a,
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
  local data = src[xoff % 2]
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
    local data, w, h = i.data, i.w, i.h
    for n=0,#data[0]-1 do
      local off = n + 1
      if off % (w / 8) == 0 then off -= w / 8 end
      data[1][n] = band(shr(data[0][n],4),0xfff.ffff) + shl(data[0][off],28)
    end
  end
end
world_x, world_y = 0, 0
owl_page = -1
owl_mode = 0
owl_x, owl_y = 10, 20
fly_cycle = 0
facing_dir = false
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
end
function draw_world()
  local data = current_image.data
  local image_width = current_image.w
  local image_height = current_image.h
  local n=8
  for i=0,n-1 do
    local lines = 128/n
    local srcwidth = image_width
    local dstwidth = 128
    local dst = 0x6000 + 128 * flr(64*i/n)
    off_x = (flr(world_x * (1.5+0.75*abs(3-i))) + image_width - 64) % image_width
    skip_y = flr((world_y) / image_height * (image_height - 128)) + i * 128 / n
    blit_bigpic(lines, dst, dstwidth, data, srcwidth, off_x, skip_y)
  end
end
function _draw()
  draw_world()
  local owl = image_list[2 + owl_mode]
  local frame = flr(fly_cycle % 1 * 16)
  local page = flr(frame / 4)
  if page != owl_page then
    blit_bigpic(owl.h, 0x0200, 0x80, owl.data, owl.w, 0x80 * page, 0)
    owl_page = page
  end
  palt(8,true)
  spr(16 + frame % 4 * 4, owl_x, owl_y, owl.w / 16 / 8, owl.h / 8)
  palt()
  cursor(90,120)
  print(stat(1)..'%')
end
__gfx__
87c9ded7d4f6b1756b062de0bfdbe147601920f04b86120303b8c6208d068bbe68f521903cc2c34a68226660843cb398b0f6e5f24ca58802c183caa608687bdb
970ff59ec264aa5861d4f8b14db541cff0660fe58d34a61186ee9fab7fcdb55cf49cf1273f8a561f4d7c9aa3fdf17f23df1c70b6853ca16d0b6853ca16d0b685
3ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0b6853ca16d0fe63c78f5f73b3f5dfd1ff
e6ef78ff8ff8fbef7cf5df2b4fbcf5cf2f3cf8ef1e38f8e38f5c70f1e70f3e78f1e2c20cf0e38f6f75bbfbafae75686c74f1ef29e3f75ff0f559ebab59fb8fbd
f5512d8f7af0ff3dfbff2effdf264fb8b8f8efdf3affbf1dff9f8cc7af5cf8f1cf8b4922799b87a0c72b6a1b6a1b6a1b6a1b6a1b6a1b6a1b6a1b6a1b6a1b6a1b
6a1b6a1b6a1b6a1fe32d8afd530b161e7c28f5009bae7cd801eed4dbf24a1547d95a05ff448e7ddb71a6cc7afb1fb130dcfd4007b9ffdf451cfa9158397b8f20
480f66505a2dd6b4eb293afdcbd24bf611918744988efd6b4ff3d914ed23e1efcff6110dd370ffb4327f8eab2ebbddfcdd914f99ecd5628b7e8e3e12abfb97f6
61570e39f72012dd619e63a9c2affecac5e7d5e21d5956a3b3b4cfd826af5a292afc7ed3afbd56b4f76acf1f29dbd3fcedca5b2b1763dd116becab5b65d6d8f3
6eda3fea3af5654fdedfc7ec9f790d725cc727f661dff1191418688c2c07e268ed8b542dd683bbf6298ea26f8cc49f0a28d90ab27b43dfd654ff692af7b51df9
b6fff76b61a5fab2b5cbbade1ff222a057583befbb33dafd7afb7b110dfbbe8e7dd7af777e3d76b1cf8f7ffd981bdf6fb3411dd656fdd461e09cdd8d665e7321
03a252bec23dd3024af5e6a6afcf312d7833fbd9b4f5c42f6b2b6761359daa3ae26ef87c5204ff9b17fc984765c7ebbe1dfab3af2ae474fffc6f995674fbe3b8
e7354e3ccc69858b4229d64ebfb34163b17a48cef5754cc2b43bce353df60b53b4ccffde7a24ff361f31f8ef7c696cf6768df3ffc083240a0081f629542f94e0
535798dcb76da594455cf3698b0df2b0dfb769eff585300755351dff3f680df6ec88ff63a20d7629b37c22a020f92b9eefe13a2f7ae292070799e11a52ea96af
511af526aff9a2af4a262074f7a6a8749f7588df23a81c65c1b763c2cd3be12c66bdcf4475346f3f49ac7eea5aff90bda3a54704f7324af7fcedf38b73bdafbc
c2acfe0c1af635a1013251f20a83046c926d8fb3cbbe3d9e2d11bf71affd1b21a424ff653d3affd53d64d7d4ff77f1fc4bf7b0065663af27a14308658c1d85ae
911bb59374f96a85fb74f7fc1df60923cdd9b757b4ff311af77762d72f97e8fbbdc1d65c6cb2ca90c387b94c921e1c987a43ba0416afc124c2dfd6b4fbc5922a
f215ff69b2a0a8103efbba7b7fee9d0137738a4c52248761bd8f4ee5040a0a28abb10dfabd3493afce81ae1c93af128447010b1a18cc35aa4cd6b151a9c63987
4428bc6f470b7183a069e37aafd6feca0d7e72c7ac5e0d412e4617f717216b5fe0b73851b5d95f26b6271f119ba28f9185b86a83fa8eb4a4dbb7f4f5b24fd64f
7b4f5d579bf921b5321bbfb6ee58ac2cabfcd635f10acac7be7b3340465aa27fb3af6020af5a0e883aff1f4350b15e2501818ba2cda0a343cb66d5f5bac2ab05
8fee894b71243be1c7e1411dff4c7af389afbc9cfe36a408c679f1b4a5d05c95afd8ff16e249d2dff4f77fb154ff3e6692f4fb4544f7e9371bd7e724618bfaa5
a2d657571b1d9e69835f748e73bce1dfa7e9e3baa6f61e7a8535fa05c27987b7d90d074fb2e8478f0ab5ba1d6698ed592a0db0625fd80dea79e3269efe9f4ff6
bf6dfdcabab7beb4057a42b5269e756a94eb23be4ec18b5a9e79a1e8292a7b23d7e0335665088d4ee7e8dc6ee532f7c71bf574fbee8e71f5b12c224f19f69e34
768817509e85287be5f0d79ef6934e32727f466235966022c6a980dbc9dfb5afca206af59661cd559518ebd8702669ec0330159330e5a404445a4a9efd2bf05d
f801afb42976109498ece442ae0b52a1f56bc380df6a5af6f8a9cb3ed5656d706970b212a619c902a92d4c6366edf350cb1fe9c37e6584fb2dc2fa44e1501d47
2e9a8410456ff9dc599c2d20abb4a6354f921e4e8efd5bffe2ba56520ab5254fb51f833849e75b4bc2b0e1d7a7486afd4b4f7545fee9efda8820a1ecc5d2ddaf
dd5ed3088e6351d77ec6e1d76b286c2d2ef293b7f6adfbd8b559c90a753b0d2b74f528c712df5a55bd4b1f1c23fc60b77309309ddea26f95154158ebc4f1274f
7971e3716252914dcd2b1e1e617b16511801f580c2dfa874ff65320af4a6a2d2f4f5481c2f51d1058ffab53fdabb30d85a0c2d4ef4561afd0f8cda84f95ca63c
10367b8da630946ee8d26a10bf9ace8efdacf576fce270c1899d40dac6acd45f36549d0b85971df11afd01afd0f9eb775e2b4f53ffc1a2ac542a32ce6fa663a5
6d4ff6d45af6d35693076b4dc9d6e7211466a14697aff69374fb910df0e8dc0a5ee7d710537946e79187d14fd13b542df972ce5a0a88eb138fba140212b6f8dc
0f0c5b04927e05bca1b780358d23970fa94e3bc2df6633f75fc2afebc7c39fb92d0fa75cf93bffba3df2bf2618c09e9c20ecf53ef6d7e3df56f99358133188b9
5c7cfaa22bb65af189350132a0caf795bfc548e73dbb2693af61a99ff1b2b8cf9bac57cfdb60af3389fdf9278fa21294bcffa58ef473cadd6696a849ea70ea78
ef479fcebd34b4ac8761c5b3df93677dc50efdbadf49eac4741733bbed1cb2fac6ef379ef23f08c98fb4fa55061ed77da2cfc17f5fbe8400339e719ca79e403d
c661955b90f033cacb975efdb62af334e3dc92ed0751708b67af3bce3b8d71ea46ff52d77e570d7f89902dfe5bbdffe709edb092dac6ff73316a3be546783b30
8fc50f4107d24f760765a596e1f3f06eec8979c124783f9fa73db5178a707e7f7acd7b81ebfbfdcc3d78298c7afd852e7fd43ca233ef91026641ef8889ae9b33
75bf18907684ffaefc89e2d92d5fa0ca88ef5fd306f3c5009a78bad2ff37fb869f56f71ff924af5f569ac45e0e5f4cc97324f18927280fcaaae5c7dca62eaa71
1df6c558eb60b6feacc2fa7346cb63afe9d7ee71fa536e757675154cefc0afd85a9ae43824b5d7dce025aba5432066c645ecd26cec0becdf5cff6d7a0dfdf549
efebe3310cea2ba46154967765218dd5af7a4b02df568a95e7ae481fa7cb8586184a6f7550d3bf7b4bbe751286fdb2cdf93e4513d4afb21084b7a3df5de95222
5617b60ffcd515455f0967e9ef274e594fd9800c23ddf6e422bcbdc7ec66b45ac3df2daa4d76909459440f7d1a7d4a40f8e73650af50eec525b71828201b4939
2da00504f5f1f5e90686e4e907495a6ec2677614129dbec3afa8cb5fc33fe25f5c9ede4e5ef8b1184917a34d50ceb288e3f4fb410df56550d061c8bf69697b11
a4749e59c8f3f4fdbcdb504f79d0171a46c6c9903243a4e793034eb9504fb882f3c5d43b6500e90205e089f7bed05be4e5867f3bcb0046db3ea0b96484fbe10d
fd9934f3ff9d718875ff4928ac46509f75a412dfa4e8e75ea2a0e0c22bea484d86a75af8d46c5fd95202f4fb193afd0f8efec254f95202ff490d01d5178e98fb
4b28d7a3af447f163374ff1e518e3b8797bf173c71a8fbe32ea61add5a4cfd822af5f6411df5280b59fb51a79ca838ffd78e42f64e8b26e6cc1df78584ff1ea8
4fbeefe836f281432c5caa514e393afdc22afa473b288fd9814557322da0eceac2ff20afdc9a4f792f080444ad6d5bc7653508fd76533c6eba910df569cb19f7
5470e1554975858221728ef7bc2d7f8ac3c2584ff1ec1aff5fc3af42b092bbd39498e44412b290824af575dff684fff9652afe75e75a023eadf0ee8ec41a487e
a2dc26af35ae0addfa7769cf1f2536051263cf5e11013eaee00d8c1df6410df569c75a9e5fbb2532a7203fa12e565c3f07a1df297a45acebb20d7d5c870d7793
179a34baa8fbe5c4fdffd5521043578482501a72ca01f32ab9efbe2ef3544f5c2e5fc18a4e8ef254dbe12436ad7c6ea41f76e01dba2dfc5b0a3d184a35dddaee
c23f3b80d65d11f2f4f7eacf76a80fa40dc924f79121e90127fb59c1edc5a00d6c7e0deac518e7edcf37c0697f7949c436132cb22df08af24669bc947ee75a0a
b8e974fb4b22df9dca60303ef9eabc0f58c5e8efedcdb9a1efb5b8477acfcdf661dcbe7169ec45abe8e79697afa1662fa933dc544e3d8f96ee5322bb09e73697
af3fccfd38bf4bd6f76df41c51338e75650af1c53334005ec3a599b21a997dcc4afb8c30277540139febe221bc59288dc590d02db929606d91cdf5e9d4fb2544
edfe11ee7efa17cb9efeb22fcc1a1b76fcb847241153f72757c7e428e1d7d413f4fd119a87e5912df2bf73554f86f19949da5f7fd5fa421a2a6565fda5f298d3
2a94a447860fdf4f55fabfe44e544fde5a4dc775a88efdfc1df292af8e0d56cf1e5a957f5b80cd00a070e7af9473ca478eb437d3fd3ef43dced456936326af7f
48e79d7afbf10df603dff258e732f4f9ecdefe976976d2cb4e6b2ca7226529b0f6aa59dd67a505b9292aab4b2e8efe684fdd7aa50735548e75a9afb2b16defbc
56f873ffb59ba771cd79833af2bf30c1622dc0ee19da5757e90fb2aff56e9ebdb7e7a27e8e75a1e1d71344a1c11e406417452b3a91cb6e6fd67fd439bf1c7538
fb1b658d09c1edca43dd52bbd4b65ee3df2bd052fd862997af5a08efd6dfd7d96abd08e57765fa604c42d6bb566fb47fd3c67282f63416d1fc79defa54d7af57
d4ffb4bed651bf5e81f8efdb08eff4567778ddbfc6d1db6bb4f0df6eeb29a83bc352cc7846cee48d2112ceef179b008e75c3afe499d454fbc5ac1dfdd2b62f51
74f9da8eb9ab39969d90bfbcf2d1396d81dd7299b52f8e68108e59b1e200178fe279d7af561374f9efe53a89ebb751997ca2af69bbbf6d87febe0615ebfe8f77
6eb226252a65e6521fd9c47913d4fb9e3d702c636b979c9d3af148321af29a0d2ce5e763c565637e21fd8c71a0d1499ba95b5d924f38fa618f4fb197af5edb08
e7dded7acc4bce71a7d82ef61c8f196eb92ba3a5a0fbc51dc0fac2fc3af5ac3df649bc359e72e3c839fbb688abf6bfd0edc244fc4321723e1eb5b75973f00cf6
ca0fee3d4a3d97b6f63f6e1abfc223c2338116c0d8c32b7b9f24f6212a8723c8fcbd65ff15729e46156f773cf77b3157e964995dff8787e9567e93effdbdc703
42e798f7316fb39d3578b587fe2f1475ef87cfe468609c3ff36372ed8fb1ebe3079fdc8be744cfe362c3b7a06d0bda9ffe282fbbfef4c387662fb54d5acf6dde
46a8fd9428ea03837b2f083834016d0fdb1ef7c3c9c03b903f36ef286f707e300e7d421cc6b1da16b55c3cec3de2c54f6bed7fa710c29d4273acf66cf0234f57
6e7780edf646138c602ef036838024a7a339ced4188ad1f9bb8f63e1a1f6f1c363cde005ff119ae1ff374ec1f012532a48edf0efd8fb72acfd3345df930fb076
d87ff3e37496cd9109ef7c34c8f09d3671f0e603c83e3f12273304bfe9898a6384c07b0cf620eef7e4209de714ef00ec291624c7f24ff39e67483cc08f9bce81
b50637fc8261e97682c8d02dfb92d884e5cef173d1c033f87086fd8cfc0d421046810cc9609a81f58d43f3bdb98af701889480e2e1cd860352f9165853e0cf46
4ab706773314c9c716384e30ed2f8540473f5ff391240334e0fe00f3052da56770c2e10fd73edfb9f2e9a1771b1f0cc1db9aaffcab9dfc6ef77905fe913070e5
637bf502f7d10c63d0fa6c00e50a77427ea4e106ef946221ab98aff1f0f7e6b15aff3b903fd68a26fc959f776303edb9cce910ab141ff3ac8fff984631c128ec
f67241f06373f60aefbb0a0ed40d7f634e3306798bbdcd42f7f46b89fddcd43af703f021f09c368c1016342e1cbb90b7b3328faff4ef489ad52bb30eae770ef5
c877c9cd007cc770aefb328724eff6cf10c344a6524b687108fbb605da57d4972b991de3f7b7877b65ba12e1579cbd7354fbd54ff7a3099d3fe078478b182f22
ff812ad3c0cafb8687b73f163af6058b1ef7471d63a0ed8d76df75743e6b1d83e66050cfc94db8cf06c3b48cdd141e48b9077ccfe02327771778d4a67f84c5ec
f50062906ffcf6ebf1cad3fe2eb0ee6d84fd5dad3b40c83d82cdc1238f3f758ad6372b686f0d5bae6cafe051e9d622f3887793e1c623e34e00082024b70c4703
06c916c1f4c4748f616e103a1d81d367f7784ff6d3895fd0a07479fd30b00a3d41bcc49bf8fab34a876870cedee073064a14e13087749fb09fff4abfc22ce802
a7b0df008bb34ebeddb42ffeae5a980562ebf386287c3c9fbcb48870bd6e8ceeeef06ee8c0310c636dbf041ecf2b3e1e68f5d87b784e030201a3f41b063caff3
4b8062a866a7e34f6c067e981f753c0a15fe804fdb33ab81e7e3003803828eb7471bf7760c64c6e264e88a0a56df3a5406c081058fa130e9d6a5e77b8cfd9af1
25ef346f0ddee3388894504fbd8a7004fd64f50eee0af63eff9191009ff7d29f357f5d6389046cfe77e462c6e5f95fd912f4995df771f201c5c166344e545f21
bf781f97e470e6e30f621627164d577c8efc8af7464fdb3851d34d6264df32cb264f74259e0eb0bef98e3f956679770ecb1c78a0783047e7282a1bef10103d45
3048f483a10504d5eae1894da6e1edd00f9c5e2044c8ff777b0228fe25cb736f8d523740f77cb2e9527979faa3d10fb76ef927cb541a8e7437076eb10e342f70
297c97634a29018ff1e08393c6414d301045f986c64713ad7570626c15f5687ed797c5410dcd13ad5c08d64dd01fd12ff3a7b36e40b4a3bb0355f7634668ec9a
bd37af7a9e6a5c15df992bf840c9fd39798fbcbacc5eb455f0411c370fd4b0f7abca5defae40e5d7ee3e948838974de78c11da945c6f5fe2bfbf524632e10e0f
535bdef79bcfce7e7e957d9ef335cf440ce86c9a6007cfe03097c81372c00cf5686ba38d09af96a0c8e2676fd1f339b038a238bb03ade79a40e3a0ec3e5fe2eb
cd19a7fcc981e0fb8181f87800090624812a7b3cb22d5c7ef23b1d8e5e5c5cfbd5cf198615acfc8de915dde5c381258c31c3a0df58b728c4ae524f69dc711e27
0c5e5a2d77514f9ee2005fed6773c5a13e8adf5d6ef8a21eee18538be1eefad526307f20fb5cbdc7a890e1c211a2efadfd0eac48fa03f3caf73fa86ee535e0c5
2508183fb9acfbbbc9e0a36f17411fc2ed6aa1995e501065bd3c017c72870c36fd82cd9f739eb3377e64bfb3f27b3378a157e0ca10e501e22f03e0c87db138b1
99cfeeaedbc0dfdd424bd686749befbb08b2eb0378ee84d327e6eafd034f420a0bbbf0c2fb10e26f16fcf619bbba0f9e5c7c805e7b91c2f82824d260a0dbd69f
545fa3c1a73be6d67f50b0cba876d0eccf392f18c5645feb945305fd7377330dff3be0863029016d7762208906fb9861afdbcbe16e38e072811f7fe40eff283d
88049d30beb5bcb0cd54cf784e96e0c855c370d0f0c3d7fefbcf2602afddf1d0d8af68c605054b149be420c981b49d183030a3f3e1f80e28c6f121e08941c3a1
acb33400cfdd8d3e6350cfb30fc33486c8d5ebd5faa127abfce10524813be754f536e4f66dcf26829259ebd797c4c69b418ff46f0c5c7e98159de662bf58c02f
ac8eb4a0e43e3bf0cc9ebd440726c73d419ebbdcbd4bef2796038bbb98f043f977771dc1c0e99d7b9fa1bedbce2b6fc626cfdf51bfb7690d400abfa0c20ca142
510be4f97e6a360d878efe156e1e39162308c6f24e684d2295dff07845e4f0c5ff78eeef2336d7b1ffd1efcbf65fdffdd40f63aecdfdf1094a67640a262c723e
1b93b6278f3047f6c31b38d3c38fff3d726aed38e7e70830e9d9c6c71071b150e7138f2c8fb32fff4efd6471f3b977c1ad5fa4987569f1e2f6d3bf6fde10c89c
9f33af7c6b3f7132f4378a3f0e9951f1a08d6c732f0ed5e280ba5328d5220d53e3cf0051af3026b360fe069b6f4d4ceeadd6c6dd0ddbfb78b51a377cf7d8abf9
2cdbd581fdd63e4472ba2eddf78e04000877c7e0f08a5de3be81b08ecf18918e678fdf394c7cd7bf65cfd611f7a5e57723f4e191a144626f04de008ebba810a3
bc6f9df3319e1d7785fd3607e72cd8f2f5c81ea3886f88f87fd89216907f08ecf8e26c45160e007210bd88700f4fd78a7ff9a9264d4edf1b1b04ce28703136f2
f4cc586e52cc3378f496382d9347f23071d8ec9bfff444fd7e62d746eec36208c602de047b341ffb3f083f726ebdc0a0a6b2e0c3f68ffdda1ecb50bffedd78f7
541fde08a31af3fd64d773779dc104fd6efc30cc9e4de9b92193b70537af79c7f9deefd8afbfad56289ee6b12fdb120079ffbc5a8fb769c5e52d3c026847ab6c
e5e9975ea29e7bbcfeb69f5f172b70374c6dba8efe381eb42a03e6f00a0e22d73038dd128bb817ff1069fd43f618a7c12f1c4a664918eed0afc1fecbc704af54
c72bf9c9f308c9e3ed12d7b176afd368706dfb1fd7c0734ff9472fafbb11ec376beba79f3f5c5463c6b9274d8fb7518ec7562bdc58181f01ce1c81116b77307d
ed56860b65e10d13c686c92cb90fb49f17b1609465e1b98213e68fe3336b78e05d139f9d82e0271c63c8cde952457bb9acd234f7f8c41d7f0a6fc953c89e2ec1
5fdfa0626b88f66592fd31e8efe05c50e1940af68e0757f6cc829dc463f504c48e47bbd1395fd8d3451b0f789efd7679fcf51cc3802011c8bf14fffc9416bd8d
12abae3b301252be8def37b23fc26020c768af52cf2c8462301701e71fde07041067855882e83e69b305f8d3127773a2c7065fb904de641fff90933eeb4ef70c
f3f7c019d743cf9fb52d7f8218e43c4050e97ed8867f10538f688d368b6c42803efe7e0dfd1f26e9929ff526309860132c0943435b2c8f2e904e322c58dd905e
bf1a4dbaffa4903caeff214f7bdd9d66e7bb88b1777adf0c64958dd0470304283ed5a4df58e0e7909fdf51fcfd141c9c7d49fd95fd091bdc53c8f524e2f70d47
3fb72bebfa77122881b6737dac20db93f8d27651a80876ddbc8abf47b06d338a731341b6fa0ccbc4d518ab487f387938752a8802efd55e98f05cb23fecd5ebe1
9fb9c5e5cb4071ce09dbb141a297c3f34447f136f76d683d6cf83339bf333e4ad6897bc4820289c7dbfcbe13f9366ee1d844ff7704743af7d1f7bb3c1febd915
d770afeda464c9fe9bfbffac4cf7cefe630862bef67c4a813994623e817e0130ac6ef2fb2ca7f56d2f12c3766ed78ef3b07f2165ffe56609f1e26c324b78e46c
50803f7d64e73aee37824d100cfb149fbb83b042d73e95a9e006a7caef0918bbf3feebae6d6ba3fcc4e2ead7683e771ff54f8ee062104c7beb70f5da16cd8d5c
3b0ab0eafe31b5fe35ebf463fb73abee0da7de6a4f7790cafecf9e2f9b1328d231012217e53afcd4e5dd7c71cd60d7e93f2862ebf76199a51f934080ea8f8132
e7c441b1b927c6f95e70110049ff291301f89a5d9c3fd8d288b3994bf3e1d7b3cb8f6fcd4f304dfa9b8fd905e66caed13e7fd107e50388b04ffe117cb76b7136
c2649a0eff030e5cefed4abe1e93fcced1ffb3391df1724dfdf9379776efc316370a75cd8c8634780b3bd3810c34d2b76ec389780e6aba81659c7bdaff428e9f
c045e01f94bfdd003a20892c2a356dcc7ae2dafb0869f12c918e3e0d0286e37430a7e20f21abe139709d7896fe02fdf636408fb193b67f96786ff18b97b75f70
3fcba2fcb12207fec0ea97ab5fd7230bfeb411f7bf5889704c3b3fc2bc4834c3f7e995e711fc87f6c8d07f990146d7f9f6045a53c6bd9d5c364d2147a66cff02
4aed1c1fc05eb6805f09d6742be3702f68cdb29fd13edb9b18fc35ebff2070cbc3fcdb817c34fbfb7a0b26e97c1fbd85de012ae0db2d8dad34768b562282ebf3
2f30c0d976c1e20fc30f7b191d181253cbc2c2002e7ff041d15aa3632263e63e6728f69a77ad58c7d85c5f301d7e37c97d0c8be07e570efdadfd5aa372309482
fd346310300a8f15bbc80ebb8005378e1834de784c5db66ed8c55bed143700b7081bf8deee82e952037b2e4f58c1e6d6674ec3d271c06834defdb5f8fcd870e0
5669aa9fd20c1ae7ffc16d606f9cf7125ff01cb295fb4db18bcf0314c178934be5701f0ee8e97eee0461f8964c71ca738a9739683743058b3e9e7ef89054e70d
48f3fd8985bf04d7f6d36a107d0dae732c2eacaf73844f2b05fd80b9fdb24aa4be1305e12bebb6421f7021f0e296a17f5b8d7061f00bed84be770ddcb17773fe
ecbff406547e2176e39d02b7aef3aba5ccfb9e81c070ee2e8022e0a15c35c202a3d56bf02671e081685aa3cd20989178a96afefc3052cd1d8b97323dd181792a
c0e0fe745d6fe9d87062080870a8fbb1389b3c1fe1cfdba3a1df1d404789fed60dc37d09c1d5c402704e8ff9e065b948d81c289cad1ed618d3eadef3fd0cf3d1
77d3a0dda4381750e9eb582a387e79ddc6b03d5f308e70aa08bd10e1c50cb0a801f0a68993ec1bbf26b71370c87b76f28674e1b05b6dd8c8504765f5f6e3715f
e61173641e24a246f245f6ee28d80e280cff7471f239c0d00c4b48f4aa05f0c634248d7a5fab905a3088ff8efee2edf60dafd16ebfd6a000f50fb2d8e9c40aa0
c3f1eaacff478dac1bb1aa734ef34f70ffafa57b694782bbeb039faba08f61a2893e188fbff73e87f3185fbb714b2a38df8546224c9b79fed4aafa16dbfd9be7
ef3709318cc3cd78fc9ae53a52673cfb1d136ffe6c00c8f7f31c8ff304f7736f00afe11e0370f2fffc81fed6ebfcc6eb7aa7f3e1b7fdfcc7d403f4dd37162eae
5bdefebafc212df660600bb0df1c33a25c6bf18cafd1ea7eeb0ce0f1ee7351244c3fd35be145ba2850c3b9ef8d7750627171f4ec1c206384f70df0ed1cc0fb70
9f0c9fbf087fb6d8ef8870ee0cc0908081b299c813adbac7f5ddf9c8e9c50fa7edb3d062d8728610b98af34df2c27b36940f30a97885705f300dfd56f2cdafd9
4eb7f2fd16dbf5bb90affa249b63c80c20603c7c09fdf905ffecfd7200b706f7fb38df1a4cbf1c0c6ebfb0ec7fe5cbfd9723a1d49a77ed5203e1f6af0c80c202
24df35ffe8be57bdfd3ad3c7681106397dbed4f77dd714b7e4dfc7f1c7ff27717fafdd4003a2731aa96e370adc136e38106ff625fd14040a5e21987fb16fbf52
550757cbfdf87f5d925fefbb600110a6064089faf2f293f1cb0cc7e0729a89f714bc1c6c0221a87ff2c5ebfbc7e89fe30d771ce70977110a33ff6723eff23913
0ff320f667dfbfe81b7863da7bc7185b734cbf1afdfdde81b2990ec7fc72c3dafd977d006814f7280205305628a29b2a3ca51bb79dd8833000a62edf372b0871
6dfdba09fef9b9020f6d858ba181f453140c4920830f10f0fcc6d3b08d8177c60def14c87f905f7763fdfe04ebf9cd48c7f5c003804c9702428fa27e3fd24df6
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
107ae184172a393640936f0d3bf2bf5a2f331f653f8fd4fe22b5227576106cf13d3b5bc0cd5f07bf050fd173add855ac74da38c8a962abdfd39ddb3199bbfbd2d899848a482d1f22c103512ad542ad53ff2d98802d2faffdebf8d365099fb851886917088fa86c87d9b793ab94673ea7f216ad9e548db1de3aaa46dfd8bbf55d
e590f6545b40445e8b5e17052a82e47ba2e8f03dfddf0f90dd8fc432ee6a8af4b7050fda7e12a1c194c7efa3004f93f9f57e8bff4e5174abf8f06a10c57a9f88f99f1dc471f63b6b59fd7bfc8a7cf458e2116d7b72ad2725ba7650b62ffc7dab3703917d2e8f6c08a1c1a275711ee81faa6e8e44624795ad33fe76be5af6a1f9
__map__
0d0c035718557d3f09e27d15863b973721df4f832acd03a978ff162a3aeedfb0be6b9beac0c5bb1decefe22cbb81f97e1a54613e470b6c600a10cda97fafee187f7fd6edbcb01365dcb3fb0c3a7ccd7ff5c94dc9f75301077a30d337f9fc09e81cf9477f077bb0f5ed3ef677a60fb899f97e2a5469c10aeb015aafa3c370e059
d439d7fd1dace8fd1ce8fba6e4bb7900632028eac7b43d83e63993b18e773b26debf91fefeed40ad26f50062a63a007b70fb5fd1d9a3e737dcdfa703e4f31dac0700c8df2fce3d7def98cae03db1f73cf07a9ddd7031364d7ecdafef0dff373ddecf04a907104c6434f610f8fbe426e7fbb9e0ea8184ebbb24f4f71bd2dfad08
4fb81e60302208fdfd7fbccffa4f6c3dc0c80fc94daeef5702ef0b3e6efdfeef15aaefb5bfcf87f7a5be5dc3df071c2e89df74d0fc444578dfc7df3308593a6cc7b3f1b37ef25e8167cfbd02fcd4a185f670c3e521fc46519e3fe49ff1344df2f2496e36fbc0b2e2a707b6aeecbd7f70e6ebffacc0fed31b2680c0be1dff714c
f8a187a7561efd7ea1fd3f4a7cfc1d8748c7b348ab975efee4b8e5f0e8b0df6fcff07f809b160fad7a41bb10dd8ff800f07bdab6fc1bb6fa806afe7b6c0345f404de69711c6af78e51fd2dcd3ff8bf6228350ccb693cd9473760c8711a8a661efe5620220120b7c8ab6530ed1d203062583f03799ca87ba11e08f3834281c2d9
6b7cf7ab42d46ef387386923fb47c20018028672140a32129386e9bce5da86c3647e3c0ce02dbb4a6cb856afd00edce1a88d32d138067f668892613fd546ac2fef27d6b62cbc6bb951053bfcd8960200025f0b341f71004c0f39188a379ce02fb02f24f8631c285c584e03fc6d03f02a31ce06ba336092f147ed44e442fc1ec4
72a9380296032e1ea0ca533f1ee654dee3bfa9beca3ff5fac018b8b5d0b668555ea8d70795a7a716712ed1d2786213c1a965afd7f75fbfbf18436fdc1862cfe425e425e4ed2946fc53c1c190d31e5a7c9fadc115482026b4045d30b752bf5e4edd47fbc91d7bd3d08e14bfb1c6e1ef19db37321a53651f31fff8ef91526acfc6
413ed6d3679229fcf693058a84d705e0efb17d5adbe218d6236259f2db21316ef93d6925b6de014046a29e43802cb908013da697c3db81000e82975427d32bf05a0887ee4512f1632cf938b59d82296310076f87b0204e9fa26908d3a712e4fac453a0f0d8be3b37102e0804e381d463f1b51703ecefb6de6bf5a2161d4ed0fc
29f1091e9351087f8f62ab438c07a958bce8bc2fce3e657e8677ab28098fcecbc667fa1aeb655db824cc8ecd67f4f1c09577a7a7fd9ee027b1b56ce7e47d3d0949e8b0919ff782c6465af23cc4d36578baee5e21d69f50d5aef415678717e49987adf4e843cfb797132aeeb0f67361a1e7eb3ba50fbedb3971c4c171146eea5f
17fac0aa5b65a4cc411a3cd660d38b64c663cb369e791cc30daa46b016c0e7453047fdc4397ddf0f87014b16d2b99c5caff77b75385bae9df3410fe735f58c47f6dea3e4ec20786137e58882f8e7c5fc7ebe007484f2116fd986795129c67acae3f7f469c81fe2a937e5062e0ed4793870aa70d741f775c5a4cea37da8780035
48be5c74904ee7c5713113faa6d265501dad9477e8c4670cfecceab8efbf9ed1a70e17d657ce14ae435bce52e4c322112de42ac417750b6aec6d3e17211c90ee231e6b8046a88b4bfddbf52207d87380f7231058718de34ea5218bed1cee3f564d4a968efe7c81337877ca041bdbb526056b16a9d7c451583b7016709c703e74
1342f687237bbdcadb2d6b4bf3f2dd2c1ed359c291ab0fc1b875e0324a752daa1878ecdb10c77bb2662905b4fd1b1f0ec7162d9bd9da6e2ea470f78a873a30dafb8bad982727d3c59026c520aecd2f17b324acbb5bcead80985b397cecf96810878ef3f6ce9d11674e0322d556c2891e398212f02c47f554b13135a74b21a121
3739d05c7b075accb984b348cf2d953cac16f50c02b417f01b9df8ae482288ecbc8c3daad7121a1411b8143e1586b424527224114211a453437ae4e9bb00778c17cee35b5ab411c8c41363a2137e2f384f3530082f766a3a76d533339e4a91d80a5ae3d4c68634cfd8cc9cd62ac6a3fc32cdb1be8c6a3dcf0d3d4f3b4afc350f
b83937b30de2fdb11a8c8bbfa97c878e25d195bb666b41a7015fceddfa52222d382ceaa9f7f3f0e3704dea48d92fe93f9a8d070af723441c9d06f591dfc3f53d4f9d9effd3790c86a0d484a03c29f68cc1dec1caf71252b04885eb15e12e86c80fdb743a651c1a1fa71c9bff95fe3529cb3f0cc3c2071941cfc14f7c9fe0f702
f57842778313e05f123ce2a09fa358e3bcb043e0f80fbd22d24d5e5f9e85f15d0a089186c813d77b3c47c527599b6ee7e6adce321fc5ae8a502fea8d9339acb9d787999c75bf54f837b87506d4bf2f8f54d7f351f1585ade93ff5a8ab2de77262f4eafe2d870854a2b60f0349887d210f1d89a128f62f5a8b04df94a806bf148
4dad4864ea228ad7b16acb799d3651f58d5ab63dea7b7c596bcda704e182ae5139b117c8a3af5bc01387d8a50266f1b027bdb2bd95cc99011e996a14c089ef40d2bab1ee96cd7ac7899eded8f874e4cd1ffab965dab0c38b82757b2bf2a3e03d8fd5e19e27b69eb41a4c0108a62a7206252d3fb16ffb87b6fb64f37baa3ab933
b914db385100fbbf97eff46cf6143e4a95da4bbc19c68c9c13b894670f54229d25e22da96d750f7aba33a0d07b1c50645fd6041375dc587b1ce2515b3fc49627a8238ac71e9e264a67a7c486b5de98f51ff06b6b88a2a223d2f153e3b11a92d97fe1840a8c44d919cae114dc7fa47e33df2f5a6ce27c15f76fbeb2545662fe75
d951c8af4a79de3e2f3aefcca19df8e6c36c9239247e3e384b5c78b3bd4118404f7378c87f2fb06fbf434bfdf94e0b876fce994f5b960de42e4ed56b4489f7ae8edfe9eae2051e143b7ce0407a220195e57f1c1fb836f144abe8300837a741da3f0aca82e3e84847115a9a39f31854ab53766669f54a7e63257418f07fea9876
d0cfb5c07ed48662d7ad0c20056e8e5c9f702c1e4b2fc545780fd7d983b6dddb447214f9ed09e1faf9a9978b4e0bd69480c730ae704960edc19f2810c7693e39b73d3c71d9984572660a261d8323593c4b550dd556382d337925922fa9533f13a3ebb567e08fcefabae03b4a758cd35b325a7db7cec7da7356e9d73bb94e3eb2
f8112728f7c28957721eda8e41f286b41bb2d4d2d28b66a77acb4052a49874f6a66cf8ac868c625ab11fffd9fe53ed8669e2f514549cb0da8fdbf282340ab3f18e0a0e1d80236f09907b606b48b0caacbc47c7e6b828351df9a553f428e82f6418e308b66315724da06ab9920b5f2665a991004efb7ecf147b1fa2846b7bfb6e
5eedc6941269189c9453dd8fea7d4564583abc1f05b5d7a3403e91db74286775f57214ccfd7c348a82b15fdb6f4fd390f153a142526c1df86d9d845e0a39ce1ef40b7bf6c7715f8935d2ee1ac72a5ac70eb7007b4c82a5753f3e44413ed0c30887bbaaabcf3bb5fce5ba239dcf5bba513d2ac4831594201e68fd050381187a42
37a171e344062c355cf942e5a3da39721cceeb225f60d06ff43dfd7b9bf4093ff3b6a9f8fc29ef3949546fab87f87d152e5c95c99e020a5689e3c4af4f6ded1c6979f8e9540fe80eb1aa7678645d9a719ebfd823501fe886f791b75cc322250b52b3b134e037f06fdd6d246101dc8efd3697f5478458c13adef4f5c6622e57ec
d23ff2ab183c4efdfc1f517e6cb923a620d0f1e6a8af6b33ee9dd244a610dc34466edb0e8e6f54b7e55ee048e17ae028069c7a2860680f7adc166caae4cc7ce8955f7ebaa494a8c4ed9b6a946a0e6546a3fddfd5837cd6cabbc57e7ba6265a74a70d20e9d9918ccb65c11705aeead1489bb3310c3b2c4a6c3672ea3f39eef1a0
3c556fd4f3ecd9935194f84b65b219c393a15d1f10eecf5c632e8b9a27b27fe754bf7d8bdfa8cdaf49dacacd1554c0e2625c5e08ac2d55e422da2547c2a3f7f1db8f9e4e60a9f86bcb8ad39f2788033a7dc2f591a6e796acdab67eea1fd84d184747bc5b85f7221cbb1dfb620b5ef3964f188907fe3722da2a9e59e5b03fe1c3
c9c56cd92b619383ce595250bec5bd39b87e05ecefd903622b6fe93fcd595ed73e4b695442d6ec7aaf96df88a4ded2225c152c87b56c6eb03ba57839a085480a7cf5c1eee019a7b11ac0f578d61cbb2cd6a7b072e6cd970f133f9d9c0626e615483cdf60239162bb2d4d87d8432a789ba6438efeb1e60ec709496145e99e7f72
6cd32bb745c76ee10bad8e92ac387b241be7cfc40e4ef9e134893dd50e751c5a58302407fc20f6fc8173880a2b7d59ce3f909ee24436e71d1d79f185e35bf03ccdbf3ed0d75d6ce26a3d09912ecef6d530920bc4634c036e3f440b49b8f94b2a8f0bd7ab1ee5e67771b08de6c8b6d734be3801ff636df76c48ed1fcb90d415fd
b47d29d5e13cf5147ea6ab05f3f2bc41849e689b0fc61d1da469c76ebe0663dd014445255feaf903f71289889c36d2a5767d8205e7f17fca2bdb6df735b5be4447095b36f8fb19bbef0d4168fdd80e1d0f6c4cc0a867c7dc6a47a0e4dc633ea7173912f7328efff681bf1e1324287fbf51e4c6684c8f960d448cccff99d784bb
3aa71f0bbb7638def2c3e9a12eb0d87379c140183e8b8f536f859bcdcfb539a962d858cd23790be45fb60cf6983f89a77dbeca5bc627f773f5bcb51e9befe12837219697338beb7e96131210d7eb38872ea79348d40b109b8f38a89e9cd9f086d2633591f9ea897b301fd335772cc64bfc3bfb76fc47f9f59bc45b6f3c949e20
72fb8f22b71559c47ba070feca86dbea73a0faa958ba005746d88d131caecf549d7d24bee3b1a735ee4da463ee9e45a4b862def2b97101a92fcb5541791ddbbba97f3852779f25b6cff4234deaad60f9a14cd68ba854155ceafc031bc1ad7acf3c755b309260dc7a6dcb53bf2d5965e8a21b625bcf49ec400e95fff3fa74e4ae
c7651b1979a471a214a94acf633f97e6f65f3b2ff796345385cb5a6ba0dd1cfe28f2f10035eaf71728bc0925170827be8fea7d0f8fb4845ade1c260e7047d7d47bfede0d7e29358a297cd790bf34f1d445c7fa3e3e6f6f066abc25fc9237e84932cd2c3c7bf7ea7d1882c64e1e5041da3d0e69ec9a283574e7d535b711bf4523
08b5fc2ae5ab7b111fdc90584178d1a20022d09393145a1ba6c8d1c16e08849aa4e5f97be4afd7f3374d9dab1c3a977043521a33f594ae2c2fa1fe5e3344ae6204b0c30fc2e4db41f6a5fa5ebd476d9c5bfe937a5ecaa058f61bb3fb00b1167c3c8598ead6d47979e158d678f95976019e1785d3245968bff1724045b3da92e1
e1a9c2bdf5d3c4ee3ff2cf538325fc53c5ca9d4762870a2d6351481fa59163ef54bd5e71d35964eb61b8280a1f79e0f91e0601f77d120285c3cb61ac397621df4e1223b57499aa0a22c8775ea0306612c6aa74cae7156031de0970bc27afda8efdef7a1df62400daefd3f5bc028c7a34cb7f7cac96316d7ea74259bfd9198ef3
bc723e9da740bef4ba43441c45be10ac85c75c3ea76a53cca1bf6d1c4b11633bf67c3fe112c8568a69afdf0bd606d050ce20928486ecf55a89c7eb9c4c66a155402bc45bfa7814bb348ac9a0a74af75886e4a9db80d8535316aabf6dc448694f43a23600f56c2f234556abd533bdb5b711b4e85bb87a96a72e9d89af02716cdb
__sfx__
2dc87fba3f51d2943d3106b1e4100961e301722e77c0921e1e63f157550f43e296083747d2a73e3f2751f12f187243b1060b47a330002a7380351d331461f448337372f121144573b4450f16f3c536074063c610
49b091cd1e0691500c2031a0555b2075e062452f5660966d061573952a1e5752d1340876f377123251221242317343d1001e31e3226d3842e3332d17365203590550c1b66a376183567a03477230672b3643b73f
027b3f34136302e3360c5693652e2e22d124371f2002677430741307023e73f2b33e0a7160943f117553b36b196442c63e396481b6223961f0716632017331583f15834769303601117d1f51c1b449050640723f
61c1f4a63e4172b73722207136432960e27163156503a50c0163b11150280493976b3327738764143671a31f2f53b004132474d3327b3417c2831a3836c356180b6300565a2e5051010c0c30c1f4211f6792336a
6f65a51a211593d3130c7550a2682264738169133750b67f367580801f2d5173032b2833a2b508101712d7432777c3c71c2433f2a55b114501015c021552101d302583e7552b06d332020426f1d24f2863a2e218
bdf0a01e2f046060550a5193826f1f31f315640047e1e6323f3233951510073192390b03a35753315003b44a3b21e2003f0353234719127451440c0c6260f0323e2212c011205353a1263c43f2f35e2e66e0e36b
5f845e281563907552192751b33c133762a7311f2400112a3d56c0620f1a40c33739026250172a1f32b0567f1e5592927c036210c26a257731b7520021d053313f4550b47b1f75b010552a4502960a1767b2f240
60e9e4e03f6332a55f2d6220337c1b2681957e0a20a2e60e3d0361527f2f6690d75a3c00e2a63f266541f7290342b2777635737196203317e1b14c2471e294322f1431400b237610a523323383c70b353361e41e
f72300000315a2f654276753751a201511f77e1966f1f5411e70b0150e1a03101656083433746d3f6360031a264692a7182f70a3c0501d53f1d2723677a064562f2450e036397442b763142280f77e3f73014335
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
07 3a0a7f40
0a 0a497169
04 654d406e
08 64265a72
02 213d7e7e
04 73202b06
0c 2a022878
09 6e16132c
01 634a0033
0e 49724865
01 37532902
08 140e0d0f
09 7a222271
02 1b44373c
0b 1372077e
0d 5b0a4e27
0b 6a5c5447
0f 10732b1a
02 514c0b41
02 4c402d0a
0f 324b5336
0f 2e365a27
01 4525202f
0a 55413e0e
07 3e767747
07 5e3e0574
08 2a73536a
01 61595f3f
0c 787d6d22
06 1a6c4860
0f 1b782725
0d 7748636d
0f 1e1a6770
0d 5a526a2d
02 0c24717e
0e 36531f0a
0d 2c0e4172
09 08074b58
0e 43240321
0b 7f5f5762
06 752a6838
06 717f3d15
00 6e65757f
01 6b767a04
07 6624441a
07 7b155f19
03 7e195101
05 3f314022
0e 5761073d
0f 363f2150
06 2d6b3831
0a 5040566a
09 6f572e78
0d 0a744019
02 3b1f4e7b
05 2d397855
0b 416b303c
03 7f5e4c14
0b 705f3a50
07 7c533626
0a 157f5378
0b 6b7b7b3f
07 601b6853
0d 58103c45
