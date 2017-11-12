local mapa = {}

	local bitmap = {
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{2,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,1},
		{3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,1},
		{4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,0,1},
		{5,0,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1},
		{6,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0},
		{7,0,0,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0},
		{8,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0},
		{9,0,0,1,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0},
		{0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0},
		}
		
	--function Mapa:create()
		--local grassImage = love.graphics.newImage("grass64.png")
		--local dirtImage = love.graphics.newImage("dirt64.png")
		--local waterImage = love.graphics.newImage("water64.png")
		
	--end
	
	function mapa:draw(grass, dirt, water)
		local i
		local j
		for i= 1, 10 do
			for j = 1, 20 do
				if (bitmap[i][j] == 0) then
					love.graphics.draw(grass, (j-1)*64, (i-1)*64)
				elseif (bitmap[i][j] == 1)	then
					love.graphics.draw(dirt, (j-1)*64, (i-1)*64)
				else
					love.graphics.draw(water, (j-1)*64, (i-1)*64)
				end
			end
		end
	
	end
	
	return mapa