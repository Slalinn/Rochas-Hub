-- Rochas Hub V4 - Regretevator (sem canal Home, TP BRADO, TP CONSTRUÇÃO, TP SORVETE)
local plr = game.Players.LocalPlayer

if plr.PlayerGui:FindFirstChild("RochasHub") then
    plr.PlayerGui.RochasHub:Destroy()
end

local mainAccent = Color3.fromRGB(255, 216, 0)
local mainAccentDark = Color3.fromRGB(200, 160, 0)
local accentText = Color3.fromRGB(32, 32, 32)
local backgroundColor = Color3.fromRGB(28,28,18)
local sliderColor = Color3.fromRGB(110, 140, 255)
local gui = Instance.new("ScreenGui")
gui.Name = "RochasHub"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.Parent = game.CoreGui or plr.PlayerGui

local defaultMainSize = UDim2.new(0, 470, 0, 320)
local defaultMainPosition = UDim2.new(0.5, -235, 0.5, -160)
local minimizedSize = UDim2.new(0, 60, 0, 60)
local main = Instance.new("Frame", gui)
main.Size = defaultMainSize
main.Position = defaultMainPosition
main.BackgroundColor3 = backgroundColor
main.BackgroundTransparency = 0.08
main.BorderColor3 = mainAccent
main.BorderSizePixel = 2
main.ClipsDescendants = true
main.Active = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 11)

local header = Instance.new("Frame", main)
header.BackgroundColor3 = mainAccent
header.Size = UDim2.new(1,0,0,32)
header.Position = UDim2.new(0,0,0,0)
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 10)
local title = Instance.new("TextLabel", header)
title.Text = "Rochas Hub - Regretevator"
title.Font = Enum.Font.GothamBlack
title.TextColor3 = accentText
title.TextSize = 18
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 18, 0, 0)
title.TextXAlignment = Enum.TextXAlignment.Left
local minBtn = Instance.new("TextButton", header)
minBtn.Size, minBtn.Position = UDim2.new(0, 26, 0, 32), UDim2.new(1, -52, 0, 0)
minBtn.BackgroundTransparency = 1
minBtn.Text, minBtn.AutoButtonColor = "_", true
minBtn.Font, minBtn.TextColor3, minBtn.TextSize, minBtn.ZIndex, minBtn.BorderSizePixel = Enum.Font.GothamBlack, accentText, 22, 4, 0
local close = Instance.new("TextButton", header)
close.Size, close.Position = UDim2.new(0, 26, 0, 32), UDim2.new(1, -26, 0, 0)
close.BackgroundTransparency = 1
close.Text, close.AutoButtonColor = "✕", true
close.Font, close.TextColor3, close.TextSize, close.ZIndex, close.BorderSizePixel = Enum.Font.GothamBlack, Color3.fromRGB(255,80,80), 15, 4, 0

local sidebar = Instance.new("Frame", main)
sidebar.BackgroundColor3 = Color3.fromRGB(41,41,30)
sidebar.Size = UDim2.new(0, 120, 1, -32)
sidebar.Position = UDim2.new(0, 0, 0, 32)
sidebar.BorderSizePixel = 0
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 10)

-- Só uma aba: Regretevator
local sections = { "Regretevator" }
local icons = { "⭐" }
local sideButtons, pages = {}, {}
local selectedSection = "Regretevator"

for i, v in ipairs(sections) do
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1, -12, 0, 36)
    btn.Position = UDim2.new(0, 6, 0, 10 + (i-1)*44)
    btn.Text = icons[i].."  "..v
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = accentText
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BackgroundTransparency = 0.08
    btn.BackgroundColor3 = mainAccent
    btn.AutoButtonColor, btn.BorderSizePixel, btn.ZIndex = true, 0, 2
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    sideButtons[v] = btn
end

