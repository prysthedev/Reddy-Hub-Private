getgenv().autoSell = false
getgenv().infiniteMoney = false
getgenv().infiniteLevels = false

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Destruction Simulator",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://discord.gg/HjdtekKvDs"
}

local Tab = GUI:Tab{
	Name = "Main",
}

Tab:Button{
	Name = "Make your gun OP",
	Description = "This will remove reload cooldown from your gun.",
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
    GUI:Notification{
        Title = "Notification",
        Text = "Made your gun OP.",
        Duration = 3,
        Callback = function() end
    }
    end
}

Tab:Button{
	Name = "Copy Discord Invite",
	Description = "This will copy discord invite into your clipboard.",
	Callback = function()
        setclipboard("https://discord.gg/HjdtekKvDs")
        GUI:Notification{
            Title = "Notification",
            Text = "Copied discord server to your clipboard.",
            Duration = 3,
            Callback = function() end
        }
    end
}

Tab:Toggle{
	Name = "AutoSell",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().autoSell = state
        autoSell()
    end
}

Tab:Toggle{
	Name = "Get Infinite Money",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().infiniteMoney = state
        getInfiniteMoney()
    end
}

Tab:Toggle{
	Name = "Get Infinite Levels",
	StartingState = false,
	Description = nil,
	Callback = function(state) 
        getgenv().infiniteLevels = state
        getInfiniteLevels()
    end
}


b:Slider("WalkSpeed",{
    min = 16;
    max = 300;
    precise = true;
},function(value)
    changeWalkSpeed(value)
end)

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