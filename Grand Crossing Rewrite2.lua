repeat wait() until game:IsLoaded()

print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/Uvxtq/lua/main/Updated%20UI%20Library.lua"))()

local GUI = Mercury:Create{
    Name = "Kaoru Hub",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://raw.githubusercontent.com/reddythedev/robloxthings/main/The%20Grand%20Crossing"
}

local Main = GUI:Tab{
	Name = "Main",
	Icon = "rbxassetid://8945416692"
}

local LocalPlayer = GUI:Tab{
	Name = "LocalPlayer",
	Icon = "rbxassetid://8945470040"
}

local Misc = GUI:Tab{
	Name = "Misc",
	Icon = "rbxassetid://8099777557"
}

Main:Toggle{
	Name = "Vault AutoFarm",
	StartingState = false,
	Description = "(Safe) Farms vault for you",
	Callback = function(c)
    getgenv().vaultAutoFarm = c
    if vaultAutoFarm == true then
        GUI:Notification{
            Title = "AutoFarm", 
            Text = "Enabled vault autofarm!", 
            Duration = 2,
        }
    end
    if vaultAutoFarm == false then
        GUI:Notification{
            Title = "AutoFarm", 
            Text = "Disabled vault autofarm!", 
            Duration = 2,
        }
    end
    while vaultAutoFarm do
        wait()
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(286.24005126953, 553.20562744141, -2273.0639648438)
        local A_1 = "Vault"
        local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidStart
        Event:FireServer(A_1)
        local A_1 = "Vault"
        local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidInteract
        Event:FireServer(A_1)
    end
end
}

Main:Toggle{
	Name = "Safe AutoFarm",
	StartingState = false,
	Description = "(Safe) Farms safe for you",
	Callback = function(c)
    getgenv().safeAutoFarm = c
    if safeAutoFarm == true then
        GUI:Notification{
            Title = "AutoFarm", 
            Text = "Enabled safe autofarm!", 
            Duration = 2,
        }
    end
    if safeAutoFarm == false then
        GUI:Notification{
            Title = "AutoFarm", 
            Text = "Disabled safe autofarm!", 
            Duration = 2,
        }
    end
    while safeAutoFarm do
        wait()
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(286.24005126953, 553.20562744141, -2273.0639648438)
        local A_1 = "Vault"
        local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidStart
        Event:FireServer(A_1)
        local A_1 = "Vault"
        local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidInteract
        Event:FireServer(A_1)
    end
end
}

Main:Toggle{
	Name = "Money AutoFarm (NightHawk team only!)",
	StartingState = false,
	Description = "(90% RISKY!) Farms money for you really fast, recommended using on private servers.",
	Callback = function(c)
    getgenv().reactorFixSpam = c
    while reactorFixSpam == true do
        local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnReactorFix
        Event:FireServer()
        wait()
    end
    if reactorFixSpam == true then
        GUI:Notification{
            Title = "AutoFarm", 
            Text = "Enabled money autofarm!", 
            Duration = 2,
        }
    end
end
}

LocalPlayer:Toggle{
	Name = "Honor Auto Farm (Collect honor manually!)",
	StartingState = false,
	Description = "(Kinda safe) Farming honor for you",
	Callback = function(c)
    getgenv().honorAutoFarm = c
    if honorAutoFarm == true then
        GUI:Notification{
            Title = "AutoFarm", 
            Text = "Enabled honor autofarm!", 
            Duration = 2,
        }
    end
    if honorAutoFarm == false then
        GUI:Notification{
            Title = "AutoFarm", 
            Text = "Disabled honor autofarm!", 
            Duration = 2,
        }
    end
    if honorAutoFarm then
        while honorAutoFarm  == true do
            wait()
            local body = game.Players.LocalPlayer.Character.HumanoidRootPart

            for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Missions.Main.MissionList:GetChildren()) do
                if v:IsA "Frame" then 
                    if v.Name == "Patrol Vault for 5 Minutes" then
                        print("Starting...")
                        print(v.Name)
                        body.CFrame = CFrame.new(1.0845682621002, 553.96350097656, -2252.1564941406)
                        wait(315)
                    elseif v.Name == "Patrol Border Gate for 5 Minutes" then
                        print("Starting...")
                        print(v.Name)
                        body.CFrame = CFrame.new(-215.52420043945, 572.93487548828, -1901.7037353516)
                        wait(315)
                        print("Done")
                    elseif v.Name == "Patrol Safe for 5 Minutes" then
                        print("Starting...")
                        print(v.Name)
                        body.CFrame = CFrame.new(-798.55194091797, 557.24066162109, -1666.0010986328)
                        wait(315)
                        print("Done")
                    end
                end
            end
        end
    end 
