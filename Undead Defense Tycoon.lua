function getCFrame()
    spawn(function()
        for v in pairs(game:GetService("Workspace").Zombies:GetDescendants()) do
            if v.Name == "HumanoidRootPart" then
                return v.CFrame()
            end
        end
    end)
end

print(getCFrame())

local args = {
    [1] = Vector3.new(-32.03874206542969, 69.1583251953125, 922.4083251953125),
    [2] = {},
    [3] = {
        [1] = Vector3.new(0.15000000596046448, 0.15000000596046448, 4),
        [2] = nil --[[Color3]],
        [3] = 0,
        [4] = Enum.Material.SmoothPlastic,
        [5] = 1250
    },
    [4] = {}
}

game:GetService("Players").LocalPlayer.Character.Pistol.Fire:FireServer(unpack(args))
