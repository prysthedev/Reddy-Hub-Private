shared.infiniteCoins = true

function infiniteCoins()
    spawn(function()
        while shared.infiniteCoins do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11124.5898, 389.118469, 96.1325684, -0.998964906, 8.1412395e-08, 0.0454877093, 7.7742186e-08, 1, -8.24546902e-08, -0.0454877093, -7.88330325e-08, -0.998964906)
            local args = {
                [1] = 1000,
                [2] = "the South Pole",
                [3] = game:GetService("Players").LocalPlayer
            }

            game:GetService("ReplicatedStorage").Coins_Award:FireServer(unpack(args))
            wait()
        end
    end)
end

infiniteCoins()