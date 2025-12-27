--==================================================
-- Shark Bite Classic -
--==================================================

--// Serviços
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPack = game:GetService("StarterPack")

--// Player
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--==================================================
-- GUI Principal
--==================================================
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "HitboxGuiV4"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 240, 0, 480)  -- Aumentei um pouco para caber tudo bonito
frame.Position = UDim2.new(0, 30, 0, 300)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.ClipsDescendants = true

-- Título
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🦈 Hitbox Shark Bite"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22
title.LayoutOrder = 0

-- UIListLayout para organizar tudo automaticamente
local listLayout = Instance.new("UIListLayout", frame)
listLayout.Padding = UDim.new(0, 10)  -- Espaço entre os elementos
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.VerticalAlignment = Enum.VerticalAlignment.Top

-- Padding interno no frame
local padding = Instance.new("UIPadding", frame)
padding.PaddingTop = UDim.new(0, 10)
padding.PaddingLeft = UDim.new(0, 10)
padding.PaddingRight = UDim.new(0, 10)
padding.PaddingBottom = UDim.new(0, 10)

--==================================================
-- Função para criar botões (sem posição manual)
--==================================================
local function criarBotao(texto, layoutOrder, cor)
	local b = Instance.new("TextButton", frame)
	b.Size = UDim2.new(0.95, 0, 0, 35)
	b.Text = texto
	b.BackgroundColor3 = cor
	b.TextColor3 = Color3.new(1, 1, 1)
	b.Font = Enum.Font.SourceSansBold
	b.TextSize = 18
	b.BorderSizePixel = 0
	b.LayoutOrder = layoutOrder
	b.AutoButtonColor = false  -- opcional, pra não mudar cor ao hover
	return b
end

--==================================================
-- Criação dos Botões (na ordem desejada)
--==================================================
local toggleButton    = criarBotao("Ativar Hitbox", 1, Color3.fromRGB(0, 170, 0))

-- Botões + e - lado a lado (usando um Frame separado)
local sizeFrame = Instance.new("Frame", frame)
sizeFrame.Size = UDim2.new(0.95, 0, 0, 35)
sizeFrame.BackgroundTransparency = 1
sizeFrame.LayoutOrder = 2

local plusButton = Instance.new("TextButton", sizeFrame)
plusButton.Size = UDim2.new(0.48, 0, 1, 0)
plusButton.Position = UDim2.new(0, 0, 0, 0)
plusButton.Text = "+ Aumentar"
plusButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
plusButton.TextColor3 = Color3.new(1,1,1)
plusButton.Font = Enum.Font.SourceSansBold
plusButton.TextSize = 18
plusButton.BorderSizePixel = 0

local minusButton = Instance.new("TextButton", sizeFrame)
minusButton.Size = UDim2.new(0.48, 0, 1, 0)
minusButton.Position = UDim2.new(0.52, 0, 0, 0)
minusButton.Text = "- Diminuir"
minusButton.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
minusButton.TextColor3 = Color3.new(1,1,1)
minusButton.Font = Enum.Font.SourceSansBold
minusButton.TextSize = 18
minusButton.BorderSizePixel = 0

local espButton       = criarBotao("Ativar ESP Hitbox", 3, Color3.fromRGB(150, 0, 0))
local anchorButton    = criarBotao("Ativar Anchor Shark", 4, Color3.fromRGB(90, 90, 160))
local copyToolsButton = criarBotao("🛠️ Copiar Todas as Tools", 5, Color3.fromRGB(255, 140, 0))
local swimButton      = criarBotao("Ativar Swim", 6, Color3.fromRGB(0, 170, 255))

--==================================================
-- Input Boxes e Labels
--==================================================
local swimBox = Instance.new("TextBox", frame)
swimBox.Size = UDim2.new(0.95, 0, 0, 35)
swimBox.PlaceholderText = "Velocidade Swim (ex: 999)"
swimBox.Text = ""
swimBox.ClearTextOnFocus = false
swimBox.TextColor3 = Color3.new(1,1,1)
swimBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
swimBox.Font = Enum.Font.SourceSans
swimBox.TextSize = 16
swimBox.BorderSizePixel = 0
swimBox.LayoutOrder = 7

