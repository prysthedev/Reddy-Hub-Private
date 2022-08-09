--Locker
shared.lockedScript_gerg487G8gre7 = false
local playerId = game:GetService("Players").LocalPlayer.UserId
local playerUsername = game:GetService("Players").LocalPlayer.Name

local owners = {
	"2657770337",
	"3036303121"
}

local names = {
	"Iamnoble_1",
	"despairDCLXVI",
	"yaxausevenom"
}

local testers = {
	"3478289766",
	"3402794295"
}

local admins = {
	""
}

--Anti AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local library1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/reddythedev/robloxthings/main/Library"))()
local FinityWindow = library1.new(true)
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightShift)

local Key = FinityWindow:Category("Key")

function loadScript()
	spawn(function()
		--Loading important stuff
		local RunService = game:GetService("RunService")

		--Up to date tables
		local spears = loadstring(game:HttpGet(('https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Utils/Spears')))()
		local mythicals = loadstring(game:HttpGet(('https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Utils/Mythicals')))()
		local legendary = loadstring(game:HttpGet(('https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Utils/Legendary')))()

		--Tables
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
			"ShipModel10",
		}

		local key = {
			"whalekey"
		}

		--Settings
		shared.autoSellCooldown = 5
		shared.autoFishCooldown = 2
		shared.autoOpenCrateCooldown = 1
		shared.autoUpgradeCooldown = 1

		--UI
		local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/reddythedev/robloxthings/main/Library"))()

		local FinityWindow = library.new(true)
		FinityWindow.ChangeToggleKey(Enum.KeyCode.RightShift)

		local Main = FinityWindow:Category("Main")
		local Settings = FinityWindow:Category("Settings")

		local AutoFarm = Main:Sector("AutoFarm")
		local Crates = Main:Sector("Crates")
		local Upgrades = Main:Sector("Upgrades")
		local Teleport = Main:Sector("Teleport")
		local Misc = Main:Sector("Misc")

		local Cooldowns = Settings:Sector("Cooldowns")

		--Teleport function
		function teleport(location)
			bLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			if game.Players.LocalPlayer.Character.Humanoid.Sit then
				game.Players.LocalPlayer.Character.Humanoid.Sit = false
			end
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = location
		end

		--Catch fish function
		function catchfish()
			spawn(function()
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishCaught:FireServer()
			end)
		end

		--Bait fish function
		function baitFish()
			spawn(function()
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.FishBiting:InvokeServer()
			end)
		end

		--Auto fish function
		function autoFish()
			spawn(function()
				local args = {
					[1] = 1
				}
				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.SetEquippedItem:InvokeServer(unpack(args))

				baitFish()
				catchfish()
			end)
		end

		--Auto open chest function
		function autoOpenChest(chest)
			spawn (function()
				local args = {
					[1] = chest
				}

				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenLootboxFunction:InvokeServer(unpack(args))
			end)
		end

		--Auto upgrade function
		function autoUpgrade(item)
			spawn (function()
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
			end)
		end

		--Teleport to player function
		function teleportToPlayer(player)
			spawn (function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[player].Character.HumanoidRootPart.CFrame
			end)
		end

		--Take all quests function
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

		--Teleport to location function
		function teleportToLocation(location, entrance)
			spawn (function()
				local args = {
					[1] = location,
					[2] = entrance
				}

				game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.EnterDoor:InvokeServer(unpack(args))
			end)
		end

		--Auto Kill Sharks
		AutoFarm:Cheat(
			"Checkbox",
			"Auto Kill Sharks",
			function(State)
				shared.toggle = State

				if shared.toggle == true then
					killSharks = RunService.Stepped:Connect(function()
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
					killSharks:Disconnect()
					teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
				end
			end
		)

		--Auto Kill Sharks Method #2 (Still in development)
		--AutoFarm:Cheat(
			--"Checkbox",
			--"Auto Kill Sharks #2 (BETA AND BUGGY)",
			--function(State)
				--shared.toggle = State

				--if shared.toggle == true then
					--killSharks = RunService.Stepped:Connect(function()
						--for i, v in pairs(game.Workspace:GetChildren()) do
							--if v:FindFirstChild("Health") and v:FindFirstChild("IsSeaMonster") and v.Name == "GreatWhiteShark" or v.Name == "BigGreatWhiteShark" or v.Name == "KillerWhale" or v.Name == "NeonGreatWhiteShark" or v.Name == "MobyWood" then
								--teleport(v.HumanoidRootPart.CFrame - Vector3.new(30, 0, 30))
								--local monsterName = v.Name
								--wait(0.25)
								--for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Interface.Inventory.QuickAccess:GetDescendants()) do
									--if v.ClassName == "Tool" then
										--if table.find(spears, v.Name) then
											--game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.MonsterHit:FireServer(workspace[monsterName], v.Name, true)
											--break
										--end
									--end
								--end
							--else
								--for i,v in pairs(game:GetService("Workspace").DroppedItems:GetDescendants()) do
									--if v.ClassName == "MeshPart" then
										--teleport(v.CFrame)
										--wait(0.25)
									--end
								--end
							--end
						--end
					--end)
				--else
					--killSharks:Disconnect()
					--teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
				--end
			--end
		--)

		--Auto Loot Ships
		AutoFarm:Cheat(
			"Checkbox",
			"Auto Loot Ships (Really Laggy)",
			function(State)
			shared.autoCollectShips = State

			if shared.autoCollectShips == true then
				collectShips = RunService.Stepped:Connect(function()
					for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
						if table.find(Ships, v.Name) then
							local shipName = v.Name
							for i,v in pairs(game:GetService("Workspace")[v.Name]:GetDescendants()) do     
								if v.Name == "ProximityPrompt" then                    
									teleport(v.Parent.CFrame)
									for i,v in pairs(game:GetService("Workspace")[shipName]:GetDescendants()) do
										if v.ClassName == "Folder" and v.Name == "Rarities" then
											local args = {
												[1] = workspace[shipName]:FindFirstChild(v.Parent.Name)
											}
											game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenChestFunction:InvokeServer(unpack(args))
										end
									end
								end
							end
						end
					end
				end)
			else
				collectShips:Disconnect()
				teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
			end
			end
		)

		--Auto Fish
		AutoFarm:Cheat(
			"Checkbox",
			"Auto Fish",
			function(State)
				shared.autoFish = State
				
				while shared.autoFish do
					autoFish()
					wait(shared.autoFishCooldown)
				end
			end
		)

		--Auto Sell
		AutoFarm:Cheat(
			"Checkbox",
			"Auto Sell",
			function(State)
				shared.autoSell = State
				
				while shared.autoSell do
					local args = {
						[1] = "SellEverything"
					}

					game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.processGameItemSold:InvokeServer(unpack(args))
					wait(shared.autoSellCooldown)
				end
			end
		)

		--Auto Open Stone Chest
		Crates:Cheat(
			"Checkbox",
			"Auto Open Stone Chest",
			function(State)
				shared.autoOpenStoneChest = State
				
				while shared.autoOpenStoneChest do
					autoOpenChest("stonechest")
					wait(shared.autoOpenCrateCooldown)
				end
			end
		)

		--Auto Open Silver Chest
		Crates:Cheat(
			"Checkbox",
			"Auto Open Silver Chest",
			function(State)
				shared.autoOpenSilverChest = State
				
				while shared.autoOpenSilverChest do
					autoOpenChest("silverchest")
					wait(shared.autoOpenCrateCooldown)
				end
			end
		)

		--Auto Open Gold Chest
		Crates:Cheat(
			"Checkbox",
			"Auto Open Gold Chest",
			function(State)
				shared.autoOpenGoldChest = State
				
				while shared.autoOpenGoldChest do
					autoOpenChest("goldchest")
					wait(shared.autoOpenCrateCooldown)
				end
			end
		)

		--Auto Upgrade Hook Speed
		Upgrades:Cheat(
			"Checkbox",
			"Auto Upgrade Hook Speed",
			function(State)
				shared.autoUpgradeHookSpeed = State
				
				while shared.autoUpgradeHookSpeed do
					autoUpgrade("Hook Speed")
					wait(shared.autoUpgradeCooldown)
				end
			end
		)

		--Auto Upgrade Reeling Speed
		Upgrades:Cheat(
			"Checkbox",
			"Auto Upgrade Reeling Speed",
			function(State)
				shared.autoUpgradeReelingSpeed = State
				
				while shared.autoUpgradeReelingSpeed do
					autoUpgrade("Reeling Speed")
					wait(shared.autoUpgradeCooldown)
				end
			end
		)

		--Auto Upgrade Strenght
		Upgrades:Cheat(
			"Checkbox",
			"Auto Upgrade Strength",
			function(State)
				shared.autoUpgradeStrenght = State
				
				while shared.autoUpgradeStrenght do
					autoUpgrade("Strength")
					wait(shared.autoUpgradeCooldown)
				end
			end
		)

		--Teleport To Supplies Store
		Teleport:Cheat(
			"Button",
			"Teleport To Supplies Store",
			function()
				teleportToLocation("SuppliesStoreInterior", "Inside")
			end
		)

		--Teleport To Tavern
		Teleport:Cheat(
			"Button",
			"Teleport To Tavern",
			function()
				teleportToLocation("TavernInterior", "Inside")
			end
		)

		--Teleport To Pets Store
		Teleport:Cheat(
			"Button",
			"Teleport To Pets Store",
			function()
				teleportToLocation("PetShop", "MainEntrance")
			end
		)

		--Teleport To Rodney's Home
		Teleport:Cheat(
			"Button",
			"Teleport To Rodney's Home",
			function()
				teleportToLocation("LivingSpaceInterior", "Inside")
			end
		)

		--Teleport To Boat Shop
		Teleport:Cheat(
			"Button",
			"Teleport To Boat Shop",
			function()
				teleportToLocation("BoatShopInterior", "Inside")
			end
		)

		--Teleport To Eruption Island
		Teleport:Cheat(
			"Button",
			"Teleport To Eruption Island",
			function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2689.80908, 42.7682953, 1484.38342, -0.1800908, 3.48670461e-08, -0.983649969, 3.66638169e-08, 1, 2.8734032e-08, 0.983649969, -3.08896269e-08, -0.1800908)
			end
		)

		--Teleport To Shadow Isles
		Teleport:Cheat(
			"Button",
			"Teleport To Shadow Isles",
			function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2197.50464, 43.3072357, -2223.0498, 0.997799814, 3.19511173e-08, 0.066299215, -3.31668524e-08, 1, 1.72364061e-08, -0.066299215, -1.93974188e-08, 0.997799814)
			end
		)

		--Teleport To Ancient Shores
		Teleport:Cheat(
			"Button",
			"Teleport To Ancient Shores",
			function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2342.73145, 41.7132492, -1764.89099, 0.269242913, -1.32969422e-08, 0.9630723, 8.73161738e-08, 1, -1.06038955e-08, -0.9630723, 8.69468124e-08, 0.269242913)
			end
		)

		--Teleport To Pharaoh's Dunes
		Teleport:Cheat(
			"Button",
			"Teleport To Pharaoh's Dunes",
			function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4163.71826, 41.6461487, 425.615601, 0.0506599918, 1.00352544e-07, 0.998715937, -4.27083684e-08, 1, -9.83151764e-08, -0.998715937, -3.76728835e-08, 0.0506599918)
			end
		)

		--Auto Lock Mythicals
		Misc:Cheat(
			"Checkbox",
			"Auto Lock Mythicals",
			function(State)
				shared.autoLockMythicals = State
				
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
			end
		)

		--Auto Lock Legendary
		Misc:Cheat(
			"Checkbox",
			"Auto Lock Legendary",
			function(State)
				shared.autoLocklegendary = State
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
			end
		)

		--Auto Lock Key
		Misc:Cheat(
			"Checkbox",
			"Auto Lock Key",
			function(State)
				shared.autoLockKey = State
				
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
			end
		)

		--Auto Sell Cooldown
		Cooldowns:Cheat(
			"Slider", 
			"Auto Sell Cooldown", 
			function(Value)
				shared.autoSellCooldown = Value
		end, {min = 0.5, max = 10, suffix = " seconds"})

		--Auto Fish Cooldown
		Cooldowns:Cheat(
			"Slider", 
			"Auto Fish Cooldown", 
			function(Value)
				shared.autoFishCooldown = Value
		end, {min = 2, max = 10, suffix = " seconds"})

		--Auto Open Crate Cooldown
		Cooldowns:Cheat(
			"Slider", 
			"Auto Open Crate Cooldown", 
			function(Value)
				shared.autoOpenCrateCooldown = Value
		end, {min = 0.5, max = 10, suffix = " seconds"})

		--Auto Upgrade Cooldown
		Cooldowns:Cheat(
			"Slider", 
			"Auto Upgrade Cooldown", 
			function(Value)
				shared.autoUpgradeCooldown = Value
		end, {min = 0.5, max = 10, suffix = " seconds"})
	end)
end

--Loader
if shared.lockedScript_gerg487G8gre7 == true then
	if table.find(owners, tostring(playerId)) then
		if table.find(names, playerUsername) then
			print("Welcome! Your rank is: Owner")
			loadScript()
		else
			game.Players.LocalPlayer:Kick("You are not whitelisted. Your ID: " .. playerId)
		end
	elseif table.find(admins, tostring(playerId)) then
		if table.find(names, playerUsername) then
			print("Welcome! Your rank is: Admin")
			loadScript()
		else
			game.Players.LocalPlayer:Kick("You are not whitelisted. Your ID: " .. playerId)
		end
	elseif table.find(testers, tostring(playerId)) then
		if table.find(names, playerUsername) then
			print("Welcome! Your rank is: Tester")
			loadScript()
		else
			game.Players.LocalPlayer:Kick("You are not whitelisted. Your ID: " .. playerId)
		end
	else
		game.Players.LocalPlayer:Kick("You are not whitelisted. Your ID: " .. playerId)
	end
else
	loadScript()
	print("Welcome to the script! Script created by: Reddy#6616")
end