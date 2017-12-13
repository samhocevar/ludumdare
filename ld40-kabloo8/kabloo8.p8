pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
-- kabloo8
-- by sam hocevar
cartdata("kabloo8")

-- constants
w,h=7,9
vel=3
tstep=0.18 -- time between balls

-- globals:
-- sim precision
dt=0.25
-- high score
hiscore=max(dget(0),1)

state_boot=1
state_menu=2
state_start=3
state_aiming=4
state_shooting=5
state_dead=6

sprite_ball=16
sprite_goldenball=35
sprite_greenball=36
sprite_life=32
sprite_dup=48
sprite_bounce=37

sfx_brick=0
sfx_wall=1
sfx_lostball=2
sfx_launch=3

-- state
function boot()
  level = 1
  power = 1
  state = state_boot
  world = {}
  balls = {}
  start = {x=64,y=120,a=0.25}
end

boot()

function clear_world()
  for n=0,w*h-1 do world[n]={type=0} end
end

function randomize()
  for n=0,w*h-1 do
    if world[n].type>10 then
      k=world[n].level
      k=flr(rnd(k/4)+rnd(3*k/4))
      world[n].level=k
    end
  end
end

function add_line()
  -- fill stuff at random
  local a={}
  if level%5==0 then
    ntiles=flr(1+rnd(3))
    newlevel=level*2
  else
    ntiles=max(flr(3+rnd(w)),flr(3+rnd(w)))
    newlevel=level
  end
  for n=1,ntiles do
    add(a,flr(rnd(w)))
  end
  for n in all(a) do
    world[n]={type=11,level=newlevel,hit=0}
  end
  -- maybe a bonus?
  if rnd()>0.7 then
    world[flr(rnd(w))]={type=flr(2+rnd(2))}
  end
  -- we need at least a level up
  n=flr(rnd(w))
  if world[n].type>10 then n=(n+1)%w end
  world[n]={type=1}
  -- scroll down
  for n=w*h-1,w,-1 do
    world[n]=world[n-w]
  end
  -- empty first line
  for n=0,w-1 do world[n]={type=0} end
  -- level up!
  level+=1
end

function do_shoot()
  balls_todo=power
  balls_done=0
  launcht=0
  balls={}
  state = state_shooting
end

function end_of_turn()
  for t in all(world) do
    if t.used then
      t.type=0
    end
  end
  add_line()
end

function _update60()
  if state==state_boot then
    boot() -- need this because bugs
    clear_world()
    world[1+w*3]={type=11,level=42,hit=0}
    world[1+w*4]={type=1}
    world[1+w*5]={type=2}
    world[1+w*6]={type=3}
    state=state_menu
  elseif state==state_menu then
    if btnp(5) then state=state_start end
  elseif state==state_start then
    clear_world()
    -- debug
    --power=141 level=141 add_line() add_line() add_line() randomize()
    add_line()
    state = state_aiming
  elseif state==state_aiming then
    if btn(1) then start.a=max(0x0.08,start.a-0x0.01) end
    if btn(0) then start.a=min(0x0.78,start.a+0x0.01) end
    if btnp(5) then do_shoot() end
  elseif state==state_shooting then
    for i=dt,1,dt do
      simstep()
    end
    -- debug
    if btn(4) then
      for i=dt,3,dt do simstep() end
    end
    worldstep()
    if #balls==0 and balls_todo==0 then
      end_of_turn()
      state = state_aiming
      for i=0,w-1 do
        t=world[i+(h-1)*w]
        if t.type>10 and t.level>0 then
          state = state_dead
        end
      end
    end
  elseif state==state_dead then
    if btnp(5) then
      state=state_boot
    end
  end
end

function hit_left(b,ti,tj)
  if b.vx<0 and ti>=0 then
    t=world[ti+tj*w]
    if t!=nil and t.type==11 and t.level>0 and b.x<ti*18+18-1+3 and b.y>tj*14+1-2 and b.y<tj*14+14-1+2 then
      b.x,b.vx=2*(ti*18+18-1+3)-b.x,-b.vx
      t.level-=1
      t.hit=1
      sfx(sfx_brick)
    end
  end
