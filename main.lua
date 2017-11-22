local mapa = require "mapa"
--local Character = require "Character"
--local Sprite = require "Sprite"
--local steven = Character:new()
--local connie = Character:new()
--local personagen = Character:new()
--local stevenSprites
--local connieSprites
local door = require "door"
local imageFile
local grassImage
local dirtImage
local waterImage

local bluemap = {
		{28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9},
		{27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8},
		{26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7},
		{25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6},
		{24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5},
		{23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4},
		{22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3},
		{21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2},
		{20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1},
		{19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0},
		}
		
local redmap = {
		{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19},
		{ 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20},
		{ 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21},
		{ 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22},
		{ 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23},
		{ 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24},
		{ 6, 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25},
		{ 7, 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26},
		{ 8, 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27},
		{ 9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28},
		}
	

function love.load()

	math.randomseed( os.time() )
	grassImage = love.graphics.newImage("grass64.png")
	dirtImage = love.graphics.newImage("dirt64.png")
	waterImage = love.graphics.newImage("water64.png")
	imageFile = love.graphics.newImage("steven-universe-sprites.png")
	
	--stevenSprites = Sprite:preencherFrames(0,0,imageFile)
	--connieSprites = Sprite:preencherFrames(0,4,imageFile)
	
	--steven:carregar(16,16,1,1,1, stevenSprites,imageFile, 'steven')
	--connie:carregar(32,96,2,1,7,connieSprites,imageFile, 'connie')
	--personagen:carregar(150,0,7, stevenSprites,imageFile)
	door:carregar(imageFile, bluemap, 16,16,1,1, 0, 0, 250 )
end

function love.update(dt)
	--steven:movimentoObjetivo(dt)
	--connie:movimentoObjetivo(dt)
	door:atualizar(dt)
	--personagen:moveRight(dt)
end


function love.draw()
	mapa:draw(grassImage, dirtImage, waterImage)
	door:desenhar(imageFile)
	--steven:desenhar(imageFile)
	--connie:desenhar(imageFile)
	--personagen:desenhar(imageFile)
end



