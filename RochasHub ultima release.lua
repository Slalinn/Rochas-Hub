-- Rochas Hub - Popup inspirado na imagem, sidebar escura, header retangular, popup translúcido e menor, SEM BUG DE MINIMIZAR

local MAX = 5000
local plr = game.Players.LocalPlayer

if plr.PlayerGui:FindFirstChild("RochasHub") then
	plr.PlayerGui.RochasHub:Destroy()
end

local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "RochasHub"

-- Popup: Transparente, borda clara, layout parecido com a imagem
local defaultMainSize = UDim2.new(0, 410, 0, 240)
local defaultMainPosition = UDim2.new(0.5, -205, 0.5, -120)
local minimizedMainSize = UDim2.new(0, 410, 0, 32)
local minimizedMainPosition = defaultMainPosition -- mantém centralizado

local main = Instance.new("Frame", gui)
main.Size = defaultMainSize
main.Position = defaultMainPosition
main.BackgroundColor3 = Color3.fromRGB(25,25,32)
main.BackgroundTransparency = 0.17
main.BorderColor3 = Color3.fromRGB(180,180,180)
main.BorderSizePixel = 1
main.ClipsDescendants = true
main.Active = true

local mainCorner = Instance.new("UICorner", main)
mainCorner.CornerRadius = UDim.new(0, 7)

local header = Instance.new("Frame", main)
header.BackgroundColor3 = Color3.fromRGB(24,24,28)
header.BackgroundTransparency = 0.12
header.Size = UDim2.new(1,0,0,32)
header.Position = UDim2.new(0,0,0,0)
header.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Text = "Rochas Hub"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 15
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 16, 0, 0)
title.TextXAlignment = Enum.TextXAlignment.Left

local minBtn = Instance.new("TextButton", header)
minBtn.Size, minBtn.Position = UDim2.new(0, 26, 0, 32), UDim2.new(1, -52, 0, 0)
minBtn.BackgroundColor3 = Color3.fromRGB(24,24,28)
minBtn.BackgroundTransparency = 1
minBtn.Text, minBtn.AutoButtonColor = "_", true
minBtn.Font, minBtn.TextColor3, minBtn.TextSize, minBtn.ZIndex, minBtn.BorderSizePixel = Enum.Font.GothamBold, Color3.fromRGB(180,180,180), 21, 4, 0

local close = Instance.new("TextButton", header)
close.Size, close.Position = UDim2.new(0, 26, 0, 32), UDim2.new(1, -26, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(24,24,28)
close.BackgroundTransparency = 1
close.Text, close.AutoButtonColor = "✕", true
close.Font, close.TextColor3, close.TextSize, close.ZIndex, close.BorderSizePixel = Enum.Font.GothamBold, Color3.fromRGB(240,80,80), 16, 4, 0
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Sidebar escura + ícones
local sidebar = Instance.new("Frame", main)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
sidebar.BackgroundTransparency = 0.08
sidebar.Size = UDim2.new(0, 110, 1, -32)
sidebar.Position = UDim2.new(0, 0, 0, 32)
sidebar.BorderSizePixel = 0
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 5)

local sections = { "Coisas Principais", "Dandys World" }
local icons = { "⭐", "🌎" }
local sideButtons, pages = {}, {}
local selectedSection = "Coisas Principais"

for i, v in ipairs(sections) do
	local btn = Instance.new("TextButton", sidebar)
	btn.Size = UDim2.new(1, 0, 0, 32)
	btn.Position = UDim2.new(0, 0, 0, (i-1)*34)
	btn.Text = "  "..icons[i].."  "..v
	btn.Font = Enum.Font.GothamMedium
	btn.TextColor3 = v==selectedSection and Color3.fromRGB(255,255,255) or Color3.fromRGB(185,185,200)
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.BackgroundTransparency = v==selectedSection and 0.09 or 1
	btn.BackgroundColor3 = Color3.fromRGB(40, 42, 53)
	btn.AutoButtonColor, btn.BorderSizePixel, btn.ZIndex = true, 0, 2
	sideButtons[v] = btn
end

