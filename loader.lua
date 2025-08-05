local Players = game:GetService("Players")
local player = Players.LocalPlayer
local userId = player.UserId

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "TradeUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 220)
frame.Position = UDim2.new(0.5, -175, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Title Text
local title = Instance.new("TextLabel")
title.Text = "freeze trade @redo"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = frame

-- Profile Picture
local pfp = Instance.new("ImageLabel")
pfp.Size = UDim2.new(0, 80, 0, 80)
pfp.Position = UDim2.new(0, 10, 0, 50)
pfp.BackgroundTransparency = 1
pfp.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
pfp.Parent = frame

-- Username Text
local username = Instance.new("TextLabel")
username.Text = player.Name
username.Position = UDim2.new(0, 100, 0, 70)
username.Size = UDim2.new(0, 230, 0, 40)
username.BackgroundTransparency = 1
username.TextColor3 = Color3.fromRGB(255, 255, 255)
username.Font = Enum.Font.SourceSans
username.TextScaled = true
username.TextXAlignment = Enum.TextXAlignment.Left
username.Parent = frame

-- Freeze Button
local freezeBtn = Instance.new("TextButton")
freezeBtn.Size = UDim2.new(0.4, 0, 0, 40)
freezeBtn.Position = UDim2.new(0.05, 0, 1, -50)
freezeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
freezeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
freezeBtn.Font = Enum.Font.SourceSansBold
freezeBtn.Text = "Freeze"
freezeBtn.TextScaled = true
freezeBtn.Parent = frame

-- Auto Accept Button
local autoBtn = Instance.new("TextButton")
autoBtn.Size = UDim2.new(0.4, 0, 0, 40)
autoBtn.Position = UDim2.new(0.55, 0, 1, -50)
autoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
autoBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
autoBtn.Font = Enum.Font.SourceSansBold
autoBtn.Text = "Auto Accept"
autoBtn.TextScaled = true
autoBtn.Parent = frame

-- Button functionality (example behavior)
freezeBtn.MouseButton1Click:Connect(function()
    print("Freeze Trade triggered!")
    -- Add your freeze logic here
end)

autoBtn.MouseButton1Click:Connect(function()
    print("Auto Accept triggered!")
    -- Add your auto accept logic here
end)
