repeat
	wait()
until game:IsLoaded()
if game.PlaceId== 4503309821 then

--// 🌒 Deekseek Map Loader v2.0.2 — จูซิง เอดิชั่น (ลบทันทีหลังโหลดเสร็จ)
--// ใช้: แก้ไขตาราง MapConfigs แล้วรัน; หากแมพตรงจะโชว์หน้าจอโหลดแล้วหายวับ

--// ====================== 🗺️ ตั้งค่าสมรภูมิของคุณที่นี่ ======================
local MapConfigs = {
    {
        PlaceId = 7304314747,
        Name = "Identity Fraud Horror Game",
        ScriptUrl = "https://raw.githubusercontent.com/wino444/EclipseX-Commands/main/Run_Command/Identity%20Fraud%20Horror%20Game.lua"
    },
    {
        PlaceId = 4503309821,
        Name = "เมืองไทย2",
        ScriptUrl = "https://raw.githubusercontent.com/wino444/EclipseX-Commands/main/Run_Command/Thailand.lua"
    },
    -- เพิ่มแมพอื่น ๆ ได้ตามใจ
}

--// ====================== 🧩 ไลบรารีเสริม ======================
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:FindFirstChildOfClass("PlayerGui")

--// ====================== 🌌 ฟังก์ชันสร้าง Loading Screen ======================
local function createLoadingScreen(mapName)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DeekseekLoader"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    -- ฉากหลังดำ (ใช้ fade-out)
    local background = Instance.new("Frame")
    background.Name = "LoadingBackground"
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    background.BackgroundTransparency = 0.6
    background.Parent = screenGui

    -- คอนเทนเนอร์หลัก
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 320, 0, 200)
    container.Position = UDim2.new(0.5, -160, 0.5, -100)
    container.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    container.BackgroundTransparency = 0.1
    container.BorderSizePixel = 0
    container.Parent = screenGui

    -- ขอบเรืองแสง
    local border = Instance.new("Frame")
    border.Size = UDim2.new(1, 8, 1, 8)
    border.Position = UDim2.new(0, -4, 0, -4)
    border.BackgroundColor3 = Color3.fromRGB(120, 80, 200)
    border.BackgroundTransparency = 0.4
    border.BorderSizePixel = 0
    border.ZIndex = 0
    border.Parent = container

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 12)
    uiCorner.Parent = container

    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 14)
    borderCorner.Parent = border

    -- ชื่อแมพ
    local mapNameLabel = Instance.new("TextLabel")
    mapNameLabel.Size = UDim2.new(1, -30, 0, 40)
    mapNameLabel.Position = UDim2.new(0, 15, 0, 30)
    mapNameLabel.BackgroundTransparency = 1
    mapNameLabel.Font = Enum.Font.GothamBold
    mapNameLabel.Text = "🗺️ " .. mapName
    mapNameLabel.TextColor3 = Color3.fromRGB(220, 200, 255)
    mapNameLabel.TextSize = 20
    mapNameLabel.TextXAlignment = Enum.TextXAlignment.Center
    mapNameLabel.Parent = container

    -- สถานะ
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, -30, 0, 30)
    statusLabel.Position = UDim2.new(0, 15, 0, 80)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Font = Enum.Font.GothamMedium
    statusLabel.Text = "⚡ กำลังเชื่อมต่อ..."
    statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusLabel.TextSize = 16
    statusLabel.TextXAlignment = Enum.TextXAlignment.Center
    statusLabel.Parent = container

    -- แถบโหลด
    local progressFrame = Instance.new("Frame")
    progressFrame.Size = UDim2.new(1, -40, 0, 10)
    progressFrame.Position = UDim2.new(0, 20, 0, 130)
    progressFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    progressFrame.BorderSizePixel = 0
    progressFrame.Parent = container

    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0, 0, 1, 0)
    progressBar.Position = UDim2.new(0, 0, 0, 0)
    progressBar.BackgroundColor3 = Color3.fromRGB(180, 50, 220)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = progressFrame

    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(0, 5)
    progressCorner.Parent = progressFrame

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 5)
    barCorner.Parent = progressBar

    -- เครดิต wino444
    local creditLabel = Instance.new("TextLabel")
    creditLabel.Size = UDim2.new(1, -20, 0, 20)
    creditLabel.Position = UDim2.new(0, 10, 1, -25)
    creditLabel.BackgroundTransparency = 1
    creditLabel.Font = Enum.Font.GothamSemibold
    creditLabel.Text = "Created by wino444"
    creditLabel.TextColor3 = Color3.fromRGB(150, 100, 200)
    creditLabel.TextSize = 12
    creditLabel.TextXAlignment = Enum.TextXAlignment.Center
    creditLabel.Parent = container

    -- fade-in เริ่มต้น
    local fadeIn = TweenService:Create(container, TweenInfo.new(0.5), {BackgroundTransparency = 0.1})
    fadeIn:Play()

    local function updateStatus(text, color)
        statusLabel.Text = text
        statusLabel.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    end

    local function finishLoading(success, errorMsg)
        if success then
            updateStatus("✅ โหลดสำเร็จ", Color3.fromRGB(50, 255, 50))
            progressBar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 0.3)
        else
            updateStatus("❌ โหลดไม่สำเร็จ", Color3.fromRGB(255, 50, 50))
            progressBar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 0.3)
            local errLabel = Instance.new("TextLabel")
            errLabel.Size = UDim2.new(1, -20, 0, 20)
            errLabel.Position = UDim2.new(0, 10, 0, 160)
            errLabel.BackgroundTransparency = 1
            errLabel.Font = Enum.Font.GothamMedium
            errLabel.Text = "⛔ " .. tostring(errorMsg or "unknown")
            errLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            errLabel.TextSize = 12
            errLabel.TextXAlignment = Enum.TextXAlignment.Center
            errLabel.Parent = container
        end

        -- 🔥 เริ่มสลายทันที ไม่รอ 2 วิแล้ว!
        local bg = screenGui:FindFirstChild("LoadingBackground")
        if bg then
            local fadeOut = TweenService:Create(bg, TweenInfo.new(0.8), {BackgroundTransparency = 1})
            fadeOut:Play()
            fadeOut.Completed:Connect(function()
                screenGui:Destroy()
            end)
        else
            screenGui:Destroy()
        end
    end

    return {
        screenGui = screenGui,
        progressBar = progressBar,
        updateStatus = updateStatus,
        finishLoading = finishLoading
    }
