local Character = require "Character"
local Sprite = require "Sprite"

local steven = Character:new()
--local connie = Character:new()

local stevenSprites
local garnetSprites
local amethystSprites
local pearlSprites
local connieSprites
local gregSprites
local peridotSprites
local individualMap
local currentX
local currentY
local coorMatricialX
local coorMatricialY
local red
local green
local blue
local goalX
local goalY

local door = {elapsedTime = 0, personagem = {}}

function door:new(o)
	o =  {}
	setmetatable(o,self)
	self.__index = self
	return o
end

function door:carregar(imageFile, mapa, mapaX,mapaY, coorMatricialX, coorMatricialY, r, g, b, gX, gY)
	stevenSprites = Sprite:preencherFrames(0,0,imageFile)
	garnetSprites = Sprite:preencherFrames(3,0,imageFile)
	amethystSprites = Sprite:preencherFrames(6,0,imageFile)
	pearlSprites = Sprite:preencherFrames(9,0,imageFile)
	connieSprites = Sprite:preencherFrames(0,4,imageFile)
	gregSprites = Sprite:preencherFrames(3,4,imageFile)
	peridotSprites = Sprite:preencherFrames(6,4,imageFile)
	
	individualMap = mapa
	currentX = mapaX
	currentY = mapaY
	coordenadaMatricialX= coorMatricialX
	coordenadaMatricialY = coorMatricialY
	red = r
	green = g
	blue = b
	goalX = gX
	goalY = gY
	steven:carregar(currentX,currentY,coordenadaMatricialX,coordenadaMatricialY,1, stevenSprites,imageFile, 'steven', individualMap)
	--steven:carregar(16,16,1,1,1, stevenSprites,imageFile, 'steven', individualMap)
	--connie:carregar(16,80,2,1,7,connieSprites,imageFile, 'connie')
	table.insert(self.personagem, steven)

end

local function escolher(pers) 
	local escolhido = math.random(7)
	if (escolhido == 1) then
		pers:carregar(currentX,currentY,coordenadaMatricialX,coordenadaMatricialY,1, stevenSprites,imageFile, 'steven', individualMap)
	end
	if (escolhido == 2) then
		pers:carregar(currentX,currentY,coordenadaMatricialX,coordenadaMatricialY,1, garnetSprites,imageFile, 'garnet', individualMap)
	end
	if (escolhido == 3) then
		pers:carregar(currentX,currentY,coordenadaMatricialX,coordenadaMatricialY,1, amethystSprites,imageFile, 'amet', individualMap)
	end
	if (escolhido == 4) then
		pers:carregar(currentX,currentY,coordenadaMatricialX,coordenadaMatricialY,1, pearlSprites,imageFile, 'pearl', individualMap)
	end
	if (escolhido == 5) then
		pers:carregar(currentX,currentY,coordenadaMatricialX,coordenadaMatricialY,1, connieSprites,imageFile, 'connie', individualMap)
	end
	if (escolhido == 6) then
		pers:carregar(currentX,currentY,coordenadaMatricialX,coordenadaMatricialY,1, gregSprites,imageFile, 'greg', individualMap)
	end
	if (escolhido == 7) then
		pers:carregar(currentX,currentY,coordenadaMatricialX,coordenadaMatricialY,1, peridotSprites,imageFile, 'peridot', individualMap)
	end
end

function door:atualizar(dt)
	self.elapsedTime = self.elapsedTime + 1
	if (self.elapsedTime > 150) then 
		self.elapsedTime = 0
		local auxiliar = Character:new()
		--auxiliar:carregar(16,16,1,1,1, stevenSprites,imageFile, 'steven')
		escolher(auxiliar)
		table.insert(self.personagem, auxiliar)
	end
	--steven:movimentoObjetivo(dt)
	--connie:movimentoObjetivo(dt)
	for i, v in ipairs(self.personagem) do
		v:movimentoObjetivo(dt)
		--if ((v.coordenadaMatricialX == goalX) and (v.coordenadaMatricialY == goalY)) then
		--if ((v.coordenadaMatricialX == 10) and (v.coordenadaMatricialY == 20)) then
		if (v.costmap[v.coordenadaMatricialX][v.coordenadaMatricialY]== 0) then
			table.remove(self.personagem, i)
		end
	end
end

function door:desenhar(imageFile)
	--steven:desenhar(imageFile)
	--connie:desenhar(imageFile)
	for i, v in ipairs(self.personagem) do
		v:desenhar(imageFile, red, green, blue)
	end
end

return door