```
local player = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Stann Official",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

local Tab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "LocalPlayer"
})

OrionLib:MakeNotification({
    Name = "MER.GG",
    Content = "DESIGNED BY MER.GG",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Variables to track feature states
local walkSpeedEnabled = false
local jumpPowerEnabled = false
local lowGravityEnabled = false
local noclipEnabled = false

-- Function to enable/disable noclip
local function toggleNoclip()
    if noclipEnabled then
        -- Enable noclip
        local function onStepped()
            if player.Character then
                for _, v in pairs(player.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end

        -- Start a loop to continuously disable collision
        game:GetService("RunService").Stepped:Connect(onStepped)
    else
        -- Disable noclip
        if player.Character then
            for _, v in pairs(player.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = true
                end
            end
        end
    end
end

Tab:AddButton({
    Name = "Toggle Walk Speed",
    Callback = function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            walkSpeedEnabled = not walkSpeedEnabled
            player.Character.Humanoid.WalkSpeed = walkSpeedEnabled and 100 or 16 -- Default walkspeed is 16
            OrionLib:MakeNotification({
                Name = "Walk Speed",
                Content = walkSpeedEnabled and "Walk Speed Enabled" or "Walk Speed Disabled",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    end
})

Tab:AddButton({
    Name = "Toggle High Jump Power(outdated)",
    Callback = function()
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            jumpPowerEnabled = not jumpPowerEnabled
            player.Character.Humanoid.JumpPower = jumpPowerEnabled and 2000 or 50 -- Default jump power is 50
            OrionLib:MakeNotification({
                Name = "Jump Power",
                Content = jumpPowerEnabled and "High Jump Power Enabled" or "High Jump Power Disabled",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    end
})

Tab:AddButton({
    Name = "Toggle Low Gravity",
    Callback = function()
        lowGravityEnabled = not lowGravityEnabled
        game.Workspace.Gravity = lowGravityEnabled and 10 or 196.2 -- Default gravity is 196.2
        OrionLib:MakeNotification({
            Name = "Gravity",
            Content = lowGravityEnabled and "Low Gravity Enabled" or "Low Gravity Disabled",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

Tab:AddButton({
    Name = "Toggle Noclip",
    Callback = function()
        noclipEnabled = not noclipEnabled
        toggleNoclip()
        OrionLib:MakeNotification({
            Name = "Noclip",
            Content = noclipEnabled and "Noclip Enabled" or "Noclip Disabled",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})
```
