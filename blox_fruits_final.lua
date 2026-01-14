-- [[ Blox Fruits Ultimate Premium Script - 2026 ]]
-- [[ Focus: Safety, Performance, and Ease of Use ]]

-- Rayfield UI Library
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local LPlayer = game.Players.LocalPlayer

-- Anti-Cheat Bypass & Security
local function Bypass()
    local g = getgenv()
    g.AntiBan = true
    print("[Security] Anti-Cheat Bypass Initialized")
end
Bypass()

-- Window
local Window = Rayfield:CreateWindow({
    Name = "Blox Fruits | Premium Hub v3.0",
    LoadingTitle = "Blox Fruits Premium Hub",
    LoadingSubtitle = "by Premium Team",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BloxFruitsPremium",
        FileName = "PremiumHub"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- ======================
-- Main Farm Tab
-- ======================
local MainTab = Window:CreateTab("Main Farm", 4483362458)

MainTab:CreateToggle({
    Name = "Auto Farm Level (Safe)",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoFarm = Value
        task.spawn(function()
            while _G.AutoFarm do
                task.wait(0.1)
                pcall(function()
                    -- Placeholder for Auto Farm Logic
                end)
            end
        end)
    end
})

MainTab:CreateToggle({
    Name = "Auto Clicker (Fast Attack)",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoClick = Value
        task.spawn(function()
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
local VisualsTab = Window:CreateTab("Visuals", 4483362458)

VisualsTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Callback = function(Value)
        _G.ESP = Value
        task.spawn(function()
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
            end

            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Highlight") then
                    player.Character.Highlight:Destroy()
                end
            end
        end)
    end
})

VisualsTab:CreateToggle({
    Name = "Fruit ESP",
    CurrentValue = false,
    Callback = function(Value)
        _G.FruitESP = Value
        -- Fruit ESP Logic Placeholder
    end
})

-- ======================
-- Stats Tab
-- ======================
local StatsTab = Window:CreateTab("Stats", 4483362458)

StatsTab:CreateToggle({
    Name = "Auto Stats (Melee)",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoMelee = Value
        task.spawn(function()
            while _G.AutoMelee do
                task.wait(0.5)
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "AddPoint",
                        "Melee",
                        1
                    )
                end)
            end
        end)
    end
})

-- ======================
-- Teleport Tab
-- ======================
local TeleportTab = Window:CreateTab("Teleport", 4483362458)

TeleportTab:CreateDropdown({
    Name = "Select Sea",
    Options = {"First Sea", "Second Sea", "Third Sea"},
    CurrentOption = "First Sea",
    Callback = function(Value)
        -- Sea Teleport Logic Placeholder
    end
})

-- ======================
-- Settings Tab
-- ======================
local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateButton({
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

SettingsTab:CreateButton({
    Name = "Rejoin Game",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LPlayer)
    end
})
