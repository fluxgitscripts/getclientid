-- ============================================
--        FLUX CLIENT ID GETTER
--        discord.gg/getflux
-- ============================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ============================================
-- GENERATE CLIENT ID
-- ============================================
local function getClientId()
    local userId = tostring(player.UserId)
    local accountAge = tostring(player.AccountAge)
    local placeId = tostring(game.PlaceId)
    local raw = userId .. "|" .. accountAge .. "|" .. placeId
    local hash = 5381
    for i = 1, #raw do
        hash = ((hash * 33) + string.byte(raw, i)) % 0xFFFFFFFF
    end
    return string.format("FLUX-%s-%08X", userId, hash)
end

local clientId = getClientId()
print("[Flux] Client ID: " .. clientId)

-- ============================================
-- BUILD GUI
-- ============================================

-- Remove existing GUI if re-executed
local existing = playerGui:FindFirstChild("FluxClientIdGui")
if existing then existing:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FluxClientIdGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

-- Backdrop blur overlay
local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.Position = UDim2.new(0, 0, 0, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.5
Overlay.BorderSizePixel = 0
Overlay.ZIndex = 1
Overlay.Parent = ScreenGui

-- Main card
local Card = Instance.new("Frame")
Card.Size = UDim2.new(0, 380, 0, 220)
Card.Position = UDim2.new(0.5, -190, 0.5, -110)
Card.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Card.BorderSizePixel = 0
Card.ZIndex = 2
Card.Parent = ScreenGui

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 14)
CardCorner.Parent = Card

-- Gold top accent bar
local AccentBar = Instance.new("Frame")
AccentBar.Size = UDim2.new(1, 0, 0, 4)
AccentBar.Position = UDim2.new(0, 0, 0, 0)
AccentBar.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
AccentBar.BorderSizePixel = 0
AccentBar.ZIndex = 3
AccentBar.Parent = Card

local AccentCorner = Instance.new("UICorner")
AccentCorner.CornerRadius = UDim.new(0, 14)
AccentCorner.Parent = AccentBar

-- Title: 👑 Flux VIP
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 36)
Title.Position = UDim2.new(0, 0, 0, 16)
Title.BackgroundTransparency = 1
Title.Text = "👑  Flux VIP"
Title.TextColor3 = Color3.fromRGB(255, 200, 0)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.ZIndex = 3
Title.Parent = Card

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Position = UDim2.new(0, 0, 0, 50)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Your Client ID"
Subtitle.TextColor3 = Color3.fromRGB(160, 160, 180)
Subtitle.TextSize = 13
Subtitle.Font = Enum.Font.Gotham
Subtitle.ZIndex = 3
Subtitle.Parent = Card

-- Client ID box background
local IdBox = Instance.new("Frame")
IdBox.Size = UDim2.new(1, -40, 0, 40)
IdBox.Position = UDim2.new(0, 20, 0, 76)
IdBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
IdBox.BorderSizePixel = 0
IdBox.ZIndex = 3
IdBox.Parent = Card

local IdBoxCorner = Instance.new("UICorner")
IdBoxCorner.CornerRadius = UDim.new(0, 8)
IdBoxCorner.Parent = IdBox

-- Client ID text
local IdLabel = Instance.new("TextLabel")
IdLabel.Size = UDim2.new(1, -16, 1, 0)
IdLabel.Position = UDim2.new(0, 8, 0, 0)
IdLabel.BackgroundTransparency = 1
IdLabel.Text = clientId
IdLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
IdLabel.TextSize = 14
IdLabel.Font = Enum.Font.RobotoMono
IdLabel.TextXAlignment = Enum.TextXAlignment.Center
IdLabel.ZIndex = 4
IdLabel.Parent = IdBox

-- Copy button
local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(1, -40, 0, 42)
CopyBtn.Position = UDim2.new(0, 20, 0, 130)
CopyBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
CopyBtn.BorderSizePixel = 0
CopyBtn.Text = "Copy Client ID"
CopyBtn.TextColor3 = Color3.fromRGB(10, 10, 15)
CopyBtn.TextSize = 15
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.ZIndex = 3
CopyBtn.Parent = Card

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 10)
CopyCorner.Parent = CopyBtn

-- Close button (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -36, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.ZIndex = 4
CloseBtn.Parent = Card

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Discord label at bottom
local DiscordLabel = Instance.new("TextLabel")
DiscordLabel.Size = UDim2.new(1, 0, 0, 20)
DiscordLabel.Position = UDim2.new(0, 0, 0, 192)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "discord.gg/getflux"
DiscordLabel.TextColor3 = Color3.fromRGB(80, 80, 100)
DiscordLabel.TextSize = 11
DiscordLabel.Font = Enum.Font.Gotham
DiscordLabel.ZIndex = 3
DiscordLabel.Parent = Card

-- ============================================
-- BUTTON LOGIC
-- ============================================

-- Copy to clipboard
CopyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(clientId)
    end)

    -- Visual feedback
    CopyBtn.Text = "✓ Copied!"
    CopyBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
    task.wait(1.5)
    CopyBtn.Text = "Copy Client ID"
    CopyBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
end)

-- Hover effect on copy button
CopyBtn.MouseEnter:Connect(function()
    CopyBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 50)
end)
CopyBtn.MouseLeave:Connect(function()
    if CopyBtn.Text == "Copy Client ID" then
        CopyBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    end
end)

-- Close button
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Close on overlay click
Overlay.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ScreenGui:Destroy()
    end
end)
