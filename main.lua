local mapa = require "mapa"
local Character = require "character"
local steven = Character:new()
local connie = Character:new()
local imageFile
local grassImage
local dirtImage
local waterImage


function love.load()

	grassImage = love.graphics.newImage("grass64.png")
	dirtImage = love.graphics.newImage("dirt64.png")
	waterImage = love.graphics.newImage("water64.png")
	imageFile = love.graphics.newImage("steven-universe-sprites.png")
	
	steven:carregar(0,0,0,0,1,imageFile)
	connie:carregar(0,4,80,0,7,imageFile)
end

function love.update(dt)
	steven:moveDown(dt)
	connie:moveRight(dt)
end


function love.draw()
	mapa:draw(grassImage, dirtImage, waterImage)
	steven:desenhar(imageFile)
	connie:desenhar(imageFile)
end



