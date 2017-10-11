local mapa = require "mapa"
local character = require "character"
local imageFile
local grassImage
local dirtImage
local waterImage


function love.load()

	grassImage = love.graphics.newImage("grass64.png")
	dirtImage = love.graphics.newImage("dirt64.png")
	waterImage = love.graphics.newImage("water64.png")
	imageFile = love.graphics.newImage("steven-universe-sprites.png")
	
	character:carregar(0,0,imageFile)
end

function love.update(dt)
	character:moveDown(dt)
end


function love.draw()
	mapa:draw(grassImage, dirtImage, waterImage)
	character:desenhar(imageFile)
end



