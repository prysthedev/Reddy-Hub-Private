for v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v.Name == "OriginalSize" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame)
        local args = {
            [1] = workspace:FindFirstChild(v.Parent.Name)
        }

        game:GetService("ReplicatedStorage").FrameworkReplicated.DataStreams:FindFirstChild("RobNpc_Eventv.01"):FireServer(unpack(args))
    end
end