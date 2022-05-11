shared.cool = false
shared.heat = false
shared.doing = nil
shared.next = nil
shared.waitTime = 3
local localPlayerCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

function coolTheCore()
    spawn(function()
        while shared.cool == true do
            if shared.doing == heating then
                shared.next = cooling
                wait(shared.waitTime)
                shared.doing = cooling 
            end
            
            wait(shared.waitTime)
            shared.doing = shared.next
        end
    end)
end

function portToCFrame(cframe)
    spawn(function()
        localPlayerCFrame = CFrame.new(cframe)
    end)
end

function heatTheCore()
    spawn(function()
        while shared.heat == true do
            if shared.doing == cooling then
                shared.next = heating
                wait(shared.waitTime)
                shared.doing = heating 
            end
            portToCFrame("8.67722702, 21.6380215, 66.6876221, -0.999998391, 2.72557066e-09, 0.00180102175, 2.62171818e-09, 1, -5.76655204e-08, -0.00180102175, -5.76607064e-08, -0.999998391")
            
            
            wait(shared.waitTime)
            shared.doing = shared.next
        end
    end)
end