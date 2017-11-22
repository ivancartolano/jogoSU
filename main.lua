local mapa = require "mapa"
local door = require "door"
local redDoor = door:new()
local blueDoor = door:new()
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

	
	blueDoor:carregar(imageFile, bluemap, 16,16,1,1, 0, 0, 250 )
	redDoor:carregar(imageFile, redmap, 1232,592,10,20, 250, 0, 0 )
end

function love.update(dt)	
	blueDoor:atualizar(dt)
	redDoor:atualizar(dt)
end


function love.draw()
	mapa:draw(grassImage, dirtImage, waterImage)
	blueDoor:desenhar(imageFile)
	redDoor:desenhar(imageFile)
end



