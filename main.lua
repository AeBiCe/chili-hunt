--  Load order: love.load -> love.update -> love.draw

-- This is being loaded once

activeChili = true

function love.load()
   love.mouse.setVisible(false) -- Hide mouse

   -- Character 
   char = {}
   char.x = 0
   char.y = 450

   -- Chili Pepper
   chili = {}
   chili.x = 150
   chili.y = 450

   -- TODO: Helper function to convert hex to RGB
   love.graphics.setBackgroundColor(0.0549, 0.2235, 0.0549)
   crunch = love.audio.newSource("assets/crunch.wav", "static")
end


-- Loads continously
-- model
function love.update(dt)

   chili_sprite = love.graphics.newImage("assets/chili.png")
   character = love.graphics.newImage("assets/character-front.png")

   if love.keyboard.isDown("right") then
      character = love.graphics.newImage("assets/character-right.png")
      char.x = char.x + 3
   end

   if love.keyboard.isDown("left") then
      character = love.graphics.newImage("assets/character-left.png")
      char.x = char.x - 3
   end

   if love.keyboard.isDown("up") then
      character = love.graphics.newImage("assets/character-back.png")
      char.y = char.y - 3
   end

   if love.keyboard.isDown("down") then
      char.y = char.y + 3
   end

   if char.x == chili.x and char.y == chili.y then
      crunch:play()
      activeChili = false
   end

   -- Hillbilly collision calculation made by Llama 3.3
   char.w, char.h = character:getDimensions()
   chili.w, chili.h = chili_sprite:getDimensions()

   if char.x < chili.x + chili.w and
      chili.x < char.x + char.w and
      char.y < chili.y + chili.h and
      chili.y < char.y + char.h then
         crunch:play()
         chili.x = -9000
         chili.y = -9000
         activeChili = false
   end
   
end

-- Loads continously
-- view
function love.draw()
   love.graphics.draw(character, char.x, char.y)
   if activeChili then
      love.graphics.draw(chili_sprite, chili.x, chili.y)
   end
end
