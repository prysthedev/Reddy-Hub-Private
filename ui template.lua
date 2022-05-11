-- // WAITS FOR GAME TO BE LOADED THEN EXECUTES
repeat wait() until game:IsLoaded()

-- // MERCURY LOADSTRING
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/Uvxtq/lua/main/Updated%20UI%20Library"))()

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

-- // TOGGLES
Main:Toggle{
	Name = "Auto Collect Money",
	StartingState = false,
	Description = "Auto Collects Money so you dont have to!",
	Callback = function(c)
    -- // WHATS BEING CALLED BACK
    getgenv().sell = c
    while true and wait() do
        if not getgenv().sell then return end
        local args = {[1] = "CollectMoney"}
        game:GetService("ReplicatedStorage").Modules.ServiceLoader.NetworkService.Events.Objects.UpdateTycoons:FireServer(unpack(args))
    end
end
}

Main:Toggle{
	Name = "Auto Buy Buttons",
	StartingState = false,
	Description = "Auto Buys all buttons.",
	Callback = function(c)
    -- // WHATS BEING CALLED BACK
    getgenv().op = c
    while true and wait() do
        if not getgenv().op then return end
        for i = 1, 5 do
            for i,v in pairs(game:GetService("Workspace").Tycoons[tostring(i)].Tycoon.Buttons:GetChildren()) do
                local args = {[1] = "BuyButton",[2] = v.Name}
                game:GetService("ReplicatedStorage").Modules.ServiceLoader.NetworkService.Events.Objects.UpdateTycoons:FireServer(unpack(args))
            end
        end
    end
end
}

-- // AUTO BUY PETS MULTIABLE
Egg:Toggle{
	Name = "Auto Buy Grand Prism Egg (Multiple Open)",
	StartingState = false,
	Description = "Auto Buys The Grand Prism Egg.",
	Callback = function(c)
    -- // WHATS BEING CALLED BACK
    getgenv().egg = c
    while true and wait() do
        if not getgenv().egg then return end
        local args = {[1] = "HatchEgg",[2] = "Grand Prism",[3] = "Multiple"}
        game:GetService("ReplicatedStorage").Modules.ServiceLoader.NetworkService.Events.Objects.UpdatePets:FireServer(unpack(args))
    end
end
}

-- // AUTO BUY PETS SINGLE
Egg:Toggle{
	Name = "Auto Buy Grand Prism Egg (Single Open)",
	StartingState = false,
	Description = "Auto Buys The Grand Prism Egg.",
	Callback = function(c)
    -- // WHATS BEING CALLED BACK
    getgenv().egg = c
    while true and wait() do
        if not getgenv().egg then return end
        local args = {[1] = "HatchEgg",[2] = "Grand Prism",[3] = "Single"}
        game:GetService("ReplicatedStorage").Modules.ServiceLoader.NetworkService.Events.Objects.UpdatePets:FireServer(unpack(args))
    end
end
}

-- // AUTO CLAIM CHESTS
Main:Toggle{
	Name = "Auto Collect Chests",
	StartingState = false,
	Description = "Auto Collects The Chests.",
	Callback = function(c)
    -- // WHATS BEING CALLED BACK
    getgenv().chest = c
    while true and wait(1) do
        if not getgenv().chest then return end
        chest = {"Group Chest", "Daily Chest"}
        for i,v in pairs(chest) do
            local args = {[1] = v}
            game:GetService("ReplicatedStorage").Modules.ServiceLoader.NetworkService.Events.Objects.UpdateChests:FireServer(unpack(args))
        end
    end
end
}

-- // TABLE
Buttons = {}
for i = 1, 5 do
    for i,v in pairs(game:GetService("Workspace").Tycoons[tostring(i)].Tycoon.Buttons:GetChildren()) do
        if v.ClassName == "Model" then
            if not table.find(Buttons,v.Name) then
                table.insert(Buttons,v.Name)
            end
        end
    end
end

for i,v in pairs(Buttons) do
    print(v)
end

