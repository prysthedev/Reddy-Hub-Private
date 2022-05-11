local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/W41K3Rs/W41K3R/main/Finity%20UI.lua"))()

local FinityWindow = library.new(true)
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightShift)

local AutoFarm = FinityWindow:Category("AutoFarm")
local Shop = FinityWindow:Category("Shop")
local Weapon = FinityWindow:Category("Weapon")
local LocalPlayer = FinityWindow:Category("LocalPlayer")
local Server = FinityWindow:Category("Server")
local Credits = FinityWindow:Category("Credits")

local SlowAutoFarms = AutoFarm:Sector("Slow Auto Farms (Safe)")
local FastAutoFarms = AutoFarm:Sector("Fast Auto Farm (80% Chance of getting banned!)")
local MiscAutoFarms = AutoFarm:Sector("Misc (50% Of getting banned!)")

local Guns = Shop:Sector("Guns")
local ClickToBuy = Shop:Sector("Click To Buy")

local Misc = Weapon:Sector("Misc")
local WeaponMods = Weapon:Sector("Weapon Mods")

local LocalPlayerTab = LocalPlayer:Sector("LocalPlayer")
local Teleport = LocalPlayer:Sector("Teleport")

local FunTab = Server:Sector("Fun")

local Creator = Credits:Sector("Creator:")
local Discord = Credits:Sector("Discord:")

print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")
print("Script Created By: Reddy#6616")

local FinityCheat = SlowAutoFarms:Cheat("Checkbox", "Vault Auto Farm", function (NewValue)
    if NewValue then
        getgenv(2).Toggle = true
        while Toggle  == true do
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
    else 
        getgenv(2).Toggle = false
    end
end, {})

local FinityCheat = SlowAutoFarms:Cheat("Checkbox", "Safe Auto Farm", function (NewValue)
    if NewValue then
        getgenv(3).Toggle = true
        while Toggle  == true do
            wait()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-911.42926025391, 540.59320068359, -1507.029296875)
            local A_1 = "Safe"
            local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidStart
            Event:FireServer(A_1)
            local A_1 = "Safe"
            local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidInteract
            Event:FireServer(A_1)
        end
    else 
        getgenv(3).Toggle = false
    end
end, {})

local FinityCheat = FastAutoFarms:Cheat("Checkbox", "Reactor Spam (Join NightHawk Team!)", function (NewValue)
    if NewValue then
        getgenv(1).Toggle = true
        while Toggle == true do
            local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnReactorFix
            Event:FireServer()
            wait()
        end
    else
        getgenv(1).Toggle = false
    end
end, {})

local FinityCheat = MiscAutoFarms:Cheat("Checkbox", "Honor Auto Farm (Collect honor manually!)", function (NewValue)
    if NewValue then
        getgenv(2).Toggle = true
        while Toggle  == true do
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
    else 
        getgenv(2).Toggle = false
    end
end, {})

local FinityCheat = Guns:Cheat("Button", "Buy all guns", function (NewValue)
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
end, {})

local FinityCheat = ClickToBuy:Cheat("Button", "Buy Red Sword (250)", function (NewValue)
    local A_1 = "BuyItem"
    local A_2 = "RebelShop"
    local A_3 = "Items"
    local A_4 = "M16A4"
    local A_5 = "Red Sword"
    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
end, {})

local FinityCheat = ClickToBuy:Cheat("Button", "Buy C4 (400)", function (NewValue)
    local A_1 = "BuyItem"
    local A_2 = "RebelShop"
    local A_3 = "Items"
    local A_4 = "M16A4"
    local A_5 = "C4"
    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
end, {})

local FinityCheat = ClickToBuy:Cheat("Button", "Buy Hacking Device (400)", function (NewValue)
    local A_1 = "BuyItem"
    local A_2 = "RebelShop"
    local A_3 = "Items"
    local A_4 = "M16A4"
    local A_5 = "Hacking Device"
    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
end, {})

