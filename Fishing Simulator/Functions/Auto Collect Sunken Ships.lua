shared.autoCollectShips = false

local RunService = game:GetService("RunService")
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

function teleport(loc)
    bLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = loc
end

if shared.autoCollectShips then
    collectShips = RunService.Stepped:Connect(function()
        for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if table.find(Ships, v.Name) then
                for i,v in pairs(v.Name:GetDescendants()) do
                    if v.Name == "ProximityPrompt" then
                        teleport(v.Parent.CFrame)
                        wait(0.25)
                        fireproximityprompt(v.Name, 100)
                    end
                end
            end
        end
    end)
else
    collectShips:Disconnect()
    teleport(CFrame.new(1.8703980445862, 53.57190322876, -188.37982177734))
end