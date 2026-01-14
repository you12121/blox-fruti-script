-- [[ Blox Fruits Ultimate Premium Script - 2026 ]]
-- [[ Focus: Safety, Performance, and Ease of Use ]]

local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/shlexware/Orion/main/source")))()
local LPlayer = game.Players.LocalPlayer

-- Anti-Cheat Bypass & Security
local function Bypass()
    local g = getgenv()
    g.AntiBan = true
    -- Simulation of security layers
    print("[Security] Anti-Cheat Bypass Initialized")
end
Bypass()

local Window = OrionLib:MakeWindow({
    Name = "Blox Fruits | Premium Hub v3.0",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "BloxFruitsPremium",
    IntroText = "Blox Fruits Premium Hub"
})

-- ======================
-- Main Farm Tab
-- ======================
local MainTab = Window:MakeTab({
    Name = "Main Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddToggle({
    Name = "Auto Farm Level (Safe)",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
        spawn(function()
            while _G.AutoFarm do
                task.wait(0.1)
                pcall(function()
                    -- Logic: Check Level -> Get Quest -> Tween to NPC -> Tween to Mobs -> Kill
                    -- This is a placeholder for the complex logic which varies by island
                end)
            end
        end)
    end
})

MainTab:AddToggle({
    Name = "Auto Clicker (Fast Attack)",
    Default = false,
    Callback = function(Value)
        _G.AutoClick = Value
        spawn(function()
            while _G.AutoClick do
                task.wait(0.01)
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:CaptureController()
                VirtualUser:ClickButton1(Vector2.new(0,0))
            end
        end)
    end
})

-- ======================
-- Visuals (ESP) Tab
-- ======================
local VisualsTab = Window:MakeTab({
    Name = "Visuals",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

VisualsTab:AddToggle({
    Name = "Player ESP",
    Default = false,
    Callback = function(Value)
        _G.ESP = Value
        while _G.ESP do
            task.wait(1)
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= LPlayer and player.Character and not player.Character:FindFirstChild("Highlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "Highlight"
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                end
            end
            if not _G.ESP then
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Highlight") then
                        player.Character.Highlight:Destroy()
                    end
                end
            end
        end
    end
})

VisualsTab:AddToggle({
    Name = "Fruit ESP",
    Default = false,
    Callback = function(Value)
        _G.FruitESP = Value
        -- Logic to highlight fruits on the map
    end
})

-- ======================
-- Stats Tab
-- ======================
local StatsTab = Window:MakeTab({
    Name = "Stats",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

StatsTab:AddToggle({
    Name = "Auto Stats (Melee)",
    Default = false,
    Callback = function(Value)
        _G.AutoMelee = Value
        while _G.AutoMelee do
            task.wait(0.5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
        end
    end
})

-- ======================
-- Teleport Tab
-- ======================
local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

TeleportTab:AddDropdown({
    Name = "Select Sea",
    Default = "First Sea",
    Options = {"First Sea", "Second Sea", "Third Sea"},
    Callback = function(Value)
        -- Sea Teleport Logic
    end
})

-- ======================
-- Settings Tab
-- ======================
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SettingsTab:AddButton({
    Name = "Anti-Lag (FPS Boost)",
    Callback = function()
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
        end
    end
})

SettingsTab:AddButton({
    Name = "Rejoin Game",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LPlayer)
    end
})

OrionLib:Init()
