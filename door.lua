local Character = require "Character"
local Sprite = require "Sprite"


local stevenSprites
local garnetSprites
local amethystSprites
local pearlSprites
local connieSprites
local gregSprites
local peridotSprites


local door = {elapsedTime = 0, 
			personagem = {},
			individualMap,
			currentX,
			currentY,
			coordenadaMatricialX,
			coordenadaMatricialY,
			red,
			green,
			blue,
			steven = Character:new(),
			}

function door:new(o)
	o =  {}
	setmetatable(o,self)
	self.__index = self
	return o
end

function door:carregar(imageFile, mapa, mapaX,mapaY, coorMatricialX, coorMatricialY, r, g, b, vec)
	stevenSprites = Sprite:preencherFrames(0,0,imageFile)
	garnetSprites = Sprite:preencherFrames(3,0,imageFile)
	amethystSprites = Sprite:preencherFrames(6,0,imageFile)
	pearlSprites = Sprite:preencherFrames(9,0,imageFile)
	connieSprites = Sprite:preencherFrames(0,4,imageFile)
	gregSprites = Sprite:preencherFrames(3,4,imageFile)
	peridotSprites = Sprite:preencherFrames(6,4,imageFile)
	
	self.individualMap = mapa
	self.currentX = mapaX
	self.currentY = mapaY
	self.coordenadaMatricialX= coorMatricialX
	self.coordenadaMatricialY = coorMatricialY
	self.red = r
	self.green = g
	self.blue = b

	self.personagem = vec

end

function door:escolher(pers) 
	local escolhido = math.random(7)
	if (escolhido == 1) then
		pers:carregar(self.currentX,self.currentY,self.coordenadaMatricialX,self.coordenadaMatricialY,1, stevenSprites,imageFile, 'steven', self.individualMap)
	end
	if (escolhido == 2) then
		pers:carregar(self.currentX,self.currentY,self.coordenadaMatricialX,self.coordenadaMatricialY,1, garnetSprites,imageFile, 'garnet', self.individualMap)
	end
	if (escolhido == 3) then
		pers:carregar(self.currentX,self.currentY,self.coordenadaMatricialX,self.coordenadaMatricialY,1, amethystSprites,imageFile, 'amet', self.individualMap)
	end
	if (escolhido == 4) then
		pers:carregar(self.currentX,self.currentY,self.coordenadaMatricialX,self.coordenadaMatricialY,1, pearlSprites,imageFile, 'pearl', self.individualMap)
	end
	if (escolhido == 5) then
		pers:carregar(self.currentX,self.currentY,self.coordenadaMatricialX,self.coordenadaMatricialY,1, connieSprites,imageFile, 'connie', self.individualMap)
	end
	if (escolhido == 6) then
		pers:carregar(self.currentX,self.currentY,self.coordenadaMatricialX,self.coordenadaMatricialY,1, gregSprites,imageFile, 'greg', self.individualMap)
	end
	if (escolhido == 7) then
		pers:carregar(self.currentX,self.currentY,self.coordenadaMatricialX,self.coordenadaMatricialY,1, peridotSprites,imageFile, 'peridot', self.individualMap)
	end
end

function door:atualizar(dt)	
	self.elapsedTime = self.elapsedTime + 1
	if (self.elapsedTime == 90) then 
		self.elapsedTime = 0
		local auxiliar = Character:new()
		self:escolher(auxiliar)
		table.insert(self.personagem, auxiliar)
	end

	for i, v in ipairs(self.personagem) do
		v:movimentoObjetivo(dt)
		
		if (v.costmap[v.coordenadaMatricialX][v.coordenadaMatricialY]== 0) then
			table.remove(self.personagem, i)
		end
	end
end

function door:desenhar(imageFile)
	for i, v in ipairs(self.personagem) do
		v:desenhar(imageFile, self.red, self.green, self.blue)
	end
end

return door