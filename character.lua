local character = {}

	local frames = {}
	local activeFrame
	local currentFrame = 1
	local currentY = 0

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
		
		frames[1] = love.graphics.newQuad(x*32,y*32,32,32, imageFile:getDimensions())
		frames[2] = love.graphics.newQuad((x+1)*32,y*32,32,32, imageFile:getDimensions())
		frames[3] = love.graphics.newQuad((x+2)*32,y*32,32,32, imageFile:getDimensions())
		frames[4] = love.graphics.newQuad(x*32,(y+1)*32,32,32, imageFile:getDimensions())
		frames[5] = love.graphics.newQuad((x+1)*32,(y+1)*32,32,32, imageFile:getDimensions())
		frames[6] = love.graphics.newQuad((x+2)*32,(y+1)*32,32,32, imageFile:getDimensions())
		frames[7] = love.graphics.newQuad(x*32,(y+2)*32,32,32, imageFile:getDimensions())
		frames[8] = love.graphics.newQuad((x+1)*32,(y+2)*32,32,32, imageFile:getDimensions())
		frames[9] = love.graphics.newQuad((x+2)*32,(y+2)*32,32,32, imageFile:getDimensions())
		frames[10] = love.graphics.newQuad(x*32,(y+3)*32,32,32, imageFile:getDimensions())
		frames[11] = love.graphics.newQuad((x+2)*32,(y+3)*32,32,32, imageFile:getDimensions())
		frames[12] = love.graphics.newQuad((x+2)*32,(y+3)*32,32,32, imageFile:getDimensions())
		
		activeFrame = frames[currentFrame]
		
	end
	
	local elapsedTime = 0
	
	function character:moveDown(dt)
		elapsedTime = elapsedTime +dt
	
		if(elapsedTime > 0.25) then
			if (currentFrame < 3) then
				currentFrame = currentFrame + 1
			else
				currentFrame = 1
			end
			activeFrame = frames[currentFrame]
			elapsedTime = 0
		end
	
		if (currentY < love.graphics.getHeight()) then
			currentY = currentY + 1
		else
			currentY = 0
		end
	end
	
	--function character:atualizar()
	
	--end
	
	function character:desenhar(imageFile)
		love.graphics.draw(imageFile, activeFrame, 0, currentY)
	end
	
return character