local swimLabel = Instance.new("TextLabel", frame)
swimLabel.Size = UDim2.new(0.95, 0, 0, 25)
swimLabel.Text = "🏊 Velocidade: 32"
swimLabel.TextColor3 = Color3.new(1,1,1)
swimLabel.BackgroundTransparency = 1
swimLabel.Font = Enum.Font.SourceSans
swimLabel.TextSize = 16
swimLabel.LayoutOrder = 8

local inputBox = Instance.new("TextBox", frame)
inputBox.Size = UDim2.new(0.95, 0, 0, 35)
inputBox.PlaceholderText = "Tamanho da Hitbox (ex: 10)"
inputBox.Text = ""
inputBox.TextColor3 = Color3.new(1,1,1)
inputBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
inputBox.Font = Enum.Font.SourceSans
inputBox.TextSize = 16
inputBox.BorderSizePixel = 0
inputBox.LayoutOrder = 9

local sizeLabel = Instance.new("TextLabel", frame)
sizeLabel.Size = UDim2.new(0.95, 0, 0, 25)
sizeLabel.Text = "📏 Tamanho: 1x"
sizeLabel.TextColor3 = Color3.new(1,1,1)
sizeLabel.BackgroundTransparency = 1
sizeLabel.Font = Enum.Font.SourceSans
sizeLabel.TextSize = 16
sizeLabel.LayoutOrder = 10

--==================================================
-- Variáveis e Funções
--==================================================
local hitboxAtivo = false
local espAtivo = false
local anchorAtivo = false
local currentScale = 1
local swimSpeedValue = 32
local swimAtivo = false
local normalSpeed = 16

local function atualizarLabel()
	sizeLabel.Text = "📏 Tamanho: " .. currentScale .. "x"
	swimLabel.Text = "🏊 Velocidade: " .. swimSpeedValue
end

--==================================================
-- Função Copiar Todas as Tools
--==================================================
copyToolsButton.MouseButton1Click:Connect(function()
	copyToolsButton.Text = "🔄 Procurando em tudo..."
	copyToolsButton.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
	
	local count = 0
	local backpack = player:WaitForChild("Backpack")
	
	local lugares = {
		workspace, ReplicatedStorage, StarterPack,
		game:GetService("StarterGear"), Lighting,
		game:GetService("ServerStorage"), game:GetService("StarterGui"), game
	}
	
	for _, lugar in pairs(lugares) do
		if lugar then
			pcall(function()
				for _, obj in pairs(lugar:GetDescendants()) do
					if obj:IsA("Tool") then
						local clone = obj:Clone()
						clone.Parent = backpack
						count += 1
					end
				end
			end)
		end
	end
	
	for _, plr in pairs(Players:GetPlayers()) do
		if plr:FindFirstChild("Backpack") then
			for _, tool in pairs(plr.Backpack:GetChildren()) do
				if tool:IsA("Tool") then
					local clone = tool:Clone()
					clone.Parent = backpack
					count += 1
				end
			end
		end
	end
	
	copyToolsButton.Text = "✅ " .. count .. " Tools Copiadas!"
	copyToolsButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	task.wait(4)
	copyToolsButton.Text = "🛠️ Copiar Todas as Tools"
	copyToolsButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
end)

--==================================================
-- Funções do Hitbox, Anchor, Swim (mantidas iguais)
--==================================================
local function alterarHitbox(scale)
	local container = workspace:FindFirstChild("Sharks") or workspace
	for _, obj in pairs(container:GetDescendants()) do
		if obj:IsA("BasePart") then
			local n = obj.Name:lower()
			if n == "torso" or n == "body" or n == "humanoidrootpart" then
				obj.Size = Vector3.new(2, 2, 2) * scale
				obj.CanCollide = false
				obj.Transparency = espAtivo and 0.5 or 1
				obj.Material = espAtivo and Enum.Material.Neon or Enum.Material.SmoothPlastic
				obj.Color = espAtivo and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(163, 162, 165)
			end
		end
	end