function createModernSlider(parent, y, labelText, default, setter, min, max, step)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -30, 0, 36)
    frame.Position = UDim2.new(0, 10, 0, y)
    frame.BackgroundTransparency = 1

    local label = Instance.new("TextLabel", frame)
    label.Text = labelText
    label.Size = UDim2.new(1, 0, 0, 13)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.TextColor3 = Color3.fromRGB(200,200,200)
    label.TextXAlignment = Enum.TextXAlignment.Left

    local valLabel = Instance.new("TextLabel", frame)
    valLabel.Text = tostring(default)
    valLabel.Size = UDim2.new(0, 40, 0, 18)
    valLabel.Position = UDim2.new(0, 0, 0, 15)
    valLabel.BackgroundTransparency = 1
    valLabel.Font = Enum.Font.GothamBold
    valLabel.TextSize = 13
    valLabel.TextColor3 = Color3.fromRGB(230,230,230)
    valLabel.TextXAlignment = Enum.TextXAlignment.Left

    local bar = Instance.new("TextButton", frame)
    bar.BackgroundTransparency = 0
    bar.AutoButtonColor = false
    bar.Position = UDim2.new(0, 44, 0, 21)
    bar.Size = UDim2.new(1, -54, 0, 8)
    bar.BackgroundColor3 = Color3.fromRGB(34,34,38)
    bar.BorderSizePixel = 0
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame", bar)
    fill.BackgroundColor3 = sliderColor
    fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
    fill.Position = UDim2.new(0, 0, 0, 0)
    fill.BorderSizePixel = 0
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame", bar)
    knob.Size = UDim2.new(0, 15, 0, 15)
    knob.Position = UDim2.new((default-min)/(max-min), -7, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(240,240,240)
    knob.BorderSizePixel = 0
    knob.ZIndex = 2
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 7)

    local dragging = false

    local function setSlider(val)
        val = math.clamp(val, min, max)
        if step then val = math.floor(val/step+0.5)*step end
        local percent = (val-min)/(max-min)
        fill.Size = UDim2.new(percent,0,1,0)
        knob.Position = UDim2.new(percent, -7, 0.5, -7)
        valLabel.Text = tostring(val)
        setter(val)
    end

    bar.MouseButton1Down:Connect(function(x, y)
        dragging = true
        local input = game:GetService("UserInputService")
        local abs, w = bar.AbsolutePosition.X, bar.AbsoluteSize.X
        local function update()
            local mouseX = input:GetMouseLocation().X
            local percent = math.clamp((mouseX-abs)/w, 0, 1)
            local val = min + (max-min)*percent
            if step then val = math.floor(val/step+0.5)*step end
            setSlider(val)
        end
        update()
        local moveC, upC
        moveC = input.InputChanged:Connect(function(inputObj)
            if dragging and inputObj.UserInputType == Enum.UserInputType.MouseMovement then
                update()
            end
        end)
        upC = input.InputEnded:Connect(function(inputObj)
            if inputObj.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
                moveC:Disconnect()
                upC:Disconnect()
            end
        end)
    end)
    setSlider(default)
    return setSlider
end

function createToggleSwitch(parent, y, labelText, state, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -30, 0, 32)
    frame.Position = UDim2.new(0, 10, 0, y)
    frame.BackgroundTransparency = 1
    local label = Instance.new("TextLabel", frame)
    label.Text = labelText
    label.Size = UDim2.new(1, -54, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextColor3 = Color3.fromRGB(230,230,230)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 44, 0, 22)
    btn.Position = UDim2.new(1, -52, 0.5, -11)
    btn.BackgroundColor3 = state and Color3.fromRGB(180, 220, 60) or Color3.fromRGB(60,60,60)
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.ZIndex = 2
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 12)
    local circle = Instance.new("Frame", btn)
    circle.Size = UDim2.new(0, 18, 0, 18)
    circle.Position = UDim2.new(state and 1 or 0, state and -20 or 2, 0.5, -9)
    circle.BackgroundColor3 = Color3.fromRGB(240,240,240)
    circle.BorderSizePixel = 0
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 8)
    circle.ZIndex = 3
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(180, 220, 60) or Color3.fromRGB(60,60,60)
        circle:TweenPosition(UDim2.new(state and 1 or 0, state and -20 or 2, 0.5, -9), "Out", "Quad", 0.18, true)
        callback(state)
    end)
    return function(newState)
        state = newState
        btn.BackgroundColor3 = state and Color3.fromRGB(180, 220, 60) or Color3.fromRGB(60,60,60)
        circle.Position = UDim2.new(state and 1 or 0, state and -20 or 2, 0.5, -9)
    end
end

local fbActive, oldLighting = false, {}
local regreteSpeed = 16
local regreteJump = 50
local espEnabled = false
local espNPCEnabled = false
local hubAberto = true

