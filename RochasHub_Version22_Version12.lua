-- Rochas Hub - UI, ESP Player/Twisted/Gen (iguais), Fullbright, Canal Dandys World

local MAX = 5000
local plr = game.Players.LocalPlayer

if plr.PlayerGui:FindFirstChild("RochasHub") then
	plr.PlayerGui.RochasHub:Destroy()
end

local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "RochasHub"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 420, 0, 460)
main.Position = UDim2.new(0.5, -210, 0.45, -230)
main.BackgroundColor3 = Color3.fromRGB(31,31,37)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Active = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)
local UIS = Instance.new("ImageLabel", main)
UIS.Size, UIS.Position = UDim2.new(1, 38, 1, 38), UDim2.new(0, -19, 0, -19)
UIS.Image, UIS.BackgroundTransparency, UIS.ImageTransparency, UIS.ZIndex = "rbxassetid://1316045217", 1, 0.56, 0

local header = Instance.new("Frame", main)
header.BackgroundColor3, header.Size, header.BorderSizePixel, header.ZIndex = Color3.fromRGB(24,24,28), UDim2.new(1,0,0,32), 0, 2
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8)
header.Active = true
header.Draggable = false
local title = Instance.new("TextLabel", header)
title.Text = "Rochas Hub"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 17
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 3

local minBtn = Instance.new("TextButton", header)
minBtn.Size, minBtn.Position = UDim2.new(0, 32, 0, 32), UDim2.new(1, -64, 0, 0)
minBtn.BackgroundColor3, minBtn.Text, minBtn.AutoButtonColor = Color3.fromRGB(24,24,28), "_", true
minBtn.Font, minBtn.TextColor3, minBtn.TextSize, minBtn.ZIndex, minBtn.BorderSizePixel = Enum.Font.GothamBold, Color3.fromRGB(80,200,255), 22, 4, 0

local close = Instance.new("TextButton", header)
close.Size, close.Position = UDim2.new(0, 32, 0, 32), UDim2.new(1, -32, 0, 0)
close.BackgroundColor3, close.Text, close.AutoButtonColor = Color3.fromRGB(24,24,28), "✕", true
close.Font, close.TextColor3, close.TextSize, close.ZIndex, close.BorderSizePixel = Enum.Font.GothamBold, Color3.fromRGB(255,90,90), 20, 4, 0
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local sidebar = Instance.new("Frame", main)
sidebar.BackgroundColor3, sidebar.Size, sidebar.Position, sidebar.BorderSizePixel, sidebar.ZIndex = Color3.fromRGB(24,24,28), UDim2.new(0, 120, 1, -32), UDim2.new(0, 0, 0, 32), 0, 2
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 8)
local sections = { "Walkspeed", "Jumpsize", "Danças", "Esp", "Fullbright", "Dandys World" }
local icons = { "🏃", "🦘", "💃", "👁️", "💡", "🌎" }
local sideButtons, pages = {}, {}
local selectedSection = "Walkspeed"

for i, v in ipairs(sections) do
	local btn = Instance.new("TextButton", sidebar)
	btn.Size = UDim2.new(1, 0, 0, 40)
	btn.Position = UDim2.new(0, 0, 0, (i-1)*44)
	btn.Text = "  "..icons[i].."  "..v
	btn.Font = Enum.Font.GothamMedium
	btn.TextColor3 = v==selectedSection and Color3.fromRGB(255,255,255) or Color3.fromRGB(180,180,190)
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.BackgroundTransparency = v==selectedSection and 0.12 or 1
	btn.BackgroundColor3 = Color3.fromRGB(39, 42, 53)
	btn.AutoButtonColor, btn.BorderSizePixel, btn.ZIndex = true, 0, 3
	sideButtons[v] = btn
end