-- // AUTO EQUIP BEST PETS
Main:Toggle{
	Name = "Auto Equip Best",
	StartingState = false,
	Description = "Auto Equips Best Pets.",
	Callback = function(c)
    -- // WHATS BEING CALLED BACK
    getgenv().sell = c
    while true and wait(10) do -- // REPEATES AND WAITS 10 SECONDS
        if not getgenv().sell then return end -- // STOPS THE REPEATE IF DISABLED
        local args = {[1] = "EquipBest"} -- // LOCAL ARGS
        game:GetService("ReplicatedStorage").Modules.ServiceLoader.NetworkService.Events.Objects.UpdatePets:FireServer(unpack(args)) -- // THE SERVERS CHECKING THE LOCAL ARGS THEN FIRING THE SERVER
    end
end
}

-- // SLIDERS
LocalPlayer:Slider{
	Name = "WalkSpeed",
	Default = 16, -- // DEFAULT WALKSPEED YOU START WITH
	Min = 16, -- // MIN WALKSPEED YOU CAN SET
	Max = 250, -- // MAX WALKSPEED YOU CAN SET
	Callback = function(s) -- // THE CALLBACK FUNCTION 
        -- // THE CALLBACK
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s -- // CHANGES YOUR LOCAL WALKSPEED
    end
}

LocalPlayer:Slider{
	Name = "JumpPower",
	Default = 50, -- // DEFAULT JUMPPOWER YOU START WITH
	Min = 50, -- // MIN JUMPPOWER YOU CAN SET
	Max = 250, -- // MAX JUMPPOWER YOU CAN SET
	Callback = function(j) -- // THE CALLBACK FUNCTION
        -- // THE CALLBACK
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = j -- // CHANGES YOUR LOCAL JUMPPOWER
    end
}

-- // NOTIFICATIONS
GUI:Notification{
	Title = "Press Right Ctrl to hide the script", -- // THE NOTIFICATION TITLE
	Text = "Please give me a thumbs up on script blox!", -- // THE NOTIFICATION TEXT
	Duration = 7, -- // HOW LONG THE NOTIFICATION LASTS FOR
	Callback = function() -- // THE CALLBACK FUNCTION
        -- // CALLBACK FUNCTION (ANTI-AFK)
        local vu = game:GetService("VirtualUser") -- // GETS YOUR LOCAL VIRTUALUSER
        game:GetService("Players").LocalPlayer.Idled:connect(function() -- // FINDS AND GETS THE IDLED CONNECTIONS
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) -- // MOVES YOUR CAMERA DOWN
                wait(1) -- // WAITS 1 SECOND
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) -- // MOVES YOUR CAMERA UP
        end)
    end
}

-- // CREDITS 
GUI:Credit{
	Name = "Kaoru~",
	Description = "PapierLP#4789 and LB.#1749 Help with the script!",
	V3rm = nil,
	Discord = "Kaoru~#0069"
}

-- // AUTO FARM
Main:Toggle{
    Name = "Auto farmer", -- // THE NAME
    StartingState = false, -- // THE STATE IT STARTS AT
    Description = "For Auto Farmer to work, you must be right next to the E button.", -- // THE DESCRIPTION 
    Callback = function() -- // THE FUNCTION / OR WHAT TOOGLES THE TOGGLE
    -- // WHATS BEING CALLED BACK
    getgenv().aaa = not getgenv().aaa -- // THE TOGGLE

    local LP = game:GetService("Players").LocalPlayer -- // GETS YOUR LOCAL PLAYER

    local function getTycoon() -- // THE FUNCTION
        for i,v in next, workspace.Tycoons:GetChildren() do -- // GETS CHILDREN 
            if (v:FindFirstChild("Data") and v.Data:FindFirstChild("Owner")) then -- // CHECKS IF YOU'RE THE OWNER
                if (v.Data.Owner.Value == LP) then -- // GETS THE DATA / OR YOUR VALUE
                    return v -- // RETURNS THE VALUE
                end
            end
        end
    end

    local tycoon = getTycoon() -- // YOUR TYCOON

    if (tycoon) then -- // CHECKS IF ITS YOUR TYCOON
        local ts = tycoon:FindFirstChild("TycoonSpawn", true) -- // FINDS YOUR TYCOON SPAWN
    
        while (getgenv().aaa and wait()) do -- // THE REPEATE
            fireproximityprompt(ts) -- // FIRE THE PROXIMITY
        end
    end
end
}

