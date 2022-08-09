local TweenService = game:GetService("TweenService")
local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
local prison = {}
prison.CFrame = CFrame.new(2111.86548, 26.5052834, 428.534546, -0.00518191606, -4.08859968e-09, -0.999986589, -2.22932854e-08, 1, -3.97313116e-09, 0.999986589, 2.22723973e-08, -0.00518191606)

local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear)

local tween = TweenService:Create(HumanoidRootPart, tweenInfo, prison)

tween:Play()

--Bank: 734.574524, 109.764679, 532.889771, 0.344500333, -8.24170741e-08, -0.938786209, 6.06386195e-08, 1, -6.55389414e-08, 0.938786209, -3.43485098e-08, 0.344500333

--Base: 2111.86548, 26.5052834, 428.534546, -0.00518191606, -4.08859968e-09, -0.999986589, -2.22932854e-08, 1, -3.97313116e-09, 0.999986589, 2.22723973e-08, -0.00518191606