local function createStyledSlider(page, y, labelText, default, setter, max, editable)
	local frame = Instance.new("Frame", page)
	frame.Position = UDim2.new(0, 26, 0, y)
	frame.Size = UDim2.new(0, 190, 0, 18)
	frame.BackgroundTransparency = 1

	local bar = Instance.new("Frame", frame)
	bar.Position = UDim2.new(0, 0, 0, 4)
	bar.Size = UDim2.new(1, 0, 0, 9)
	bar.BackgroundColor3 = Color3.fromRGB(32, 40, 46)
	bar.BorderSizePixel = 0
	bar.ZIndex = 1
	local barCorner = Instance.new("UICorner", bar)
	barCorner.CornerRadius = UDim.new(1, 0)

	local fill = Instance.new("Frame", bar)
	fill.BackgroundColor3 = Color3.fromRGB(26, 145, 255)
	fill.Size = UDim2.new(default/max, 0, 1, 0)
	fill.Position = UDim2.new(0, 0, 0, 0)
	fill.BorderSizePixel = 0
	fill.ZIndex = 2
	local fillCorner = Instance.new("UICorner", fill)
	fillCorner.CornerRadius = UDim.new(1, 0)

	local circle = Instance.new("Frame", bar)
	circle.Size = UDim2.new(0, 32, 1, 0)
	circle.Position = UDim2.new(default/max, -32, 0, 0)
	circle.BackgroundColor3 = Color3.fromRGB(35, 160, 255)
	circle.BorderSizePixel = 0
	circle.ZIndex = 3
	local circCorner = Instance.new("UICorner", circle)
	circCorner.CornerRadius = UDim.new(1, 0)

	local label = Instance.new("TextBox", circle)
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Text = tostring(default).." "..labelText
	label.TextColor3 = Color3.fromRGB(230, 240, 255)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 12
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.ClearTextOnFocus = editable and false or true
	label.TextEditable = editable
	label.ZIndex = 4

	local dragging = false
	bar.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
	end)
	bar.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
	end)
	bar.MouseMoved:Connect(function(x, _)
		if dragging then
			local abs, w = bar.AbsolutePosition.X, bar.AbsoluteSize.X
			local n = math.clamp(math.floor(((x-abs)/w)*max+0.5),1,max)
			fill.Size = UDim2.new(n/max,0,1,0)
			circle.Position = UDim2.new(n/max, -32, 0, 0)
			label.Text = tostring(n).." "..labelText
			setter(n)
		end
	end)
	label.FocusLost:Connect(function()
		local t = label.Text:match("^(%d+)")
		local n = tonumber(t) or default
		n = math.clamp(n,1,max)
		fill.Size = UDim2.new(n/max,0,1,0)
		circle.Position = UDim2.new(n/max, -32, 0, 0)
		label.Text = tostring(n).." "..labelText
		setter(n)
	end)
	fill.Size = UDim2.new(default/max,0,1,0)
	circle.Position = UDim2.new(default/max, -32, 0, 0)
	label.Text = tostring(default).." "..labelText

	return label
end

