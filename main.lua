local mapa = require "mapa"
local Character = require "Character"
local Sprite = require "Sprite"
local steven = Character:new()
local connie = Character:new()
--local personagen = Character:new()
local stevenSprites
local connieSprites
local imageFile
local grassImage
local dirtImage
local waterImage


function love.load()

	math.randomseed( os.time() )
	grassImage = love.graphics.newImage("grass64.png")
	dirtImage = love.graphics.newImage("dirt64.png")
	waterImage = love.graphics.newImage("water64.png")
	imageFile = love.graphics.newImage("steven-universe-sprites.png")
	
	stevenSprites = Sprite:preencherFrames(0,0,imageFile)
	connieSprites = Sprite:preencherFrames(0,4,imageFile)
	
	steven:carregar(8,8,1,1,1, stevenSprites,imageFile, 'steven')
	connie:carregar(32,96,2,1,7,connieSprites,imageFile, 'connie')
	--personagen:carregar(150,0,7, stevenSprites,imageFile)
end

function love.update(dt)
	steven:movimento(dt)
	connie:movimento(dt)
	--personagen:moveRight(dt)
end


function love.draw()
	mapa:draw(grassImage, dirtImage, waterImage)
	steven:desenhar(imageFile)
	connie:desenhar(imageFile)
	--personagen:desenhar(imageFile)
end



