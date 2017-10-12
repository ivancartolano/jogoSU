local Character = {

	frames = {},
	activeFrame,
	currentFrame = 1,
	currentX,
	currentY = 0,
	elapsedTime = 0,

	bitmap = {
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
		
		}
		
	function Character:new(o)
		o = o or {}
		setmetatable(o,self)
		self.__index = self
		return o
	end
	
	function Character:carregar(x,y,mapaX,mapaY,initialFrame,imageFile)
		
		self.frames[1] = love.graphics.newQuad(x*32,y*32,32,32, imageFile:getDimensions())
		self.frames[2] = love.graphics.newQuad((x+1)*32,y*32,32,32, imageFile:getDimensions())
		self.frames[3] = love.graphics.newQuad((x+2)*32,y*32,32,32, imageFile:getDimensions())
		self.frames[4] = love.graphics.newQuad(x*32,(y+1)*32,32,32, imageFile:getDimensions())
		self.frames[5] = love.graphics.newQuad((x+1)*32,(y+1)*32,32,32, imageFile:getDimensions())
		self.frames[6] = love.graphics.newQuad((x+2)*32,(y+1)*32,32,32, imageFile:getDimensions())
		self.frames[7] = love.graphics.newQuad(x*32,(y+2)*32,32,32, imageFile:getDimensions())
		self.frames[8] = love.graphics.newQuad((x+1)*32,(y+2)*32,32,32, imageFile:getDimensions())
		self.frames[9] = love.graphics.newQuad((x+2)*32,(y+2)*32,32,32, imageFile:getDimensions())
		self.frames[10] = love.graphics.newQuad(x*32,(y+3)*32,32,32, imageFile:getDimensions())
		self.frames[11] = love.graphics.newQuad((x+2)*32,(y+3)*32,32,32, imageFile:getDimensions())
		self.frames[12] = love.graphics.newQuad((x+2)*32,(y+3)*32,32,32, imageFile:getDimensions())
		
		self.currentFrame = initialFrame
		self.activeFrame = self.frames[self.currentFrame]
		self.currentX = mapaX
		self.currentY = mapaY
		
	end
	
	
	function Character:moveDown(dt)
		self.elapsedTime = self.elapsedTime +dt
	
		if(self.elapsedTime > 0.25) then
			if (self.currentFrame < 3) then
				self.currentFrame = self.currentFrame + 1
			else
				self.currentFrame = 1
			end
			self.activeFrame = self.frames[self.currentFrame]
			self.elapsedTime = 0
		end
	
		if (self.currentY < love.graphics.getHeight()) then
			self.currentY = self.currentY + 1
		else
			self.currentY = 0
		end
	end
	
	function Character:moveRight(dt)
		self.elapsedTime = self.elapsedTime +dt
	
		if(self.elapsedTime > 0.75) then
			if (self.currentFrame < 9) then
				self.currentFrame = self.currentFrame + 1
			else
				self.currentFrame = 7
			end
			self.activeFrame = self.frames[self.currentFrame]
			self.elapsedTime = 0
		end
	
		if (self.currentX < love.graphics.getWidth()) then
			self.currentX = self.currentX + 1
		else
			self.currentX = 0
		end
	
	end
	
	--function character:atualizar()
	
	--end
	
	function Character:desenhar(imageFile)
		love.graphics.draw(imageFile, self.activeFrame, self.currentX, self.currentY)
	end
	
return Character