local function createStyledSlider(page, y, labelText, default, setter, max, editable)
	local frame = Instance.new("Frame", page)
	frame.Position = UDim2.new(0, 40, 0, y)
	frame.Size = UDim2.new(0, 250, 0, 28)
	frame.BackgroundTransparency = 1

	local bar = Instance.new("Frame", frame)
	bar.Position = UDim2.new(0, 0, 0, 4)
	bar.Size = UDim2.new(1, 0, 0, 20)
	bar.BackgroundColor3 = Color3.fromRGB(20, 36, 46)
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
	circle.Size = UDim2.new(0, 60, 1, 0)
	circle.Position = UDim2.new(default/max, -60, 0, 0)
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
	label.TextSize = 14
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
			circle.Position = UDim2.new(n/max, -60, 0, 0)
			label.Text = tostring(n).." "..labelText
			setter(n)
		end
	end)
	label.FocusLost:Connect(function()
		local t = label.Text:match("^(%d+)")
		local n = tonumber(t) or default
		n = math.clamp(n,1,max)
		fill.Size = UDim2.new(n/max,0,1,0)
		circle.Position = UDim2.new(n/max, -60, 0, 0)
		label.Text = tostring(n).." "..labelText
		setter(n)
	end)
	fill.Size = UDim2.new(default/max,0,1,0)
	circle.Position = UDim2.new(default/max, -60, 0, 0)
	label.Text = tostring(default).." "..labelText

	return label
end

local function createSectionStyled(name, label, default, setter)
	local page = Instance.new("Frame", main)
	page.Name = name
	page.Size = UDim2.new(1, -120, 1, -32)
	page.Position = UDim2.new(0, 120, 0, 32)
	page.BackgroundTransparency = 1
	page.Visible = (name == selectedSection)
	page.ZIndex = 3

	local sectionTitle = Instance.new("TextLabel", page)
	sectionTitle.Text = "| "..name
	sectionTitle.Size = UDim2.new(1, 0, 0, 30)
	sectionTitle.Position = UDim2.new(0, 10, 0, 0)
	sectionTitle.Font = Enum.Font.GothamSemibold
	sectionTitle.TextColor3 = Color3.fromRGB(255,255,255)
	sectionTitle.TextSize = 20
	sectionTitle.BackgroundTransparency = 1
	sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

	createStyledSlider(page, 60, label, default, setter, MAX, true)
	pages[name] = page
end

local function createDances()
	if pages["Danças"] then return end
	local page = Instance.new("Frame", main)
	page.Name = "Danças"
	page.Size = UDim2.new(1, -120, 1, -32)
	page.Position = UDim2.new(0, 120, 0, 32)
	page.BackgroundTransparency = 1
	page.Visible = false
	page.ZIndex = 3

	local sectionTitle = Instance.new("TextLabel", page)
	sectionTitle.Text = "| Danças"
	sectionTitle.Size = UDim2.new(1, 0, 0, 30)
	sectionTitle.Position = UDim2.new(0, 10, 0, 0)
	sectionTitle.Font = Enum.Font.GothamSemibold
	sectionTitle.TextColor3 = Color3.fromRGB(255,255,255)
	sectionTitle.TextSize = 20
	sectionTitle.BackgroundTransparency = 1
	sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

	local subLabel = Instance.new("TextLabel", page)
	subLabel.Text = "Kazotsky Kick (TF2)"
	subLabel.Size = UDim2.new(0, 200, 0, 26)
	subLabel.Position = UDim2.new(0, 10, 0, 60)
	subLabel.Font = Enum.Font.Gotham
	subLabel.TextColor3 = Color3.fromRGB(230,230,235)
	subLabel.TextSize = 15
	subLabel.BackgroundTransparency = 1
	subLabel.TextXAlignment = Enum.TextXAlignment.Left

	local btn = Instance.new("TextButton", page)
	btn.Size = UDim2.new(0,180,0,38)
	btn.Position = UDim2.new(0,10,0,100)
	btn.BackgroundColor3 = Color3.fromRGB(0,200,255)
	btn.Text = "Executar Kazotsky Kick"
	btn.TextSize = 17
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.Font = Enum.Font.GothamBold
	btn.AutoButtonColor = true
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)

	local kazotskyR15 = Instance.new("Animation")
	kazotskyR15.AnimationId = "rbxassetid://507771019"
	local kazotskyR6 = Instance.new("Animation")
	kazotskyR6.AnimationId = "rbxassetid://5915777484"

	local kazPlaying = false
	local track = nil

	btn.MouseButton1Click:Connect(function()
		local char = plr.Character
		if not char then return end
		local hum = char:FindFirstChildOfClass("Humanoid")
		if not hum then return end

		if kazPlaying and track then
			track:Stop()
			track = nil
			kazPlaying = false
			btn.Text = "Executar Kazotsky Kick"
			return
		end

		local rigType = hum.RigType and hum.RigType.Name or "R15"
		local anim = kazotskyR15
		if rigType == "R6" then
			anim = kazotskyR6
		end

		for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
			if t.Animation.AnimationId == anim.AnimationId then t:Stop() end
		end

		track = hum:LoadAnimation(anim)
		track.Looped = true
		track:Play()
		kazPlaying = true
		btn.Text = "Parar Kazotsky Kick"
	end)

	pages["Danças"] = page