-- Coisas Principais: Fullbright, Walkspeed, JumpSize, ESP Player
local function createCoisasPrincipais()
	if pages["Coisas Principais"] then return end
	local page = Instance.new("Frame", main)
	page.Name = "Coisas Principais"
	page.Size = UDim2.new(1, -110, 1, -32)
	page.Position = UDim2.new(0, 110, 0, 32)
	page.BackgroundTransparency = 1
	page.Visible = false
	page.ZIndex = 3

	local sectionTitle = Instance.new("TextLabel", page)
	sectionTitle.Text = "| Coisas Principais"
	sectionTitle.Size = UDim2.new(1, 0, 0, 20)
	sectionTitle.Position = UDim2.new(0, 10, 0, 7)
	sectionTitle.Font = Enum.Font.GothamSemibold
	sectionTitle.TextColor3 = Color3.fromRGB(255,255,255)
	sectionTitle.TextSize = 14
	sectionTitle.BackgroundTransparency = 1
	sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

	local info = Instance.new("TextLabel", page)
	info.Text = "Deixa o jogo clarão (FullBright)!"
	info.Size = UDim2.new(1, -20, 0, 13)
	info.Position = UDim2.new(0, 10, 0, 28)
	info.Font = Enum.Font.Gotham
	info.TextColor3 = Color3.fromRGB(230,230,235)
	info.TextSize = 11
	info.BackgroundTransparency = 1
	info.TextXAlignment = Enum.TextXAlignment.Left

	local toggleFB = Instance.new("TextButton", page)
	toggleFB.Size = UDim2.new(0,87,0,22)
	toggleFB.Position = UDim2.new(0,10,0,46)
	toggleFB.BackgroundColor3 = Color3.fromRGB(255,200,0)
	toggleFB.Text = "Fullbright"
	toggleFB.TextSize = 12
	toggleFB.TextColor3 = Color3.fromRGB(40,40,40)
	toggleFB.Font = Enum.Font.GothamBold
	toggleFB.AutoButtonColor = true
	toggleFB.BorderSizePixel = 0
	Instance.new("UICorner", toggleFB).CornerRadius = UDim.new(0, 7)

	local fbActive = false
	local oldLighting = {}

	toggleFB.MouseButton1Click:Connect(function()
		local lighting = game:GetService("Lighting")
		if not fbActive then
			oldLighting.Brightness = lighting.Brightness
			oldLighting.ClockTime = lighting.ClockTime
			oldLighting.FogEnd = lighting.FogEnd
			oldLighting.GlobalShadows = lighting.GlobalShadows
			oldLighting.OutdoorAmbient = lighting.OutdoorAmbient
			oldLighting.Ambient = lighting.Ambient
			lighting.Brightness = 3
			lighting.ClockTime = 12
			lighting.FogEnd = 100000
			lighting.GlobalShadows = false
			lighting.OutdoorAmbient = Color3.new(1, 1, 1)
			lighting.Ambient = Color3.new(1, 1, 1)
			fbActive = true
			toggleFB.Text = "Desligar"
		else
			for k,v in pairs(oldLighting) do
				lighting[k] = v
			end
			fbActive = false
			toggleFB.Text = "Fullbright"
		end
	end)

	local char,hum = plr.Character or plr.CharacterAdded:Wait(),nil
	hum = char:WaitForChild("Humanoid")
	plr.CharacterAdded:Connect(function(c) char=c; hum=char:WaitForChild("Humanoid") end)
	local function setSpeed(v) if hum then hum.WalkSpeed = v end end
	local function setJump(v) if hum then hum.JumpPower = v end end

	local wsLabel = Instance.new("TextLabel", page)
	wsLabel.Text = "Walkspeed"
	wsLabel.Size = UDim2.new(0, 110, 0, 13)
	wsLabel.Position = UDim2.new(0, 10, 0, 76)
	wsLabel.Font = Enum.Font.Gotham
	wsLabel.TextColor3 = Color3.fromRGB(230,230,240)
	wsLabel.TextSize = 11
	wsLabel.BackgroundTransparency = 1
	wsLabel.TextXAlignment = Enum.TextXAlignment.Left

	createStyledSlider(page, 92, "Speed", 16, setSpeed, MAX, true)

	local jumpLabel = Instance.new("TextLabel", page)
	jumpLabel.Text = "JumpSize"
	jumpLabel.Size = UDim2.new(0, 110, 0, 13)
	jumpLabel.Position = UDim2.new(0, 10, 0, 122)
	jumpLabel.Font = Enum.Font.Gotham
	jumpLabel.TextColor3 = Color3.fromRGB(230,230,240)
	jumpLabel.TextSize = 11
	jumpLabel.BackgroundTransparency = 1
	jumpLabel.TextXAlignment = Enum.TextXAlignment.Left

	createStyledSlider(page, 138, "Jump", 50, setJump, MAX, true)

	local espEnabled = false
	local espBoxes = {}
	local function removeEsp()
		for _,v in pairs(espBoxes) do if v and v.Parent then v:Destroy() end end
		espBoxes = {}
	end
	local function createEspForPlayer(player)
		if player == plr then return end
		local char = player.Character
		if not char then return end
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
		local box = Instance.new("BoxHandleAdornment")
		box.Adornee = hrp
		box.AlwaysOnTop = true
		box.ZIndex = 10
		box.Size = Vector3.new(4,6,2)
		box.Color3 = Color3.fromRGB(0,200,255)
		box.Transparency = 0.1
		box.Parent = workspace
		box.Name = "[ESP]"
		espBoxes[player] = box
	end
	local function refreshEsp()
		removeEsp()
		for _,player in ipairs(game.Players:GetPlayers()) do
			if player ~= plr and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				createEspForPlayer(player)
			end
		end
	end

	local toggleESP = Instance.new("TextButton", page)
	toggleESP.Size = UDim2.new(0,110,0,22)
	toggleESP.Position = UDim2.new(0,10,0,170)
	toggleESP.BackgroundColor3 = Color3.fromRGB(0,200,255)
	toggleESP.Text = "ESP Jogadores"
	toggleESP.TextSize = 12
	toggleESP.TextColor3 = Color3.fromRGB(255,255,255)
	toggleESP.Font = Enum.Font.GothamBold
	toggleESP.AutoButtonColor = true
	toggleESP.BorderSizePixel = 0
	Instance.new("UICorner", toggleESP).CornerRadius = UDim.new(0, 7)

	toggleESP.MouseButton1Click:Connect(function()
		espEnabled = not espEnabled
		if espEnabled then
			toggleESP.Text = "Desligar ESP"
			refreshEsp()
		else
			toggleESP.Text = "ESP Jogadores"
			removeEsp()
		end
	end)
	game.Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function()
			if espEnabled then wait(1) createEspForPlayer(player) end
		end)
	end)
	game.Players.PlayerRemoving:Connect(function(player)
		if espBoxes[player] then espBoxes[player]:Destroy() espBoxes[player] = nil end
	end)
	game:GetService("RunService").RenderStepped:Connect(function()
		if not espEnabled then return end
		for _,player in ipairs(game.Players:GetPlayers()) do
			if player ~= plr and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				if not espBoxes[player] then
					createEspForPlayer(player)
				else
					local box = espBoxes[player]
					box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
				end
			elseif espBoxes[player] then
				espBoxes[player]:Destroy()
				espBoxes[player] = nil
			end
		end
	end)

	pages["Coisas Principais"] = page
