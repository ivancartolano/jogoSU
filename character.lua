local Character = {

	frames = {},
	activeFrame,
	currentFrame = 1,
	coordenadaMatricialX=1,
	coordenadaMatricialY=1,
	currentX,
	currentY = 0,
	contadorIncremento = 0,
	elapsedTime = 0,
	acao,
	emMovimento= false,
	contador= 0,
	nome,


	bitmap = {
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1},
		{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,1,0,1,1,1,1,0,0,0,0,0,0,1,0,0,1},
		{1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,1},
		{1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,0,0,0,1},
		{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1},
		{2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		},
		
	
	costmap	
		}
		
		
	local charmap = {
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		}
		
		
	function Character:stand(dt)
		emMovimento = false
	end	
		
		
	function Character:new(o)
		o =  {}
		setmetatable(o,self)
		self.__index = self
		return o
	end
	
	function Character:carregar(mapaX,mapaY, coorMatricialX, coorMatricialY, initialFrame, sprites,imageFile, onome, individualMap)
		
		self.frames = sprites
		self.currentFrame = initialFrame
		self.activeFrame = self.frames[self.currentFrame]
		self.currentX = mapaX
		self.currentY = mapaY
		self.coordenadaMatricialX= coorMatricialX
		self.coordenadaMatricialY = coorMatricialY
		self.nome = onome
		self.costmap = individualMap
		
	end
	
	
	function Character:least(x,y)
		local minimo = self.costmap[x][y]
		if (x < 10) then
			if (minimo > self.costmap[x + 1][y]) then
				minimo = self.costmap[x + 1][y]
			end
		end
		if (x > 1) then
			if (minimo > self.costmap[x - 1][y]) then
				minimo = self.costmap[x - 1][y]
			end
		end
		if (y < 20) then
			if (minimo > self.costmap[x][y + 1]) then
				minimo = self.costmap[x][y + 1]
			end
		end
		if ( y > 1) then 
			if (minimo > self.costmap[x][y - 1]) then
				minimo = self.costmap[x][y - 1]
			end
		end
		return minimo
	end

function Character:movimentoObjetivo(dt)
	self.contador = self.contador +1

	if (not(self.emMovimento)) then
		movimentoPossivel = {}
		
		local minimo = self:least(self.coordenadaMatricialX, self.coordenadaMatricialY) 
		
		if (self.coordenadaMatricialX<10) then
			if ((self.bitmap[self.coordenadaMatricialX+1][self.coordenadaMatricialY ] == 0) and (self.costmap[self.coordenadaMatricialX+1][self.coordenadaMatricialY ] == minimo) )then
				if(charmap[self.coordenadaMatricialX+1][self.coordenadaMatricialY ] == 0) then
					table.insert(movimentoPossivel, 'down')
				end
			end
		end
		if (self.coordenadaMatricialX>1) then
			if ((self.bitmap[self.coordenadaMatricialX- 1][self.coordenadaMatricialY] == 0) and (self.costmap[self.coordenadaMatricialX- 1][self.coordenadaMatricialY] == minimo) ) then
				if(charmap[self.coordenadaMatricialX- 1][self.coordenadaMatricialY] == 0) then
					table.insert(movimentoPossivel, 'up')
				end
			end
		end
		if (self.coordenadaMatricialY<20) then
			if ((self.bitmap[self.coordenadaMatricialX] [self.coordenadaMatricialY + 1]== 0) and (self.costmap[self.coordenadaMatricialX] [self.coordenadaMatricialY + 1]== minimo)) then
				if (charmap[self.coordenadaMatricialX] [self.coordenadaMatricialY + 1]== 0) then
					table.insert(movimentoPossivel, 'right')
				end
			end
		end
		if (self.coordenadaMatricialY>1) then
			if ((self.bitmap[self.coordenadaMatricialX][self.coordenadaMatricialY - 1] == 0) and (self.costmap[self.coordenadaMatricialX][self.coordenadaMatricialY - 1] == minimo) ) then
				if (charmap[self.coordenadaMatricialX][self.coordenadaMatricialY - 1] == 0) then
					table.insert(movimentoPossivel, 'left')
				end
			end
		end 
	
		movimentoEscolhido = movimentoPossivel[math.random(#movimentoPossivel)]
		
		
		if movimentoEscolhido == 'down' then
			self.acao = self.moveDown
		elseif (movimentoEscolhido == 'up') then
			self.acao = self.moveUp
		elseif movimentoEscolhido == 'right' then
			self.acao = self.moveRight
		elseif movimentoEscolhido == 'left' then
			self.acao = self.moveLeft
		else
			self.acao = self.stand
		end
		
	end

	self:acao(dt)
end 

	function Character:moveDown(dt)
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 1
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 1
		end
		
		if (self.contadorIncremento<64) then
			if(self.elapsedTime > 0.15) then
				if (self.currentFrame < 3) then
					self.currentFrame = self.currentFrame + 1
				else
					self.currentFrame = 1
				end
				self.activeFrame = self.frames[self.currentFrame]
				self.elapsedTime = 0
			end
	
			self.currentY = self.currentY + 1
			self.contadorIncremento = self.contadorIncremento + 1
			
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0
			self.coordenadaMatricialX = self.coordenadaMatricialX + 1
			
		end
		
	end
	
	
	function Character:moveUp(dt)
		
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 10
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 1
		end
		
		if (self.contadorIncremento<64) then
			if(self.elapsedTime > 0.15) then
				if (self.currentFrame < 12) then
					self.currentFrame = self.currentFrame + 1
				else
					self.currentFrame = 10
				end
				self.activeFrame = self.frames[self.currentFrame]
				self.elapsedTime = 0
			end
	
			self.currentY = self.currentY - 1
			self.contadorIncremento = self.contadorIncremento + 1
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0
			self.coordenadaMatricialX = self.coordenadaMatricialX - 1
		end
		
	end
	
	
	function Character:moveRight(dt)
	
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 7
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 1
		end
		
		if (self.contadorIncremento<64) then
			if(self.elapsedTime > 0.15) then
				if (self.currentFrame < 9) then
					self.currentFrame = self.currentFrame + 1
				else
					self.currentFrame = 7
				end
				self.activeFrame = self.frames[self.currentFrame]
				self.elapsedTime = 0
			end
	
			self.currentX = self.currentX + 1
			self.contadorIncremento = self.contadorIncremento + 1
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0
			self.coordenadaMatricialY = self.coordenadaMatricialY + 1
		end
		
	end
	
	
	function Character:moveLeft(dt)
	
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 4
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 1
		end
		
		if (self.contadorIncremento<64) then
			if(self.elapsedTime > 0.15) then
				if (self.currentFrame < 6) then
					self.currentFrame = self.currentFrame + 1
				else
					self.currentFrame = 4
				end
				self.activeFrame = self.frames[self.currentFrame]
				self.elapsedTime = 0
			end
	
			self.currentX = self.currentX - 1
			self.contadorIncremento = self.contadorIncremento + 1
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			charmap[self.coordenadaMatricialX][self.coordenadaMatricialY] = 0
			self.coordenadaMatricialY = self.coordenadaMatricialY - 1
		end
		
	end

	
	function Character:desenhar(imageFile, red, green, blue)
		love.graphics.setColor(red,green,blue,150)
		love.graphics.circle("fill", self.currentX+16, self.currentY+ 16, 20)
		love.graphics.setColor(255,255,255,255)
		love.graphics.draw(imageFile, self.activeFrame, self.currentX, self.currentY)
	end
	
return Character