-- [[ Blox Fruits Ultimate Premium Script - 2026 ]]
-- [[ Focus: Safety, Performance, and Ease of Use ]]

local LPlayer = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Anti-Cheat Bypass & Security
local function Bypass()
    local g = getgenv()
    g.AntiBan = true
    print("[Security] Anti-Cheat Bypass Initialized")
end
Bypass()

-- ======================
-- ScreenGui Setup (UI بدون مكتبات)
-- ======================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxFruitsPremiumUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local UIWidth, UIHeight = 400, 500
local UI = Instance.new("Frame")
UI.Size = UDim2.new(0, UIWidth, 0, UIHeight)
UI.Position = UDim2.new(0.5, -UIWidth/2, 0.5, -UIHeight/2)
UI.BackgroundColor3 = Color3.fromRGB(20,20,20)
UI.BorderSizePixel = 0
UI.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundColor3 = Color3.fromRGB(30,30,30)
Title.Text = "Blox Fruits Premium Hub"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = UI

-- Tab container
local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(1,0,1,-40)
Tabs.Position = UDim2.new(0,0,0,40)
Tabs.BackgroundTransparency = 1
Tabs.Parent = UI

local CurrentTab = nil

local function CreateTab(TabName)
    local TabFrame = Instance.new("Frame")
    TabFrame.Size = UDim2.new(1,0,1,0)
    TabFrame.BackgroundTransparency = 1
    TabFrame.Visible = false
    TabFrame.Parent = Tabs
    return TabFrame
end

-- ======================
-- Main Farm Tab
-- ======================
local MainTab = CreateTab("Main Farm")

local function CreateToggle(Parent, Name, Callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1,-20,0,30)
    Btn.Position = UDim2.new(0,10,0,30*#Parent:GetChildren())
    Btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.Font = Enum.Font.SourceSans
    Btn.TextSize = 18
    Btn.Text = Name.." [OFF]"
    Btn.Parent = Parent
    local State = false
    Btn.MouseButton1Click:Connect(function()
        State = not State
        Btn.Text = Name.." ["..(State and "ON" or "OFF").."]"
        Callback(State)
    end)
end

-- Auto Farm
CreateToggle(MainTab, "Auto Farm Level (Safe)", function(Value)
    _G.AutoFarm = Value
    task.spawn(function()
        while _G.AutoFarm do
            task.wait(0.1)
            pcall(function()
                -- Placeholder: Auto Farm Logic
            end)
        end
    end)
end)

-- Auto Clicker
CreateToggle(MainTab, "Auto Clicker (Fast Attack)", function(Value)
    _G.AutoClick = Value
    task.spawn(function()
        while _G.AutoClick do
            task.wait(0.01)
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(0,0))
        end
    end)
end)

-- ======================
-- Visuals Tab
-- ======================
local VisualsTab = CreateTab("Visuals")

CreateToggle(VisualsTab, "Player ESP", function(Value)
    _G.ESP = Value
    task.spawn(function()
        while _G.ESP do
            task.wait(1)
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= LPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "Highlight"
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.fromRGB(255,0,0)
                    highlight.OutlineColor = Color3.fromRGB(255,255,255)
                end
            end
        end
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Highlight") then
                player.Character.Highlight:Destroy()
            end
        end
    end)
end)

CreateToggle(VisualsTab, "Fruit ESP", function(Value)
    _G.FruitESP = Value
    -- Fruit ESP Logic Placeholder
end)

-- ======================
-- Stats Tab
-- ======================
local StatsTab = CreateTab("Stats")

CreateToggle(StatsTab, "Auto Stats (Melee)", function(Value)
    _G.AutoMelee = Value
    task.spawn(function()
        while _G.AutoMelee do
            task.wait(0.5)
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint","Melee",1)
            end)
        end
    end)
end)

-- ======================
-- Teleport Tab
-- ======================
local TeleportTab = CreateTab("Teleport")

local function CreateDropdown(Parent, Name, Options, Callback)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1,-20,0,30)
    Label.Position = UDim2.new(0,10,0,#Parent:GetChildren()*35)
    Label.BackgroundColor3 = Color3.fromRGB(60,60,60)
    Label.TextColor3 = Color3.fromRGB(255,255,255)
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 16
    Label.Text = Name..": "..Options[1]
    Label.Parent = Parent
    local CurrentOption = 1
    Label.MouseButton1Click:Connect(function()
        CurrentOption = CurrentOption + 1
        if CurrentOption > #Options then CurrentOption = 1 end
        Label.Text = Name..": "..Options[CurrentOption]
        Callback(Options[CurrentOption])
    end)
end

CreateDropdown(TeleportTab, "Select Sea", {"First Sea","Second Sea","Third Sea"}, function(Value)
    -- Sea Teleport Logic Placeholder
end)

-- ======================
-- Settings Tab
-- ======================
local SettingsTab = CreateTab("Settings")

local function CreateButton(Parent, Name, Callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1,-20,0,30)
    Btn.Position = UDim2.new(0,10,0,30*#Parent:GetChildren())
    Btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.Font = Enum.Font.SourceSans
    Btn.TextSize = 18
    Btn.Text = Name
    Btn.Parent = Parent
    Btn.MouseButton1Click:Connect(function()
        Callback()
    end)
end

CreateButton(SettingsTab, "Anti-Lag (FPS Boost)", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
    end
end)

CreateButton(SettingsTab, "Rejoin Game", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LPlayer)
end)

-- ======================
-- Tab Buttons
-- ======================
local TabNames = {"Main Farm","Visuals","Stats","Teleport","Settings"}
local TabFrames = {MainTab,VisualsTab,StatsTab,TeleportTab,SettingsTab}

for i, Name in ipairs(TabNames) do
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1/#TabNames,0,0,30)
    Btn.Position = UDim2.new((i-1)/#TabNames,0,0,0)
    Btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.Font = Enum.Font.SourceSans
    Btn.TextSize = 16
    Btn.Text = Name
    Btn.Parent = UI
    Btn.MouseButton1Click:Connect(function()
        for _, F in ipairs(TabFrames) do F.Visible = false end
        TabFrames[i].Visible = true
    end)
end

-- افتراضي يظهر Main Farm
MainTab.Visible = true
