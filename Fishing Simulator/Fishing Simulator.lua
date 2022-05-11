getgenv().autoKillSharks = false
getgenv().autoSell = false
getgenv().autoFish = false
getgenv().autoUpgrade = false

if game.PlaceId == 2866967438 then
    print("Script is created by Reddy#6616")
else
    game.Players.LocalPlayer:Kick("Wrong game dumbass")
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("Fishing Simulator")
local b = w:CreateFolder("Main")
local c = w:CreateFolder("Crates")
local l = w:CreateFolder("Upgrades")
local t = w:CreateFolder("Teleport")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local hum = player.Character.HumanoidRootPart
local mouse = player:GetMouse() 
local tpservice= game:GetService("TeleportService")
local vu = game:GetService("VirtualUser")
local playerId = game.Players.LocalPlayer.UserId

local mythicals = loadstring(game:HttpGet(('https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Utils/Mythicals')))()

local spears = loadstring(game:HttpGet(('https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Utils/Spears')))()

local legendary = loadstring(game:HttpGet(('https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Utils/Legendary')))()

local key = {
    "whalekey"
}

print(table.concat(mythicals, ", "))
print(table.concat(spears, ", "))
print(table.concat(legendary, ", "))

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

function teleport(loc)
    bLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = loc
end

b:Toggle("Auto Kill Sharks",function(bool)
    shared.toggle = bool
    if shared.toggle == true then
    fuckMonster = RunService.Stepped:Connect(function()
     for i, v in pairs(game.Workspace:GetChildren()) do
     if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and v.Name == "GreatWhiteShark" or v.Name == "BigGreatWhiteShark" or v.Name == "KillerWhale" or v.Name == "NeonGreatWhiteShark" or v.Name == "MobyWood" then
        teleport(v.HumanoidRootPart.CFrame - Vector3.new(30, 0, 30))
        local monsterName = v.Name
        wait(0.25)
        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Interface.Inventory.QuickAccess:GetDescendants()) do
            if v.ClassName == "Tool" then
                if table.find(spears, v.Name) then
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[monsterName], v.Name, true)
                    break
                end
            end
        end
        end
     end
     end)
    else
         fuckMonster:Disconnect()
          teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
        end
end)

b:Toggle("Auto Fish",function(bool)
    getgenv().autoFish = bool
    autoFish()
end)

b:Toggle("Auto Lock Mythicals",function(bool)
    shared.autoLockMythicals = bool
    if shared.autoLockMythicals == true then
        lockMythicals = RunService.Stepped:Connect(function()
        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetDescendants()) do
            if v.ClassName == "Tool" then
                if table.find(mythicals, v.Name) then
                    local args = {
                        [1] = "Tools",
                        [2] = v.Parent.Parent.Parent.Parent.Parent.Name,
                        [3] = true
                    }
    
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(args))
                end
            end
        end
        end)
    else
        lockMythicals:Disconnect()
    end
end)

b:Toggle("Auto Lock Legendary",function(bool)
    shared.autoLocklegendary = bool
    if shared.autoLocklegendary == true then
        lockLegendary = RunService.Stepped:Connect(function()
        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetDescendants()) do
            if v.ClassName == "Tool" then
                if table.find(legendary, v.Name) then
                    local args = {
                        [1] = "Tools",
                        [2] = v.Parent.Parent.Parent.Parent.Parent.Name,
                        [3] = true
                    }
    
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(args))
                end
            end
        end
        end)
    else
        lockLegendary:Disconnect()
    end
end)

b:Toggle("Auto Lock Key",function(bool)
    shared.autoLockKey = bool
    if shared.autoLockKey == true then
        lockKey = RunService.Stepped:Connect(function()
        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetDescendants()) do
            if v.ClassName == "Tool" then
                if table.find(key, v.Name) then
                    local args = {
                        [1] = "Tools",
                        [2] = v.Parent.Parent.Parent.Parent.Parent.Name,
                        [3] = true
                    }
    
                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(unpack(args))
                end
            end
        end
        end)
    else
        lockKey:Disconnect()
    end
end)

b:Toggle("Auto Sell",function(bool)
    getgenv().autoSell = bool
    autoSell()
end)

b:Button("Accept All Quests",function()
    takeAllQuests()
end)

t:Box("Teleport To Player","string",function(string) 
    teleportToPlayer(string)
end)

b:Slider("WalkSpeed",{
    min = 16;
    max = 300;
    precise = true;
},function(value)
    changeWalkSpeed(value)
end)

b:Slider("JumpPower",{
    min = 50;
    max = 300;
    precise = true;
},function(value)
    changeJumpPower(value)
end)