end

function hit_right(b,ti,tj)
  if b.vx>0 and ti<w then
    t=world[ti+tj*w]
    if t!=nil and t.type==11 and t.level>0 and b.x>ti*18+1-3 and b.y>tj*14+1-2 and b.y<tj*14+14-1+2 then
      b.x,b.vx=2*(ti*18+1-3)-b.x,-b.vx
      t.level-=1
      t.hit=1
      sfx(sfx_brick)
    end
  end
end

function hit_top(b,ti,tj)
  if b.vy<0 and tj>=0 then
    t=world[ti+tj*w]
    if t!=nil and t.type==11 and t.level>0 and b.y<tj*14+14-1+3 and b.x>ti*18+1-2 and b.x<ti*18+18-1+2 then
      b.y,b.vy=2*(tj*14+14-1+3)-b.y,-b.vy
      t.level-=1
      t.hit=1
      sfx(sfx_brick)
    end
  end
end

function hit_bottom(b,ti,tj)
  if b.vy>0 and tj<h then
    t=world[ti+tj*w]
    if t!=nil and t.type==11 and t.level>0 and b.y>tj*14+1-3 and b.x>ti*18+1-2 and b.x<ti*18+18-1+2 then
      b.y,b.vy=2*(tj*14+1-3)-b.y,-b.vy
      t.level-=1
      t.hit=1
      sfx(sfx_brick)
    end
  end
end

function sqdist(p1,p2)
  local dx,dy=p1.x-p2.x,p1.y-p2.y
  return dx*dx+dy*dy
end

function simstep()
  -- update balls
  if state == state_shooting then
    launcht+=tstep*dt
    while launcht>0 and balls_todo>0 do
      angle=start.a+rnd(0x.002)-0x.001
      vx,vy=vel*cos(angle),vel*sin(angle)
      add(balls,{x=start.x,y=start.y,vx=vx,vy=vy,double=false})
      sfx(sfx_launch)
      balls_todo-=1
      balls_done+=1
      launcht-=1
    end
    for b in all(balls) do
      -- bonus tile?
      ti=flr(b.x/18)
      tj=flr(b.y/14)
      t=world[ti+tj*w]
      if t!=nil and t.type<=10 then
        c={x=ti*18+9,y=tj*14+7}
        if sqdist(b,c)<8*8 then
          if t.type==1 then
            power+=1
            if power>hiscore then
              hiscore=power
              dset(0,hiscore)
            end
            t.type=0
          elseif t.type==2 and not b.double then
            vx1=(b.vx-b.vy/3)*0.948683 -- 3/sqrt(10)
            vy1=(b.vy+b.vx/3)*0.948683
            vx2=(b.vx+b.vy/3)*0.948683
            vy2=(b.vy-b.vx/3)*0.948683
            b.vx,b.vy,b.double=vx1,vy1,true
            add(balls,{x=b.x,y=b.y,vx=vx2,vy=vy2,double=true,bounce=b.bounce})
            t.used=true
          elseif t.type==3 and not b.bounce then
            b.bounce=1
            t.used=true
          end
        end
      end
      -- find closest tiles
      ti=flr((b.x-9)/18)
      tj=flr((b.y-7)/14)
      -- advance
      b.x+=b.vx*dt
      b.y+=b.vy*dt
      -- wall bounce x
      if b.x>128-3 then b.x,b.vx=2*(128-3)-b.x,-b.vx sfx(sfx_wall) end
      if b.x<3 then b.x,b.vx=2*3-b.x,-b.vx sfx(sfx_wall) end
      -- wall bounce y
      if b.bounce==1 and b.y>128-3 then b.y,b.vy,b.bounce=2*(128-3)-b.y,-b.vy,2 sfx(sfx_wall) end
      if b.y<3 then b.y,b.vy=2*3-b.y,-b.vy sfx(sfx_wall) end
      -- tile bounce x
      hit_left(b,ti,tj)
      hit_left(b,ti,tj+1)
      hit_right(b,ti+1,tj)
      hit_right(b,ti+1,tj+1)
      -- tile bounce y
      hit_top(b,ti,tj)
      hit_top(b,ti+1,tj)
      hit_bottom(b,ti,tj+1)
      hit_bottom(b,ti+1,tj+1)
      -- fall on the floor -- fixme: bounce?
      --if b.y>128-3 then b.vx,b.vy=0,0 end
      if b.y>128 then del(balls,b) sfx(sfx_lostball) end
    end
  end
