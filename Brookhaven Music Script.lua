-- 🎵🛹 Brookhaven Music Script | Dark Glassmorphism UI
-- TopBar Button | Draggable | Boombox + Skateboard

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RE = game:GetService("ReplicatedStorage"):WaitForChild("RE")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 🎨 สร้าง ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MusicUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

-- ══════════════════════════════════
-- 🔘 TopBar Button
-- ══════════════════════════════════
local TopBarButton = Instance.new("ImageButton")
TopBarButton.Name = "TopBarBtn"
TopBarButton.Size = UDim2.new(0, 36, 0, 36)
TopBarButton.Position = UDim2.new(0, 8, 0, 8)
TopBarButton.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
TopBarButton.BorderSizePixel = 0
TopBarButton.Image = ""
TopBarButton.ZIndex = 10
TopBarButton.Parent = ScreenGui

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(1, 0)
TopBarCorner.Parent = TopBarButton

local TopBarStroke = Instance.new("UIStroke")
TopBarStroke.Color = Color3.fromRGB(120, 80, 255)
TopBarStroke.Thickness = 1.5
TopBarStroke.Parent = TopBarButton

local TopBarLabel = Instance.new("TextLabel")
TopBarLabel.Size = UDim2.new(1, 0, 1, 0)
TopBarLabel.BackgroundTransparency = 1
TopBarLabel.Text = "🎵"
TopBarLabel.TextScaled = true
TopBarLabel.Font = Enum.Font.GothamBold
TopBarLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TopBarLabel.Parent = TopBarButton

-- ══════════════════════════════════
-- 🪟 Main Frame (Glassmorphism)
-- ══════════════════════════════════
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 320)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BackgroundTransparency = 0.25
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.ZIndex = 5
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(120, 80, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

-- 🌟 Gradient
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 15, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 30))
})
Gradient.Rotation = 135
Gradient.Parent = MainFrame

-- ══════════════════════════════════
-- 🏷️ Title Bar
-- ══════════════════════════════════
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 10, 55)
TitleBar.BackgroundTransparency = 0.3
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex = 6
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 16)
TitleCorner.Parent = TitleBar

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0.5, 0)
TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleFix.BackgroundColor3 = Color3.fromRGB(25, 10, 55)
TitleFix.BackgroundTransparency = 0.3
TitleFix.BorderSizePixel = 0
TitleFix.ZIndex = 6
TitleFix.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🎵 Brookhaven Music"
TitleLabel.TextColor3 = Color3.fromRGB(200, 160, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 7
TitleLabel.Parent = TitleBar

-- ❌ Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -36, 0.5, -14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 80)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.ZIndex = 8
CloseBtn.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

-- ══════════════════════════════════
-- 🔊 Boombox Section
-- ══════════════════════════════════
local function createLabel(text, posY, parent)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -30, 0, 20)
    lbl.Position = UDim2.new(0, 15, 0, posY)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(180, 140, 255)
    lbl.TextScaled = true
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6
    lbl.Parent = parent
    return lbl
end

local function createInput(posY, defaultText, parent)
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, -30, 0, 36)
    box.Position = UDim2.new(0, 15, 0, posY)
    box.BackgroundColor3 = Color3.fromRGB(20, 10, 45)
    box.BackgroundTransparency = 0.3
    box.BorderSizePixel = 0
    box.Text = defaultText
    box.PlaceholderText = "กรอก Audio ID..."
    box.TextColor3 = Color3.fromRGB(230, 210, 255)
    box.PlaceholderColor3 = Color3.fromRGB(120, 100, 160)
    box.TextScaled = true
    box.Font = Enum.Font.Gotham
    box.ClearTextOnFocus = false
    box.ZIndex = 6
    box.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = box

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(100, 60, 200)
    stroke.Thickness = 1
    stroke.Parent = box

    return box
end

local function createButton(text, posY, color, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -30, 0, 38)
    btn.Position = UDim2.new(0, 15, 0, posY)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.ZIndex = 6
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = btn

    return btn
end

-- 🎙️ Labels + Inputs
createLabel("🔊 Boombox — Audio ID", 55, MainFrame)
local BoomboxInput = createInput(78, "9048375035", MainFrame)

createLabel("🛹 Skateboard — Audio ID", 128, MainFrame)
local SkateInput = createInput(151, "87249742743145", MainFrame)

-- 🎵 Play Both
local PlayBothBtn = createButton("▶ เปิดทั้งคู่ 🎵🛹", 202, Color3.fromRGB(100, 50, 220), MainFrame)

-- 🔊 Play Boombox only
local PlayBoomBtn = createButton("🔊 เปิดแค่ Boombox", 248, Color3.fromRGB(60, 40, 140), MainFrame)

-- 🛹 Play Skate only
local PlaySkateBtn = createButton("🛹 เปิดแค่ Skateboard", 294, Color3.fromRGB(60, 40, 140), MainFrame)

-- ══════════════════════════════════
-- 🖱️ Drag System
-- ══════════════════════════════════
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMove) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- ══════════════════════════════════
-- 🎬 Tween Open/Close
-- ══════════════════════════════════
local isOpen = false

local function openUI()
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 300, 0, 340),
        Position = UDim2.new(0.5, -150, 0.5, -170)
    }):Play()
    isOpen = true
end

local function closeUI()
    local tween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    tween:Play()
    tween.Completed:Connect(function()
        MainFrame.Visible = false
    end)
    isOpen = false
end

-- ══════════════════════════════════
-- 🔗 Button Events
-- ══════════════════════════════════
TopBarButton.MouseButton1Click:Connect(function()
    if isOpen then closeUI() else openUI() end
end)

CloseBtn.MouseButton1Click:Connect(function()
    closeUI()
end)

-- ▶ เปิดทั้งคู่
PlayBothBtn.MouseButton1Click:Connect(function()
    RE:WaitForChild("PlayerToolEvent"):FireServer("ToolMusicText", BoomboxInput.Text, nil, true)
    RE:WaitForChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", SkateInput.Text, nil, true)
end)

-- 🔊 เปิดแค่ Boombox
PlayBoomBtn.MouseButton1Click:Connect(function()
    RE:WaitForChild("PlayerToolEvent"):FireServer("ToolMusicText", BoomboxInput.Text, nil, true)
end)

-- 🛹 เปิดแค่ Skateboard
PlaySkateBtn.MouseButton1Click:Connect(function()
    RE:WaitForChild("PlayerToolEvent"):FireServer("PickingScooterMusicText", SkateInput.Text, nil, true)
end)