local FinityCheat = ClickToBuy:Cheat("Button", "Buy Medi Gun (1000)", function (NewValue)
    local A_1 = "BuyItem"
    local A_2 = "RebelShop"
    local A_3 = "Items"
    local A_4 = "M16A4"
    local A_5 = "Medi-Gun"
    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
end, {})

local FinityCheat = ClickToBuy:Cheat("Button", "Buy Time Bomb (1000)", function (NewValue)
    local A_1 = "BuyItem"
    local A_2 = "CivShop"
    local A_3 = "Items"
    local A_4 = "M16A4"
    local A_5 = "Time Bomb"
    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
end, {})

local FinityCheat = ClickToBuy:Cheat("Button", "Get Passport (Free)", function (NewValue)
    local A_1 = "BuyItem"
    local A_2 = "PassportShop"
    local A_3 = "Items"
    local A_4 = "Passport"
    local A_5 = "Passport"
    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
end, {})

local FinityCheat = ClickToBuy:Cheat("Button", "Buy C4 (400)", function (NewValue)
    local A_1 = "BuyItem"
    local A_2 = "RebelShop"
    local A_3 = "Items"
    local A_4 = "M16A4"
    local A_5 = "C4"
    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
end, {})

local FinityCheat = Misc:Cheat("Button", "Make Guns Invisible", function (NewValue)
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            for i,a in pairs(v:GetDescendants()) do
                if a:IsA("MeshPart") then
                    if  a.Name ~= "DamagePart" and a.Name ~= "Handle" then
                       a:Destroy() 
                    end
                end
            end
        end
    end
end, {})

local FinityCheat = Misc:Cheat("Button", "Equip All Guns", function (NewValue)
    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.Character
     end
end, {})

local FinityCheat = WeaponMods:Cheat("Button", "Automatic", function (NewValue)
    for i, v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "damage") then
            v.shootType = "Auto"
        end
    end
end, {})

local FinityCheat = WeaponMods:Cheat("Button", "Infinite Ammo", function (NewValue)
    for i, v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "damage") then
                v.ammo = math.huge
        end
    end
end, {})

local FinityCheat = WeaponMods:Cheat("Button", "No Spread", function (NewValue)
    for i, v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "damage") then
            v.spread = 0
        end
    end
end, {})

local FinityCheat = WeaponMods:Cheat("Button", "Infinite Range", function (NewValue)
    for i, v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "damage") then
            v.range = 10000
        end
    end
end, {})

local FinityCheat = WeaponMods:Cheat("Button", "Instant Kill", function (NewValue)
    for i, v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "damage") then
            v.bulletNumber = 100
        end
    end
end, {})

local FinityCheat = WeaponMods:Cheat("Button", "No Reload Time", function (NewValue)
    for i, v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "damage") then
            v.reloadTime = 0
        end
    end
end, {})

local FinityCheat = WeaponMods:Cheat("Button", "No Fire Rate", function (NewValue)
    for i, v in next, getgc(true) do
        if type(v) == "table" and rawget(v, "damage") then
            v.fireRate = 0
        end
    end
end, {})

local FinityCheat = LocalPlayerTab:Cheat("Button", "Throw Medinate", function (NewValue)
    local A_1 = Vector3.new(0,10000,0)
    local A_2 = "Medinade"
    local A_3 = 100000000000
    local Event = game:GetService("ReplicatedStorage").Modules.Grenades.Remotes.ThrowGrenade
    Event:FireServer(A_1, A_2, A_3)
end, {})

local FinityCheat = LocalPlayerTab:Cheat("Button", "Throw Gas Grenade", function (NewValue)
    local A_1 = Vector3.new(0,10000,0)
    local A_2 = "Tear Gas Nade"
    local A_3 = 100000000000
    local Event = game:GetService("ReplicatedStorage").Modules.Grenades.Remotes.ThrowGrenade
    Event:FireServer(A_1, A_2, A_3)
end, {})

