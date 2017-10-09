local character = {}

	local bitmap = {
		{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
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
		
	
	function character:carregar(x,y,imageFile)
		local frames = {}
		
		frames[1] = love.graphics.newQuad(x*32,y*32,32,32, imageFile:getDimensions())
		frames[2] = love.graphics.newQuad(x*32,(y+1)*32,32,32, imageFile:getDimensions())
		frames[3] = love.graphics.newQuad(x*32,(y+2)*32,32,32, imageFile:getDimensions())
		frames[4] = love.graphics.newQuad((x+1)*32,32,32,32, imageFile:getDimensions())
		frames[5] = love.graphics.newQuad((x+1)*32,(y+1)*32,32,32, imageFile:getDimensions())
		frames[6] = love.graphics.newQuad((x+1)*32,(y+2)*32,32,32, imageFile:getDimensions())
		frames[7] = love.graphics.newQuad((x+2)*32,32,32,32, imageFile:getDimensions())
		frames[8] = love.graphics.newQuad((x+2)*32,(y+1)*32,32,32, imageFile:getDimensions())
		frames[9] = love.graphics.newQuad((x+2)*32,(y+2)*32,32,32, imageFile:getDimensions())
		frames[10] = love.graphics.newQuad((x+3)*32,32,32,32, imageFile:getDimensions())
		frames[11] = love.graphics.newQuad((x+3)*32,(y+1)*32,32,32, imageFile:getDimensions())
		frames[12] = love.graphics.newQuad((x+3)*32,(y+2)*32,32,32, imageFile:getDimensions())
		
		return frames
	end