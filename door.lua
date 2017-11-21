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

local door = {elapsedTime = 0, personagem = {}}

function door:carregar(imageFile)
	stevenSprites = Sprite:preencherFrames(0,0,imageFile)
	garnetSprites = Sprite:preencherFrames(3,0,imageFile)
	amethystSprites = Sprite:preencherFrames(6,0,imageFile)
	pearlSprites = Sprite:preencherFrames(9,0,imageFile)
	connieSprites = Sprite:preencherFrames(0,4,imageFile)
	gregSprites = Sprite:preencherFrames(3,4,imageFile)
	peridotSprites = Sprite:preencherFrames(6,4,imageFile)
	
	steven:carregar(16,16,1,1,1, stevenSprites,imageFile, 'steven')
	--connie:carregar(16,80,2,1,7,connieSprites,imageFile, 'connie')
	table.insert(self.personagem, steven)

end



function door:atualizar(dt)
	self.elapsedTime = self.elapsedTime + 1
	if (self.elapsedTime > 150) then 
		self.elapsedTime = 0
		local auxiliar = Character:new()
		auxiliar:carregar(16,16,1,1,1, stevenSprites,imageFile, 'steven')
		table.insert(self.personagem, auxiliar)
	end
	--steven:movimentoObjetivo(dt)
	--connie:movimentoObjetivo(dt)
	for i, v in ipairs(self.personagem) do
		v:movimentoObjetivo(dt)
	end
end

function door:desenhar(imageFile)
	--steven:desenhar(imageFile)
	--connie:desenhar(imageFile)
	for i, v in ipairs(self.personagem) do
		v:desenhar(imageFile)
	end
end

return door