end

function worldstep()
  for t in all(world) do
    if t.type>10 and t.hit>0 then
      t.hit-=0.25
    end
  end
end

function draw_brick(i,j,tile)
  -- tile coord to world
  x,y=i*18+9,j*14+7
  if tile.type>10 then -- bricks
    if tile.hit>0 then
      x+=rnd(3)-1
      y+=rnd(3)-1
    end
    sx,sy=8,0 // 8,16
    tdx=tile.level<10 and -1 or tile.level<100 and -3 or -5
    tdy=-2
    if tile.type==12 then
      tdx+=1
      tdy-=2
      sy+=16
    end
    if tile.level>0 then
      l=tile.level
      while l>=80 do l/=32 end
      if tile.hit>0 and rnd(2)>1 then f,b=0,7
      elseif l<5 then f,b=1,13
      elseif l<10 then f,b=2,14
      elseif l<20 then f,b=4,15
      elseif l<40 then f,b=1,12
      else f,b=5,11 end
      pal(13,b)
      sspr(sx,sy,17,14,x-8,y-6)
      print(tile.level,x+tdx,y+tdy,f)
      pal(13,13)
    end
  elseif tile.type>0 then
    circ(x,y,6,8+rnd(8))
    if tile.type==1 then
      -- extra lfie
      spr(sprite_life,x-3,y-3)
    elseif tile.type==3 then
      -- bounce
      palt(0,false) palt(8,true)
      spr(sprite_bounce,x-4,y-3)
      palt()
    elseif tile.type==2 then
      -- double ball
      palt(0,false) palt(8,true)
      sspr(0,24,10,8,x-5,y-2)
      palt()
    end
  end
end

function draw_hud()
  spr(16,92,1) -- ball in the hud
  print(":"..power,100,2,7)
  if state==state_shooting then
    n=balls_todo
  else
    n=power
  end
  if n>0 then
    print(n,start.x+5,start.y-1,6)
    print("⬅️➡️:aim",3,start.y-1,6)
    print("❎:shoot",128-34,start.y-1,6)
  else
    print("🅾️:faster",3,start.y-1,6)
  end
end

function draw_world()
  for n=0,w*h-1 do
    i,j=n%w,flr(n/w)
    draw_brick(i,j,world[n])
  end
end

function _draw()
  local p={0xffff,0xaf5f,0xaa55,0x0a05,0x0}
  for n=1,#p do
    fillp(p[n])
    circfill(64+n*5,64+n*5,100-(n-1)*20,16)
  end

  print("best:"..tostr(hiscore),3,2,7)

  if state==state_menu then
    draw_world()
    color(10)
    print("kabloo8",32,17)
    print("by sam hocevar",42,25)
    color(6)
    print("break these!",42,4+3*14)
    print("extra ball",42,4+4*14)
    print("split ball",42,4+5*14)
    print("bouncing ball",42,4+6*14)
    color(7)
    print("press ❎ to start",32,110)
  elseif state == state_aiming then
    dx,dy=cos(start.a),sin(start.a)
    for l=rnd(8),128,8 do
      line(start.x+dx*l,start.y+dy*l,start.x+dx*(l+1),start.y+dy*(l+1),6+rnd(5))
    end
    palt(0,false) palt(8,true) -- balls use red for transparency
    spr(sprite_ball,start.x-2.5,start.y-2.5)
    palt()
    draw_world()
    palt(0,false) palt(8,true) -- balls use red for transparency
    draw_hud()
    palt()
  elseif state == state_shooting then
    palt(0,false) palt(8,true) -- balls use red for transparency
    for i=1,#balls do
      b=balls[i]
      if b.bounce then
        spr(sprite_greenball,b.x-2.5,b.y-2.5)
      elseif b.double then
        spr(sprite_goldenball,b.x-2.5,b.y-2.5)
      else
        spr(sprite_ball,b.x-2.5,b.y-2.5)
      end
    end
    palt()
    draw_world()
    palt(0,false) palt(8,true) -- balls use red for transparency
    draw_hud()
    palt()
  elseif state == state_dead then
    draw_world()
    rectfill(30,57,128-30,128-57,1)
    rect(30,57,128-30,128-57,0)
    print("game over!",44,62,7)
  end
  palt()