end

-- Dandys World (igual antes)
local function createDandysWorld()
	if pages["Dandys World"] then return end
	local page = Instance.new("Frame", main)
	page.Name = "Dandys World"
	page.Size = UDim2.new(1, -110, 1, -32)
	page.Position = UDim2.new(0, 110, 0, 32)
	page.BackgroundTransparency = 1
	page.Visible = false
	page.ZIndex = 3

	local sectionTitle = Instance.new("TextLabel", page)
	sectionTitle.Text = "| Dandys World"
	sectionTitle.Size = UDim2.new(1, 0, 0, 20)
	sectionTitle.Position = UDim2.new(0, 10, 0, 7)
	sectionTitle.Font = Enum.Font.GothamSemibold
	sectionTitle.TextColor3 = Color3.fromRGB(255,255,255)
	sectionTitle.TextSize = 14
	sectionTitle.BackgroundTransparency = 1
	sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

	local subLabel = Instance.new("TextLabel", page)
	subLabel.Text = "Funções exclusivas para Dandys World"
	subLabel.Size = UDim2.new(1, -20, 0, 13)
	subLabel.Position = UDim2.new(0, 10, 0, 28)
	subLabel.Font = Enum.Font.Gotham
	subLabel.TextColor3 = Color3.fromRGB(200,220,255)
	subLabel.TextSize = 11
	subLabel.BackgroundTransparency = 1
	subLabel.TextXAlignment = Enum.TextXAlignment.Left

	local wsLabel = Instance.new("TextLabel", page)
	wsLabel.Text = "Walkspeed Dandys"
	wsLabel.Size = UDim2.new(0, 120, 0, 13)
	wsLabel.Position = UDim2.new(0, 10, 0, 45)
	wsLabel.Font = Enum.Font.Gotham
	wsLabel.TextColor3 = Color3.fromRGB(230,230,240)
	wsLabel.TextSize = 11
	wsLabel.BackgroundTransparency = 1
	wsLabel.TextXAlignment = Enum.TextXAlignment.Left

	local wsLoop, wsConnection = nil, nil
	local function setDandysSpeed(v)
		local function applySpeed()
			local char = plr.Character
			if not char then return end
			for _,folderName in ipairs({"playerValues","PlayerValues","Values","Stats"}) do
				local folder = char:FindFirstChild(folderName) or workspace:FindFirstChild(folderName)
				if folder then
					for _,valName in ipairs({"WalkSpeed","Speed","walkspeed","speed"}) do
						local val = folder:FindFirstChild(valName)
						if val and val:IsA("NumberValue") then
							val.Value = v
						end
					end
				end
			end
			if char:GetAttribute("WalkSpeed") ~= nil then
				char:SetAttribute("WalkSpeed", v)
			elseif char:GetAttribute("Speed") ~= nil then
				char:SetAttribute("Speed", v)
			end
			for _,obj in ipairs(char:GetChildren()) do
				if obj:IsA("NumberValue") and (obj.Name:lower():find("speed") or obj.Name:lower():find("walk")) then
					obj.Value = v
				end
			end
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then
				pcall(function() hum.WalkSpeed = v end)
			end
		end
		if wsLoop then wsLoop:Disconnect() end
		wsLoop = game:GetService("RunService").RenderStepped:Connect(applySpeed)
		if wsConnection then wsConnection:Disconnect() end
		wsConnection = plr.CharacterAdded:Connect(function()
			if wsLoop then wsLoop:Disconnect() end
			wsLoop = game:GetService("RunService").RenderStepped:Connect(applySpeed)
		end)
	end
	createStyledSlider(page, 60, "Dandys", 16, setDandysSpeed, MAX, true)

	-- ESP Twisteds
	local espTwistedEnabled = false
	local espTwistedBoxes = {}
	local function removeTwistedEsp()
		for _,v in pairs(espTwistedBoxes) do if v and v.Parent then v:Destroy() end end
		espTwistedBoxes = {}
	end
	local function isTwistedModel(model)
		return model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") and not game.Players:GetPlayerFromCharacter(model)
	end
	local function createEspForTwisted(twisted)
		if espTwistedBoxes[twisted] then return end
		local hrp = twisted:FindFirstChild("HumanoidRootPart")
		if not hrp then return end
		local box = Instance.new("BoxHandleAdornment")
		box.Adornee = hrp
		box.AlwaysOnTop = true
		box.ZIndex = 10
		box.Size = Vector3.new(4,6,2)
		box.Color3 = Color3.fromRGB(200,90,255)
		box.Transparency = 0.1
		box.Parent = workspace
		box.Name = "[ESP-Twisted]"
		espTwistedBoxes[twisted] = box
	end

	local toggleTwisted = Instance.new("TextButton", page)
	toggleTwisted.Size = UDim2.new(0,110,0,22)
	toggleTwisted.Position = UDim2.new(0,10,0,95)
	toggleTwisted.BackgroundColor3 = Color3.fromRGB(200,90,255)
	toggleTwisted.Text = "ESP Twisteds"
	toggleTwisted.TextSize = 12
	toggleTwisted.TextColor3 = Color3.fromRGB(255,255,255)
	toggleTwisted.Font = Enum.Font.GothamBold
	toggleTwisted.AutoButtonColor = true
	toggleTwisted.BorderSizePixel = 0
	Instance.new("UICorner", toggleTwisted).CornerRadius = UDim.new(0, 7)

	toggleTwisted.MouseButton1Click:Connect(function()
		espTwistedEnabled = not espTwistedEnabled
		if espTwistedEnabled then
			toggleTwisted.Text = "Desligar Twisted"
		else
			toggleTwisted.Text = "ESP Twisteds"
			removeTwistedEsp()
		end
	end)
	game:GetService("RunService").RenderStepped:Connect(function()
		if not espTwistedEnabled then return end
		for twisted,box in pairs(espTwistedBoxes) do
			if not twisted.Parent or not isTwistedModel(twisted) then box:Destroy() espTwistedBoxes[twisted] = nil end
		end
		for _,obj in ipairs(workspace:GetDescendants()) do
			if isTwistedModel(obj) then
				if not espTwistedBoxes[obj] then
					createEspForTwisted(obj)
				else
					local box = espTwistedBoxes[obj]
					local hrp = obj:FindFirstChild("HumanoidRootPart")
					box.Adornee = hrp
				end
			end
		end
	end)

	-- ESP GERADORES
	local espGenEnabled = false
	local espGenBoxes = {}
	local function removeGenEsp()
		for _,v in pairs(espGenBoxes) do if v and v.Parent then v:Destroy() end end
		espGenBoxes = {}
	end
	local function isGenerator(obj)
		local lowerName = obj.Name:lower()
		return (
			lowerName:find("generator") or
			lowerName:find("gerador") or
			lowerName:find("gen")
		) and (obj:IsA("Model") or obj:IsA("BasePart"))
	end
	local function createEspForGen(gen)
		if espGenBoxes[gen] then return end
		local adornee = gen:IsA("BasePart") and gen or gen:FindFirstChildWhichIsA("BasePart")
		if not adornee then return end
		local box = Instance.new("BoxHandleAdornment")
		box.Adornee = adornee
		box.AlwaysOnTop = true
		box.ZIndex = 10
		box.Size = Vector3.new(4,6,2)
		box.Color3 = Color3.fromRGB(30,255,100)
		box.Transparency = 0.1
		box.Parent = workspace
		box.Name = "[ESP-Generator]"
		espGenBoxes[gen] = box
	end

	local toggleGen = Instance.new("TextButton", page)
	toggleGen.Size = UDim2.new(0,110,0,22)
	toggleGen.Position = UDim2.new(0,10,0,125)
	toggleGen.BackgroundColor3 = Color3.fromRGB(30,255,100)
	toggleGen.Text = "ESP Geradores"
	toggleGen.TextSize = 12
	toggleGen.TextColor3 = Color3.fromRGB(40,40,40)
	toggleGen.Font = Enum.Font.GothamBold
	toggleGen.AutoButtonColor = true
	toggleGen.BorderSizePixel = 0
	Instance.new("UICorner", toggleGen).CornerRadius = UDim.new(0, 7)

	toggleGen.MouseButton1Click:Connect(function()
		espGenEnabled = not espGenEnabled
		if espGenEnabled then
			toggleGen.Text = "Desligar Gen"
		else
			toggleGen.Text = "ESP Geradores"
			removeGenEsp()
		end
	end)
	game:GetService("RunService").RenderStepped:Connect(function()
		if not espGenEnabled then return end
		for gen,box in pairs(espGenBoxes) do if not gen.Parent then box:Destroy() espGenBoxes[gen] = nil end end
		for _,obj in ipairs(workspace:GetDescendants()) do
			if isGenerator(obj) then
				if not espGenBoxes[obj] then
					createEspForGen(obj)
				else
					local box = espGenBoxes[obj]
					local adornee = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
					box.Adornee = adornee
				end
			end
		end
	end)

	pages["Dandys World"] = page
