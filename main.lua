local mapa = require "mapa"
local imageFile
local grassImage
local dirtImage
local waterImage
local steven
local frames = {}
local activeFrame
local currentFrame = 1

currentX = 0

function love.load()
	steven = love.graphics.newImage("StevenUniverse.png")
	grassImage = love.graphics.newImage("grass64.png")
	dirtImage = love.graphics.newImage("dirt64.png")
	waterImage = love.graphics.newImage("water64.png")
	imageFile = love.graphics.newImage("sprite-robin.png")
	frames[1] = love.graphics.newQuad(0,0,32,32, imageFile:getDimensions())
	frames[2] = love.graphics.newQuad(32,0,32,32, imageFile:getDimensions())
	frames[3] = love.graphics.newQuad(0,32,32,32, imageFile:getDimensions())
	frames[4] = love.graphics.newQuad(32,32,32,32, imageFile:getDimensions())
	
	activeFrame = frames[currentFrame]
end

local elapsedTime = 0
function love.update(dt)
	elapsedTime = elapsedTime +dt
	
	if(elapsedTime > 1) then
		if (currentFrame < 4) then
			currentFrame = currentFrame + 1
		else
			currentFrame = 1
		end
		activeFrame = frames[currentFrame]
		elapsedTime = 0
	end
	
	if (currentX < love.graphics.getWidth()) then
		currentX = currentX + 1
	else
		currentX = 0
	end
end


function love.draw()
	--love.graphics.draw(steven)
	--love.graphics.draw(grassImage)
	mapa:draw(grassImage, dirtImage, waterImage)
	love.graphics.draw(imageFile, activeFrame, currentX, 0)
end



