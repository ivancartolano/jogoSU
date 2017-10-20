local mapa = require "mapa"
local Character = require "Character"
local Sprite = require "Sprite"
local steven = Character:new()
local connie = Character:new()
local personagen = Character:new()
local stevenSprites
local connieSprites
local imageFile
local grassImage
local dirtImage
local waterImage


function love.load()

	grassImage = love.graphics.newImage("grass64.png")
	dirtImage = love.graphics.newImage("dirt64.png")
	waterImage = love.graphics.newImage("water64.png")
	imageFile = love.graphics.newImage("steven-universe-sprites.png")
	
	--steven= Character.new(0,0,0,0,1,imageFile)
	--connie= Character.new(0,4,80,0,7,imageFile)
	stevenSprites = Sprite:preencherFrames(0,0,imageFile)
	connieSprites = Sprite:preencherFrames(0,4,imageFile)
	
	steven:carregar(0,0,1, stevenSprites,imageFile)
	connie:carregar(80,0,7,connieSprites,imageFile)
	personagen:carregar(150,0,7, stevenSprites,imageFile)
end

function love.update(dt)
	steven:moveDown(dt)
	connie:moveRight(dt)
	personagen:moveRight(dt)
end


function love.draw()
	mapa:draw(grassImage, dirtImage, waterImage)
	steven:desenhar(imageFile)
	connie:desenhar(imageFile)
	personagen:desenhar(imageFile)
end



