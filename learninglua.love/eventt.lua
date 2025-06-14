local love = require("love")
local foood = require("food")
local state = require("state_game")

_G.sounds = {menusong = love.audio.newSource("data/bgm.mp3", "stream"), ghostsound = love.audio.newSource("data/ghostsound.mp3", "stream")}



function love.load()
_G.food = foood()
_G.vol = 1
dim.x = 20
dim.y = 20
dim.qx = 1200
dim.qy = 700
sounds.menusong:setVolume(1)
sounds.ghostsound:setVolume(1)

_G.check = false


end
_G.timer = 0
_G.transparency = 1
function _G.events(dt)

   if check then
      _G.timer = timer + dt
   if _G.timer > 11 then  
      game.state["running"] = true
      game.state["menu"] = false
    end
    if check and timer <2 then
     
      _G.transparency = math.max((2-timer)/2,0)
      end

   if timer > 3 and timer < 5 then
      _G.transparency = math.min((timer-3)/2,1)

   end
   if timer > 6 and timer <8 then
      _G.transparency = 1
   end
if timer > 8 and timer <10 then
   _G.transparency = math.max((10-timer)/2,0)
end
end


if food.eaten > 6 and food.eaten < 10 then
   _G.vol = (vol-dt/3)
    sounds.menusong:setVolume(math.max(0, (vol)))
end



if food.eaten == 16 then
   ghost.espeed = 15
   if not detect(pacman.x-50,pacman.y-50,100,100,ghost.x,ghost.y,ghost.gw,ghost.gh) then
   ghost:move(pacman.x ,pacman.y)
   end
end

if food.eaten > 19 then
  ghost.espeed = 2.5
   ghost:move(pacman.x, pacman.y)
end

if food.eaten> 22 then
   ghost:move(ghost.x, ghost.y)
end
if game.state["menu"]  then
   _G.vol = 1
   sounds.menusong:setVolume(1)
end
return sounds
end
return events