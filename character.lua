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

	bitmap = {
		{0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,1},
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
		
	function Character:stand(dt)
		emMovimento = false
	end	
		
	
	--acao = {move = stand}
		
	function Character:new(o)
		o =  {}
		setmetatable(o,self)
		self.__index = self
		return o
	end
	
	function Character:carregar(mapaX,mapaY,initialFrame, sprites,imageFile)
		
		self.frames = sprites
		
		self.currentFrame = initialFrame
		self.activeFrame = self.frames[self.currentFrame]
		self.currentX = mapaX
		self.currentY = mapaY
		--self.elapsedTime = 0
		
	end
	
	function Character:movimento(dt)
	self.contador = self.contador +1
--if (self.contador < 100) then
	print(self.emMovimento)
	if (not(self.emMovimento)) then
		movimentoPossivel = {}
		
		if (self.coordenadaMatricialY<10) then
			if (self.bitmap[self.coordenadaMatricialY +1][self.coordenadaMatricialX] == 0)then
				--print(self.bitmap[self.coordenadaMatricialX][self.coordenadaMatricialY + 1] == 0)
				--print('x= '.. self.coordenadaMatricialX.. 'y= '.. self.coordenadaMatricialY)
				--print('bitmap['.. self.coordenadaMatricialX.. ']['.. self.coordenadaMatricialY.. '] = '.. self.bitmap[self.coordenadaMatricialX][self.coordenadaMatricialY])
				table.insert(movimentoPossivel, 'down')
			end
		end
		if (self.coordenadaMatricialY>1) then
			if (self.bitmap[self.coordenadaMatricialY - 1][self.coordenadaMatricialX] == 0) then
				table.insert(movimentoPossivel, 'up')
			end
		end
		if (self.coordenadaMatricialX<20) then
			if (self.bitmap[self.coordenadaMatricialY][self.coordenadaMatricialX + 1] == 0) then
				table.insert(movimentoPossivel, 'right')
			end
		end
		if (self.coordenadaMatricialX>1) then
			if (self.bitmap[self.coordenadaMatricialY][self.coordenadaMatricialX - 1] == 0) then
				table.insert(movimentoPossivel, 'left')
			end
		end 
		
		movimentoEscolhido = movimentoPossivel[math.random(#movimentoPossivel)]
		
		if movimentoEscolhido == 'down' then
			self.acao = self.moveDown
		elseif (movimentoEscolhido == 'up') then
			--self.acao = self.moveUp
			--acao = {move = self.moveUp}
			self.acao = self.moveUp
		elseif movimentoEscolhido == 'right' then
			--acao = self.moveRight
			self.acao = self.moveRight
		elseif movimentoEscolhido == 'left' then
			--acao = {move = self:moveLeft(dt)}
			self.acao = self.moveLeft
		else
			self.acao = self.stand
		end
		
	end
	print('x= '.. self.coordenadaMatricialX.. 'y= '.. self.coordenadaMatricialY)
	self:acao(dt)
--end
end 

	

	function Character:moveDown(dt)
		print('moveDown'.. self.contadorIncremento)
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento<65) then
			if(self.elapsedTime > 0.20) then
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
			
			--print(self.currentY) 
			--print(self.contadorIncremento)
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			self.coordenadaMatricialY = self.coordenadaMatricialY + 1
			
			--print(self.emMovimento)
			--print(self.contadorIncremento)
			--print(self.coordenadaMatricialY)
			
		end
		
	end
	
	
	function Character:moveUp(dt)
		print('moveUp'.. self.contadorIncremento)
		
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento<65) then
			if(self.elapsedTime > 0.20) then
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
			self.coordenadaMatricialY = self.coordenadaMatricialY - 1
		end
		
	end
	
	
	function Character:moveRight(dt)
		print('moveRight'.. self.contadorIncremento)
	
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento<65) then
			if(self.elapsedTime > 0.20) then
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
			self.coordenadaMatricialX = self.coordenadaMatricialX + 1
		end
		
	end
	
	
	function Character:moveLeft(dt)
		print('moveLeft '.. self.contadorIncremento)
	
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento<65) then
			if(self.elapsedTime > 0.20) then
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
			self.coordenadaMatricialX = self.coordenadaMatricialX - 1
		end
		
	end
	
	--function character:atualizar()
	
	--end
	
	function Character:desenhar(imageFile)
		love.graphics.draw(imageFile, self.activeFrame, self.currentX, self.currentY)
	end
	
return Character