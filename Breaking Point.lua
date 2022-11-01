shared.gunCrate = "Colors"
shared.knifeCrate = "Colors"
shared.knifeEnabled = false
shared.gunEnabled = false
shared.chairCrate = "Colors"
shared.chairEnabled = false
shared.autoFarmEnabled = false

repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Reddy Hub: Breaking Point (Outdated)",
	LoadingTitle = "Reddy Hub...",
	LoadingSubtitle = "by Reddy and his team",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "Reddy Hub",
		FileName = "Breaking Point"
	},
	KeySystem = true,
	KeySettings = {
		Title = "Reddy's Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/YFgFhUWNFC)",
		Key = "z5#8yiBUBqO&5^W7UBNfY9M2"
	}
})

local Crates = Window:CreateTab("Crates")
local AutoFarm = Window:CreateTab("Main")

local Dropdown = Crates:CreateDropdown({
	Name = "Select Gun Crate",
	Options = {"Colors","Regular Case","Uncommon Case","Rare Case","Legendary Case"},
	CurrentOption = "Colors",
	Flag = "gunCrate",
	Callback = function(Option)
        shared.gunCrate = Option
	end,
})

local Dropdown = Crates:CreateDropdown({
	Name = "Select Knife Crate",
	Options = {"Colors","Common Case","Uncommon Case","Rare Case","Legendary Case"},
	CurrentOption = "Colors",
	Flag = "knifeCrate",
	Callback = function(Option)
        shared.knifeCrate = Option
	end,
})

local Dropdown = Crates:CreateDropdown({
	Name = "Select Chair Crate",
	Options = {"Colors","Pattern","Uncommon Case","Rare Case","Legendary Case"},
	CurrentOption = "Colors",
	Flag = "chairCrate",
	Callback = function(Option)
        shared.knifeCrate = Option
	end,
})

local Toggle = Crates:CreateToggle({
	Name = "Open Selected Gun Crate",
	CurrentValue = false,
	Flag = "openGunCrateToggle",
	Callback = function(Value)
		shared.gunEnabled = Value
        openGunCrate(shared.gunCrate)
	end,
})

local Toggle = Crates:CreateToggle({
	Name = "Open Selected Knife Crate",
	CurrentValue = false,
	Flag = "openKnifeCrateToggle",
	Callback = function(Value)
		shared.knifeEnabled = Value
        openKnifeCrate(shared.knifeCrate)
	end,
})

local Toggle = Crates:CreateToggle({
	Name = "Open Selected Chair Crate",
	CurrentValue = false,
	Flag = "openChairCrateToggle",
	Callback = function(Value)
		shared.chairEnabled = Value
        openChairCrate(shared.chairCrate)
	end,
})

local Toggle = AutoFarm:CreateToggle({
	Name = "AutoFarm",
	CurrentValue = false,
	Flag = "autoFarmToggle",
	Callback = function(Value)
		shared.autoFarmEnabled = Value
        autoFarm()
	end,
})

local Label = AutoFarm:CreateLabel("This will teleport you if you aren't in right server.")

function openGunCrate(crate)
    spawn(function()
        while shared.gunEnabled == true do
            local args = {
                [1] = 66,
                [2] = "Gun Skins",
                [3] = crate
            }

            game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
            wait(0.1)
        end
    end)
end

function openKnifeCrate(crate2)
    spawn(function()
        while shared.knifeEnabled == true do
            local args = {
                [1] = 66,
                [2] = "Knife Skins",
                [3] = crate2
            }
            
            game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
            wait(0.1)
        end
    end)
end

function openChairCrate(crate3)
    spawn(function()
        while shared.chairEnabled == true do
            local args = {
                [1] = 66,
                [2] = "Chair Skins",
                [3] = crate3
            }

            game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
            wait(0.1)
        end
    end)
end

function autoFarm()
    spawn(function()
        if game.PlaceId == 834827615 then
        repeat wait() until game:IsLoaded()
        
        Clone = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:Clone()
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:Destroy()
        Clone.Parent = game:GetService("Players").LocalPlayer.Character
        game.Players.LocalPlayer.settings["Display Gun"].Value = true
        game.Players.LocalPlayer.CharacterAdded:Connect(
            function()
                if shared.autoFarmEnabled == true then
                    pcall(function()
                    game.Players.LocalPlayer.settings["Display Gun"].Value = true
                    wait(4)
                    Clone = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:Clone()
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:Destroy()
                    Clone.Parent = game:GetService("Players").LocalPlayer.Character
                    end)
                end
            end
        )

        while shared.autoFarmEnabled == true do
            pcall(function()
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
            end)
            wait()
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name == game.Players.LocalPlayer.Name then
                else
                    pcall(function()
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(30, v)
                    end)
                end
            end
        end
    else
        game:GetService("TeleportService"):Teleport(834827615, LocalPlayer)
    end
    end)
end