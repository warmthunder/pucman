local love = require("love")
local enemy = require("enemy")
---@diagnostic disable: lowercase-global


function love.load()
    _G.ghost = Enemy()
end


function foood()
local food = {

    x = math.random(1200),
    y = math.random(700),
    eaten = 0
    
 }



 function food:eat(x,y)
    
    if (x  >= (food.x -50)) and (x  <= (food.x + 50))  and (y >= (food.y -50)) and (y <= (food.y +50)) then
        self.eaten = self.eaten + 1
       if self.eaten % 3 == 0 then
        ghost.espeed = ghost.espeed + 0.4
       end
        food.x = love.math.random(1200)
        food.y = love.math.random(700)
        
    end
    
end
return food
end

return foood()
