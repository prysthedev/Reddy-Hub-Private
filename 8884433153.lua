local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Reddy Hub: Collect All Pets!", IntroText = "Reddy Hub"})
local LocalPlayer = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://8945416692",
})

Main:AddToggle({
    Name = "Auto Collect All Coins",
    Callback = function(Value)
        shared.AutoCollectCoins = value
        if shared.AutoCollectCoins == true then
            for i,v in ipairs(game:GetService("Workspace").Drops) do 
                if v.Name == "GoldDrop_Small" then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = new.CFrame(v.Base.CFrame)
                    wait(.2)
                end
            end
        end
    end
})