b:Button("Copy Discord Invite",function()
    setclipboard("https://discord.gg/HjdtekKvDs")
end)

c:Button("Open Stone Chest",function()
    autoOpenChest("stonechest")
end)

c:Button("Open Silver Chest",function()
    autoOpenChest("silverchest")
end)

c:Button("Open Gold Chest",function()
    autoOpenChest("goldchest")
end)

l:Toggle("Auto Upgrade Hook Speed",function(bool)
    getgenv().autoUpgrade = bool
    autoUpgrade("Hook Speed")
end)

l:Toggle("Auto Upgrade Reeling Speed",function(bool)
    getgenv().autoUpgrade = bool
    autoUpgrade("Reeling Speed")
end)

l:Toggle("Auto Upgrade Strength",function(bool)
    getgenv().autoUpgrade = bool
    autoUpgrade("Strength")
end)

t:Button("Teleport To Supplies Store",function()
    teleportToLocation("SuppliesStoreInterior", "Inside")
end)

t:Button("Teleport To Tavern",function()
    teleportToLocation("TavernInterior", "Inside")
end)

t:Button("Teleport To Pets Store",function()
    teleportToLocation("PetShop", "MainEntrance")
end)

t:Button("Teleport To Rodney's Home",function()
    teleportToLocation("LivingSpaceInterior", "Inside")
end)

t:Button("Teleport To Boat Shop",function()
    teleportToLocation("BoatShopInterior", "Inside")
end)

t:Button("Teleport To Eruption Island",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2689.80908, 42.7682953, 1484.38342, -0.1800908, 3.48670461e-08, -0.983649969, 3.66638169e-08, 1, 2.8734032e-08, 0.983649969, -3.08896269e-08, -0.1800908)
end)

t:Button("Teleport To Shadow Isles",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2197.50464, 43.3072357, -2223.0498, 0.997799814, 3.19511173e-08, 0.066299215, -3.31668524e-08, 1, 1.72364061e-08, -0.066299215, -1.93974188e-08, 0.997799814)
end)

t:Button("Teleport To Ancient Shores",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2342.73145, 41.7132492, -1764.89099, 0.269242913, -1.32969422e-08, 0.9630723, 8.73161738e-08, 1, -1.06038955e-08, -0.9630723, 8.69468124e-08, 0.269242913)
end)

t:Button("Teleport To Pharaoh's Dunes",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4163.71826, 41.6461487, 425.615601, 0.0506599918, 1.00352544e-07, 0.998715937, -4.27083684e-08, 1, -9.83151764e-08, -0.998715937, -3.76728835e-08, 0.0506599918)
end)

function biteFish()
    spawn (function()
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishBiting:InvokeServer()
    end)
end

function catchFish()
    spawn (function()
        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
    end)
end

function takeAllQuests()
    spawn (function()
        local args = {
            [1] = 1
        }

        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.TakeRayganJob:InvokeServer(unpack(args))
        local args = {
            [1] = 2
        }

        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.TakeRayganJob:InvokeServer(unpack(args))
        local args = {
            [1] = 3
        }

        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.TakeRayganJob:InvokeServer(unpack(args))
    end)
end

function autoFish()
    spawn (function()
        while getgenv().autoFish do
            local args = {
                [1] = 1
            }
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetEquippedItem:InvokeServer(unpack(args))
            biteFish()
            catchFish()
            wait(5)
        end
    end)
end

function autoSell()
    spawn (function()
        while getgenv().autoSell do
            local args = {
                [1] = "SellEverything"
            }

            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer(unpack(args))
            wait(5)
        end
    end)
end

function changeWalkSpeed(speed)
    spawn (function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
    end)
end

function changeJumpPower(power)
    spawn (function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = power
    end)
end

function teleportToPlayer(player)
    spawn (function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[player].Character.HumanoidRootPart.CFrame
    end)
end

function autoUpgrade(item)
    spawn (function()
        while getgenv().autoUpgrade do
            local args = {
                    [1] = "Upgrade",
                    [2] = "FinnsSuppliesShop",
                    [3] = "Fishing Rod",
                    [4] = "",
                    [5] = {
                        ["statName"] = item
                    }
                }

                game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemPurchase:InvokeServer(unpack(args))
        end
    end)
end

function autoOpenChest(chest)
    spawn (function()
        local args = {
            [1] = chest
        }

        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer(unpack(args))
    end)
end

function teleportToLocation(location, entrance)
    spawn (function()
        local args = {
            [1] = location,
            [2] = entrance
        }

        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer(unpack(args))
    end)
end