end

__gfx__
00000000055656666666666700000000055656666666666700000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000016dddddddddfdfff7000000016dddddddddfdfff70000000000000000000000000000000000000000000000000000000000000000000000000000000
007007002ddddddddddddddf600000002ddddddddddddddf60000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700026dddddddddddddf600000002ddddddddddddddf60000000000000000000000000000000000000000000000000000000000000000000000000000000
000770002ddddddddddddddd6000000002dddddddddddddd60000000000000000000000000000000000000000000000000000000000000000000000000000000
007007002ddddddddddddddf60000000002ddddddddddddf60000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002ddddddddddddddd600000000001dddddddddddd60000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002ddddddddddddddd60000000000012dddddddddd60000000000000000000000000000000000000000000000000000000000000000000000000000000
886660881ddddddddddddddd500000000000011ddddddddd50000000000000000000000000000000000000000000000000000000000000000000000000000000
86777d082ddddddddddddddd60000000000000022ddddddd60000000000000000000000000000000000000000000000000000000000000000000000000000000
dff777d012dddddddddddddd5000000000000000122ddddd50000000000000000000000000000000000000000000000000000000000000000000000000000000
566ff7d01222ddddddddddd2500000000000000000122dd250000000000000000000000000000000000000000000000000000000000000000000000000000000
5d66dfd0011121222222221100000000000000000000021100000000000000000000000000000000000000000000000000000000000000000000000000000000
01ddd508000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
80115088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88000888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ef0f700000000000001c10088666088886660888880088800000000000000000000000000000000000000000000000000000000000000000000000000000000
e88fee7000000000000d7d0086f77d0886a77d088807c08800000000000000000000000000000000000000000000000000000000000000000000000000000000
28888ef000c000c000c777c0d9f9f7d0dbaaa7d080777c0800000000000000000000000000000000000000000000000000000000000000000000000000000000
288888f01d71117d1001710054499fd053bbbad00777776000000000000000000000000000000000000000000000000000000000000000000000000000000000
02888f00c7777777c001710052442fd0513b3ad010076d0100000000000000000000000000000000000000000000000000000000000000000000000000000000
0028e0001d71117d1001710001222508013315088807608800000000000000000000000000000000000000000000000000000000000000000000000000000000
0028e00000c000c000c777c080115088801150888807608800000000000000000000000000000000000000000000000000000000000000000000000000000000
0002000000000000000d7d0088000888880008888810018800000000000000000000000000000000000000000000000000000000000000000000000000000000
88668866888888880001c10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
86f776f7d88888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d9f9f76f7d8888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
52499699fd8888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02245124508888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
80110015088888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88008800888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
11111111111111111111111111111111111111111110101010101010101010101010101010101010101010101010101010101010101111111111111111111111
11111116660111111111111111111111111111111111111111111111111111111111111111111111111111111166606660111111111111111111111111111111
1117776777d07717771111171717771111111111010101010101010101010101010101010101010101010101067776777d010106767177711111111111111111
11171dff777d0111711171171717171111111111111111111111111111111111111111111111111111111111dff7dff777d01767777071111111111111111111
11177566ff7d0711711111177717771111101010101010101010101010101010101010101010101010101010566f566ff7d01dff777d77701011111666011111
111715d66dfd07117111711117171711111111111111111111111111111111111111111166601111111111115d665d66dfd01766ff7d01711111116777d01111
1117701ddd50711171111111171777110101010101010101010101010101010101010106777d01010101010101dd01ddd50105d66d7d777101010dff777d0111
1111110115011111111111111111111111111111111111111111111111111111111111dff777d01111111111101150115011101ddd50111111111566ff7d0111
1111111000111111111111111111101010101010166600101010101010101010101010566ff7d01010101010660000000010100115001010101015d66dfd0111
11111111111111111111111111111111111111116777d01111111111111111111111115d66dfd01111111116777d011111111110001111111111101ddd501111
111111111111111111111111110101010101010dff777d01010101010101010101010101ddd50101010101dff777d00101010101010101010101010115011111
111111111111111111111111111111111111116660ff7d0111111111111111111111111011501111111111566ff7d01111111111111111111111111000111111
11111111111111111111111010101010101016777d0dfd00101010101010101010101010000010101010105d66dfd01010101010101010101010101010101011
111111111111111111111111111166601111dff777d050111111111111111116660111111111111111111101ddd5011111111111111111111111111111666011
1111111111111111111111010666777d0101566ff7d00101010101010101016777d0010101010101010101001150010101010101010101010101010106777d01
11556566666666667111111167dff777d0115d66dfd011111111111111111dff777d0111111111111111111100015565666666666671111111111111dff777d0
116cccccccccfcfff710101dff566ff7d01001ddd50010101010101010101566ff7d0010105565666666666670116cccccccccfcfff7101010101010566ff7d0
12ccccccccccccccf6111115665d66dfd01110115011111111111111111115d66dfd0111116777777777f7fff712ccccccccccccccf61111111111165d66dfd0
126cccccccccccccf6010105d601ddd50101010001010101010101010101001ddd5001010277777777777777f6026cccccccccccccf60101010101df01ddd501
12cccc000c000cccc61111101dd0115011111111111166601111111111111101150111110267777777777777f612cccc000c000cccc611166601115660115011
12cccccc0ccc0cccf610101001150000101010101016777d00101010101010100010101012777707070007777612cccccc0ccc0cccf6106777d0105d66000010
12ccccc00c000cccc6111111100011111111111111dff777d011111111116660101010101277770707070777f612cccc000cc00cccc61dff777d0101ddd50111
12cccccc0c0cccccc6010101010101010101010101566ff7d00101010106777d0101010102777700070707777602cccc0ccccc0cccc60566ff7d010011500101
11cccc000c000cccc51111111111111111111111115d66dfd011111111dff777d001010102777777070707777601cccc000c000cccc515d66dfd011100011111
12ccccccccccccccc610101010101010101010101001ddd50010101010566ff7d010101011777777070007777512ccccccccccccccc6101ddd50101010101010
112cccccccccccccc511111111111111111111111110115011111010105d66dfd0101010127777777777777776112cccccccccccccc511011501111111111111
11222ccccccccccc25010101010101010101010101010001010101010101ddd50101010101277777777777777501222ccccccccccc2501000001010101010101
11111212222222211111111111111111111111111111111111010101010011500101010101222777777777772501111212222222211101111111111111111111
11111111101010101010101010101010101010101010101010101010101000001010101010111212222222211010101010101010101010101010101010101010
11556566666666667111111111111111111111111111111010101010101010101010101010556566666666667010556566666666667010101111111111111111
116eeeeeeeeefefff7010101010101010101010101010101010101010556566666666667016bbbbbbbbbfbfff7016cccccccccfcfff701010101010101010101
12eeeeeeeeeeeeeef61111111111111111111111111101010101010116cccccccccfcfff72bbbbbbbbbbbbbbf602ccccccccccccccf601010101111111111111
126eeeeeeeeeeeeef6101010101010101010101010101010101010102ccccccccccccccf626bbbbbbbbbbbbbf6126cccccccccccccf610101010101010101010
12eeeeee000eeeeee61111111111111111111111101010101010101026cccccccccccccf62bbbb0b0b000bbbb612cccc000c000cccc610101010101111111111
12eeeeee0eeeeeeef6010101010101010101010101010101010101012cccc000c000cccc62bbbb0b0bbb0bbbf602cccccc0c0c0cccf601010101010101010101
12eeeeee000eeeeee6111111111111111111666001010101010101012cccccc0c0cccccf62bbbb000bb00bbbb602cccc000c000cccc601010101010101111111
12eeeeeeee0eeeeee6101010101010101016777d00101010101010102cccc000c000cccc62bbbbbb0bbb0bbbb612cccc0ccc0c0cccc610101010101010101010
11eeeeee000eeeeee51111111111111111dff777d0101010101010102cccc0ccccc0cccc61bbbbbb0b000bbbb511cccc000c000cccc510101010101010111111
12eeeeeeeeeeeeeee60101010101010101566ff7d0010101010101011cccc000c000cccc52bbbbbbbbbbbbbbb602ccccccccccccccc601010101010101010101
112eeeeeeeeeeeeee511111111111111115d66dfd0010101010101012ccccccccccccccc612bbbbbbbbbbbbbb5012cccccccccccccc501010101010101010111
11222eeeeeeeeeee25101010101010101001ddd5001010101010101012cccccccccccccc51222bbbbbbbbbbb2511222ccccccccccc2510101010101010101010
111112122222222111111111111111111010115010101010106660101222ccccccccccc250111212222222211010111212222222211010101010101010101011
11010101010101010101010101010101010100010101010106777d01011121222222221101010101010101010101010101010101010101010101010101010101
111111111111111111111111111111110101010101010101dff777d0010101010101010101010666010101010101556566666666667101010101010101010101
101010101010101010101010101010101010101010101010566ff7d0101010101010101010106777d000000000016cccccccccfcfff710101010101010101010
1111111111111111111111111111111010101010101010105d66dfd01010101010101010101dff777d0010101012ccccccccccccccf610101010101010101010
01010101000101010101010101010101010101010101010101ddd5010101010101010100000566ff7d00000000026cccccccccccccf601010101010101010101
1111111107c01111111111111111010101066601010101010011500101010101010101010105d66dfd0101010102cccc000c0cccccc601010101010101010101
10101010777c00101010101010101010106777d01010101010000010101010101000000000001ddd500000000002cccccc0c0cccccf610101010101010101010
111111077777601111111111111010101dff777d0010101010101010101010101010101010100115006660101012cccc000c000cccc610101010101010166600
01010110076d010101010101010101010566ff7d010101010101010101010100000000000000000006777d000002cccc0ccc0c0cccc6010101010101016777d0
1111111107601111111111111101010105d66dfd0101010101010101010101010101010101010101dff777d00101cccc000c000cccc50101010101010dff777d
10101010076010101010101010101010101ddd501010101010101010101000000000000000000000566ff7d00002ccccccccccccccc60010101010101566ff7d
111111111001111111116660101010101001150010101010101010101010101010101010101010105d66dfd010112cccccccccccccc510101010101015d66dfd
01010101010101010106777d0101010101000001010101010101010100000000000000000000000001ddd5000001222ccccccccccc25000001010101001ddd50
111111111111111111dff777d0010101010101010101010101010101010101010101010101010101001150010101111212222222211101010101010101011501
155656666666666710566ff7d0101010101010101010101010101010000000000000000005565666660006670000000000000000000000000010101010100010
16cccccccccfcfff715d66dfd0101010101010101010101010101010101010101010101016cccccccccfcfff7010101010101010101010556566666666667010
2ccccccccccccccf6101ddd50101010101010101010101010101010000000000000000002ccccccccccccccf60000000000000000000016cccccccccfcfff701
26cccccccccccccf6110115001010101016660010101010101010101010101010101010126cccccccccccccf6101010101010101010102ccccccccccccccf601
2cccc000c0cccccc601000001010101016777d00101010101010000000000000000000002cccc000c000cccc60000000000000000000026cccccccccccccf610
2cccccc0c0cccccf6111111010101010dff777d0101010101666001010101010101010102cccccc0ccc0cccf6010101010101010101012cccc000c0c0cccc610
2cccc000c000cccc6101010101010101566ff7d0010101016777d00000000000000000002ccccc00ccc0cccc6000000000000000000002cccccc0c0c0cccf601
2cccc0ccc0c0cccc61111101010101015d66dfd00101010dff777d0101010101010101012cccccc0ccc0cccc6101010101010101010102ccccc00c000cccc601
1cccc000c000cccc501010101010101001ddd5001010101566ff7d0000000000000000001cccc000ccc0cccc5000000000000000000002cccccc0ccc0cccc610
2ccccccccccccccc61111010166600101011501010101015d666600010101010101010102ccccccccccccccc6010101010101010101011cccc000ccc0cccc510
12cccccccccccccc510101016777d001060001010101010016777d00000000000000000012cccccccccccccc5000000000000000000002ccccccccccccccc601
1222ccccccccccc25111010dff777d016777d00101010101dff777d001010101010101011222ccccccccccc251010101010101010101012cccccccccccccc501
11112122222222111010101566ff7d0dff777d0010101010566ff7d0000000000000000001112122222222110000000000000000000001222ccccccccccc2510
111111111111111111111015d66dfd0566ff7d00101010105d66dfd0101010101010101010101010101010000000001010101010101010111212222222211010
0101010101010101010101001ddd5005d66dfd010101010001ddd500000000000000000000000000000000000000000000000000000000000000000000010101
111111111111111111110101011501001ddd50010101010100115001010101010101010101010101000000000000000000010101010101010101010101010101
10101010101010101010101010001010011500101010100000000000000000000000000000000000000000000000000000000000000000000000000000001010
11111111111111111110101010101010100010101010101010101010101010101010101010101000000000000000000000000010101010101010101010101010
01010101010101010101010101010101010101010101000000000000000000000000000000000006660000000000000000000000000000000000000000000101
1111111111111111111101010101010101010101010101010101010101010101010101010100006a77d000000000000000000000010101010101010101010101
10101010101010101010101010101010101010101010100000000000000000000000000000000dbaaa7d00000000000000000000000000000000000000001010
1111111111111111111010101010101010101010101066601010101010101010101010101000053bbbad00000000000000000000001010101010101010101010
01010101010101010101010101010101010101010106777d00000000000000000000000000000513b3ad00000000000000000000000000000000000000000101
111111111111111111110101010101010101010101dff777d0010101010101010101010100000013315000000000000000000000000101010101010101010101
101010101010101010101010101010101010101010566ff7d0000000000000000000000000000001150000000000000000000000000000000000000000000010
1111111111111111111010101010101010101010105d66dfd0101010101010101010101000000000000000000000000000000000000010101010101010101010
01010101010101010101010101010101010101010101ddd500000000000000000000000000000000000000000000000000000000000000000000000000000101
11111111111111111111010101010101010101010100115001010101010101010101010000000000000000000000000000000000000001010101010101010101
10101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000010
11111111111111111110101010101010101010101010101010101010101010101010100000000000000000000000000000000000000000101010101010101010
01010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000101
11111111111111111111010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000010101010101010101
10101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000010
11111111111111111111101010101010101010101010101010101010101010101010100000066600000000000000000000000000000000101010101010101010
010101010101010101010101010101010101010101010000000000000000000000000000006777d0000000000000000000000000000000000000000000000101
1111111111111111111101010101010106660101010101010101010101010101010100000dff777d000000000000000000000000000000010101010101010101
101010101010101010101010101010106777d010101010000000000000000000000000000566ff7d000000000000000000000000000000000000000000001010
1111111111111111111110101010101dff777d001010101010101010101010101010100005d66dfd000000000000000000000000000000101010101010101010
0101010101010101010101010101010566ff7d0101010000000000000000000000000000001ddd50000000000000000000000000000000000000000000000101
11111111111111111111110101010105d66dfd010101010101010101010101010101010000011500000000000000000000000000000001010101010101010101
101010101010101010101010101010101ddd50001010100066600000000000000000000000000000000000000000000000000000000000000000000000001010
111111111111111111111110101010100115001010101016777d0010101010101010101000000000000000000000000000000000000010101010101010101010
0101010101010101010101010101010100000101010101dff777d000000000000000000000000000000000000000000000000000000000000000000000010101
1111111111111111111111010101010100000101010101566ff7d001010101010101010100000000000000000000000000000000000101010101010101010101
10101010101010101010101010101010101010101010105d66dfd000000000000000000000000000000000000000000000000000000000000000000000101010
111111111111111111111110101010101010101010101001ddd50010101010101010101010000000000000000000000000000000001010101010101010101010
01010101010101010101010101010101010101010101010011500000000000000000000000000000000000000000000000000000000000000000000001010101
11111111111111111111111101010101010101010101010100010101010101016660010101000000000000000000000000000000010101010101010101010101
1010101010101010101010101010101010101010101010101000000000000006777d000000000000000000000000000000000000000000000000000010101010
11111111111111111111111110101010101010101010101010101010101010dff777d01010101000000000000000000000000010101010101010101010101010
11010101010101010101010101010101010166600101010101000000000000566ff7d00000000000000000000000000000000000000000000000000101010101
111111111111111111111111110101010106a77d01010101010101010101015d66dfd00101010101000000000000000000010101010101010101010101010101
1110101010101010101010101010101010dbaaa7d01010101010000000000001ddd5000000000000000000000000000000000000000000000000001010101010
111111111111111111111111111010101053bbbad010101010101010101010101150101010101010101010000000001010101010101010101010101010101010
1111010101010101010101010101010101513b3ad001010101010100000000000000000000000000000000000000000000000000000000000001010101010101
11111111111111111111111111110101010133150101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
11111010101010101010101010101010101011501010101010101010000000000000000000000000000000000000000000000000000000000010101010101010
11111111111111111111111111111110101000001010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
11111101010101010101010101010101010101010101010101010101000000000000000000000000000000000000000666000000000000000101010101010101
11111111111111111111111111111111010101010101010101010101010101010101010101010101010101010101016777d00101010101010101010101010101
111111101010101010101010101010101010101010101010101010101010000000000000000000000000000000000dff777d0666000000101010101010101010
111111111111111111111111111111111010101010101010101010101010101010101010101010101010101010101566ff7d6a77d01010101010101010101011
1111111101010101010101010101010101010101010101010101010101010100000000000000000000000000000005d66dfdbaaa7d0101010101010101010101
11111111111111111111111111111111110101010101010101010101010101010101010101010101010101010101001ddd553bbbad0101010101010101010111
111111111010101010101010101010101010101010101010101010101010101010000000000000000000000000000001150513b3ad0010101010101010101010
11111111111111111111111111111111111110101010101010101010101010101010101010101010101010101010101000101331501010101010101010111111
11111111110101010101010101010101010101010101010101010101010101010101010000000000000006660000000000010115010101010101010101010101
1111111111111111111111111111111111111101010101010101010101010101010101010101010101016a77d001010101010000010101010101010101111111
11111111111110101010101010101010101010101010101010101010101010101010101010101000000dbaaa7d00101010101010101010101010101010101010
1111111111111111111111111111111111111111101010101010101010101010101010101010101010153bbbad00101010101010101010101010101111111111
11111111111111010101010101010101010101010101010101010101010101010101010101010101010513b3ad01010101010101010101010101010101010101
11111111111111111111111111111111111111111111010101010101010101010101010101010101010013315001010101010101010101010101111111111111

__sfx__
000100001737013370103600e36009350063400433001310043000330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100003d0301b300093000830000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0004000012050100500e0500c0500b0400a0400804006030040200301002010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0001000003750067500b75010750167501e7502375021600226000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
