-- Rochas Hub V4 - Dandys World (corrigido/robusto, limpa efeitos ao fechar)

local plr = game.Players.LocalPlayer

if plr.PlayerGui:FindFirstChild("RochasHub") then
    plr.PlayerGui.RochasHub:Destroy()
end

local mainAccent = Color3.fromRGB(255, 216, 0)
local mainAccentDark = Color3.fromRGB(200, 160, 0)
local accentText = Color3.fromRGB(32, 32, 32)
local backgroundColor = Color3.fromRGB(28,28,18)
local sliderColor = Color3.fromRGB(110, 140, 255)
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "RochasHub"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

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
title.Text = "Rochas Hub - Dandys World"
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

local sections = { "Home", "Dandys World" }
local icons = { "🏠", "🌎" }
local sideButtons, pages = {}, {}
local selectedSection = "Home"

for i, v in ipairs(sections) do
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1, -12, 0, 36)
    btn.Position = UDim2.new(0, 6, 0, 10 + (i-1)*44)
    btn.Text = icons[i].."  "..v
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = v==selectedSection and accentText or mainAccent
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BackgroundTransparency = v==selectedSection and 0.08 or 0.7
    btn.BackgroundColor3 = v==selectedSection and mainAccent or Color3.fromRGB(51,51,36)
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
    local bar = Instance.new("Frame", frame)
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
    bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
    end)
    bar.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    bar.MouseMoved:Connect(function(x, _)
        if dragging then
            local abs, w = bar.AbsolutePosition.X, bar.AbsoluteSize.X
            local percent = math.clamp((x-abs)/w,0,1)
            local val = min + (max-min)*percent
            if step then
                val = math.floor(val/step+0.5)*step
            end
            valLabel.Text = tostring(val)
            fill.Size = UDim2.new(percent,0,1,0)
            knob.Position = UDim2.new(percent, -7, 0.5, -7)
            setter(val)
        end
    end)
    return function(newVal)
        local percent = (newVal-min)/(max-min)
        fill.Size = UDim2.new(percent,0,1,0)
        knob.Position = UDim2.new(percent, -7, 0.5, -7)
        valLabel.Text = tostring(newVal)
    end
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

-- Variável de controle para loops
local hubAberto = true

local dandySpeed = 16

-- Funções para ESPs
local espTwistedEnabled = false
local espTwistedBoxes = {}
local function removeTwistedEsp() for _,v in pairs(espTwistedBoxes) do if v and v.Parent then v:Destroy() end end espTwistedBoxes = {} end
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
    box.Color3 = mainAccent
    box.Transparency = 0.13
    box.Parent = workspace
    box.Name = "[ESP-Twisted]"
    espTwistedBoxes[twisted] = box
end

local espGenEnabled = false
local espGenBoxes = {}
local function removeGenEsp() for _,v in pairs(espGenBoxes) do if v and v.Parent then v:Destroy() end end espGenBoxes = {} end
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
    box.Color3 = mainAccentDark
    box.Transparency = 0.13
    box.Parent = workspace
    box.Name = "[ESP-Generator]"
    espGenBoxes[gen] = box
end

-- Loop de alteração de WalkSpeed
local loopConn = game:GetService("RunService").RenderStepped:Connect(function()
    if not hubAberto then return end
    local char = plr.Character
    if not char then return end
    for _,folderName in ipairs({"playerValues","PlayerValues","Values","Stats"}) do
        local folder = char:FindFirstChild(folderName) or workspace:FindFirstChild(folderName)
        if folder then
            for _,valName in ipairs({"WalkSpeed","Speed","walkspeed","speed"}) do
                local val = folder:FindFirstChild(valName)
                if val and val:IsA("NumberValue") then
                    val.Value = dandySpeed
                end
            end
        end
    end
    if char:GetAttribute("WalkSpeed") ~= nil then
        char:SetAttribute("WalkSpeed", dandySpeed)
    elseif char:GetAttribute("Speed") ~= nil then
        char:SetAttribute("Speed", dandySpeed)
    end
    for _,obj in ipairs(char:GetChildren()) do
        if obj:IsA("NumberValue") and (obj.Name:lower():find("speed") or obj.Name:lower():find("walk")) then
            obj.Value = dandySpeed
        end
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        pcall(function() hum.WalkSpeed = dandySpeed end)
    end
end)
local charConn = plr.CharacterAdded:Connect(function()
    if not hubAberto then return end
    -- Força restauração ao respawn
    local hum=plr.Character and plr.Character:WaitForChild("Humanoid", 3)
    if hum then hum.WalkSpeed = dandySpeed end
end)