end

--// ====================== ⚔️ ระบบโหลดอัตโนมัติ ======================
local currentPlaceId = game.PlaceId
local matchedMap = nil

for _, map in ipairs(MapConfigs) do
    if map.PlaceId == currentPlaceId then
        matchedMap = map
        break
    end
end

if not matchedMap then
    warn("[MapLoader] 🚫 ไม่รับรองแมพนี้ (PlaceId: " .. currentPlaceId .. ")")
    print("[MapLoader] ❌ ไม่มีการตั้งค่าสำหรับแมพนี้ — E0 ไม่รับรอง")
    return
end

print("[MapLoader] 🗺️ แมพที่พบ: " .. matchedMap.Name .. " (PlaceId: " .. currentPlaceId .. ")")
print("[MapLoader] 📜 กำลังโหลดสคริปต์: " .. matchedMap.Name)

local loader = createLoadingScreen(matchedMap.Name)

-- จำลองแถบถึง 90%
local progress = 0
local progressConnection
progressConnection = game:GetService("RunService").Heartbeat:Connect(function(delta)
    if progress < 0.9 then
        progress = math.min(progress + delta * 0.8, 0.9)
        loader.progressBar.Size = UDim2.new(progress, 0, 1, 0)
    end
end)

-- โหลดจริง
local success, err = pcall(function()
    loadstring(game:HttpGet(matchedMap.ScriptUrl))()
end)

if progressConnection then
    progressConnection:Disconnect()
end

if success then
    print("[MapLoader] ✅ โหลดสคริปต์สำเร็จ: " .. matchedMap.Name)
    loader.finishLoading(true)
else
    warn("[MapLoader] ❌ โหลดสคริปต์ไม่สำเร็จ: " .. tostring(err))
    print("[MapLoader] ⚠️ ข้อผิดพลาด: " .. tostring(err))
    loader.finishLoading(false, err)
end

end
