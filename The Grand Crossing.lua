getgenv().autoFixReactor = false
getgenv().autoRaidSafe = false
getgenv().autoRaidVault = false
getgenv().autoRaidReactor = false
getgenv().autoFarmHonor = false
getgenv().honorFarmSafe = false
getgenv().honorFarmBorder = false

print("Created by Reddy#6616")

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("The Grand Crossing")

local b = w:CreateFolder("Main")

local c = w:CreateFolder("Shop (Civilian)")

local n = w:CreateFolder("Shop (Nighthawk)")

local t = w:CreateFolder("Teleport")

b:Toggle("Infinite money farm (Unsafe, Nighthawk team only)",function(bool)
    getgenv().autoFixReactor = bool
    autoFixReactor()
end)

b:Toggle("Auto Safe Farm",function(bool)
    getgenv().autoRaidSafe = bool
    autoRaidSafe()
    autoCollectMoneyFromSafe()
end)

b:Toggle("Auto Vault Farm",function(bool)
    getgenv().autoRaidVault = bool
    autoRaidVault()
    autoCollectMoneyFromVault()
end)

b:Toggle("Auto Reactor Farm",function(bool)
    getgenv().autoRaidReactor = bool
    autoRaidReactor()
end)

--b:Toggle("Auto Honor Farm (Nighthawk)",function(bool)
--    getgenv().autoFarmHonor = bool
--    autoFarmHonor()
--end)

b:Button("Copy Discord Invite",function()
    setclipboard("https://discord.gg/HjdtekKvDs")
end)

