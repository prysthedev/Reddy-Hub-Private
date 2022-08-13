--[[
    Todo: 
        [+] Make the script cleaner and faster.
]]--

local function service(...) return game:GetService(...) end

local Players = service("Players")
local Character = service("Players").LocalPlayer.Character
local Workspace = service("Workspace")
local MarketplaceService = service("MarketplaceService")
local ReplicatedStorage = service("ReplicatedStorage")
local HttpService = service("HttpService")
local ReplicatedStorage = service("ReplicatedStorage")
local VirtualUser = service("VirtualUser")
local Humanoid = game.Players.LocalPlayer.Character.Humanoid

local GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name

local StarterWorld = "Demon Village"
local Enemies = {};
for _,v in next, workspace.Enemies:GetChildren() do
    if v:IsA'Folder' and not table.find(Enemies, tostring(v)) then
        table.insert(Enemies, tostring(v))
    end
end
local Worlds = {};
for _,v in next, workspace.Worlds:GetChildren() do
    if v:IsA'Folder' and not table.find(Worlds, tostring(v)) then
        table.insert(Worlds, tostring(v))
    end
end
local Egg = {};
for _,v in next, workspace.Eggs:GetChildren() do
    if v:IsA'Model' and not table.find(Egg, tostring(v)) then
        table.insert(Egg, tostring(v))
    end
end
local Npcs = {};
for _,v in next, workspace.Enemies[StarterWorld]:GetChildren() do
    if v:IsA'Model' and not table.find(Npcs, tostring(v)) then
        table.insert(Npcs, tostring(v))
    end
end

local function getPlayer(player)
    return Players:FindFirstChild(player)
end

local function discordMain()
    local Settings = {
        InviteCode = "T2RAmrVZ7h"
    }
    
    -- Objects
    local HttpService = game:GetService("HttpService")
    local RequestFunction
    
    if syn and syn.request then
        RequestFunction = syn.request
    elseif request then
        RequestFunction = request
    elseif http and http.request then
        RequestFunction = http.request
    elseif http_request then
        RequestFunction = http_request
    end
    
    local DiscordApiUrl = "http://127.0.0.1:%s/rpc?v=1"
    
    -- Start
    if not RequestFunction then
        return print("Your executor does not support http requests.")
    end
    
    for i = 6453, 6464 do
        local DiscordInviteRequest = function()
            local Request = RequestFunction({
                Url = string.format(DiscordApiUrl, tostring(i)),
                Method = "POST",
                Body = HttpService:JSONEncode({
                    nonce = HttpService:GenerateGUID(false),
                    args = {
                        invite = {code = Settings.InviteCode},
                        code = Settings.InviteCode
                    },
                    cmd = "INVITE_BROWSER"
                }),
                Headers = {
                    ["Origin"] = "https://discord.com",
                    ["Content-Type"] = "application/json"
                }
            })
        end
        spawn(DiscordInviteRequest)
    end
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Reddy Hub: "..GameName, IntroText = "Reddy Hub"})

local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://8945416692",
})
local Eggs = Window:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://8945455556",
})

local Teleport = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://8945517811",
})

local LocalPlayer = Window:MakeTab({
	Name = "LocalPlayer",
	Icon = "rbxassetid://8945470040",
})

local Credits = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://8950218710",
})

local Discord = Window:MakeTab({
	Name = "Discord",
	Icon = "rbxassetid://8950218710",
})

Main:AddDropdown({
    Name = "Select A World To Autofarm",
    Default = "Select World...",
    Options = Worlds,
    Callback = function(arg)
        _G.World = arg
        npcDropdown:Refresh(getNpcs(_G.World), true)
    end    
})

function getNpcs(world)
    local Npcs = {};
    for _,v in next, workspace.Enemies[_G.World]:GetChildren() do
        if v:IsA'Model' and not table.find(Npcs, tostring(v)) then
            table.insert(Npcs, tostring(v))
        end
    end
    return Npcs
end

npcDropdown = Main:AddDropdown({
    Name = "Select A NPC To Autofarm",
    Default = "Select NPC...",
    Options = Npcs,
    Callback = function(arg)
        _G.NPC = arg
    end    
})

local function getNPC()
    local dist, char = math.huge
    for _,v in next, workspace.Enemies[_G.World]:GetChildren() do
        if v:IsA'Model' and v.Name == _G.NPC and v.HP.Value > 0 then
            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if mag < dist then
                dist = mag
                char = v
            end
        end
    end
    return char
end

Main:AddSlider({
	Name = "AutoFarm NPC x-axis",
	Min = -10,
	Max = 10,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.5,
	ValueName = "studs",
	Callback = function(valueStuds)
        _G.xStuds = valueStuds
    end
})

Main:AddParagraph("AutoFarm NPC x-axis","This is good, so people can't see your username. (-10 studs recommended)")

Main:AddToggle({
    Name = "AutoFarm NPC",
    Callback = function(BooleanA)
        ValueA = BooleanA
        while ValueA do task.wait()
        if ValueA == false then break; end
            pcall(function()
                local args = {[1] = getNPC()}
                ReplicatedStorage.Remotes.WeaponRemote:FireServer(unpack(args))
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNPC().HumanoidRootPart.CFrame * CFrame.new(0,_G.xStuds,0)
            end)
        end
    end    
})