end

local function createFullbright()
	if pages["Fullbright"] then return end
	local page = Instance.new("Frame", main)
	page.Name = "Fullbright"
	page.Size = UDim2.new(1, -120, 1, -32)
	page.Position = UDim2.new(0, 120, 0, 32)
	page.BackgroundTransparency = 1
	page.Visible = false
	page.ZIndex = 3

	local sectionTitle = Instance.new("TextLabel", page)
	sectionTitle.Text = "| Fullbright"
	sectionTitle.Size = UDim2.new(1, 0, 0, 30)
	sectionTitle.Position = UDim2.new(0, 10, 0, 0)
	sectionTitle.Font = Enum.Font.GothamSemibold
	sectionTitle.TextColor3 = Color3.fromRGB(255,255,255)
	sectionTitle.TextSize = 20
	sectionTitle.BackgroundTransparency = 1
	sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

	local info = Instance.new("TextLabel", page)
	info.Text = "Deixa o jogo clarão (FullBright)!"
	info.Size = UDim2.new(1, -20, 0, 24)
	info.Position = UDim2.new(0, 10, 0, 36)
	info.Font = Enum.Font.Gotham
	info.TextColor3 = Color3.fromRGB(230,230,235)
	info.TextSize = 15
	info.BackgroundTransparency = 1
	info.TextXAlignment = Enum.TextXAlignment.Left

	local toggle = Instance.new("TextButton", page)
	toggle.Size = UDim2.new(0,150,0,36)
	toggle.Position = UDim2.new(0,10,0,70)
	toggle.BackgroundColor3 = Color3.fromRGB(255,200,0)
	toggle.Text = "Ativar Fullbright"
	toggle.TextSize = 17
	toggle.TextColor3 = Color3.fromRGB(40,40,40)
	toggle.Font = Enum.Font.GothamBold
	toggle.AutoButtonColor = true
	toggle.BorderSizePixel = 0
	Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 7)

	local fbActive = false
	local oldLighting = {}

	toggle.MouseButton1Click:Connect(function()
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
			toggle.Text = "Desativar Fullbright"
		else
			for k,v in pairs(oldLighting) do
				lighting[k] = v
			end
			fbActive = false
			toggle.Text = "Ativar Fullbright"
		end
	end)

	pages["Fullbright"] = page
end

