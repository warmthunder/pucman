_G.love = require("love")
---@diagnostic disable: lowercase-global

function _G.pucman()

_G.prop = {
    x = 700,
    y = 600,
    side1 = 1,
    side2 = 5,
    check = false,
    debounce = 0.5,
}



    function move(self, dt)
        self.debounce = self.debounce - dt
        if love.keyboard.isDown("d") and self.x<1200 then
         self.x = self.x + 4
     
         if self.debounce <= 0  then
           self.side1 = 1
           self.side2 = 5
           self.debounce = 0.5
         end
      end
      if love.keyboard.isDown("a") and self.x > 10 then
         self.x = self.x - 4
         if self.debounce <= 0 then
           self.side1 = 4.2
           self.side2 = 8.2
           self.debounce = 0.5
         end
      end
      if love.keyboard.isDown("w") and self.y >10 then
         self.y = self.y - 4
         if self.debounce <= 0 then
           self.side1 = 5.9
           self.side2 = 9.9
           self.debounce = 0.5
         end
      end
      if love.keyboard.isDown("s") and self.y < 700 then
         self.y = self.y + 4
         if self.debounce <= 0 then
           self.side1 = 2.8
           self.side2 = 6.8
           self.debounce = 0.5
         end
      end
    end

    function chomp(self, dt)
        if self.check then
            self.side1 = self.side1 - math.pi*dt
            self.side2 = self.side2 + math.pi*dt
         
            if self.side2 - self.side1 >= 2*math.pi then
               self.check=false
            end
         
         else
            self.side1 = self.side1 + math.pi*dt
            self.side2 = self.side2 - math.pi*dt
         
         
            if self.side2 - self.side1 <= 4 then
               self.check=true
            end
    end
end
return prop

end

return pucman
