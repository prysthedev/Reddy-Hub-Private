getgenv().fence = {
    Toggles = {
        enabled = true,
        legit = false,
        rage = true,
        autoCollectLoot = false,
        stop = false,
    },
    Settings = {
        lastAttack = 0,
        minLevel = 10,
        maxLevel = 20,
        attackSpeed = 0.14,
    },
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

function GetNumberInString(String)
    local Number = ''
    for i = 1, #String do
        local Char = String:sub(i, i)
        if tonumber(Char) then
            Number = Number .. Char
        end
    end
    return tonumber(Number)
end

function GetLoot()
    local LootTable = {}
    for _, Loot in workspace.Projectiles:GetChildren() do
        if Loot:IsA('Part') and Loot:FindFirstChild('ProximityPrompt') then
            table.insert(LootTable, Loot)
        end
    end
    return LootTable
end

function GetEnemys()
    local Enemys = {}
    for _, Enemy in next, workspace.NPCs:GetChildren() do
        if Enemy:FindFirstChild("HumanoidRootPart") and GetNumberInString(Enemy.Name) >= fence.Settings.minLevel and GetNumberInString(Enemy.Name) <= fence.Settings.maxLevel then
            table.insert(Enemys, Enemy)
        end
    end
    return Enemys
end

function GetClosestEnemy()
    local Enemys = GetEnemys()
    local ClosestEnemy = nil
    local ClosestDistance = math.huge
    for _, Enemy in next, Enemys do
        local Distance = (RootPart.Position - Enemy.HumanoidRootPart.Position).Magnitude
        if Distance < ClosestDistance then
            ClosestDistance = Distance
            ClosestEnemy = Enemy
        end
    end
    return ClosestEnemy
end

function TeleportToEnemy(Enemy)
    local HumanoidRootPart = Enemy:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart then
        RootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 0, 2.5) * CFrame.Angles(0, math.rad(360), 0)
    end
end

function Attack()
    if tick() - (fence.Settings.lastAttack or 0) >= 0.14 then
        fence.Settings.lastAttack = tick()
        mouse1click()
    end
end

task.spawn(function()
    while fence.enabled do task.wait()
        local Loot = GetLoot()
        if #Loot ~= 0 and fence.Toggles.autoCollectLoot then
            fence.stop = true
            for i = 1, #Loot do
                local LootPart = Loot[i]
                if LootPart then
                    RootPart.CFrame = LootPart.CFrame
                    fireproximityprompt(LootPart.ProximityPrompt, 0)
                end
            end
        elseif #Loot == 0 then
            fence.stop = false
        end

        if fence.Toggles.rage and fence.Toggles.stop == false then
            local Enemy = GetClosestEnemy()
            if Enemy then
                TeleportToEnemy(Enemy)
                Attack()
            end
        elseif fence.Toggles.legit and fence.Toggles.stop == false then
            local Enemy = GetClosestEnemy()
            if Enemy then
                local Distance = (RootPart.Position - Enemy.HumanoidRootPart.Position).Magnitude
                Humanoid:MoveTo(Enemy.HumanoidRootPart.Position)
                if Distance <= 5 then
                    Attack()
                end
            end
        end
    end
end)