end

local function anchorSharks(state)
	local container = workspace:FindFirstChild("Sharks") or workspace
	for _, obj in pairs(container:GetDescendants()) do
		if obj:IsA("BasePart") then
			local n = obj.Name:lower()
			if n == "torso" or n == "body" or n == "humanoidrootpart" then
				obj.Anchored = state
			end
		end
	end
end

local function aplicarSwim(humanoid)
	if not humanoid then return end
	if swimAtivo and humanoid:GetState() == Enum.HumanoidStateType.Swimming then
		humanoid.WalkSpeed = swimSpeedValue
	else
		humanoid.WalkSpeed = normalSpeed
	end
end

local function onCharacterAdded(char)
	local humanoid = char:WaitForChild("Humanoid")
	task.spawn(function()
		while humanoid and humanoid.Parent do
			aplicarSwim(humanoid)
			task.wait(0.1)
		end
	end)
	humanoid.StateChanged:Connect(aplicarSwim)
end

if player.Character then onCharacterAdded(player.Character) end
player.CharacterAdded:Connect(onCharacterAdded)

--==================================================
-- Eventos dos Botões e Inputs
--==================================================
swimBox.FocusLost:Connect(function(enter)
	if enter then
		local v = tonumber(swimBox.Text)
		if v and v >= 1 and v <= 99999 then
			swimSpeedValue = v
			atualizarLabel()
			swimBox.Text = ""
		else
			swimBox.Text = ""
		end
	end
end)

swimButton.MouseButton1Click:Connect(function()
	swimAtivo = not swimAtivo
	swimButton.Text = swimAtivo and "Desativar Swim" or "Ativar Swim"
	swimButton.BackgroundColor3 = swimAtivo and Color3.fromRGB(0, 100, 255) or Color3.fromRGB(0, 170, 255)
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		aplicarSwim(player.Character.Humanoid)
	end
end)

toggleButton.MouseButton1Click:Connect(function()
	hitboxAtivo = not hitboxAtivo
	toggleButton.Text = hitboxAtivo and "Desativar Hitbox" or "Ativar Hitbox"
	toggleButton.BackgroundColor3 = hitboxAtivo and Color3.fromRGB(170, 0, 0) or Color3.fromRGB(0, 170, 0)
	alterarHitbox(hitboxAtivo and currentScale or 1)
end)

espButton.MouseButton1Click:Connect(function()
	espAtivo = not espAtivo
	espButton.Text = espAtivo and "Desativar ESP" or "Ativar ESP Hitbox"
	if hitboxAtivo then alterarHitbox(currentScale) end
end)

anchorButton.MouseButton1Click:Connect(function()
	anchorAtivo = not anchorAtivo
	anchorButton.Text = anchorAtivo and "Desativar Anchor Shark" or "Ativar Anchor Shark"
	anchorSharks(anchorAtivo)
end)

plusButton.MouseButton1Click:Connect(function()
	currentScale += 1
	atualizarLabel()
	if hitboxAtivo then alterarHitbox(currentScale) end
end)

minusButton.MouseButton1Click:Connect(function()
	currentScale = math.max(1, currentScale - 1)
	atualizarLabel()
	if hitboxAtivo then alterarHitbox(currentScale) end
end)

inputBox.FocusLost:Connect(function(enter)
	if enter then
		local valor = tonumber(inputBox.Text)
		if valor and valor >= 1 and valor <= 9999 then
			currentScale = valor
			atualizarLabel()
			if hitboxAtivo then alterarHitbox(currentScale) end
			inputBox.Text = ""
		else
			inputBox.Text = ""
		end
	end
end)

--==================================================
-- Drag da GUI
--==================================================
local dragging, dragStart, startPos
frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Pronto! GUI linda, organizada e sem espaços vazios 💪🦈
