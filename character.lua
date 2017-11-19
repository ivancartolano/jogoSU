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

	--bitmap = {
	--	{0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	--	{1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,1},
	--	{3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,1},
	--	{4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,0,1},
	--	{5,0,0,1,1,1,1,1,1,1,0,0,1,1,1,0,1,1,1,1},
	--	{6,1,1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0},
	--	{7,0,0,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0},
	--	{8,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0},
	--	{9,0,0,1,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0},
	--	{0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0},
	--	}
	bitmap = {
		{2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		{1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1},
		{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,0,0,1},
		{1,0,0,0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0,1},
		{1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,0,0,0,1},
		{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
		{1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1},
		{2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
		}
		
	costmap = {
		{28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9},
		{27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8},
		{26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7},
		{25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6},
		{24,23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5},
		{23,22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4},
		{22,21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3},
		{21,20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2},
		{20,19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1},
		{19,18,17,16,15,14,13,12,11,10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0},
		}
		
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
	
	function Character:carregar(mapaX,mapaY, coorMatricialX, coorMatricialY, initialFrame, sprites,imageFile, onome)
		
		self.frames = sprites
		self.currentFrame = initialFrame
		self.activeFrame = self.frames[self.currentFrame]
		self.currentX = mapaX
		self.currentY = mapaY
		self.coordenadaMatricialX= coorMatricialX
		self.coordenadaMatricialY = coorMatricialY
		self.nome = onome
		
		--self.elapsedTime = 0
		
	end
	
	function Character:movimento(dt)
	self.contador = self.contador +1
--if (self.contador < 650) then
	print(self.emMovimento)
	--print(self.nome.. ' '.. self.contador)
	if (not(self.emMovimento)) then
		movimentoPossivel = {}
		
		if (self.coordenadaMatricialX<10) then
			if (self.bitmap[self.coordenadaMatricialX+1][self.coordenadaMatricialY ] == 0)then
				table.insert(movimentoPossivel, 'down')
			end
		end
		if (self.coordenadaMatricialX>1) then
			if (self.bitmap[self.coordenadaMatricialX- 1][self.coordenadaMatricialY] == 0) then
				table.insert(movimentoPossivel, 'up')
			end
		end
		if (self.coordenadaMatricialY<20) then
			if (self.bitmap[self.coordenadaMatricialX] [self.coordenadaMatricialY + 1]== 0) then
				table.insert(movimentoPossivel, 'right')
			end
		end
		if (self.coordenadaMatricialY>1) then
			if (self.bitmap[self.coordenadaMatricialX][self.coordenadaMatricialY - 1] == 0) then
				table.insert(movimentoPossivel, 'left')
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
	
	print(self.nome..' x= '.. self.coordenadaMatricialX.. ' y= '.. self.coordenadaMatricialY)
	print('bitmap['.. self.coordenadaMatricialX.. ']['.. self.coordenadaMatricialY.. '] = '.. self.bitmap[self.coordenadaMatricialX][self.coordenadaMatricialY])
	print("....")
	print("  ")
	self:acao(dt)
--end
end 

	function Character:movimentoObjetivo(dt)
	self.contador = self.contador +1
--if (self.contador < 650) then
	print(self.emMovimento)
	--print(self.nome.. ' '.. self.contador)
	if (not(self.emMovimento)) then
		movimentoPossivel = {}
		
		local goalX= 10
		local goalY= 20
		
		--local left = false
		--local right = false
		--local up = false
		--local down = false
		
		
		--local downIndex = 0
		--local upIndex = 0
		--local leftIndex = 0
		--local rightIndex = 0
		
		local minimo = 999
		
		if (self.coordenadaMatricialX<10) then
			if (self.bitmap[self.coordenadaMatricialX+1][self.coordenadaMatricialY ] == 0)then
				table.insert(movimentoPossivel, 'down')
				--down = true
				--downIndex = downIndex +1
			end
		end
		if (self.coordenadaMatricialX>1) then
			if (self.bitmap[self.coordenadaMatricialX- 1][self.coordenadaMatricialY] == 0) then
				table.insert(movimentoPossivel, 'up')
				--up = true
				--upIndex = upIndex + 1
				--downIndex = downIndex +1
			end
		end
		if (self.coordenadaMatricialY<20) then
			if (self.bitmap[self.coordenadaMatricialX] [self.coordenadaMatricialY + 1]== 0) then
				table.insert(movimentoPossivel, 'right')
				--right = true
				--rightIndex = rightIndex +1
				--upIndex = upIndex + 1
				--downIndex = downIndex +1
			end
		end
		if (self.coordenadaMatricialY>1) then
			if (self.bitmap[self.coordenadaMatricialX][self.coordenadaMatricialY - 1] == 0) then
				table.insert(movimentoPossivel, 'left')
				--left = true 
				--leftIndex = leftIndex + 1
				--rightIndex = rightIndex +1
				--upIndex = upIndex + 1
				--downIndex = downIndex +1
			end
		end 
		
		--if (up and down) then
		--	if (self.coordenadaMatricialX < goalX) then
		--		table.remove(movimentoPossivel, upIndex)				
		--	elseif (self.coordenadaMatricialX > goalX) then
		--		table.remove(movimentoPossivel, downIndex)
		--	end
		--end
		
		--if (right and left) then
		--	if (self.coordenadaMatricialY < goalY) then
		--		table.remove(movimentoPossivel, leftIndex)				
		--	elseif (self.coordenadaMatricialY > goalY) then
		--		table.remove(movimentoPossivel, rightIndex)
		--	end
		--end
		
		
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
	
	print(self.nome..' x= '.. self.coordenadaMatricialX.. ' y= '.. self.coordenadaMatricialY)
	print('bitmap['.. self.coordenadaMatricialX.. ']['.. self.coordenadaMatricialY.. '] = '.. self.bitmap[self.coordenadaMatricialX][self.coordenadaMatricialY])
	print("....")
	print("  ")
	self:acao(dt)
--end
end 

	function Character:moveDown(dt)
		print('moveDown'.. self.contadorIncremento)
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 1
		end
		
		if (self.contadorIncremento<65) then
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
			
			--print(self.currentY) 
			--print(self.contadorIncremento)
		
		else
			self.emMovimento = false
			self.contadorIncremento = 0
			self.coordenadaMatricialX = self.coordenadaMatricialX + 1
			
			--print(self.emMovimento)
			--print(self.contadorIncremento)
			--print(self.coordenadaMatricialY)
			
		end
		
	end
	
	
	function Character:moveUp(dt)
		print('moveUp'.. self.contadorIncremento)
		
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 10
		end
		
		if (self.contadorIncremento<65) then
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
			self.coordenadaMatricialX = self.coordenadaMatricialX - 1
		end
		
	end
	
	
	function Character:moveRight(dt)
		print('moveRight'.. self.contadorIncremento)
	
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 7
		end
		
		if (self.contadorIncremento<65) then
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
			self.coordenadaMatricialY = self.coordenadaMatricialY + 1
		end
		
	end
	
	
	function Character:moveLeft(dt)
		print('moveLeft '.. self.contadorIncremento)
	
		self.elapsedTime = self.elapsedTime +dt
		self.emMovimento = true
		
		if (self.contadorIncremento == 0) then
			self.currentFrame = 4
		end
		
		if (self.contadorIncremento<65) then
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
			self.coordenadaMatricialY = self.coordenadaMatricialY - 1
		end
		
	end
	
	--function character:atualizar()
	
	--end
	
	function Character:desenhar(imageFile)
		love.graphics.setColor(0,50,255,150)
		love.graphics.circle("fill", self.currentX+16, self.currentY+ 16, 20)
		love.graphics.setColor(255,255,255,255)
		love.graphics.draw(imageFile, self.activeFrame, self.currentX, self.currentY)
	end
	
return Character