end
}

LocalPlayer:Button{
	Name = "Buy all guns",
	StartingState = false,
	Description = nil,
	Callback = function()
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Auger"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local player = game.Players.LocalPlayer
                    local rl = game:GetService("ReplicatedStorage").Assets.Weapons.Medkit:Clone()
                    rl.Parent = player.Backpack
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "C4"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "L95-S"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Hacking Device"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "M16A4"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "MAC-10"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "MP-7"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Red Sword"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "SCAR-L"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "SPAS-55"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Time Bomb"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Titan"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "C4"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "ICR-3"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Medi-Gun"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "X9 Pistol"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "MK-14"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "Auger"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "MZ-12"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "P90"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "Revolver"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "SPAS-55"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "USP-S"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
end
}

LocalPlayer:Button{
	Name = "Equip all guns",
	StartingState = false,
	Description = nil,
	Callback = function()
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.Character
    end
end
}

LocalPlayer:Button{
	Name = "Make guns automatic",
	StartingState = false,
	Description = nil,
	Callback = function()
    for i, v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "damage") then
            v.shootType = "Auto"
        end
    end
end
}

LocalPlayer:Button{
	Name = "Infinite Ammo",
	StartingState = false,
	Description = nil,
	Callback = function()
        for i, v in next, getgc(true) do
            if type(v) == "table" and rawget(v, "damage") then
                    v.ammo = math.huge
            end
        end
end
}

LocalPlayer:Button{
	Name = "No Spread",
	StartingState = false,
	Description = nil,
	Callback = function()
        for i, v in next, getgc(true) do
            if type(v) == "table" and rawget(v, "damage") then
                v.spread = 0
            end
        end
end
}

LocalPlayer:Button{
	Name = "Infinite Range",
	StartingState = false,
	Description = nil,
	Callback = function()
        for i, v in next, getgc(true) do
            if type(v) == "table" and rawget(v, "damage") then
                v.range = 10000
            end
        end
end
}

LocalPlayer:Button{
	Name = "Instant Kill",
	StartingState = false,
	Description = nil,
	Callback = function()
        for i, v in next, getgc(true) do
            if type(v) == "table" and rawget(v, "damage") then
                v.bulletNumber = 100
            end
        end
end
}

LocalPlayer:Button{
	Name = "No Reload Time",
	StartingState = false,
	Description = nil,
	Callback = function()
        for i, v in next, getgc(true) do
            if type(v) == "table" and rawget(v, "damage") then
                v.reloadTime = 0
            end
        end
end
}

LocalPlayer:Button{
	Name = "No Fire Rate",
	StartingState = false,
	Description = nil,
	Callback = function()
        for i, v in next, getgc(true) do
            if type(v) == "table" and rawget(v, "damage") then
                v.fireRate = 0
            end
        end
end
}

LocalPlayer:Button{
	Name = "Throw Medinate",
	StartingState = false,
	Description = nil,
	Callback = function()
    local A_1 = Vector3.new(0,10000,0)
    local A_2 = "Medinade"
    local A_3 = 100000000000
    local Event = game:GetService("ReplicatedStorage").Modules.Grenades.Remotes.ThrowGrenade
    Event:FireServer(A_1, A_2, A_3)
end
}

LocalPlayer:Button{
	Name = "Throw Gas Grenade",
	StartingState = false,
	Description = nil,
	Callback = function()
    local A_1 = Vector3.new(0,10000,0)
    local A_2 = "Tear Gas Nade"
    local A_3 = 100000000000
    local Event = game:GetService("ReplicatedStorage").Modules.Grenades.Remotes.ThrowGrenade
    Event:FireServer(A_1, A_2, A_3)
end
}

LocalPlayer:Button{
	Name = "Get MedKit",
	StartingState = false,
	Description = nil,
	Callback = function()
    local clone = game:GetService("ReplicatedStorage").Assets.Weapons.Medkit:Clone()
    clone.Parent = game.Players.LocalPlayer.Backpack
end
}

LocalPlayer:Button{
	Name = "Destroy Vault Lasers",
	StartingState = false,
	Description = nil,
	Callback = function()
    local vaultlasers = game:GetService("Workspace").Doors.Lasers.Lasers
    vaultlasers:Destroy()
end
}

