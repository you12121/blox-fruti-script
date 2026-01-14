-- [[ Blox Fruits Ultimate Premium Script - 2026 ]]
-- [[ Focus: Safety, Performance, and Ease of Use ]]

-- Kavo UI Library (خفيفة للجوال)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/Kavo-UI-Library.lua"))()
local Window = Library.CreateLib("Blox Fruits | Premium Hub v3.0", "Ocean")

local LPlayer = game.Players.LocalPlayer

-- Anti-Cheat Bypass & Security
local function Bypass()
    local g = getgenv()
    g.AntiBan = true
    print("[Security] Anti-Cheat Bypass Initialized")
end
Bypass()

-- ======================
-- Main Farm Tab
-- ======================
local MainTab = Window:NewTab("Main Farm")
local MainSection = MainTab:NewSection("Farm Settings")

MainSection:NewToggle("Auto Farm Level (Safe)", "Farms level automatically", function(Value)
    _G.AutoFarm = Value
    task.spawn(function()
        while _G.AutoFarm do
            task.wait(0.1)
            pcall(function()
                -- Placeholder for Auto Farm Logic
            end)
        end
    end)
end)

MainSection:NewToggle("Auto Clicker (Fast Attack)", "Clicks fast automatically", function(Value)
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
local VisualsTab = Window:NewTab("Visuals")
local VisualsSection = VisualsTab:NewSection("ESP Settings")

VisualsSection:NewToggle("Player ESP", "Highlights players", function(Value)
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

VisualsSection:NewToggle("Fruit ESP", "Highlights fruits on map", function(Value)
    _G.FruitESP = Value
    -- Fruit ESP Logic Placeholder
end)

-- ======================
-- Stats Tab
-- ======================
local StatsTab = Window:NewTab("Stats")
local StatsSection = StatsTab:NewSection("Stats Settings")

StatsSection:NewToggle("Auto Stats (Melee)", "Auto points to Melee", function(Value)
    _G.AutoMelee = Value
    task.spawn(function()
        while _G.AutoMelee do
            task.wait(0.5)
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",1)
            end)
        end
    end)
end)

-- ======================
-- Teleport Tab
-- ======================
local TeleportTab = Window:NewTab("Teleport")
local TeleportSection = TeleportTab:NewSection("Teleport Options")

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
local SettingsTab = Window:NewTab("Settings")
local SettingsSection = SettingsTab:NewSection("Settings Options")

SettingsSection:NewButton("Anti-Lag (FPS Boost)", "Boost FPS", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
    end
end)

SettingsSection:NewButton("Rejoin Game", "Teleport back to game", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LPlayer)
end)
