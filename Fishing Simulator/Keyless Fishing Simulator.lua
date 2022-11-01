repeat wait() until game:IsLoaded() and game:GetService("Players")
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
v:Disable()
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Reddy Hub: Fishing Simulator",
	LoadingTitle = "Reddy Hub...",
	LoadingSubtitle = "by Reddy and his team",
	ConfigurationSaving = {
		Enabled = false,
		FileName = "Reddy's Hub"
	},
	KeySystem = false,
	KeySettings = {
		Title = "Reddy's Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/YFgFhUWNFC)",
		Key = "1$QmYc%$0Gr!ek*e4Oq09T7!"
	}
})

local AutoFarm = Window:CreateTab("Auto Farm")
local Teleport = Window:CreateTab("Teleport")
local Movement = Window:CreateTab("Movement")
local Crates = Window:CreateTab("Crates")
local Upgrades = Window:CreateTab("Upgrades")
local Misc = Window:CreateTab("Misc")
local Settings = Window:CreateTab("Settings")

local SharkSec = AutoFarm:CreateSection("Sharks")
local CooldownSec = Settings:CreateSection("Cooldown")

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

local Toggle = AutoFarm:CreateToggle({
	Name = "Auto Kill Sharks",
	CurrentValue = false,
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
                end)
	end,
})

local FishesSec = AutoFarm:CreateSection("Fishes")

local Toggle = AutoFarm:CreateToggle({
	Name = "Auto Fish",
	CurrentValue = false,
	Callback = function(Value)
		shared.autoFish = Value
            while shared.autoFish do
                autoFish()
                wait(shared.autoFishCooldown)
            end
	end,
})

local ShipsSec = AutoFarm:CreateSection("Ships")
local SellingSec = AutoFarm:CreateSection("Selling")

local Toggle = AutoFarm:CreateToggle({
	Name = "Auto Sell",
	CurrentValue = false,
	Callback = function(Value)
		shared.autoFish = Value
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
	end,
})

local Toggle = Crates:CreateToggle({
	Name = "Auto Open Stone Crate",
	CurrentValue = false,
	Callback = function(Value)
		shared.autoOpenStoneChest = Value

            while shared.autoOpenStoneChest do
                autoOpenChest("stonechest")
                wait(shared.autoOpenCrateCooldown)
            end
	end,
})

local Toggle = Crates:CreateToggle({
	Name = "Auto Open Silver Crate",
	CurrentValue = false,
	Callback = function(Value)
		shared.autoOpenSilverChest = Value

            while shared.autoOpenSilverChest do
                autoOpenChest("silverchest")
                wait(shared.autoOpenCrateCooldown)
            end
	end,
})

local Toggle = Crates:CreateToggle({
	Name = "Auto Open Gold Chest",
	CurrentValue = false,
	Callback = function(Value)
		shared.autoOpenGoldChest = Value

            while shared.autoOpenGoldChest do
                autoOpenChest("goldchest")
                wait(shared.autoOpenCrateCooldown)
            end
	end,
})

local Toggle = Upgrades:CreateToggle({
	Name = "Auto Upgrade Hook Speed",
	CurrentValue = false,
	Callback = function(Value)
		shared.autoUpgradeHookSpeed = Value

            while shared.autoUpgradeHookSpeed do
                autoUpgrade("Hook Speed")
                wait(shared.autoUpgradeCooldown)
            end
	end,
})

local Toggle = Upgrades:CreateToggle({
	Name = "Auto Upgrade Reeling Speed",
	CurrentValue = false,
	Callback = function(Value)
		shared.autoUpgradeReelingSpeed = Value

            while shared.autoUpgradeReelingSpeed do
                autoUpgrade("Reeling Speed")
                wait(shared.autoUpgradeCooldown)
            end
	end,
})

local Toggle = Upgrades:CreateToggle({
	Name = "Auto Upgrade Strength",
	CurrentValue = false,
	Callback = function(Value)
		shared.autoUpgradeStrenght = Value

            while shared.autoUpgradeStrenght do
                autoUpgrade("Strength")
                wait(shared.autoUpgradeCooldown)
            end
	end,
})

local Button = Teleport:CreateButton({
	Name = "Teleport To Supplies Store",
        Callback = function()
            teleportToLocation("SuppliesStoreInterior", "Inside")
    end,
})

local Button = Teleport:CreateButton({
	Name = "Teleport To Tavern",
        Callback = function()
            teleportToLocation("TavernInterior", "Inside")
    end,
})

local Button = Teleport:CreateButton({
	Name = "Teleport To Pets Store",
        Callback = function()
            teleportToLocation("PetShop", "MainEntrance")
    end,
})

local Button = Teleport:CreateButton({
	Name = "Teleport To Rodney's Home",
        Callback = function()
            teleportToLocation("LivingSpaceInterior", "Inside")
    end,
})

local Button = Teleport:CreateButton({
	Name = "Teleport To Boat Shop",
        Callback = function()
            teleportToLocation("BoatShopInterior", "Inside")
    end,
})

local Button = Teleport:CreateButton({
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
    end,
})

local Button = Teleport:CreateButton({
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
    end,
})

local Button = Teleport:CreateButton({
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
    end,
})

local Button = Teleport:CreateButton({
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
    end,
})

local Toggle = Misc:CreateToggle({
	Name = "Auto Lock Mythicals",
	CurrentValue = false,
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
	end,
})

local Toggle = Misc:CreateToggle({
	Name = "Auto Lock Legendary",
	CurrentValue = false,
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
	end,
})

local Toggle = Misc:CreateToggle({
	Name = "Auto Lock Key",
	CurrentValue = false,
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
	end,
})

local Button = Misc:CreateButton({
	Name = "Teleport to your boat",
        Callback = function()
            local args = {
                [1] = workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Boat"),
                [2] = workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Boat").Controller.VehicleSeat
            }

            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SeatPlayer:FireServer(unpack(args))
    end,
})

local Slider = Settings:CreateSlider({
	Name = "Auto Sell Cooldown",
	Range = {0, 10},
	Increment = 1,
	Suffix = "Seconds",
	CurrentValue = 1,
	Callback = function(Value)
		shared.autoSellCooldown = Value
	end,
})

local Slider = Settings:CreateSlider({
	Name = "Auto Fish Cooldown",
	Range = {2, 10},
	Increment = 1,
	Suffix = "Seconds",
	CurrentValue = 3,
	Callback = function(Value)
		shared.autoFishCooldown = Value
	end,
})

local Slider = Settings:CreateSlider({
	Name = "Auto Open Crate Cooldown",
	Range = {0, 10},
	Increment = 1,
	Suffix = "Seconds",
	CurrentValue = 3,
	Callback = function(Value)
		shared.autoOpenCrateCooldown = Value
	end,
})

local Slider = Settings:CreateSlider({
	Name = "Auto Upgrade Cooldown",
	Range = {0, 10},
	Increment = 1,
	Suffix = "Seconds",
	CurrentValue = 3,
	Callback = function(Value)
		shared.autoUpgradeCooldown = Value
	end,
})

local Slider = Movement:CreateSlider({
	Name = "Walk Speed",
	Range = {16, 300},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})

local Slider = Movement:CreateSlider({
	Name = "Jump Power",
	Range = {50, 500},
	Increment = 1,
	Suffix = "Power",
	CurrentValue = 50,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
})

Rayfield:Notify("Loaded!","Script has been successfully loaded!",4483345998)