-- Canal Dandys World (TUDO de Dandys aqui)
local function createDandysWorld()
	if pages["Dandys World"] then return end
	local page = Instance.new("Frame", main)
	page.Name = "Dandys World"
	page.Size = UDim2.new(1, -120, 1, -32)
	page.Position = UDim2.new(0, 120, 0, 32)
	page.BackgroundTransparency = 1
	page.Visible = false
	page.ZIndex = 3

	-- Título
	local sectionTitle = Instance.new("TextLabel", page)
	sectionTitle.Text = "| Dandys World"
	sectionTitle.Size = UDim2.new(1, 0, 0, 30)
	sectionTitle.Position = UDim2.new(0, 10, 0, 0)
	sectionTitle.Font = Enum.Font.GothamSemibold
	sectionTitle.TextColor3 = Color3.fromRGB(255,255,255)
	sectionTitle.TextSize = 20
	sectionTitle.BackgroundTransparency = 1
	sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

	local subLabel = Instance.new("TextLabel", page)
	subLabel.Text = "Funções exclusivas para Dandys World"
	subLabel.Size = UDim2.new(1, -20, 0, 24)
	subLabel.Position = UDim2.new(0, 10, 0, 36)
	subLabel.Font = Enum.Font.Gotham
	subLabel.TextColor3 = Color3.fromRGB(200,220,255)
	subLabel.TextSize = 15
	subLabel.BackgroundTransparency = 1
	subLabel.TextXAlignment = Enum.TextXAlignment.Left

	local wsLabel = Instance.new("TextLabel", page)
	wsLabel.Text = "Walkspeed Dandys"
	wsLabel.Size = UDim2.new(0, 200, 0, 24)
	wsLabel.Position = UDim2.new(0, 10, 0, 66)
	wsLabel.Font = Enum.Font.Gotham
	wsLabel.TextColor3 = Color3.fromRGB(230,230,240)
	wsLabel.TextSize = 15
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
	createStyledSlider(page, 92, "Dandys", 16, setDandysSpeed, MAX, true)

	pages["Dandys World"] = page
end

