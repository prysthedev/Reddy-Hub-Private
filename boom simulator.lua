-- // WAITS FOR GAME TO BE LOADED THEN EXECUTES
repeat wait() until game:IsLoaded()

-- // MERCURY LOADSTRING
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/Uvxtq/lua/main/Updated%20UI%20Library.lua"))()

-- // GUI
local GUI = Mercury:Create{
    Name = "Kaoru Hub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://raw.githubusercontent.com/Uvxtq/lua/main/games/Anime%20Battle%20Tycoon.lua"
}

-- // TABS
local Main = GUI:Tab{
    Name = "Main",
    Icon = "rbxassetid://8945416692"
}

local Egg = GUI:Tab{
    Name = "Egg",
    Icon = "rbxassetid://8945455556"
}

local LocalPlayer = GUI:Tab{
    Name = "LocalPlayer",
    Icon = "rbxassetid://8945470040"
}

local Teleport = GUI:Tab{
    Name = "Teleport",
    Icon = "rbxassetid://8945517811"
}

local Extra = GUI:Tab{
    Name = "Extra",
    Icon = "rbxassetid://8950218710"
}

Main:Toggle{
    Name = "Auto Farm 'Nearest' HP (Recommended)",
    StartingState = false,
    Description = nil,
    Callback = function(v)
    _G.Farm = v
    while task.wait() do
        if not _G.Farm then break end;

        local plr = game.Players.LocalPlayer.Character.HumanoidRootPart

        function getNear()
            local near;
            local nearr = math.huge;

            for i,v in pairs(game:GetService("Workspace").Objects:GetDescendants()) do
                if v:IsA("MeshPart") then
                    local dist = (v.Position - plr.Position).magnitude
                    if dist < nearr then
                        nearr = dist
                        near = v
                    end
                end
            end
            return near
        end

        local nearest = getNear()
                    
        plr.CFrame = nearest.HitBox.CFrame * CFrame.new(0,0,0)
        wait(.2)

        game:GetService("ReplicatedStorage").Communication.RE:FireServer("SelectObject",workspace.Objects[nearest.Name].HitBox)

        repeat task.wait()
            plr.CFrame = nearest.HitBox.CFrame * CFrame.new(0,0,0)
        until nearest.Value == "0" or not _G.Farm
    end
end
}

LocalPlayer:Toggle{
    Name = "Auto Claim Daily Reward Chest",
    StartingState = false,
    Description = nil,
    Callback = function(v)
    _G.AutoClaimDailyReward = v
    while _G.AutoClaimDailyReward == true do
        playerHead = game.Players.LocalPlayer.Character.Head
        firetouchinterest(game:GetService("Workspace").Rewards.DailyReward.Touch.TouchInterest, playerHead, 1)
        wait(1)
    end
end
}

Egg:Toggle{
    Name = "Auto Hatch Egg",
    StartingState = false,
    Description = nil,
    Callback = function(v)
    _G.AutoHatch = v
    
end
}