end

createCoisasPrincipais()
createDandysWorld()

for k,v in pairs(sideButtons) do
	v.MouseButton1Click:Connect(function()
		selectedSection = k
		for n,btn in pairs(sideButtons) do
			btn.TextColor3 = n==selectedSection and Color3.fromRGB(255,255,255) or Color3.fromRGB(185,185,200)
			btn.BackgroundTransparency = n==selectedSection and 0.09 or 1
		end
		for name,page in pairs(pages) do
			page.Visible = (name==selectedSection)
		end
	end)
end
for _,page in pairs(pages) do page.Visible = false end
pages["Coisas Principais"].Visible = true

local minimizado = false
minBtn.MouseButton1Click:Connect(function()
	minimizado = not minimizado
	if minimizado then
		-- Minimizar: só header!
		sidebar.Visible = false
		for _,page in pairs(pages) do page.Visible = false end
		main.Size = minimizedMainSize
		main.Position = minimizedMainPosition
	else
		sidebar.Visible = true
		for name,page in pairs(pages) do
			page.Visible = (name==selectedSection)
		end
		main.Size = defaultMainSize
		main.Position = defaultMainPosition
	end
end)

local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart, startPos

header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = Vector2.new(input.Position.X, input.Position.Y)
		startPos = UDim2.new(main.Position.X.Scale, main.Position.X.Offset, main.Position.Y.Scale, main.Position.Y.Offset)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)