-- // AUTO CLAIM REWARDS
Main:Toggle{
	Name = "Auto Claim Rewards",
	StartingState = false,
	Description = "Auto Claims Rewards, so you don't have to!",
	Callback = function(c)
    -- // WHATS BEING CALLED BACK 
    getgenv().test = c
    while true and wait() do
        rewards = {"Jeice", "Burter", "Ginyu", "Piccolo", "Vegeta", "Kaio Goku"}
            for i,v in pairs(rewards) do
            local args = {[1] = "ClaimReward",[2] = "Companions",[3] = "Home",[4] = v}
            game:GetService("ReplicatedStorage").Modules.ServiceLoader.NetworkService.Events.Objects.UpdateIndex:FireServer(unpack(args))
        end
    end
end
}

-- // AUTO CLAIM BAD REWAREDS
Main:Toggle{
	Name = "Auto Claim Boss Rewards",
	StartingState = false,
	Description = "Auto Claims Boss Rewards, so you don't have to!",
	Callback = function(c)
        getgenv().idk = c
        while true and wait() do
            if not getgenv().idk then return end
            rewardss = {"Home"}
            for i,v in pairs(rewardss) do
            local args = {[1] = "ClaimReward",[2] = "Boss",[3] = v}
            game:GetService("ReplicatedStorage").Modules.ServiceLoader.NetworkService.Events.Objects.UpdateIndex:FireServer(unpack(args))
        end
    end
end
}

-- // UPGARDES
Main:Toggle{
	Name = "Auto Buy Upgrades",
	StartingState = false,
	Description = "Auto Buys Upgrades",
	Callback = function(c)
        getgenv().idk = c
        while true and wait() do
            if not getgenv().idk then return end
            upgrades = {"More Workers", "Hero Damage", "Hero XP", "Companion XP", "Package Value"}
            for i,v in pairs(upgrades) do
            local args = {[1] = "Buy",[2] = v}
            game:GetService("ReplicatedStorage").Modules.ServiceLoader.NetworkService.Events.Objects.UpdateUpgrades:FireServer(unpack(args))
        end
    end
end
}

-- // TELEPORTS
Teleport:button{
	Name = "Teleport to Spawn",
	StartingState = false,
	Description = nil,
	Callback = function()
        function teleportTO(placeCFrame)
            local plyr = game.Players.LocalPlayer;
            if plyr.Character then
                plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
            end
        end
    teleportTO(game:GetService("Workspace").Worlds.Home.Map.Path.Top.Union.CFrame)
end
}

-- // TELEPORTS
Teleport:button{
	Name = "Teleport to Hidden Leaf",
	StartingState = false,
	Description = nil,
	Callback = function()
        function teleportTO(placeCFrame)
            local plyr = game.Players.LocalPlayer;
            if plyr.Character then
                plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
            end
        end
    teleportTO(game:GetService("Workspace").Worlds["Leaf Village"].Map.Model.fence.CFrame)
end
}
            
-- // TELEPORTS
Teleport:button{
	Name = "Teleport to Redline",
	StartingState = false,
	Description = nil,
	Callback = function()
        function teleportTO(placeCFrame)
            local plyr = game.Players.LocalPlayer;
            if plyr.Character then
                plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
            end
        end
    teleportTO(game:GetService("Workspace").Worlds["Red Line"].Map.Model["Wanted Poster"]["Meshes/leaderboard screen_Plane"].CFrame)
end
}

-- // COPYS DISCORD INVITE
Extra:Button{
	Name = "Copy my Discord Invite",
	Description = nil,
	Callback = function()
        setclipboard('https://discord.gg/3HzZEpeh4J')
    end
}

-- // REMOVE NOTIFICATIONS
game:GetService("Players").LocalPlayer.PlayerGui.Display.Notifications:Destroy() -- // DESTROYS THE GEY ASS NOTIFICATIONS 