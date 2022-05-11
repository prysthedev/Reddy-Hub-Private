--UI home
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("GrindHub               V.0.0.3", "Ocean")


--UI tabs
local Home = Window:NewTab("Home")
local Mods = Window:NewTab("Weapon Mods")
local lplr = Window:NewTab("LocalPlayer")
local TP = Window:NewTab("Teleport")
local settings = Window:NewTab("settings")
local Credits = Window:NewTab("Credits")





--UI sections
local HomeSection = Home:NewSection("Home")
local ModsSection = Mods:NewSection("Gun Mods")
local plrSection = lplr:NewSection("LocalPlayer")
local bodySection = lplr:NewSection("Change Body")
local teamSection = lplr:NewSection("Switch Teams")

local lplr2Section = lplr:NewSection("OtherStuff")

local TP1Section = TP:NewSection("Teleport")
local TP2Section = TP:NewSection("Health-Station")
local TP3Section = TP:NewSection("Armor-Station")
local TP4Section = TP:NewSection("Rations-Station")
local TP5Section = TP:NewSection("Jobs")
local TP6Section = TP:NewSection("Shop")
local settingsSection = settings:NewSection("settings")
local CreditSection = Credits:NewSection("Credits")





--gun mods
ModsSection:NewButton("INF Ammo", "Will give you inf ammo.", function()
    for _,v in pairs(getgc(true)) do
        if typeof(v) == 'table' and rawget(v, 'Recoil') and typeof(rawget(v, 'Recoil')) == 'function' then
            rawset(v, 'Recoil', function()end)
            local shoot = rawget(v, 'Shoot')
            local guns = debug.getupvalue(shoot, 2)
            for _,v in pairs(guns) do
                if typeof(v) == 'table' and rawget(v, 'Ammo') then
                    rawset(v, 'MaxAmmo', math.huge)
                    rawset(v, 'Ammo', math.huge)
                end
            end
        end
    end
end)

ModsSection:NewButton("No shooting cooldown", "No shooting cooldown.", function()
    for _,v in pairs(getgc(true)) do
        if typeof(v) == 'table' and rawget(v, 'Recoil') and typeof(rawget(v, 'Recoil')) == 'function' then
            rawset(v, 'Recoil', function()end)
            local shoot = rawget(v, 'Shoot')
            local guns = debug.getupvalue(shoot, 2)
            for _,v in pairs(guns) do
                if typeof(v) == 'table' and rawget(v, 'Ammo') then
                    rawset(v, 'RPM', math.huge)
                end
            end
        end
    end
end)

ModsSection:NewButton("Auto shoot", "Will shoot automatically.", function()
    for _,v in pairs(getgc(true)) do
        if typeof(v) == 'table' and rawget(v, 'Recoil') and typeof(rawget(v, 'Recoil')) == 'function' then
            rawset(v, 'Recoil', function()end)
            local shoot = rawget(v, 'Shoot')
            local guns = debug.getupvalue(shoot, 2)
            for _,v in pairs(guns) do
                if typeof(v) == 'table' and rawget(v, 'Ammo') then
                    rawset(v, 'FiringType', 'Auto')
                end
            end
        end
    end
end)


--CREDITS
CreditSection:NewButton("SpaceMan#3664", "Will copy my discord account", function()
    setclipboard("SpaceMan#3664")
end)
CreditSection:NewButton(".gg/nR9VsD34Pz", "Will copy my discord server", function()
    setclipboard("https://discord.gg/nR9VsD34Pz")
end)


--settings
settingsSection:NewKeybind("Toggle UI", "Press RightShift To Toggle UI", Enum.KeyCode.RightShift, function()
    Library:ToggleUI()
end)