local FinityCheat = LocalPlayerTab:Cheat("Button", "Get MedKit", function (NewValue)
    local clone = game:GetService("ReplicatedStorage").Assets.Weapons.Medkit:Clone()
    clone.Parent = game.Players.LocalPlayer.Backpack
end, {})

local FinityCheat = LocalPlayerTab:Cheat("Button", "Destroy Vault Lasers", function (NewValue)
    local vaultlasers = game:GetService("Workspace").Doors.Lasers.Lasers
    vaultlasers:Destroy()
end, {})

local FinityCheat = FunTab:Cheat("Button", "Make Chaos (Risky!, Hold Passport!)", function (NewValue)
    while true do
        wait() 
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-110, -110, -110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-10, -10, -110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-10, -110, -10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-100, -10, -10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-10, -10, -10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(110, -110, -110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(10, -10, -110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(10, -110, -10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(100, -10, -10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(10, -10, -10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-110, 110, -110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-10, 10, -110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-10, 110, -10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-100, 10, -10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-10, 10, -10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-110, -110, 110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-10, -10, 110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-10, -110, 10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-100, -10, 10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-10, -10, 10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(-110, -110, -110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(10, 10, 110)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(10, 110, 10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(100, 10, 10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
        local A_1 = "GrenadeLauncher"
        local A_2 = Vector3.new(10, 10, 10)
        local A_3 = "Grenade Launcher"
        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
        Event:FireServer(A_1, A_2, A_3)
    end
end, {})

local FinityCheat = FunTab:Cheat("Button", "Rejoin Server", function (NewValue)
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Rejoin = coroutine.create(function()
    local Success, ErrorMessage = pcall(function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)
    if ErrorMessage and not Success then
        warn(ErrorMessage)
        end
    end)
        coroutine.resume(Rejoin)
end, {})

local FinityCheat = Creator:Cheat("Label", "Reddy#6616 - UI and some functions", function (NewValue)
end, {})

local FinityCheat = Creator:Cheat("Label", "SpaceMan#3664 - Many functions of this script", function (NewValue)
end, {})

local FinityCheat = Discord:Cheat("Button", "Copy Discord Invite", function (NewValue)
    setclipboard("https://discord.gg/HjdtekKvDs")
end, {})

local FinityCheat = Teleport:Cheat("Button", "Vault", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(288.91915893555, 561.79974365234, -2273.4873046875)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Place Near Vault", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-97.359481811523, 551.96960449219, -2230.068359375)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to an Appartment", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-223.64752197266, 571.70037841797, -2412.7272949219)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to the border", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-193.30702209473, 574.29821777344, -1839.0023193359)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to the cafe", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-73.912132263184, 549.19323730469, -1884.1300048828)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to the cafe cave", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(27.202188491821, 521.15344238281, -1683.8842773438)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to Nighthawk spawn", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-531.03851318359, 577.68914794922, -1853.3787841797)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to Broken Glass", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-213.57571411133, 642.15814208984, -1638.0130615234)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to DK spawn", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-442.04147338867, 642.30816650391, -1627.3150634766)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to the safe", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-890.03094482422, 552.06896972656, -1525.5651855469)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to the Rebel Spawn", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1075.3908691406, 586.67199707031, -1324.3911132813)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to Scientist Spawn", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-535.07531738281, 575.23358154297, -1798.6588134766)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to the reactor", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-639.49011230469, 556.90222167969, -1795.1322021484)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to Armory", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919.91851806641, 596.41198730469, -1830.2003173828)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to Border Glass", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-253.57690429688, 640.59460449219, -1913.4090576172)
end, {})

local FinityCheat = Teleport:Cheat("Button", "Teleports you to camera chairs", function (NewValue)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-364.44537353516, 641.32653808594, -1920.8878173828)
end, {})