-- // Auto Farm ปูน INTELLIGENT v5.0 GLOBAL GOD 🔥💀🩸🤖⚡
-- getgenv() Global + Anti-Duplicate! Reload Safe! Money Apocalypse! 🤑🌪️
-- Upgraded by Exploiter God | NEVER RUN TWICE! Global Control Reigns!

-- 🔥 ANTI-DUPLICATE + getgenv() GLOBAL SYSTEM 🔥
if getgenv().PunFarmLoaded then
    game.StarterGui:SetCore("SendNotification", {
        Title = "🩸 PUN FARM v5 ALREADY LOADED! 💀";
        Text = "สคริปต์เทพยังรันอยู่! Kill UI เก่าก่อน หรือ Re-Execute! 🔥";
        Duration = 5;
    })
    return
end

getgenv().PunFarmLoaded = true
getgenv().Farming = false
getgenv().PunFarmGUI = nil
getgenv().OriginalCFrame = nil

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Global Positions
getgenv().OriginalCFrame = HumanoidRootPart.CFrame

-- พิกัดเลือด (Global Ready)
local ProxPart = workspace:WaitForChild("Prox")
local ProxCFrame = ProxPart.CFrame + Vector3.new(0, 5, 0)
local SellNPC = workspace:WaitForChild("MassiveRBLX"):WaitForChild("Torso")
local SellCFrame = SellNPC.CFrame + Vector3.new(0, 5, 0)

-- Auto-Search Prompts 🧠
local function FindProximityPrompt(parent)
    for _, obj in pairs(parent:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            print("✅ [FOUND] Prompt:", obj:GetFullName())
            return obj
        end
    end
    return nil
end

local GrabPrompt = FindProximityPrompt(ProxPart)
local SellPrompt = SellNPC:FindFirstChild("ProximityPrompt")

if not GrabPrompt then
    error("🛑 Grab Prompt NOT FOUND! F9 Console check paths.")
end

print("🩸 GLOBAL PUN FARM v5 LOADED! Grab:", GrabPrompt:GetFullName())

-- Cement AI Check 🤖
local function HasCement()
    local backpack = Player:FindFirstChild("Backpack")
    if backpack then
        local cement = backpack:FindFirstChild("Cement")
        local hasIt = cement ~= nil
        print("🧠 [AI CHECK] Has Cement:", hasIt and "YES 🤑" or "NO → Grab!")
        return hasIt
    end
    return false
end

-- INSTANT TELEPORT ฟ้าผ่า! ⚡
local function InstantTeleport(cframe)
    if HumanoidRootPart then
        HumanoidRootPart.CFrame = cframe
    end
end

-- Fire Prompt ไวไฟ!
local function FirePrompt(prompt)
    if prompt and prompt.Enabled then
        fireproximityprompt(prompt)
        task.wait(0.3)
    end
end

-- Global Farming Control! 🔥
local function StartFarming()
    if getgenv().Farming then 
        print("⚠️ [GLOBAL] Farm already running! Stop first.")
        return 
    end
    getgenv().Farming = true
    getgenv().OriginalCFrame = HumanoidRootPart.CFrame
    print("🚀 GLOBAL FARM ON! AI Cement Checker Active! 💰🤖")
    
    spawn(function()
        while getgenv().Farming do
            pcall(function()
                if HasCement() then
                    print("🤑 [AI] Has Cement → SELL!")
                    InstantTeleport(SellCFrame)
                    task.wait(0.2)
                    if SellPrompt then FirePrompt(SellPrompt) end
                    task.wait(0.4)
                else
                    print("🔨 [AI] No Cement → GRAB!")
                    InstantTeleport(ProxCFrame)
                    task.wait(0.2)
                    FirePrompt(GrabPrompt)
                    task.wait(0.4)
                end
                task.wait(0.2)
            end)
        end
    end)
end

local function StopFarming()
    getgenv().Farming = false
    if getgenv().OriginalCFrame and HumanoidRootPart then
        InstantTeleport(getgenv().OriginalCFrame)
    end
    print("🏠 GLOBAL FARM STOPPED! Back to safety! 💨")
end

-- Cleanup Old UI (Global Safe)
if getgenv().PunFarmGUI then
    pcall(function() getgenv().PunFarmGUI:Destroy() end)
end

-- // GLOBAL MINIMAL UI + X KILLER! 🖤✕
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local StartBtn = Instance.new("TextButton")
local StopBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "PunFarmAI_v5"

MainFrame.Size = UDim2.new(0, 220, 0, 120)
MainFrame.Position = UDim2.new(0.5, -110, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner", MainFrame)
Corner.CornerRadius = UDim.new(0, 16)
local Stroke = Instance.new("UIStroke", MainFrame)
Stroke.Color = Color3.fromRGB(255, 0, 0)
Stroke.Thickness = 3

StartBtn.Size = UDim2.new(0.45, 0, 0, 45)
StartBtn.Position = UDim2.new(0, 5, 0, 10)
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
StartBtn.Text = "START 🤖"
StartBtn.TextColor3 = Color3.new(1,1,1)
StartBtn.Font = Enum.Font.GothamBold
StartBtn.TextSize = 20
StartBtn.Parent = MainFrame
local StartCorner = Instance.new("UICorner", StartBtn)
StartCorner.CornerRadius = UDim.new(0, 12)

StopBtn.Size = UDim2.new(0.45, 0, 0, 45)
StopBtn.Position = UDim2.new(0.55, 0, 0, 10)
StopBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
StopBtn.Text = "STOP 🏠"
StopBtn.TextColor3 = Color3.new(1,1,1)
StopBtn.Font = Enum.Font.GothamBold
StopBtn.TextSize = 20
StopBtn.Parent = MainFrame
local StopCorner = Instance.new("UICorner", StopBtn)
StopCorner.CornerRadius = UDim.new(0, 12)

CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 24
CloseBtn.Parent = MainFrame
local XCorner = Instance.new("UICorner", CloseBtn)
XCorner.CornerRadius = UDim.new(0, 50)

-- Global UI Reference
getgenv().PunFarmGUI = ScreenGui

-- Events ดุร้าย Global! 🔥
StartBtn.MouseButton1Click:Connect(StartFarming)
StopBtn.MouseButton1Click:Connect(StopFarming)

CloseBtn.MouseButton1Click:Connect(function()
    StopFarming()
    ScreenGui:Destroy()
    getgenv().PunFarmGUI = nil
    print("💀 GLOBAL UI KILLED! Farm Stopped!")
end)

-- Global Auto Respawn God
Player.CharacterAdded:Connect(function(newChar)
    task.wait(2.5)
    Character = newChar
    HumanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
    if getgenv().Farming then
        task.wait(0.5)
        StartFarming()
    end
end)

-- Epic Global Notify!
game.StarterGui:SetCore("SendNotification", {
    Title = "🌍 GLOBAL PUN FARM v5! 🩸💀";
    Text = "getgenv() ACTIVE! Anti-Duplicate ON! กด START → เงินถล่ม! X=Kill All!";
    Duration = 8;
})

print("🩸💀🌍 GLOBAL INTELLIGENT CEMENT FARM v5 READY! Reload Safe! 🤑🩸💀")
print("💡 Tip: รันซ้ำได้! UI เก่าจะหายอัตโนมัติ!")