local espBoxes = {}
local function removeEsp() for _,v in pairs(espBoxes) do if v and v.Parent then v:Destroy() end end espBoxes = {} end

-- ESP NPC otimizado
local espNPCBoxes = {}
local npcLoopConn

local function isRegretevatorNPC(model)
    return model:IsA("Model")
        and model:FindFirstChild("HumanoidRootPart")
        and model:FindFirstChildOfClass("Humanoid")
        and not game.Players:GetPlayerFromCharacter(model)
end

local function createEspForNPC(npc)
    if espNPCBoxes[npc] then return end
    local hrp = npc:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = hrp
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = Vector3.new(4,6,2)
    box.Color3 = mainAccentDark
    box.Transparency = 0.15
    box.Parent = workspace
    box.Name = "[ESP-NPC]"
    espNPCBoxes[npc] = box
end

local function removeEspForNPC(npc)
    if espNPCBoxes[npc] then espNPCBoxes[npc]:Destroy() espNPCBoxes[npc] = nil end
end

local function refreshAllNPCs()
    for npc, box in pairs(espNPCBoxes) do
        if not npc.Parent or not isRegretevatorNPC(npc) then
            removeEspForNPC(npc)
        end
    end
    for _,obj in ipairs(workspace:GetDescendants()) do
        if isRegretevatorNPC(obj) then
            createEspForNPC(obj)
        end
    end
end

local function connectNpcEsp()
    if npcLoopConn then npcLoopConn:Disconnect() end
    refreshAllNPCs()
    npcLoopConn = game:GetService("RunService").Stepped:Connect(function()
        if espNPCEnabled then refreshAllNPCs() end
    end)
end

local function disconnectNpcEsp()
    if npcLoopConn then npcLoopConn:Disconnect() npcLoopConn = nil end
    for npc, box in pairs(espNPCBoxes) do box:Destroy() end
    espNPCBoxes = {}
end

local function restoreWalkAndJump()
    local char = plr.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = 16
            hum.JumpPower = 50
        end
    end
end
local charAddedConn
charAddedConn = plr.CharacterAdded:Connect(function(char)
    if not hubAberto then
        local hum = char:WaitForChild("Humanoid", 3)
        if hum then
            hum.WalkSpeed = 16
            hum.JumpPower = 50
        end
    end
end)

-- TP FINAL DA FAZE BRADO (coordenadas da imagem fornecida)
local function tpBrado()
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 2)
    if not hrp then return end
    hrp.CFrame = CFrame.new(-203.95, 102.24, 19.85)
end

-- TP FINAL DA FASE DE CONSTRUÇÃO (coordenadas da segunda imagem)
local function tpConstrucao()
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 2)
    if not hrp then return end
    hrp.CFrame = CFrame.new(-103.20, 525.27, 22.60)
end

-- TP FINAL DA FASE DO SORVETE (coordenadas da terceira imagem)
local function tpSorvete()
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 2)
    if not hrp then return end
    hrp.CFrame = CFrame.new(-186.47, 12.49, 18.31)
end

