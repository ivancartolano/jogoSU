local Character = require "Character"
local Sprite = require "Sprite"

local steven = Character:new()
local connie = Character:new()

local stevenSprites
local connieSprites

local door = {}

function door:carregar(imageFile)
	stevenSprites = Sprite:preencherFrames(0,0,imageFile)
	connieSprites = Sprite:preencherFrames(0,4,imageFile)
	
	steven:carregar(16,16,1,1,1, stevenSprites,imageFile, 'steven')
	connie:carregar(16,80,2,1,7,connieSprites,imageFile, 'connie')

end

function door:atualizar(dt)
	steven:movimentoObjetivo(dt)
	connie:movimentoObjetivo(dt)
end

function door:desenhar(imageFile)
	steven:desenhar(imageFile)
	connie:desenhar(imageFile)
end

return door