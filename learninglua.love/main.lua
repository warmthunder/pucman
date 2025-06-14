_G.love = require("love")
_G.Enemy = require("enemy")
_G.pacman = require("pacman")
_G.food = require("food")
_G.detect = require("detect")
_G.event = require("eventt")
_G.gamestate = require("state_game")
---@diagnostic disable: lowercase-global


local font = love.graphics.newFont(25)
love.graphics.setFont(font)
function love.load() 
   if game.state["running"] then
 love.graphics.setBackgroundColor(152/255, 117/255, 189/255)


end


if game.state["menu"] then
   love.graphics.setBackgroundColor(0,0,0)
   
  end 
   _G.ghost = Enemy()
  _G.food = foood()
  _G.pacman = pucman()
end

check = false
timer = 0

_G.mx, _G.my = love.mouse.getPosition()
function love.update(dt)
   _G.mx, _G.my = love.mouse.getPosition()
   
   if game.state["running"] then
      
   --movement for pacman
   move(pacman,dt)
   --food pellet code 
   food:eat(pacman.x,pacman.y)
   --animation for pacman chomp
   chomp(pacman,dt)
  
   
      
end
events(dt)
   --events
   
   if (food.eaten > 3 and food.eaten<12) then
      ghost:move(pacman.x,pacman.y)
   end
  
   
   if game.state["menu"] then
   sounds.menusong:play()
   
   end
if detect(500, 500, 300, 50,mx,my,0,0) and love.mouse.isDown(1) then
   check =  true
end
   


if (detect(pacman.x-50,pacman.y-50,100,100,ghost.x,ghost.y,ghost.gw,ghost.gh) and food.eaten > 3  and food.eaten < 12) or (detect(pacman.x-50,pacman.y-50,100,100,ghost.x,ghost.y,ghost.gw,ghost.gh) and food.eaten> 19 ) then
   game.state["running"] = false
   game.state["menu"] = true
   love.graphics.setBackgroundColor(0,0,0)
   pacman.x = 700
   pacman.y = 600
   ghost.x = 20
   ghost.y = 20
   food.eaten = 0
   ghost.espeed = 1
   _G.timer = 0
   check = false
   sounds.ghostsound:stop()
   sounds.menusong:stop()
end
end
function love.draw()


   if game.state["running"]  then
            
   love.graphics.setBackgroundColor(160/255,32/255,240/255)
   
   
    love.graphics.setColor(1,1,1)
    love.graphics.circle("fill", food.x, food.y, 12.5)
   
    love.graphics.setColor(1,1,0)
    love.graphics.arc("fill","pie" ,pacman["x"],pacman["y"],50,pacman["side1"],pacman["side2"], 150)
   ghost:draw() 
end

if check  and timer < 2 then
   love.graphics.setColor(128/255,128/255,128/255, transparency)
      love.graphics.rectangle("fill", 500, 500, 300, 50)
      
      love.graphics.setColor(1,1,1,_G.transparency) 
      font = love.graphics.newFont(25)
love.graphics.setFont(font)
      
      if(detect(500,500,300,50,mx,my,0,0)) then
         love.graphics.print("DON'T START", 580, 510)

      else
         love.graphics.print("START", 620, 510)
      end
      
      font = love.graphics.newFont(100)
love.graphics.setFont(font)
      love.graphics.print("PAC-MAN", 450, 210)
      
      end
      if timer > 2 and timer < 10 then
         love.graphics.setColor(1,1,1,_G.transparency) 
         love.graphics.print("Don't eat the Pellets", 150, 210)
      end

if game.state["menu"] and not check then
         love.graphics.setColor(128/255,128/255,128/255)
         love.graphics.rectangle("fill", 500, 500, 300, 50)
         
         love.graphics.setColor(1,1,1) 
         font = love.graphics.newFont(25)
   love.graphics.setFont(font)
         
         if(detect(500,500,300,50,mx,my,0,0)) then
            love.graphics.print("DON'T START", 580, 510)
   
         else
            love.graphics.print("START", 620, 510)
         end
         
         font = love.graphics.newFont(100)
   love.graphics.setFont(font)
         love.graphics.print("PAC-MAN", 450, 210)
        
      end


   end 


   