-- ESP universal para Jogadores, Twisteds e Geradores (igual player)
local function createEsp()
	if pages["Esp"] then return end
	local page = Instance.new("Frame", main)
	page.Name = "Esp"
	page.Size = UDim2.new(1, -120, 1, -32)
	page.Position = UDim2.new(0, 120, 0, 32)
	page.BackgroundTransparency = 1
	page.Visible = false
	page.ZIndex = 3

	local sectionTitle = Instance.new("TextLabel", page)
	sectionTitle.Text = "| Esp"
	sectionTitle.Size = UDim2.new(1, 0, 0, 30)
	sectionTitle.Position = UDim2.new(0, 10, 0, 0)
	sectionTitle.Font = Enum.Font.GothamSemibold
	sectionTitle.TextColor3 = Color3.fromRGB(255,255,255)
	sectionTitle.TextSize = 20
	sectionTitle.BackgroundTransparency = 1
	sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

	local subLabel = Instance.new("TextLabel", page)
	subLabel.Text = "ESP Jogadores, Twisteds e Geradores (config igual player)"
	subLabel.Size = UDim2.new(1, -20, 0, 26)
	subLabel.Position = UDim2.new(0, 10, 0, 48)
	subLabel.Font = Enum.Font.Gotham
	subLabel.TextColor3 = Color3.fromRGB(230,230,235)
	subLabel.TextSize = 15
	subLabel.BackgroundTransparency = 1
	subLabel.TextXAlignment = Enum.TextXAlignment.Left

	-- ESP Jogador
	local toggle = Instance.new("TextButton", page)
	toggle.Size = UDim2.new(0,150,0,36)
	toggle.Position = UDim2.new(0,10,0,82)
	toggle.BackgroundColor3 = Color3.fromRGB(0,200,255)
	toggle.Text = "Ativar ESP Jogadores"
	toggle.TextSize = 17
	toggle.TextColor3 = Color3.fromRGB(255,255,255)
	toggle.Font = Enum.Font.GothamBold
	toggle.AutoButtonColor = true
	toggle.BorderSizePixel = 0
	Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 7)

	-- ESP Twisted
	local toggleTwisted = Instance.new("TextButton", page)
	toggleTwisted.Size = UDim2.new(0,180,0,36)
	toggleTwisted.Position = UDim2.new(0,10,0,128)
	toggleTwisted.BackgroundColor3 = Color3.fromRGB(200,90,255)
	toggleTwisted.Text = "Ativar ESP Twisteds"
	toggleTwisted.TextSize = 17
	toggleTwisted.TextColor3 = Color3.fromRGB(255,255,255)
	toggleTwisted.Font = Enum.Font.GothamBold
	toggleTwisted.AutoButtonColor = true
	toggleTwisted.BorderSizePixel = 0
	Instance.new("UICorner", toggleTwisted).CornerRadius = UDim.new(0, 7)

	-- ESP Gerador
	local toggleGen = Instance.new("TextButton", page)
	toggleGen.Size = UDim2.new(0,180,0,36)
	toggleGen.Position = UDim2.new(0,10,0,174)
	toggleGen.BackgroundColor3 = Color3.fromRGB(30,255,100)
	toggleGen.Text = "Ativar ESP Geradores"
	toggleGen.TextSize = 17
	toggleGen.TextColor3 = Color3.fromRGB(40,40,40)
	toggleGen.Font = Enum.Font.GothamBold
	toggleGen.AutoButtonColor = true
	toggleGen.BorderSizePixel = 0
	Instance.new("UICorner", toggleGen).CornerRadius = UDim.new(0, 7)

	-- ESP Jogador
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
	toggle.MouseButton1Click:Connect(function()
		espEnabled = not espEnabled
		if espEnabled then
			toggle.Text = "Desativar ESP Jogadores"
			refreshEsp()
		else
			toggle.Text = "Ativar ESP Jogadores"
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
	-- ESP Twisteds (igual player)
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
	toggleTwisted.MouseButton1Click:Connect(function()
		espTwistedEnabled = not espTwistedEnabled
		if espTwistedEnabled then
			toggleTwisted.Text = "Desativar ESP Twisteds"
		else
			toggleTwisted.Text = "Ativar ESP Twisteds"
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
	-- ESP GERADORES (igual player)
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
	toggleGen.MouseButton1Click:Connect(function()
		espGenEnabled = not espGenEnabled
		if espGenEnabled then
			toggleGen.Text = "Desativar ESP Geradores"
		else
			toggleGen.Text = "Ativar ESP Geradores"
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
	pages["Esp"] = page
end

local char,hum = plr.Character or plr.CharacterAdded:Wait(),nil
hum = char:WaitForChild("Humanoid")
plr.CharacterAdded:Connect(function(c) char=c; hum=char:WaitForChild("Humanoid") end)
local function setSpeed(v) if hum then hum.WalkSpeed = v end end
local function setJump(v) if hum then hum.JumpPower = v end end

createSectionStyled("Walkspeed","Speed",16,setSpeed)
createSectionStyled("Jumpsize","Jump",50,setJump)
createDances()
createEsp()
createFullbright()
createDandysWorld()
setSpeed(16) setJump(50)

for k,v in pairs(sideButtons) do
	v.MouseButton1Click:Connect(function()
		selectedSection = k
		for n,btn in pairs(sideButtons) do
			btn.TextColor3 = n==selectedSection and Color3.fromRGB(255,255,255) or Color3.fromRGB(180,180,190)
			btn.BackgroundTransparency = n==selectedSection and 0.12 or 1
		end
		for name,page in pairs(pages) do
			page.Visible = (name==selectedSection)
		end
	end)
end
for _,page in pairs(pages) do page.Visible = false end
pages["Walkspeed"].Visible = true

local minimizado = false
minBtn.MouseButton1Click:Connect(function()
	minimizado = not minimizado
	header.Visible = true
	sidebar.Visible = not minimizado
	for _,page in pairs(pages) do
		page.Visible = not minimizado and (selectedSection == page.Name or pages[selectedSection] == page)
	end
	main.Size = minimizado and UDim2.new(0,420,0,36) or UDim2.new(0,420,0,460)
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