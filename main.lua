--  Load order: love.load -> love.update -> love.draw

-- This is being loaded once
function love.load()
   local character
   -- Idea: Helper function to convert hex to RGB
   love.graphics.setBackgroundColor(0.0549, 0.2235, 0.0549)
end


-- Loads continously
-- model
function love.update(dt)
   character = love.graphics.newImage("assets/character.png")
end

-- Loads continously
-- view
function love.draw()
   love.graphics.draw(character, 100, 100)
end
