getgenv().autoSell = false
getgenv().infiniteMoney = false
getgenv().infiniteLevels = false

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Reddy Hub: Destruction Simulator",
	LoadingTitle = "Reddy Hub",
	LoadingSubtitle = "by Reddy",
	ConfigurationSaving = {
		Enabled = false,
		FileName = "Big Hub"
	},
	KeySystem = false, -- Set this to true to use our key system
})

local Tab = Window:CreateTab("Main")

local Button = Tab:CreateButton({
	Name = "Make your gun OP",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:getDescendants()) do
            if v.Name == "Stats" then
                local gunStats = v
                local g = require(gunStats)
                g.Cooldown = 0
                g.BlastForce = math.huge
                g.BlastRadius = math.huge
                g.RocketSpeed = math.huge
                g.ShotgunAmount = 50
            end
        end
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Sell",
	CurrentValue = false,
	Callback = function(Value)
		getgenv().autoSell = Value
        autoSell()
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Get Infinite Money",
	CurrentValue = false,
	Callback = function(Value)
		getgenv().infiniteMoney = Value
        getInfiniteMoney()
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Get Infinite Levels",
	CurrentValue = false,
	Callback = function(Value)
		getgenv().infiniteLevels = Value
        getInfiniteLevels()
	end,
})

local Slider = Tab:CreateSlider({
	Name = "Walkspeed",
	Range = {16, 300},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Callback = function(Value)
		changeWalkSpeed(Value)
	end,
})

print("This script is created by Reddy#6616")

function autoSell()
    spawn(function()
        while getgenv().autoSell == true do
            game:GetService("ReplicatedStorage").Remotes.sellBricks:FireServer()
            wait(1)
        end
    end)
end

function getInfiniteMoney()
    spawn(function()
        while getgenv().infiniteMoney == true do
            game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 10000000, 99999999)
        wait()
        end
    end)
end

function getInfiniteLevels()
    spawn(function()
        while getgenv().infiniteLevels == true do
            game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
        wait()
        end
    end)
end

function optimizeGame()
    spawn(function()
        while true do
            for i,v in pairs(game:GetService("Workspace").Debris:getDescendants()) do
                if v.Name == "Boom" then
                    v.Parent.Transparency = 1
                end
            end
        wait(10)
        end
    end)
end

function changeWalkSpeed(speed)
    spawn (function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end)
end

optimizeGame()