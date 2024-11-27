
-- LocalScript for educational video showing a "cheat" to get guns instantly

-- Define the guns to be given
local gunNames = {"AKM", "MA1", "AKU-74SU"}
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local gunFolder = replicatedStorage:WaitForChild("Guns")  -- Folder with gun models

-- Create a simple GUI to make it look "cheat-like"
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local cheatButton = Instance.new("TextButton")
cheatButton.Size = UDim2.new(0, 200, 0, 50)
cheatButton.Position = UDim2.new(0.5, -100, 0.8, -25)
cheatButton.Text = "Activate Cheat!"
cheatButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red for cheat-like effect
cheatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cheatButton.Parent = screenGui

-- Function to instantly give guns (like a cheat)
local function giveGun(gunName)
    local gun = gunFolder:FindFirstChild(gunName)
    if gun then
        local clone = gun:Clone()  -- Clone and add it to the player's backpack
        clone.Parent = player.Backpack
        print(player.Name .. " has received " .. gunName)
    else
        print("Gun " .. gunName .. " not found!")
    end
end

-- Function to activate the cheat and give guns
cheatButton.MouseButton1Click:Connect(function()
    for _, gunName in ipairs(gunNames) do
        giveGun(gunName)  -- Give all guns in the list
    end
end)

-- Chat command to activate cheat (e.g., typing !cheat in chat)
game:GetService("Players").LocalPlayer.Chatted:Connect(function(message)
    if message:lower() == "!cheat" then  -- Typing !cheat will activate the cheat
        for _, gunName in ipairs(gunNames) do
            giveGun(gunName)  -- Give guns on command
        end
        print("Cheat activated by " .. player.Name)
    end
end)
