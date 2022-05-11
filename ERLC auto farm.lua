getgenv().bankAutoFarm = false

function spawnMafia(name)
    spawn(function()
        local args = {
            [1] = name
        }

        game:GetService("ReplicatedStorage").FE.StartMafia:InvokeServer(unpack(args))
    end)
end

function startBankRobbery()
    spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1070.69275, 23.247839, 382.132477, -0.999849677, 4.43972965e-08, 0.0173376948, 4.24512017e-08, 1, -1.12614387e-07, -0.0173376948, -1.11861453e-07, -0.999849677)
        wait(0.5)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players")["rth_s"].Backpack["Beretta M9"])
        wait(0.5)
        local args = {
            [1] = "Beretta M9",
            [2] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Beretta M9").FrontEnd.Muzzle,
            [4] = Vector3.new(-1069.0832519531, 24.170707702637, 388.86340332031),
            [5] = Vector3.new(3.7550926208496e-06, -0.0019532404839993, -0.99999809265137),
            [6] = workspace.EnterableBuildings.Bank.BreakableGlass,
            [7] = Vector3.new(-1064.9046630859, 24.671226501465, 381.25503540039),
            [8] = Enum.Material.Plastic
        }

        game:GetService("ReplicatedStorage").Guns.Remotes.FireGun:FireServer(unpack(args))
        wait(0.5)
        local args = {
            [1] = "Beretta M9",
            [2] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Beretta M9").FrontEnd.Muzzle,
            [4] = Vector3.new(-1069.0832519531, 24.170707702637, 388.86340332031),
            [5] = Vector3.new(3.7550926208496e-06, -0.0019532404839993, -0.99999809265137),
            [6] = workspace.EnterableBuildings.Bank.BreakableGlass,
            [7] = Vector3.new(-1064.9046630859, 24.671226501465, 381.25503540039),
            [8] = Enum.Material.Plastic
        }

        game:GetService("ReplicatedStorage").Guns.Remotes.FireGun:FireServer(unpack(args))
        wait(0.5)
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    end)
end

function buyGun()
    spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.10254, 24.2379971, -195.258774, -0.00148998655, -6.33829345e-08, -0.999998868, -3.36591377e-08, 1, -6.33328554e-08, 0.999998868, 3.3564735e-08, -0.00148998655)
        wait(0.5)
        local args = {
            [1] = "Beretta M9"
        }

        game:GetService("ReplicatedStorage").FE.BuyGun:InvokeServer(unpack(args))
        wait(0.5)
        local args = {
            [1] = "Beretta M9",
            [2] = true
        }

        game:GetService("ReplicatedStorage").FE.EquipGun:InvokeServer(unpack(args))
    end)
end

function makeKeyCode()
    spawn(function()
        local keyCode = game:GetService("Workspace").EnterableBuildings.Bank.Notecard.SurfaceGui.TextLabel.Text

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1224.10254, 24.2379971, -195.258774, -0.00148998655, -6.33829345e-08, -0.999998868, -3.36591377e-08, 1, -6.33328554e-08, 0.999998868, 3.3564735e-08, -0.00148998655)
        game:GetService("ReplicatedStorage").Bank.UseKeypad:FireServer()
        wait(1)
    end)
end

function plantExplosives()
    spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1096.71497, 23.6750278, 419.490021, 0.999503732, -1.0225726e-07, 0.0315003134, 1.04442471e-07, 1, -6.77256722e-08, -0.0315003134, 7.09820327e-08, 0.999503732)
        wait(0.5)
        game:GetService("ReplicatedStorage").Bank.PlantExplosive:FireServer()
    end)
end

-- Decompiled with the Synapse X Luau decompiler.

local l__LocalPlayer__1 = game:GetService("Players").LocalPlayer;
local l__Parent__2 = script.Parent;
local u1 = require(l__Parent__2.Parent.MenuFunctions);
local u2 = false;
local l__EnteredCode__3 = l__Parent__2:WaitForChild("EnteredCode");
local l__Buttons__4 = l__Parent__2:WaitForChild("Buttons");
local l__Beep__5 = l__Parent__2:WaitForChild("Beep");
local l__Response__6 = l__Parent__2:WaitForChild("Response");
local function u7()
	u1.ClearMenuConnections(l__Parent__2);
	_G.CloseMenu("Small", l__Parent__2);
end;
local function u8(p1)
	u2 = false;
	l__EnteredCode__3.Text = "";
	for v3, v4 in pairs(l__Buttons__4:GetChildren()) do
		if v4:IsA("TextButton") and v4.Name ~= "Blank" then
			u1.AddMenuConnection(l__Parent__2, v4.MouseButton1Down:Connect(function()
				l__EnteredCode__3.Text = l__EnteredCode__3.Text .. v4.Name;
				l__Beep__5:Play();
				l__Response__6:Fire();
			end));
		end;
	end;
	u1.AddMenuConnection(l__Parent__2, script.Parent.Close.MouseButton1Down:Connect(function()
		u2 = true;
		l__Response__6:Fire();
	end));
	while true do
		l__Response__6.Event:Wait();
		if u2 then
			break;
		end;
		if #l__EnteredCode__3.Text == p1 then
			break;
		end;	
	end;
	u7();
	if u2 then
		return;
	end;
	return l__EnteredCode__3.Text;
end;
game:GetService("ReplicatedStorage"):WaitForChild("FE").PromptKeypad.OnClientInvoke = function(p2)
	if _G.InMenu then
		return;
	end;
	_G.OpenMenu("Small", l__Parent__2);
	return u8(p2);
end;
