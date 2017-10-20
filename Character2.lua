local Character = {}

				
	Character.new = function(x,y,mapaX,mapaY,initialFrame,imageFile)
		local self = self or {}
		
		self.frames = {}
		
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
		self.elapsedTime=0
		
		--funcoes
		self.moveDown = function(dt)
			self.elapsedTime = self.elapsedTime +0.01
	
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
		
		self.moveRight = function(dt)
			self.elapsedTime = self.elapsedTime +0.01
	
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
		
		self.desenhar = function(imageFile)
			love.graphics.draw(imageFile, self.activeFrame, self.currentX, self.currentY)
		end
		
		return self
	end
return Character