c:Button("Buy Passport (Free)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "PassportShop",
        [3] = "Items",
        [4] = "Passport",
        [5] = "Passport"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy Auger (1600c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "Auger"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy C4 (600c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "C4"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy Hacking Device (600c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "Hacking Device"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy L95-S (1750c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "L95-S"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy M16A4 (750c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "M16A4"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy MAC-10 (500c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "MAC-10"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy MP-7 (650c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "MP-7"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy Red Sword (1500c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "Red Sword"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy SCAR-L (1600c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "SCAR-L"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy SPAS-55 (1200c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "SPAS-55"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy Time Bomb (1000c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "Time Bomb"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

c:Button("Buy Titan (1600c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "CivShop",
        [3] = "Items",
        [4] = "M16A4",
        [5] = "Titan"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy Auger (1500c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "Auger"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy ICR-3 (2000c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "ICR-3"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy M16A4 (1500c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "M16A4"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy MAC-10 (1500c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "MAC-10"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy MK-14 (1700c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "MK-14"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy MZ-12 (1600c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "MZ-12"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy P-90 (1600c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "P90"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy Paladin (2000c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "Paladin"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy Revolver (1400c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "Revolver"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy SPAS-55 (2500c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "SPAS-55"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy Titan (2500c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "Titan"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

n:Button("Buy USP-S (1250c)",function()
    local args = {
        [1] = "BuyItem",
        [2] = "AdvancedShop",
        [3] = "Items",
        [4] = "MK-14",
        [5] = "USP-S"
    }

    game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))
end)

t:Button("Entrance",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-328.259552, 572.317627, -1604.77551, 0.999787629, -3.17587094e-08, 0.0206073243, 3.04316714e-08, 1, 6.47100435e-08, -0.0206073243, -6.40691837e-08, 0.999787629) 
end)

t:Button("Border",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-216.132126, 572.103577, -1875.7522, 0.999952316, -1.19800916e-08, -0.00976338703, 1.25785018e-08, 1, 6.12298905e-08, 0.00976338703, -6.13497804e-08, 0.999952316) 
end)

t:Button("Civil Spawn",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-327.882172, 500.184174, -913.414612, 0.999942899, 1.27715607e-08, -0.0106891859, -1.38682532e-08, 1, -1.02524197e-07, 0.0106891859, 1.02666576e-07, 0.999942899) 
end)

t:Button("Nighthawk Spawn",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-530.172119, 576.099487, -1853.28479, -0.00928365346, -7.3863994e-08, -0.999956906, -5.03131581e-08, 1, -7.34000665e-08, 0.999956906, 4.96295662e-08, -0.00928365346) 
end)

t:Button("Safe Inside",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(272.734283, 558.770691, -2273.86304, 0.0477990732, 7.3159228e-08, 0.998856962, -3.90143811e-08, 1, -7.13759647e-08, -0.998856962, -3.55580809e-08, 0.0477990732) 
end)

t:Button("Safe Outside",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(42.1452446, 551.850464, -2275.70654, 0.00164000306, -1.96505106e-08, 0.999998629, -9.78888748e-10, 1, 1.96521412e-08, -0.999998629, -1.01111708e-09, 0.00164000306) 
end)

t:Button("Reactor",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-636.898438, 555.711731, -1796.12488, 0.000754662906, -4.19471782e-08, 0.999999702, 1.2276903e-08, 1, 4.19379269e-08, -0.999999702, 1.2245251e-08, 0.000754662906) 
end)

t:Button("Inside Reactor",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-658.288269, 564.398682, -1795.83752, -0.0278061796, -1.99970085e-08, 0.999613345, -1.61682578e-09, 1, 1.99597672e-08, -0.999613345, -1.06119569e-09, -0.0278061796) 
end)

t:Button("Laboratory",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-739.13147, 523.478027, -2297.78687, 0.0330651365, -6.67709941e-08, 0.999453187, 6.23784413e-10, 1, 6.67868889e-08, -0.999453187, -1.58487423e-09, 0.0330651365) 
end)

t:Button("Vault Outside",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-898.065308, 549.661377, -1520.29712, -0.704159856, -2.07037996e-08, 0.710041463, 1.58460689e-09, 1, 3.07300603e-08, -0.710041463, 2.27640111e-08, -0.704159856) 
end)

t:Button("Vault Inside",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-912.65625, 550.017822, -1504.96704, -0.720243156, 4.39318271e-08, 0.693721652, 3.70122866e-09, 1, -5.94850142e-08, -0.693721652, -4.02760527e-08, -0.720243156) 
end)

t:Button("Cave",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-173.50943, 384.999908, -1006.65765, 0.887341976, 1.17828742e-08, -0.461111933, 1.04596962e-08, 1, 4.56813218e-08, 0.461111933, -4.53580427e-08, 0.887341976) 
end)

t:Button("Prison",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(218.675171, 579.350098, -1904.58923, -0.999957323, -1.40791894e-08, 0.00924040936, -1.30603919e-08, 1, 1.10314886e-07, -0.00924040936, 1.1018949e-07, -0.999957323) 
end)

t:Button("Armory",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919.03241, 597.137207, -1820.68469, -0.999986947, -7.46259582e-11, 0.00510570733, -1.97112868e-10, 1, -2.39896885e-08, -0.00510570733, -2.3990383e-08, -0.999986947) 
end)

t:Button("Sell Materials",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-66.6913528, 505.350983, -888.976257, 0.0665202886, 9.02929074e-08, -0.997785091, 2.29003239e-09, 1, 9.06460116e-08, 0.997785091, -8.31475866e-09, 0.0665202886) 
end)

t:Button("Claim Apartment",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-329.765259, 571.544861, -2469.4729, -0.0601593442, 1.26306844e-07, 0.998188794, 2.8753794e-08, 1, -1.2480308e-07, -0.998188794, 2.11936424e-08, -0.0601593442) 
end)

function autoFixReactor()
    spawn(function()
        while getgenv().autoFixReactor do
            game:GetService("ReplicatedStorage").Systems:FindFirstChild("Raid System").Events.OnReactorFix:FireServer()
            wait()
        end
    end) 
end

function autoRaidSafe()
    spawn(function()
        while getgenv().autoRaidSafe do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-913.252319, 550.015808, -1506.50317, -0.970486224, -4.60431124e-08, 0.241156608, -3.75462399e-08, 1, 3.98289082e-08, -0.241156608, 2.95988816e-08, -0.970486224)
            
            local args = {
                [1] = "Safe"
            }

            game:GetService("ReplicatedStorage").Systems:FindFirstChild("Raid System").Events.OnRaidStart:FireServer(unpack(args))
            wait(1)
        end
    end) 
end

function autoRaidVault()
    spawn(function()
        while getgenv().autoRaidVault do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(289.141663, 561.91449, -2273.3501, 0.0167428553, 6.51331717e-08, 0.99985981, -1.43625183e-08, 1, -6.49017977e-08, -0.99985981, -1.32738638e-08, 0.0167428553)
            
            local args = {
                [1] = "Vault"
            }

            game:GetService("ReplicatedStorage").Systems:FindFirstChild("Raid System").Events.OnRaidStart:FireServer(unpack(args))
            wait(1)
        end
    end) 
end

function autoRaidReactor()
    spawn(function()
        while getgenv().autoRaidReactor do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-645.954041, 563.896606, -1795.81616, 0.0109842224, 1.47211567e-08, 0.99993968, 3.64995201e-10, 1, -1.4726055e-08, -0.99993968, 5.26727439e-10, 0.0109842224)
            
            local args = {
                [1] = "BuyItem",
                [2] = "CivShop",
                [3] = "Items",
                [4] = "M16A4",
                [5] = "Time Bomb"
            }
        
            game:GetService("ReplicatedStorage").Remotes.Shop:InvokeServer(unpack(args))

            local args = {
                [1] = "Reactor"
            }

            game:GetService("ReplicatedStorage").Systems:FindFirstChild("Raid System").Events.OnRaidStart:FireServer(unpack(args))
            wait(1)
        end
    end) 
end

function autoCollectMoneyFromSafe()
    spawn(function()
        while getgenv().autoRaidSafe do
            local args = {
                [1] = "Safe"
            }

            game:GetService("ReplicatedStorage").Systems:FindFirstChild("Raid System").Events.OnRaidInteract:FireServer(unpack(args))
            wait(0.5)
        end
    end)
end

function autoCollectMoneyFromVault()
    spawn(function()
        while getgenv().autoRaidVault do
            local args = {
                [1] = "Vault"
            }

            game:GetService("ReplicatedStorage").Systems:FindFirstChild("Raid System").Events.OnRaidInteract:FireServer(unpack(args))
            wait(0.5)
        end
    end)
end

--function autoFarmHonor()
--    spawn(function()
--        while getgenv().autoFarmHonor do
--            if getgenv().honorFarmSafe == false then
--                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29.1882401, 551.850647, -2249.64258, -0.0471775457, -6.64177477e-08, 0.998886526, 3.15051985e-08, 1, 6.79797836e-08, -0.998886526, 3.46772353e-08, -0.0471775457)
--                wait(400)
--                autoCollectPatrolVault()
--                getgenv().honorFarmSafe = true
--                print("Honor Farm Status: Safe")
--            elseif getgenv().honorFarmBorder == true then
--                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-779.038818, 555.861633, -1639.81897, 0.0473101437, -8.10740275e-08, 0.998880267, 3.77276912e-08, 1, 7.93780117e-08, -0.998880267, 3.39300605e-08, 0.0473101437)
--                wait(400)
--                autoCollectPatrolBorder()
--                getgenv().honorFarmSafe = false
--                getgenv().honorFarmBorder = false
--                print("Honor Farm Status: Vault", honorFarmStatus)
--            elseif getgenv().honorFarmSafe == true then
--                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-779.038818, 555.861633, -1639.81897, 0.0473101437, -8.10740275e-08, 0.998880267, 3.77276912e-08, 1, 7.93780117e-08, -0.998880267, 3.39300605e-08, 0.0473101437)
--                wait(400)
--                autoCollectPatrolSafe()
--                getgenv().honorFarmSafe = false
--                getgenv().honorFarmBorder = true
--                print("Honor Farm Status: Vault", honorFarmStatus)
--            end
--        end
--    end)
--end

function autoCollectPatrolVault()
    spawn(function()
        local args = {
            [1] = "claimMission",
            [2] = "honorMissions",
            [3] = "Patrol Vault for 5 Minutes"
        }

        game:GetService("ReplicatedStorage").Remotes.Missions.Function:InvokeServer(unpack(args))
    end)
end

function autoCollectPatrolSafe()
    spawn(function()
        local args = {
            [1] = "claimMission",
            [2] = "honorMissions",
            [3] = "Patrol Safe for 5 Minutes"
        }

        game:GetService("ReplicatedStorage").Remotes.Missions.Function:InvokeServer(unpack(args))
    end)
end

function autoCollectPatrolBorder()
    spawn(function()
        local args = {
            [1] = "claimMission",
            [2] = "honorMissions",
            [3] = "Patrol Border for 5 Minutes"
        }

        game:GetService("ReplicatedStorage").Remotes.Missions.Function:InvokeServer(unpack(args))
    end)
end