local SpawnCollectibles = require(game:GetService("Players").LocalPlayer.PlayerScripts.Client.ClientMain.SpawnCollectibles)
local CollectRemote = game:GetService("ReplicatedStorage").Remotes.PickupCollectible
local function collectAllCoins() 
local coinsTable = debug.getupvalue(SpawnCollectibles, 2)
for i,v in next, coinsTable do 
        CollectRemote:FireServer(v.value, v.name)
        v.collected = true 
        v.model:Destroy()
        coinsTable[i] = nil
    end
end

Main:AddToggle({
    Name = "Auto Collect Coins",
    Callback = function(BooleanB)
        ValueB = BooleanB
        while ValueB do task.wait()
        if ValueB == false then break; end
            collectAllCoins()
        end
    end    
})


local function getCOMET()
    local dist, com = math.huge
    for _,v in next, workspace.Comets:GetDescendants() do
        if v.Name == "Comet" then
            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v["Meshes/Meteor_Icosphere (1)"].Position).magnitude
            if mag < dist then
                dist = mag
                com = v
            end
        end
    end
    return com
end

Main:AddToggle({
    Name = "AutoFarm Comet",
    Callback = function(BooleanC)
        ValueC = BooleanC
        while ValueC do task.wait()
        if ValueC == false then break; end
            pcall(function()
                local args = {[1] = getCOMET()}
                ReplicatedStorage.Remotes.WeaponRemote:FireServer(unpack(args))
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getCOMET()["Meshes/Meteor_Icosphere (1)"].CFrame
            end)
        end
    end    
})

local function getWeapons()
    local Weapons = {}; 
    for _,v in next, game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Frames.Inventory.Main.ScrollList:GetChildren() do
        if v:IsA'ImageButton' and not table.find(Weapons, tostring(v)) then
            table.insert(Weapons, tostring(v))
        end
    end
    return Weapons
end     

Main:AddToggle({
    Name = "Auto Evolve Weapons",
    Callback = function(BooleanF)
        ValueF = BooleanF
        while ValueF do task.wait(0.5)
        if ValueF == false then break; end
            for _,Weapon in next, getWeapons() do
                game:GetService("ReplicatedStorage").Remotes.WeaponEvolve:FireServer(Weapon)
            end
        end
    end    
})

Main:AddToggle({
    Name = "Auto Equip Best (Weapon)",
    Callback = function(BooleanG)
        ValueG = BooleanG
        while ValueG do task.wait(0.5)
        if ValueG == false then break; end
        local PATH = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Frames.Inventory.Main.Configure.EquipBest
            firesignal(PATH.Activated)
        end
    end    
})

Eggs:AddDropdown({
    Name = "Select A Egg To Auto Open",
    Default = "Select Egg...",
    Options = Egg,
    Callback = function(arg)
        _G.Egg = arg
    end    
})

Eggs:AddSlider({
	Name = "Egg Auto Open Speed",
	Min = .01,
	Max = 1,
	Default = 250,
	Color = Color3.fromRGB(255,255,255),
	Increment = .1,
	ValueName = "Speed",
	Callback = function(Value)
        _G.EggSpeed = Value
    end
})

Eggs:AddToggle({
    Name = "Auto Open Egg",
    Callback = function(BooleanD)
        ValueD = BooleanD
        while ValueD do task.wait(_G.EggSpeed)
            ReplicatedStorage.Remotes.OpenEgg:InvokeServer(_G.Egg,false,false)
        end
    end    
})

Teleport:AddDropdown({
    Name = "Select A World To Teleport To",
    Default = "Select World...",
    Options = Worlds,
    Callback = function(arg)
        _G.Teleport = arg
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Worlds[_G.Teleport].Spawn.CFrame
    end    
})

Credits:AddParagraph("Credits","Kaoru~#6438 for scripting the entire script and engo#0320 for helping with the auto collect coins cause im a moron! :)")

LocalPlayer:AddToggle({
    Name = "Speed Toggle",
    Callback = function(speedToggleVal)
        _G.speedToggle = speedToggleVal
    end    
})

LocalPlayer:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "WalkSpeed",
	Callback = function(valueSpeed)
        while _G.speedToggle do task.wait()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = valueSpeed
        end
    end
})

Discord:AddButton({
	Name = "Join Our Discord Server",
	Callback = function()
        OrionLib:MakeNotification({
            Name = "Info.",
            Content = "Join discord...",
            Time = 1.5
        })
        wait(1)
        discordMain()
    end
})

spawn(function()
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

if game.CoreGui:FindFirstChild("Reddy") then
	OrionLib:MakeNotification({
        Name = "Success!",
        Content = "The script has been successfully Re-Executed, If there are any errors please report them to the discord.",
        Time = 5
    })
else
	Instance.new("ScreenGui",game.CoreGui).Name = "Reddy"
	OrionLib:MakeNotification({
        Name = "Success!",
        Content = "The script has been successfully executed, If there are any errors please report them to the discord.",
        Time = 5
    })
end