-- Loop para ESPs
local twistedEspConn = game:GetService("RunService").RenderStepped:Connect(function()
    if not hubAberto or not espTwistedEnabled then return end
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
local genEspConn = game:GetService("RunService").RenderStepped:Connect(function()
    if not hubAberto or not espGenEnabled then return end
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

local function createHome()
    if pages["Home"] then return end
    local page = Instance.new("Frame", main)
    page.Name = "Home"
    page.Size = UDim2.new(1, -120, 1, -32)
    page.Position = UDim2.new(0, 120, 0, 32)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ZIndex = 3

    local logo = Instance.new("TextLabel", page)
    logo.Text = "ROCHAS HUB"
    logo.Font = Enum.Font.GothamBlack
    logo.TextColor3 = mainAccent
    logo.TextSize = 38
    logo.Position = UDim2.new(0, 30, 0, 14)
    logo.Size = UDim2.new(1, -60, 0, 42)
    logo.BackgroundTransparency = 1
    logo.TextXAlignment = Enum.TextXAlignment.Left

    local vers = Instance.new("TextLabel", page)
    vers.Text = "2025 PREMIUM"
    vers.Font = Enum.Font.GothamBlack
    vers.TextColor3 = mainAccentDark
    vers.TextSize = 15
    vers.Position = UDim2.new(0, 34, 0, 50)
    vers.Size = UDim2.new(0, 120, 0, 18)
    vers.BackgroundTransparency = 1
    vers.TextXAlignment = Enum.TextXAlignment.Left

    local welcome = Instance.new("TextLabel", page)
    welcome.Text = "Obrigado por usar o Rochas Hub!\nVersão Dandys World"
    welcome.Font = Enum.Font.GothamBold
    welcome.TextColor3 = Color3.fromRGB(255,255,255)
    welcome.TextSize = 16
    welcome.Position = UDim2.new(0, 30, 0, 75)
    welcome.Size = UDim2.new(1, -40, 0, 40)
    welcome.BackgroundTransparency = 1
    welcome.TextXAlignment = Enum.TextXAlignment.Left
    welcome.TextYAlignment = Enum.TextYAlignment.Top

    local img = Instance.new("ImageLabel", page)
    img.Image = "rbxassetid://16007954275"
    img.Size = UDim2.new(0, 74, 0, 74)
    img.Position = UDim2.new(1, -110, 0, 25)
    img.BackgroundTransparency = 1

    local copyBtn = Instance.new("TextButton", page)
    copyBtn.Size = UDim2.new(0, 150, 0, 32)
    copyBtn.Position = UDim2.new(0, 30, 0, 125)
    copyBtn.Text = "📋 Copy Discord"
    copyBtn.Font = Enum.Font.GothamBold
    copyBtn.TextColor3 = Color3.fromRGB(38,38,38)
    copyBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    copyBtn.BackgroundTransparency = 0
    copyBtn.AutoButtonColor = true
    copyBtn.BorderSizePixel = 0
    Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(1, 12)
    copyBtn.MouseButton1Click:Connect(function() end)

    pages["Home"] = page
end

local function createDandysWorld()
    if pages["Dandys World"] then return end
    local page = Instance.new("Frame", main)
    page.Name = "Dandys World"
    page.Size = UDim2.new(1, -120, 1, -32)
    page.Position = UDim2.new(0, 120, 0, 32)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ZIndex = 3

    local sectionTitle = Instance.new("TextLabel", page)
    sectionTitle.Text = "| Dandys World"
    sectionTitle.Size = UDim2.new(1, 0, 0, 20)
    sectionTitle.Position = UDim2.new(0, 10, 0, 7)
    sectionTitle.Font = Enum.Font.GothamSemibold
    sectionTitle.TextColor3 = mainAccent
    sectionTitle.TextSize = 17
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

    createModernSlider(page, 40, "Walkspeed Dandys", dandySpeed, function(v) dandySpeed = v end, 1, 200, 1)
    createToggleSwitch(page, 80, "ESP Twisteds", espTwistedEnabled, function(on)
        espTwistedEnabled = on
        if not espTwistedEnabled then
            removeTwistedEsp()
        end
    end)
    createToggleSwitch(page, 115, "ESP Geradores", espGenEnabled, function(on)
        espGenEnabled = on
        if not espGenEnabled then
            removeGenEsp()
        end
    end)

    pages["Dandys World"] = page
end

createHome()
createDandysWorld()

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
            btn.TextColor3 = n==selectedSection and accentText or mainAccent
            btn.BackgroundTransparency = n==selectedSection and 0.08 or 0.7
            btn.BackgroundColor3 = n==selectedSection and mainAccent or Color3.fromRGB(51,51,36)
        end
        showTab(k)
    end)
end

for _,page in pairs(pages) do 
    page.Visible = false 
    page.Position = pageYEnd
end
pages["Home"].Visible = true

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

-- FECHAR: limpa tudo, restaura WalkSpeed, para loops de alteração!
close.MouseButton1Click:Connect(function()
    hubAberto = false
    removeTwistedEsp()
    removeGenEsp()
    if loopConn then loopConn:Disconnect() end
    if twistedEspConn then twistedEspConn:Disconnect() end
    if genEspConn then genEspConn:Disconnect() end
    if charConn then charConn:Disconnect() end
    -- Restaura WalkSpeed padrão
    local char = plr.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 end
    end
    gui:Destroy()
end)