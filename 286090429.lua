--Get services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local MarketplaceService = game:GetService("MarketplaceService")
local GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name

--Loading local things
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local sc = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y /2)
local Down = false
local Inset = GuiService:GetGuiInset()


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Reddy Hub: "..GameName})

local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://8945416692",
})

local AimBotSec =
    Main:AddSection(
    {
        Name = "Aimbot"
    }
)

Main:AddToggle(
    {
        Name = "Aimbot",
        Default = false,
        Callback = function(Value)
            --Options
            shared.Options = {
                Enabled = Value,
                TeamCheck = true,
                Triggerbot = false,
                Smoothness = true,
                AimPart = "Head",
                FOV = 150
            }

            --Functions
            local gc = function()
                local nearest = math.huge
                local nearplr
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= game:GetService("Players").LocalPlayer and v.Character and v.Character:FindFirstChild(Options.AimPart) then
                        if Options.TeamCheck then
                            if game:GetService("Players").LocalPlayer.Team ~= v.Team then
                                local pos = Camera:WorldToScreenPoint(v.Character[Options.AimPart].Position)
                                local diff = math.sqrt((pos.X - sc.X) ^ 2 + (pos.Y + Inset.Y - sc.Y) ^ 2)
                                if diff < nearest and diff < Options.FOV then
                                    nearest = diff
                                    nearplr = v
                                end
                            end
                        else
                            local pos = Camera:WorldToScreenPoint(v.Character[Options.AimPart].Position)
                            local diff = math.sqrt((pos.X - sc.X) ^ 2 + (pos.Y + Inset.Y - sc.Y) ^ 2) 
                            if diff < nearest and diff < Options.FOV then
                                nearest = diff
                                nearplr = v
                            end
                        end
                    end
                end
                return nearplr
            end

            function drawCircle()
                local circ = Drawing.new("Circle")
                circ.Transparency = 1
                circ.Thickness = 1.5
                circ.Visible = true
                circ.Color = Color3.fromRGB(255,255,255)
                circ.Filled = false
                circ.NumSides = 150
                circ.Radius = shared.Options.FOV
                return circ
            end

            curc = drawCircle()

            --Main code
            UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton2 then
                    Down = true
                end
            end)

            UserInputService.InputEnded:Connect(function( input )
                if input.UserInputType == Enum.UserInputType.MouseButton2 then
                    Down = false
                end
            end)    

            RunService.RenderStepped:Connect(function( ... )
                if shared.Options.Enabled then
                    if Down then
                        if gc() ~= nil and gc().Character:FindFirstChild(Options.AimPart) then
                            if Options.Smoothness then
                                pcall(function( ... )
                                    local Info = TweenInfo.new(0.05,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
                                    game:GetService("TweenService"):Create(Camera,Info,{
                                        CFrame = CFrame.new(Camera.CFrame.p,gc().Character[Options.AimPart].CFrame.p)
                                    }):Play()
                                end)
                            else
                                pcall(function()
                                    Camera.CFrame = CFrame.new(Camera.CFrame.p,gc().Character[Options.AimPart].CFrame.p)
                                end)
                            end
                        end
                    end
                    curc.Visible = true
                    curc.Position = Vector2.new(Mouse.X, Mouse.Y+Inset.Y)
                    curc.Radius = shared.Options.FOV
                else
                    curc.Visible = false
                    pcall(function()
                        curc:Destroy()
                    end)
                end
            end)
        end
    }
)