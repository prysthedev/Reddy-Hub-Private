local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/shlexware/Orion/main/source")))()

local Window =
    OrionLib:MakeWindow(
    {
        Name = "Reddy Hub (Fishing Simulator)",
        HidePremium = true,
        SaveConfig = false,
        ConfigFolder = "ReddyHub",
        IntroEnabled = true,
        IntroText = "Reddy Hub"
    }
)

local AutoFarm =
    Window:MakeTab(
    {
        Name = "Auto Farm",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

local Crates =
    Window:MakeTab(
    {
        Name = "Crates",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

local Upgrades =
    Window:MakeTab(
    {
        Name = "Upgrades",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

local Misc =
    Window:MakeTab(
    {
        Name = "Misc",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

local Settings =
    Window:MakeTab(
    {
        Name = "Settings",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

local SharkSec =
    AutoFarm:AddSection(
    {
        Name = "Sharks"
    }
)

local CooldownSec =
    Settings:AddSection(
    {
        Name = "Cooldown"
    }
)

local RunService = game:GetService("RunService")
local spears = loadstring(game:HttpGet(("https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Utils/Spears")))()
local mythicals =
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Utils/Mythicals")))()
local legendary =
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Utils/Legendary")))()
local Ships = {
    "ShipModel1",
    "ShipModel2",
    "ShipModel3",
    "ShipModel4",
    "ShipModel5",
    "ShipModel6",
    "ShipModel7",
    "ShipModel8",
    "ShipModel9",
    "ShipModel10"
}
local key = {
    "whalekey"
}

shared.autoSellCooldown = 5
shared.autoFishCooldown = 2
shared.autoOpenCrateCooldown = 1
shared.autoUpgradeCooldown = 1

function teleport(location)
    bLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = location
end
function catchfish()
    spawn(
        function()
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
        end
    )
end

function baitFish()
    spawn(
        function()
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishBiting:InvokeServer()
        end
    )
end

function autoFish()
    spawn(
        function()
            local args = {
                [1] = 1
            }
            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetEquippedItem:InvokeServer(unpack(args))

            baitFish()
            catchfish()
        end
    )
end

function autoOpenChest(chest)
    spawn(
        function()
            local args = {
                [1] = chest
            }

            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer(
                unpack(args)
            )
        end
    )
end

function autoUpgrade(item)
    spawn(
        function()
            local args = {
                [1] = "Upgrade",
                [2] = "FinnsSuppliesShop",
                [3] = "Fishing Rod",
                [4] = "",
                [5] = {
                    ["statName"] = item
                }
            }

            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemPurchase:InvokeServer(
                unpack(args)
            )
        end
    )
end

function teleportToPlayer(player)
    spawn(
        function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players[player].Character.HumanoidRootPart.CFrame
        end
    )
end

function takeAllQuests()
    spawn(
        function()
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
        end
    )
end

function teleportToLocation(location, entrance)
    spawn(
        function()
            local args = {
                [1] = location,
                [2] = entrance
            }

            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer(unpack(args))
        end
    )
end

AutoFarm:AddToggle(
    {
        Name = "Auto Kill Sharks",
        Default = false,
        Callback = function(Value)
            shared.toggle = Value
            killSharks =
                RunService.Stepped:Connect(
                function()
                        if shared.toggle == true then
                            pcall(
                                for i, v in pairs(game.Workspace:GetChildren()) do
                                    if
                                        v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and
                                            v.Name == "GreatWhiteShark" or
                                            v.Name == "BigGreatWhiteShark" or
                                            v.Name == "KillerWhale" or
                                            v.Name == "NeonGreatWhiteShark" or
                                            v.Name == "MobyWood"
                                    then
                                        teleport(v.HumanoidRootPart.CFrame - Vector3.new(30, 0, 30))
                                        local monsterName = v.Name
                                        wait(0.25)
                                        for i, v in pairs(
                                            game:GetService("Players").LocalPlayer.PlayerGui.Interface.Inventory.QuickAccess:GetDescendants(

                                            )
                                        ) do
                                            if v.ClassName == "Tool" then
                                                if table.find(spears, v.Name) then
                                                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(
                                                        workspace[monsterName],
                                                        v.Name,
                                                        true
                                                    )
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                        end
                end
            )
            if shared.toggle == false then
                killSharks:Disconnect()
            end
        end
    }
)

local FishesSec =
    AutoFarm:AddSection(
    {
        Name = "Fishes"
    }
)

AutoFarm:AddToggle(
    {
        Name = "Auto Fish",
        Default = false,
        Callback = function(Value)
        shared.autoFish = Value
		while shared.autoFish do
            autoFish()
            wait(shared.autoFishCooldown)
        end
    end
    }
)

local ShipSec =
    AutoFarm:AddSection(
    {
        Name = "Ships"
    }
)

AutoFarm:AddToggle(
    {
        Name = "Auto Loot Ships",
        Default = false,
        Callback = function(Value)
            shared.autoCollectShips = Value
            while shared.autoCollectShips == true do
                for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if table.find(Ships, v.Name) then
                        local shipName = v.Name
                        for i, v in pairs(game:GetService("Workspace")[v.Name]:GetDescendants()) do
                            if v.Name == "ProximityPrompt" then
                                teleport(v.Parent.CFrame)
                                for i, v in pairs(game:GetService("Workspace")[shipName]:GetDescendants()) do
                                    if v.ClassName == "Folder" and v.Name == "Rarities" then
                                        local args = {
                                            [1] = workspace[shipName]:FindFirstChild(v.Parent.Name)
                                        }
                                        game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenChestFunction:InvokeServer(
                                            unpack(args)
                                        )
                                    end
                                end
                            end
                        end
                    end
                end
            wait(5)
            end
        end
    }
)

local SellingSec =
    AutoFarm:AddSection(
    {
        Name = "Selling"
    }
)

AutoFarm:AddToggle(
    {
        Name = "Auto Sell",
        Default = false,
        Callback = function(Value)
        shared.autoSell = Value
		while shared.autoSell do
            local args = {
                [1] = "SellEverything"
            }

            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer(unpack(args))
            wait(shared.autoSellCooldown)
            end
        end
    }
)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
)

OrionLib:MakeNotification(
    {
        Name = "Loaded!",
        Content = "Script has been successfully loaded!",
        Image = "rbxassetid://4483345998",
        Time = 3
    }
)
