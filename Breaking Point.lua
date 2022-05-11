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

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/reddythedev/robloxthings/main/Library"))()

local FinityWindow = library.new(true)
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightShift)

local Main = FinityWindow:Category("Main")

local Crates = Main:Sector("Crates")
local AutoFarm = Main:Sector("Main")
local Discord = Main:Sector("Discord")

Crates:Cheat("Dropdown", "Select Gun Crate", function(Option)
	shared.gunCrate = Option
end, {
	options = {
		"Colors",
		"Regular Case",
		"Uncommon Case",
		"Rare Case",
		"Legendary Case"
	}
})

Crates:Cheat("Dropdown", "Select Knife Crate", function(Option)
	shared.knifeCrate = Option
end, {
	options = {
		"Colors",
		"Common Case",
		"Uncommon Case",
		"Rare Case",
		"Legendary Case"
	}
})

Crates:Cheat("Dropdown", "Select Chair Crate", function(Option)
	shared.chairCrate = Option
end, {
	options = {
		"Colors",
		"Pattern",
		"Uncommon Case",
		"Rare Case",
		"Legendary Case"
	}
})

Crates:Cheat(
	"Checkbox",
	"Open Selected Gun Crate",
	function(State)
		shared.gunEnabled = State
        openGunCrate(shared.gunCrate)
	end
)

Crates:Cheat(
	"Checkbox",
	"Open Selected Knife Crate",
	function(State)
		shared.knifeEnabled = State
        openKnifeCrate(shared.knifeCrate)
	end
)

Crates:Cheat(
	"Checkbox",
	"Open Selected Chair Crate",
	function(State)
		shared.chairEnabled = State
        openChairCrate(shared.chairCrate)
	end
)

AutoFarm:Cheat(
	"Checkbox",
	"AutoFarm",
	function(State)
		shared.autoFarmEnabled = State
        autoFarm()
	end
)

AutoFarm:Cheat("Label", "This will teleport you if you aren't in right server.")

Discord:Cheat(
	"Button",
	"Copy Discord Invite",
	function()
		setclipboard("https://discord.gg/HjdtekKvDs")
	end
)

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