--lplr
plrSection:NewSlider("Change WalkSpeed", "Changes your WalkSpeed", 500, 10, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

plrSection:NewSlider("Change JumpPower", "Changes your JumpPower", 500, 20, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)


plrSection:NewButton("Respawn", "Die", function()
    local Event = game:GetService("ReplicatedStorage").Remotes.Die
    Event:FireServer()
end)

bodySection:NewButton("Remove Name + Rank", "Will remove your name and rank", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.RankUI:Destroy()
end)
bodySection:NewButton("Remove face", "Will remove your face", function()
    game.Players.LocalPlayer.Character.Head.face:Destroy()
end)
bodySection:NewButton("Remove Left Arm", "Will remove your left arm", function()
    game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
end)
bodySection:NewButton("Remove Right Arm", "Will remove your right arm", function()
    game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
end)
bodySection:NewButton("Remove head", "Will remove your head.", function()
    game.Players.LocalPlayer.Character.Head.Weld:Destroy()
end)
bodySection:NewToggle("Auto Hide Name", "Will auto-hide your name", function(state)
    if state then
        getgenv(1).Toggle = true
        while Toggle == true do
            wait()
            local speaker = game.Players.LocalPlayer

            for i,v in pairs(speaker.Character:GetDescendants())do
                if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
                    v:Destroy()
                end
            end
            local function charPartAdded(part)
                if part:IsA("BillboardGui") or part:IsA("SurfaceGui") then
                    wait()
                    part:Destroy()
                end
            end
            charPartTrigger = speaker.Character.DescendantAdded:Connect(charPartAdded)
        end
    else
        getgenv(1).Toggle = false
    end
end)

--lplr2
teamSection:NewButton("Switch to Citizen", "Changed to Citizen", function()

    local A_1 = "Citizen"
    local Event = game:GetService("ReplicatedStorage").Remotes.changeTeam
    Event:InvokeServer(A_1)
    wait(0.1)
    local Event = game:GetService("ReplicatedStorage").Remotes.getTeamType
    Event:InvokeServer()
    wait(0.1)
    local Event = game:GetService("ReplicatedStorage").Remotes.Spawn
    Event:FireServer()

end)

teamSection:NewButton("Switch to Rebel", "Changed to Rebel", function()

    local A_1 = "Rebel"
    local Event = game:GetService("ReplicatedStorage").Remotes.changeTeam
    Event:InvokeServer(A_1)
    wait(0.1)
    local Event = game:GetService("ReplicatedStorage").Remotes.getTeamType
    Event:InvokeServer()
    wait(0.1)
    local Event = game:GetService("ReplicatedStorage").Remotes.Spawn
    Event:FireServer()

end)

teamSection:NewButton("Switch to Combine", "Changed to Combine", function()

    local A_1 = "Combine"
    local Event = game:GetService("ReplicatedStorage").Remotes.changeTeam
    Event:InvokeServer(A_1)
    wait(0.1)
    local Event = game:GetService("ReplicatedStorage").Remotes.getTeamType
    Event:InvokeServer()
    wait(0.1)
    local Event = game:GetService("ReplicatedStorage").Remotes.Spawn
    Event:FireServer()

end)

lplr2Section:NewButton("Crab Hitbox Expander", "Change HeadcrabAIs Hitbox", function()
    --crab hitbox shit
    local h1= 50 --Change if you want.
    local t1 = 0.5 --Change if you want.


    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "Headcrab_AI" then
            local head = v.HumanoidRootPart
            head.Transparency = t1
            head.Size = Vector3.new(h1,h1,h1)
        end
    end
end)

--teleports 1
TP1Section:NewButton("Bridge", "Teleport to the Bridge!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-397.257874, 36.115799, -498.011261)
end)

TP1Section:NewButton("Combine Spawn", "Teleport to the Combine Spawn!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-494.5578, -31.734005, -243.505844)
end)

TP1Section:NewButton("Rebel Spawn", "Teleport to the Rebel Spawn!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-764.996033, -71.3841553, -699.057556)
end)

TP1Section:NewButton("City", "Teleport to the City Center!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-534.789307, -51.6977539, -738.658203) 
end)

TP1Section:NewButton("Outlands", "Teleport to the Outlands", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-690.452393, -45.2679825, 496.475128)
end)

TP1Section:NewButton("Factory", "Teleport to the Factory", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-269.62637329102, -50.240558624268, -1029.9099121094)
end)


--teleports 2
TP2Section:NewButton("Health 1", "Go to a Health Station!", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-510.412994, -51.3841553, -491.179718)  
end)

TP2Section:NewButton("Health 2", "Go to a Health Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-553.583557, -71.3841553, -542.784729)    
end)

TP2Section:NewButton("Health 3", "Go to a Health Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-328.888031, -51.3841553, -489.575745) 
end)

TP2Section:NewButton("Health 4", "Go to a Health Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-404.944092, -51.3841553, -755.828735)
end)

TP2Section:NewButton("Health 5", "Go to a Health Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-476.510834, -31.9841614, -271.321106) 
end)

--teleports 3
TP3Section:NewButton("Armor 1", "Go to a Armor Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-414.506683, -51.3841553, -531.945679) 
end)

TP3Section:NewButton("Armor 2", "Go to a Armor Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-577.872375, -31.3852539, -844.959656) 
end)

TP3Section:NewButton("Armor 3", "Go to a Armor Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-454.729431, -52.6341553, -795.879639)
end)

TP3Section:NewButton("Armor 4", "Go to a Armor Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-404.944092, -51.3841553, -755.828735) 
end)

TP3Section:NewButton("Armor 5", "Go to a Armor Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-513.871094, -32.1739197, -235.803604)
end)

--teleports 4

TP4Section:NewButton("Rations 1", "Go to a Rations Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-681.533875, -51.3691597, -560.763489) 
end)

TP4Section:NewButton("Rations 2", "Go to a Rations Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-489.739624, -51.3841553, -455.14978) 
end)

TP4Section:NewButton("Rations 3", "Go to a Rations Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-450.277802, -52.6341553, -759.400757) 
end)

TP4Section:NewButton("Rations 4", "Go to a Rations Station!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-372.245148, -48.8841553, -611.116272)
end)

TP5Section:NewButton("TP to Jack!", "Get a job!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-389.508698, -51.3841553, -486.14743)
end)

TP5Section:NewButton("TP to James", "Get a job!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-593.345154, -49.2032051, 209.242447) 
end)

TP5Section:NewButton("TP to Niguel", "Get a job!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-387.919983, -51.3841553, -795.750732)
end)

TP5Section:NewButton("TP to Kai", "Get a job!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-288.58313, -11.3841543, -647.877747) 
end)

TP6Section:NewButton("TP to Rebel Shop 1", "Buy something!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-544.54382324219, -71.384155273438, -582.58905029297) 
end)

TP6Section:NewButton("TP to Rebel Shop 2", "Buy something!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-464.10748291016, -31.384155273438, -647.67279052734) 
end)

TP6Section:NewButton("TP to Rebel Shop 3", "Buy something!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-539.60534667969, -71.384155273438, -656.83654785156) 
end)

TP6Section:NewButton("TP to Combine Shop", "Buy something!", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-484.72076416016, -31.734004974365, -244.6448059082) 
end)