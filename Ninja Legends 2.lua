shared.autoClick = false
shared.autoSell = false

local playerHead = game.Players.LocalPlayer.Character.Head
local sellCircle = game:GetService("Workspace").sellAreaCircles.sellAreaCircle.circleInner.TouchInterest

function autoClick()
    spawn(function()
        while shared.autoClick do
            local args = {
                [1] = "swingBlade"
            }

            game:GetService("Players").LocalPlayer.saberEvent:FireServer(unpack(args))
            wait()
        end
    end)
end

function autoSell()
    spawn(function()
        while shared.autoSell do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-90.1704483, 126.394089, 136.585037, 0.0216045324, -1.49178007e-07, 0.999766588, 2.83965544e-08, 1, 1.48599199e-07, -0.999766588, 2.51795118e-08, 0.0216045324)
            wait()
        end
    end)
end