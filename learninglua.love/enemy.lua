local love = require("love")

---@diagnostic disable: lowercase-global

function eneemy()

function love.load()
    sounds.ghostsound:setVolume(0.5)
    pacman = pucman()
    dim = {
        gw = 65,
        gh = 60,
        gtw = 150,
        gth = 118,
        x = 240,
        y = 20,
        qx = 1200,
        qy = 700,
        espeed = 1,
        ghost = love.graphics.newImage("data/ghost.png"),
        quads = { }}
end

    food = foood()
    
    dim = {
        gw = 65,
        gh = 60,
        gtw = 150,
        gth = 118,
        x = 240,
        y = 20,
        qx = 1200,
        qy = 700,
        espeed = 1,
        ghost = love.graphics.newImage("data/ghost.png"),
        quads = { }}

        
        
        
        function dim:move(playerx, playery)
            if playerx < self.x then
                self.x = self.x - self.espeed
            elseif playerx > self.x then
                self.x = self.x + self.espeed
            end
        
            if playery < self.y then
                self.y = self.y - self.espeed
            elseif playery > self.y then
                self.y = self.y + self.espeed
            end
        end
        
       
    
        function dim:draw()
            q2 = love.graphics.newQuad(0,0, dim.gw, dim.gh, dim.gtw, dim.gth)
            q1 = love.graphics.newQuad(dim.gw+20,dim.gh, 2*dim.gw-65, dim.gh, dim.gtw, dim.gth)
            love.graphics.newQuad(dim.gw+20,dim.gh, 2*dim.gw-65, dim.gh, dim.gtw, dim.gth)
            if food.eaten > 3 then

                love.audio.play(sounds.ghostsound)
            end
                if game.state["menu"]  then
                sounds.ghostsound:stop()
            end
            if food.eaten > 3 and food.eaten < 12 then
            love.graphics.draw(dim.ghost ,q2,dim.x,dim.y)
            
        end
            if food.eaten == 16 and not detect(pacman.x-50,pacman.y-50,100,100,ghost.x,ghost.y,ghost.gw,ghost.gh) then
                love.graphics.draw(dim.ghost ,q2,dim.x,dim.y)
            
            end    
            if food.eaten> 19 and food.eaten <23 then
                love.graphics.setColor(1,1,1)
                love.graphics.draw(dim.ghost ,q1,dim.qx,dim.qy)
            end
            if food.eaten> 22  then
                love.graphics.setColor(1,1,1)
                love.graphics.draw(dim.ghost ,q1,dim.x,dim.y)
                love.graphics.draw(dim.ghost ,q2,dim.qx, dim.qy)
            
            end
    end

return dim
end

return eneemy

 