local function createRegretevator()
    if pages["Regretevator"] then return end
    local page = Instance.new("ScrollingFrame", main)
    page.Name = "Regretevator"
    page.Size = UDim2.new(1, -120, 1, -32)
    page.Position = UDim2.new(0, 120, 0, 32)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ZIndex = 3
    page.ScrollBarThickness = 7
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.VerticalScrollBarInset = Enum.ScrollBarInset.Always

    local sectionTitle = Instance.new("TextLabel", page)
    sectionTitle.Text = "| Regretevator"
    sectionTitle.Size = UDim2.new(1, 0, 0, 20)
    sectionTitle.Position = UDim2.new(0, 10, 0, 7)
    sectionTitle.Font = Enum.Font.GothamSemibold
    sectionTitle.TextColor3 = mainAccent
    sectionTitle.TextSize = 17
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

    createToggleSwitch(page, 38, "Fullbright", fbActive, function(on)
        local lighting = game:GetService("Lighting")
        if on then
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
        else
            if fbActive then
                local lighting = game:GetService("Lighting")
                for k,v in pairs(oldLighting) do lighting[k]=v end
                fbActive = false
            end
        end
    end)

    createModernSlider(page, 70, "Walkspeed", regreteSpeed, function(v)
        regreteSpeed = v
        local char = plr.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = regreteSpeed end
        end
    end, 1, 200, 1)
    createModernSlider(page, 110, "JumpSize", regreteJump, function(v)
        regreteJump = v
        local char = plr.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower = regreteJump end
        end
    end, 1, 200, 1)

    local loopConn = game:GetService("RunService").RenderStepped:Connect(function()
        if not hubAberto then return end
        local char = plr.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = regreteSpeed
                hum.JumpPower = regreteJump
            end
        end
    end)

    local charConn = plr.CharacterAdded:Connect(function(char)
        if hubAberto then
            local hum = char:WaitForChild("Humanoid", 3)
            if hum then
                hum.WalkSpeed = regreteSpeed
                hum.JumpPower = regreteJump
            end
        end
    end)

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
        box.Color3 = mainAccent
        box.Transparency = 0.15
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

    createToggleSwitch(page, 150, "ESP Jogadores", espEnabled, function(on)
        espEnabled = on
        if espEnabled then
            refreshEsp()
        else
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

    createToggleSwitch(page, 190, "ESP NPCs", espNPCEnabled, function(on)
        espNPCEnabled = on
        if espNPCEnabled then
            connectNpcEsp()
        else
            disconnectNpcEsp()
        end
    end)

    -- Botão TP BRADO
    local tpBradoBtn = Instance.new("TextButton", page)
    tpBradoBtn.Size = UDim2.new(1, -30, 0, 36)
    tpBradoBtn.Position = UDim2.new(0, 10, 0, 225)
    tpBradoBtn.Text = "🇧🇷 TP pro final da faze BRADO"
    tpBradoBtn.Font = Enum.Font.GothamBold
    tpBradoBtn.TextColor3 = Color3.fromRGB(38,38,38)
    tpBradoBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
    tpBradoBtn.BackgroundTransparency = 0.05
    tpBradoBtn.AutoButtonColor = true
    tpBradoBtn.BorderSizePixel = 0
    tpBradoBtn.TextSize = 16
    Instance.new("UICorner", tpBradoBtn).CornerRadius = UDim.new(1, 12)
    tpBradoBtn.MouseButton1Click:Connect(tpBrado)

    -- Botão TP Construção
    local tpConstrucaoBtn = Instance.new("TextButton", page)
    tpConstrucaoBtn.Size = UDim2.new(1, -30, 0, 36)
    tpConstrucaoBtn.Position = UDim2.new(0, 10, 0, 265)
    tpConstrucaoBtn.Text = "🚧 TP pro final da fase de construção"
    tpConstrucaoBtn.Font = Enum.Font.GothamBold
    tpConstrucaoBtn.TextColor3 = Color3.fromRGB(38,38,38)
    tpConstrucaoBtn.BackgroundColor3 = Color3.fromRGB(255, 220, 0)
    tpConstrucaoBtn.BackgroundTransparency = 0.05
    tpConstrucaoBtn.AutoButtonColor = true
    tpConstrucaoBtn.BorderSizePixel = 0
    tpConstrucaoBtn.TextSize = 16
    Instance.new("UICorner", tpConstrucaoBtn).CornerRadius = UDim.new(1, 12)
    tpConstrucaoBtn.MouseButton1Click:Connect(tpConstrucao)

    -- Botão TP Sorvete
    local tpSorveteBtn = Instance.new("TextButton", page)
    tpSorveteBtn.Size = UDim2.new(1, -30, 0, 36)
    tpSorveteBtn.Position = UDim2.new(0, 10, 0, 305)
    tpSorveteBtn.Text = "🍦 TP pro final da fase do sorvete"
    tpSorveteBtn.Font = Enum.Font.GothamBold
    tpSorveteBtn.TextColor3 = Color3.fromRGB(38,38,38)
    tpSorveteBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    tpSorveteBtn.BackgroundTransparency = 0.05
    tpSorveteBtn.AutoButtonColor = true
    tpSorveteBtn.BorderSizePixel = 0
    tpSorveteBtn.TextSize = 16
    Instance.new("UICorner", tpSorveteBtn).CornerRadius = UDim.new(1, 12)
    tpSorveteBtn.MouseButton1Click:Connect(tpSorvete)

    close.MouseButton1Click:Connect(function()
        hubAberto = false
        if fbActive then
            local lighting = game:GetService("Lighting")
            for k,v in pairs(oldLighting) do lighting[k]=v end
            fbActive = false
        end
        removeEsp()
        disconnectNpcEsp()
        restoreWalkAndJump()
        if loopConn then loopConn:Disconnect() end
        if charConn then charConn:Disconnect() end
        gui:Destroy()
    end)

    pages["Regretevator"] = page
end

createRegretevator()

local TweenService = game:GetService("TweenService")
local transitionTime = 0.22
local pageYStart = UDim2.new(0, 120, 0, -main.AbsoluteSize.Y)
local pageYEnd = UDim2.new(0, 120, 0, 32)
local function showTab(tabName)
    for name, page in pairs(pages) do
        if page.Visible then
            page.Visible = false
            page.Position = pageYEnd
        end
    end
    local page = pages[tabName]
    if not page then return end
    page.Position = pageYStart
    page.Visible = true
    TweenService:Create(page, TweenInfo.new(transitionTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = pageYEnd}):Play()
end

for k,v in pairs(sideButtons) do
    v.MouseButton1Click:Connect(function()
        selectedSection = k
        for n,btn in pairs(sideButtons) do
            btn.TextColor3 = accentText
            btn.BackgroundTransparency = 0.08
            btn.BackgroundColor3 = mainAccent
        end
        showTab(k)
    end)
end

for _,page in pairs(pages) do 
    page.Visible = false 
    page.Position = pageYEnd
end
pages["Regretevator"].Visible = true

local mini = Instance.new("ImageButton", gui)
mini.Size = minimizedSize
mini.Position = UDim2.new(0.5, 120, 0.5, 0)
mini.BackgroundColor3 = Color3.fromRGB(36,36,36)
mini.BorderSizePixel = 0
mini.Visible = false
mini.Active = true
Instance.new("UICorner", mini).CornerRadius = UDim.new(1, 18)
mini.Image = "rbxassetid://119416847138099"
mini.ImageColor3 = Color3.new(1,1,1)
mini.ScaleType = Enum.ScaleType.Crop

local minAnimTime = 0.28
minBtn.MouseButton1Click:Connect(function()
    local goal = {
        Position = mini.Position,
        Size = minimizedSize,
        BackgroundTransparency = 0.25,
    }
    local tween = TweenService:Create(main, TweenInfo.new(minAnimTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), goal)
    tween:Play()
    tween.Completed:Wait()
    main.Visible = false
    main.Size = defaultMainSize
    main.Position = defaultMainPosition
    main.BackgroundTransparency = 0.08
    mini.Position = goal.Position
    mini.Visible = true
end)

local dragging, dragStart, startPos, moved
mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        dragStart = Vector2.new(input.Position.X, input.Position.Y)
        startPos = mini.Position
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        moved = true
        local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
        local parent = mini.Parent
        local scr = parent and parent.AbsoluteSize or Vector2.new(1920,1080)
        local x = math.clamp(startPos.X.Offset + delta.X, 0, scr.X-mini.AbsoluteSize.X)
        local y = math.clamp(startPos.Y.Offset + delta.Y, 0, scr.Y-mini.AbsoluteSize.Y)
        mini.Position = UDim2.new(0, x, 0, y)
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
mini.MouseButton1Click:Connect(function()
    if moved then return end
    main.Position = mini.Position
    main.Size = minimizedSize
    main.BackgroundTransparency = 0.25
    main.Visible = true
    mini.Visible = false
    TweenService:Create(main, TweenInfo.new(minAnimTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = defaultMainPosition,
        Size = defaultMainSize,
        BackgroundTransparency = 0.08
    }):Play()
end)

local UIS = game:GetService("UserInputService")
local draggingMain, dragStartMain, startPosMain
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingMain = true
        dragStartMain = Vector2.new(input.Position.X, input.Position.Y)
        startPosMain = main.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if draggingMain and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStartMain
        local parent = main.Parent
        local scr = parent and parent.AbsoluteSize or Vector2.new(1920,1080)
        local x = math.clamp(startPosMain.X.Offset + delta.X, 0, scr.X-main.AbsoluteSize.X)
        local y = math.clamp(startPosMain.Y.Offset + delta.Y, 0, scr.Y-main.AbsoluteSize.Y)
        main.Position = UDim2.new(0, x, 0, y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingMain = false end
end)
