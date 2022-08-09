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

local Teleport =
    Window:MakeTab(
    {
        Name = "Teleport",
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

                game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer(
                    unpack(args)
                )
                wait(shared.autoSellCooldown)
            end
        end
    }
)

Crates:AddToggle(
    {
        Name = "Auto Open Stone Crate",
        Default = false,
        Callback = function(Value)
            shared.autoOpenStoneChest = Value

            while shared.autoOpenStoneChest do
                autoOpenChest("stonechest")
                wait(shared.autoOpenCrateCooldown)
            end
        end
    }
)

Crates:AddToggle(
    {
        Name = "Auto Open Silver Crate",
        Default = false,
        Callback = function(Value)
            shared.autoOpenSilverChest = Value

            while shared.autoOpenSilverChest do
                autoOpenChest("silverchest")
                wait(shared.autoOpenCrateCooldown)
            end
        end
    }
)

Crates:AddToggle(
    {
        Name = "Auto Open Gold Chest",
        Default = false,
        Callback = function(Value)
            shared.autoOpenGoldChest = Value

            while shared.autoOpenGoldChest do
                autoOpenChest("goldchest")
                wait(shared.autoOpenCrateCooldown)
            end
        end
    }
)

Upgrades:AddToggle(
    {
        Name = "Auto Upgrade Hook Speed",
        Default = false,
        Callback = function(Value)
            shared.autoUpgradeHookSpeed = Value

            while shared.autoUpgradeHookSpeed do
                autoUpgrade("Hook Speed")
                wait(shared.autoUpgradeCooldown)
            end
        end
    }
)

Upgrades:AddToggle(
    {
        Name = "Auto Upgrade Reeling Speed",
        Default = false,
        Callback = function(Value)
            shared.autoUpgradeReelingSpeed = Value

            while shared.autoUpgradeReelingSpeed do
                autoUpgrade("Reeling Speed")
                wait(shared.autoUpgradeCooldown)
            end
        end
    }
)

Upgrades:AddToggle(
    {
        Name = "Auto Upgrade Strength",
        Default = false,
        Callback = function(Value)
            shared.autoUpgradeStrenght = Value

            while shared.autoUpgradeStrenght do
                autoUpgrade("Strength")
                wait(shared.autoUpgradeCooldown)
            end
        end
    }
)

Teleport:AddButton(
    {
        Name = "Teleport To Supplies Store",
        Callback = function()
            teleportToLocation("SuppliesStoreInterior", "Inside")
        end
    }
)

Teleport:AddButton(
    {
        Name = "Teleport To Tavern",
        Callback = function()
            teleportToLocation("TavernInterior", "Inside")
        end
    }
)

Teleport:AddButton(
    {
        Name = "Teleport To Pets Store",
        Callback = function()
            teleportToLocation("PetShop", "MainEntrance")
        end
    }
)

Teleport:AddButton(
    {
        Name = "Teleport To Rodney's Home",
        Callback = function()
            teleportToLocation("LivingSpaceInterior", "Inside")
        end
    }
)

Teleport:AddButton(
    {
        Name = "Teleport To Boat Shop",
        Callback = function()
            teleportToLocation("BoatShopInterior", "Inside")
        end
    }
)

Teleport:AddButton(
    {
        Name = "Teleport To Eruption Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(
                2689.80908,
                42.7682953,
                1484.38342,
                -0.1800908,
                3.48670461e-08,
                -0.983649969,
                3.66638169e-08,
                1,
                2.8734032e-08,
                0.983649969,
                -3.08896269e-08,
                -0.1800908
            )
        end
    }
)

Teleport:AddButton(
    {
        Name = "Teleport To Shadow Isles",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(
                2197.50464,
                43.3072357,
                -2223.0498,
                0.997799814,
                3.19511173e-08,
                0.066299215,
                -3.31668524e-08,
                1,
                1.72364061e-08,
                -0.066299215,
                -1.93974188e-08,
                0.997799814
            )
        end
    }
)

Teleport:AddButton(
    {
        Name = "Teleport To Ancient Shores",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(
                -2342.73145,
                41.7132492,
                -1764.89099,
                0.269242913,
                -1.32969422e-08,
                0.9630723,
                8.73161738e-08,
                1,
                -1.06038955e-08,
                -0.9630723,
                8.69468124e-08,
                0.269242913
            )
        end
    }
)

