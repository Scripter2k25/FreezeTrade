local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local userId = player.UserId

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "TradeUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.3 -- low transparency
frame.BorderSizePixel = 0
frame.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Text = "freeze trade @redo"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = frame

-- Your Profile Picture
local yourPfp = Instance.new("ImageLabel")
yourPfp.Size = UDim2.new(0, 80, 0, 80)
yourPfp.Position = UDim2.new(0, 10, 0, 50)
yourPfp.BackgroundTransparency = 1
yourPfp.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
yourPfp.Parent = frame

-- Your Username
local yourName = Instance.new("TextLabel")
yourName.Text = player.Name
yourName.Position = UDim2.new(0, 100, 0, 70)
yourName.Size = UDim2.new(0, 250, 0, 40)
yourName.BackgroundTransparency = 1
yourName.TextColor3 = Color3.fromRGB(255, 255, 255)
yourName.Font = Enum.Font.SourceSans
yourName.TextScaled = true
yourName.TextXAlignment = Enum.TextXAlignment.Left
yourName.Parent = frame

-- Input Box
local inputBox = Instance.new("TextBox")
inputBox.PlaceholderText = "Enter username"
inputBox.Size = UDim2.new(0.9, 0, 0, 35)
inputBox.Position = UDim2.new(0.05, 0, 0, 150)
inputBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.Font = Enum.Font.SourceSans
inputBox.TextScaled = true
inputBox.ClearTextOnFocus = false
inputBox.Parent = frame

-- Searched Profile Picture
local targetPfp = Instance.new("ImageLabel")
targetPfp.Size = UDim2.new(0, 80, 0, 80)
targetPfp.Position = UDim2.new(0, 10, 0, 190)
targetPfp.BackgroundTransparency = 1
targetPfp.Image = ""
targetPfp.Parent = frame

-- Freeze Button
local freezeBtn = Instance.new("TextButton")
freezeBtn.Size = UDim2.new(0.4, 0, 0, 40)
freezeBtn.Position = UDim2.new(0.05, 0, 1, -50)
freezeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
freezeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
freezeBtn.Font = Enum.Font.SourceSansBold
freezeBtn.Text = "Freeze Trade"
freezeBtn.TextScaled = true
freezeBtn.Parent = frame

-- Accept Button
local acceptBtn = Instance.new("TextButton")
acceptBtn.Size = UDim2.new(0.4, 0, 0, 40)
acceptBtn.Position = UDim2.new(0.55, 0, 1, -50)
acceptBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
acceptBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
acceptBtn.Font = Enum.Font.SourceSansBold
acceptBtn.Text = "Auto Accept"
acceptBtn.TextScaled = true
acceptBtn.Parent = frame

-- Button Effects
local function onClick(btn)
	btn.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	wait(0.1)
	btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
end

-- Button Actions
freezeBtn.MouseButton1Click:Connect(function()
	onClick(freezeBtn)
	print("Freeze Trade Clicked!")
	-- Insert your freeze trade logic here
end)

acceptBtn.MouseButton1Click:Connect(function()
	onClick(acceptBtn)
	print("Auto Accept Clicked!")
	-- Insert your auto accept logic here
end)

-- Username Search Functionality
inputBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local username = inputBox.Text
		if username ~= "" then
			-- Use Roblox API to get UserId
			local success, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet("https://api.roblox.com/users/get-by-username?username=" .. username))
			end)
			
			if success and result and result.Id then
				local targetId = result.Id
				targetPfp.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. targetId .. "&width=420&height=420&format=png"
			else
				targetPfp.Image = ""
				warn("User not found or API error.")
			end
		end
	end
end)