Teleport:AddButton(
    {
        Name = "Teleport To Pharaoh's Dunes",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(
                -4163.71826,
                41.6461487,
                425.615601,
                0.0506599918,
                1.00352544e-07,
                0.998715937,
                -4.27083684e-08,
                1,
                -9.83151764e-08,
                -0.998715937,
                -3.76728835e-08,
                0.0506599918
            )
        end
    }
)

Misc:AddToggle(
    {
        Name = "Auto Lock Mythicals",
        Default = false,
        Callback = function(Value)
            shared.autoLockMythicals = Value
            lockMythicals =
                RunService.Stepped:Connect(
                function()
                    if shared.autoLockMythicals == true then
                        for i, v in pairs(
                            game:GetService("Players").LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetDescendants(

                            )
                        ) do
                            if v.ClassName == "Tool" then
                                if table.find(mythicals, v.Name) then
                                    local args = {
                                        [1] = "Tools",
                                        [2] = v.Parent.Parent.Parent.Parent.Parent.Name,
                                        [3] = true
                                    }

                                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(
                                        unpack(args)
                                    )
                                end
                            end
                        end
                    end
                end
            )
            if shared.autoLockMythicals == false then
                lockMythicals:Disconnect()
            end
        end
    }
)

Misc:AddToggle(
    {
        Name = "Auto Lock Legendary",
        Default = false,
        Callback = function(Value)
            shared.autoLocklegendary = Value
            lockLegendary =
                RunService.Stepped:Connect(
                function()
                    if shared.autoLocklegendary == true then
                        for i, v in pairs(
                            game:GetService("Players").LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetDescendants(

                            )
                        ) do
                            if v.ClassName == "Tool" then
                                if table.find(legendary, v.Name) then
                                    local args = {
                                        [1] = "Tools",
                                        [2] = v.Parent.Parent.Parent.Parent.Parent.Name,
                                        [3] = true
                                    }

                                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(
                                        unpack(args)
                                    )
                                end
                            end
                        end
                    end
                end
            )
            if shared.autoLocklegendary == false then
                lockLegendary:Disconnect()
            end
        end
    }
)
Misc:AddToggle(
    {
        Name = "Auto Lock Key",
        Default = false,
        Callback = function(Value)
            shared.autoLockKey = Value
            lockKey =
                RunService.Stepped:Connect(
                function()
                    if shared.autoLockKey == true then
                        for i, v in pairs(
                            game:GetService("Players").LocalPlayer.PlayerGui.Interface.Inventory.Inventory.Frame.Backpack.List.Container:GetDescendants(

                            )
                        ) do
                            if v.ClassName == "Tool" then
                                if table.find(key, v.Name) then
                                    local args = {
                                        [1] = "Tools",
                                        [2] = v.Parent.Parent.Parent.Parent.Parent.Name,
                                        [3] = true
                                    }

                                    game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetInventoryItemLock:InvokeServer(
                                        unpack(args)
                                    )
                                end
                            end
                        end
                    end
                end
            )
            if shared.autoLockKey == false then
                lockKey:Disconnect()
            end
        end
    }
)

Settings:AddSlider(
    {
        Name = "Auto Sell Cooldown",
        Min = 0,
        Max = 10,
        Default = 5,
        Color = Color3.fromRGB(255, 255, 255),
        Increment = 1,
        ValueName = "Seconds",
        Callback = function(Value)
            shared.autoSellCooldown = Value
        end
    }
)

Settings:AddSlider(
    {
        Name = "Auto Fish Cooldown",
        Min = 2,
        Max = 10,
        Default = 2,
        Color = Color3.fromRGB(255, 255, 255),
        Increment = 1,
        ValueName = "Seconds",
        Callback = function(Value)
            shared.autoFishCooldown = Value
        end
    }
)

Settings:AddSlider(
    {
        Name = "Auto Open Crate Cooldown",
        Min = 0,
        Max = 10,
        Default = 1,
        Color = Color3.fromRGB(255, 255, 255),
        Increment = 1,
        ValueName = "Seconds",
        Callback = function(Value)
            shared.autoOpenCrateCooldown = Value
        end
    }
)

Settings:AddSlider(
    {
        Name = "Auto Upgrade Cooldown",
        Min = 0,
        Max = 10,
        Default = 1,
        Color = Color3.fromRGB(255, 255, 255),
        Increment = 1,
        ValueName = "Seconds",
        Callback = function(Value)
            shared.autoUpgradeCooldown = Value
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
