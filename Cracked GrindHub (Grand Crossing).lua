local grindhub = Instance.new("Part")
            grindhub.Name = "grindhub"
            grindhub.Parent = game.Workspace
            grindhub.Position = Vector3.new(-328.4450378418, 506.14901733398, -862.31768798828)
            grindhub.Anchored = true
            local Mesh = Instance.new("SpecialMesh", game.Workspace.grindhub)
            Mesh.MeshId = "http://www.roblox.com/asset/?id=7679595061"   
            print("Welcome to GrindHub")
            if game.PlaceId == 885450884 then

                local trash = game:GetService("Workspace").Map.sw.Part
                trash.Mesh.MeshId = "https://assetdelivery.roblox.com/v1/asset/?id=5310351747"
                trash.Mesh.TextureId = "http://www.roblox.com/asset/?id=5309633883"
                trash.Position = Vector3.new(-245.08721923828, 575.17034912109, -1881.59375)
                trash.Mesh.Scale = Vector3.new(10, 10, 10)
                local vu = game:GetService("VirtualUser")
                game:GetService("Players").LocalPlayer.Idled:connect(function()
                   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                   wait(1)
                   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end)
                local plr = game:GetService("Players").LocalPlayer
                print("start")
              
                --grindhub start
                local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
                local Window = Library.CreateLib("Grind Hub - V.2.0.4", "Ocean")
              
                --home section
                local Home = Window:NewTab("Home")
                local HomeSection = Home:NewSection("Made by: SpaceMan#3664")
                local HomeSection = Home:NewSection("Discord Server: discord.gg/GsARKfHTzK")
                HomeSection:NewButton("Rejoin Game.", "Will rejoin the game for you.", function()
                    local TeleportService = game:GetService("TeleportService")
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    local Rejoin = coroutine.create(function()
                        local Success, ErrorMessage = pcall(function()
                            TeleportService:Teleport(game.PlaceId, LocalPlayer)
                        end)
                        if ErrorMessage and not Success then
                            warn(ErrorMessage)
                        end
                    end)
                    coroutine.resume(Rejoin)
                end)
              
                --guns
                local Guns = Window:NewTab("Weapons")
                local GunsSection = Guns:NewSection("Doesn't work for nighthawk team.")
              
                --get all guns
                GunsSection:NewButton("Get all guns.", "Will grab all the guns for you.", function()
                    for i,v in pairs(game:GetService("Workspace").Pickups.Debris:GetChildren()) do
                        local weapons = v.ClickBox.ClickDetector
                        fireclickdetector(weapons)
                    end
                end)
                GunsSection:NewButton("Equip all guns.", "Will equip all guns.", function()
                    for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        v.Parent = game.Players.LocalPlayer.Character
                     end
                end)
                print("wp mods")
                GunsSection:NewButton("Make gun invisible.", "Will make your gun invisible.", function()
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Tool") then
                            for i,a in pairs(v:GetDescendants()) do
                                if a:IsA("MeshPart") then
                                    if  a.Name ~= "DamagePart" and a.Name ~= "Handle" then
                                       a:Destroy() 
                                    end
                                end
                            end
                        end
                    end
                end)
              
                --weapon mods
                local Mods = Window:NewTab("Weapon Mods")
                local ModsSection = Mods:NewSection("Weapon Modifications")
              
                --shoot type
                ModsSection:NewButton("Automatic gun", "Makes your gun shoot automatically.", function()
                    for i, v in next, getgc(true) do
                        if type(v) == "table" and rawget(v, "damage") then
                            v.shootType = "Auto"
                        end
                    end
                end)
              
                --ammo
                ModsSection:NewButton("Inf ammo", "Seems clear to me.", function()
                    for i, v in next, getgc(true) do
                        if type(v) == "table" and rawget(v, "damage") then
                                v.ammo = math.huge
                        end
                    end
                end)
              
                --0 spread
                ModsSection:NewButton("0 spread", "doesn't spread the bullets.", function()
                    for i, v in next, getgc(true) do
                        if type(v) == "table" and rawget(v, "damage") then
                            v.spread = 0
                        end
                    end
                end)
              
                --range
                ModsSection:NewButton("Range", "Gun range.", function()
                    for i, v in next, getgc(true) do
                        if type(v) == "table" and rawget(v, "damage") then
                            v.range = 10000
                        end
                    end
                end)
              
                --bullet number
                ModsSection:NewButton("Bullet Number", "100 bullets per click", function()
                    for i, v in next, getgc(true) do
                        if type(v) == "table" and rawget(v, "damage") then
                            v.bulletNumber = 100
                        end
                    end
                end)
              
                --no reload
                ModsSection:NewButton("no reload time", "no reload time", function()
                    for i, v in next, getgc(true) do
                        if type(v) == "table" and rawget(v, "damage") then
                            v.reloadTime = 0
                        end
                    end
                end)
              
                --no fire rate
                ModsSection:NewButton("No Firerate", "no shoot cooldown", function()
                    for i, v in next, getgc(true) do
                        if type(v) == "table" and rawget(v, "damage") then
                            v.fireRate = 0
                        end
                    end
                end)
                print("localplayer")
                local LocalPlayer = Window:NewTab("LocalPlayer")
                local LocalPlayerSection = LocalPlayer:NewSection("LocalPlayer stuff.")
              
                --Change WalkSpeed
                LocalPlayerSection:NewSlider("Change Speed", "Will change your WalkSpeed.", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
                end)
              
                --Change JumpPower
                LocalPlayerSection:NewSlider("Change Jump", "Will change your JumpPwer.", 500, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
                end)
              
                --Force Reset
                LocalPlayerSection:NewButton("Force Reset", "Will reset your character.", function()
                    game.Players.LocalPlayer.Character.Humanoid.RigType = "R6"
                end)
              
                --No Max Zoom
                LocalPlayerSection:NewButton("No Max Zoom", "You can look further away.", function()
                    game.Players.LocalPlayer.CameraMaxZoomDistance = 100000
                end)
              
                --Others
                local OtherLocalPlayerSection = LocalPlayer:NewSection("Other Stuff.")
                OtherLocalPlayerSection:NewButton("Get Fake Inf Money", "Will change money (Fake).", function()
                    game:GetService("Players").LocalPlayer.Credits.Value = "INF"
                end)
                OtherLocalPlayerSection:NewSlider("Change Kills", "Will change kills, Others cannot see.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
                    game:GetService("Players").LocalPlayer.leaderstats.Kills.Value = s
                end)
                OtherLocalPlayerSection:NewButton("Sit", "Will make the character sit.", function()
                    game.Players.LocalPlayer.Character.Humanoid.Sit = true
                end)
                OtherLocalPlayerSection:NewButton("Get Safe Money", "Will automatically get the safe money for you when raiding the safe..", function()
                    while true do
                        wait(0)
                        local A_1 = "Safe"
                        local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidInteract
                        Event:FireServer(A_1)
                    end
                    print("Auto Safe Turned On")
                end)
                OtherLocalPlayerSection:NewButton("Get Vault Money", "Auto Get Vault Money", function()
                    while true do
                        wait(0)
                        local A_1 = "Vault"
                        local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidInteract
                        Event:FireServer(A_1)
                    end
                    print("Auto Vault Turned On")
                end)
                OtherLocalPlayerSection:NewButton("Throw Medinate", "Throw med grenade.", function()
                    local A_1 = Vector3.new(0,10000,0)
                    local A_2 = "Medinade"
                    local A_3 = 100000000000
                    local Event = game:GetService("ReplicatedStorage").Modules.Grenades.Remotes.ThrowGrenade
                    Event:FireServer(A_1, A_2, A_3)
                end)
                

                OtherLocalPlayerSection:NewButton("Throw gas grenade", "Throw gas grenade.", function()
                    local A_1 = Vector3.new(0,10000,0)
                    local A_2 = "Tear Gas Nade"
                    local A_3 = 100000000000
                    local Event = game:GetService("ReplicatedStorage").Modules.Grenades.Remotes.ThrowGrenade
                    Event:FireServer(A_1, A_2, A_3)
                end)
                OtherLocalPlayerSection:NewButton("Get Medkit", "Get free medkit.", function()
                    local clone = game:GetService("ReplicatedStorage").Assets.Weapons.Medkit:Clone()
                    clone.Parent = game.Players.LocalPlayer.Backpack
                end)
                OtherLocalPlayerSection:NewButton("Open first Border Gate", "Opens First Border Gate", function()
                    local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-198.69711303711, 571.09228515625, -1948.7708740234)
                    wait(0.2)
                    fireclickdetector(game:GetService("Workspace").BorderScanner.Controls.FirstDoor.ClickDetector)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
                end)
                OtherLocalPlayerSection:NewButton("Open second Border Gate", "Opens Second Border Gate", function()
                    local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-198.69711303711, 571.09228515625, -1948.7708740234)
                    wait(0.2)
                    fireclickdetector(game:GetService("Workspace").BorderScanner.Controls.SecondDoor.ClickDetector)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
                end)
                OtherLocalPlayerSection:NewButton("Open Both Border Gates", "Opens Both Border Gates", function()
                    local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-198.69711303711, 571.09228515625, -1948.7708740234)
                    wait(0.2)
                    fireclickdetector(game:GetService("Workspace").BorderScanner.Controls.SecondDoor.ClickDetector)
                    fireclickdetector(game:GetService("Workspace").BorderScanner.Controls.FirstDoor.ClickDetector)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
                end)
                OtherLocalPlayerSection:NewButton("Destroy vault lasers", "Destroys vault lasers", function()
                    local vaultlasers = game:GetService("Workspace").Doors.Lasers.Lasers
                    vaultlasers:Destroy()
                end)
              
                OtherLocalPlayerSection:NewButton("Play Titanic", "Plays Titanic Song", function()
                
                    --titanic song
                    game:GetService("Workspace").HonorDing.Volume = 1
                    game:GetService("Workspace").HonorDing.SoundId = "rbxassetid://454451340"
                    game:GetService("Workspace").HonorDing:Play()
                    game:GetService("Workspace").HonorDing.TimeLenght = 10
                end)
                OtherLocalPlayerSection:NewButton("Become Giant Head", "Use City Life Woman Head to work.", function()
                    local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.Humanoid.RigType = "R6"
                    wait(10)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
                    local LocalPlayer = game:GetService("Players").LocalPlayer
                    local Character = LocalPlayer.Character
                    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                    function rm()
                        for i,v in pairs(Character:GetDescendants()) do
                            if v:IsA("BasePart") then
                                if v.Name == "Handle" or v.Name == "Head" then
                                    if Character.Head:FindFirstChild("OriginalSize") then
                                        Character.Head.OriginalSize:Destroy()
                                    end
                                else
                                    for i,cav in pairs(v:GetDescendants()) do
                                        if cav:IsA("Attachment") then
                                            if cav:FindFirstChild("OriginalPosition") then
                                                cav.OriginalPosition:Destroy()  
                                            end
                                        end
                                    end
                                    v:FindFirstChild("OriginalSize"):Destroy()
                                    if v:FindFirstChild("AvatarPartScaleType") then
                                        v:FindFirstChild("AvatarPartScaleType"):Destroy()
                                    end
                                end
                            end
                        end
                    end
                    rm()
                    wait(0.5)
                    Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
                    wait(1)
                    rm()
                    wait(0.5)
                    Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
                    wait(1)
                    rm()
                    wait(0.5)
                    Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
                    wait(1)
                    rm()
                    wait(0.5)
                    Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
                    wait(1)
                    rm()
                    wait(0.5)
                    Humanoid:FindFirstChild("HeadScale"):Destroy()
                    wait(1) 
                    game.Players.LocalPlayer.Character.Humanoid.HipHeight = 20
                end)
              
                OtherLocalPlayerSection:NewButton("Get players inventory", "Get all weapons etc from other players.", function()
                    for i,v in pairs(game.Players:GetChildren()) do
                        for i,v in pairs(v.Backpack:GetChildren()) do
                            local clone = v:Clone()
                            clone.Parent = game.Players.LocalPlayer.Backpack
                        end
                    end
                end)
              
                print("autofarm")
                OtherLocalPlayerSection:NewButton("Remove C4+Hackable Doors", "Removes shit doors", function()
                
                    --destroy hackable and c4 doors
                    for i,v in pairs(game:GetService("Workspace").Doors:GetChildren()) do
                        v:Destroy()
                    end
                end)
                OtherLocalPlayerSection:NewButton("Remove Invisible Barriers", "Removes shit barriers", function()
                
                    --remove invis barriers
                    for i,v in pairs(game:GetService("Workspace").Map["InvisibleBricks (Lighting/BorderWalls)"]:GetChildren()) do
                        v:Destroy()
                    end
                end)
              
                local Message = Window:NewTab("Message Functions")
                local MessageSection = Message:NewSection("Chat stuff.")
                MessageSection:NewButton("Turn Message Functions On", "Turns message functions on.", function()
                    local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                    game.Players.LocalPlayer.Chatted:Connect(function(msg)
                        if msg == "/nighthawk" then
                            local A_1 = 
                            {
                                ["request"] = "spawnPlayer", 
                                ["team"] = "Nighthawk", 
                                ["morph"] = "Cadet"
                            }
                            local Event = game:GetService("ReplicatedStorage").Remotes.Intro.Request
                            Event:InvokeServer(A_1)
                            wait(0.5)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-528.79998779297, 575.83563232422, -1839.8000488281)
                            wait(0.5)
                            local A_1 = ""
                            local A_2 = "All"
                            local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                  
                    local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                    game.Players.LocalPlayer.Chatted:Connect(function(msg)
                        if msg == "/rebel" then
                            local A_1 = 
                            {
                                ["request"] = "spawnPlayer", 
                                ["team"] = "Rebels", 
                                ["morph"] = "Cadet"
                            }
                            local Event = game:GetService("ReplicatedStorage").Remotes.Intro.Request
                            Event:InvokeServer(A_1)
                            wait(0.5)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1090.8199462891, 584.75549316406, -1223.66015625)
                            wait(0.5)
                            local A_1 = ""
                            local A_2 = "All"
                            local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                  
                    local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                    game.Players.LocalPlayer.Chatted:Connect(function(msg)
                        if msg == "/citizen" then
                            local A_1 = 
                            {
                                ["request"] = "spawnPlayer", 
                                ["team"] = "Citizen", 
                                ["morph"] = false
                            }
                            local Event = game:GetService("ReplicatedStorage").Remotes.Intro.Request
                            Event:InvokeServer(A_1)
                            wait(0.5)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-301.75015258789, 499.59545898438, -878.8310546875)
                            local A_1 = ""
                            local A_2 = "All"
                            local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                            Event:FireServer(A_1, A_2)
                        end
                    end)
                  
                    if msg == "/equipall" then
                        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            v.Parent = game.Players.LocalPlayer.Character
                         end                
                    end
                end)
              
              
              
              
                --------------[[MOET EEN TAB NAAR BENEDEN ANDERS IS SCRIPT VERNEUKT.]]--------------
              
              
              
              
                local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                game.Players.LocalPlayer.Chatted:Connect(function(msg)
                    if msg == "/fixreactor" then
                        wait(0.5)
                        local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnReactorFix
                        Event:FireServer()
                        wait(0.5)
                        local A_1 = ""
                        local A_2 = "All"
                        local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                        Event:FireServer(A_1, A_2)
                    end
                end)
              
              
                local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                game.Players.LocalPlayer.Chatted:Connect(function(msg)
                    if msg == "/fakeraid" then
                        local posi = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        game:GetService("Workspace")["Raid System"].Systems.Vault.Vault.Interaction.Position = posi
                        wait(0.5)
                        local A_1 = "Vault"
                        local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidStart
                        Event:FireServer(A_1) 
                    end
                end)  
              
              
                game.Players.LocalPlayer.Chatted:Connect(function(msg)
                    if msg == "/buyguns" then
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "Auger"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local player = game.Players.LocalPlayer
                        local rl = game:GetService("ReplicatedStorage").Assets.Weapons.Medkit:Clone()
                        rl.Parent = player.Backpack
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "C4"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "L95-S"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "Hacking Device"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "M16A4"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "MAC-10"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "MP-7"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "Red Sword"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "SCAR-L"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "SPAS-55"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "Time Bomb"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "CivShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "Titan"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "RebelShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "C4"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "RebelShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "ICR-3"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "RebelShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "Medi-Gun"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "RebelShop"
                        local A_3 = "Items"
                        local A_4 = "M16A4"
                        local A_5 = "X9 Pistol"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "AdvancedShop"
                        local A_3 = "Items"
                        local A_4 = "MK-14"
                        local A_5 = "MK-14"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "AdvancedShop"
                        local A_3 = "Items"
                        local A_4 = "MK-14"
                        local A_5 = "Auger"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "AdvancedShop"
                        local A_3 = "Items"
                        local A_4 = "MK-14"
                        local A_5 = "MZ-12"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "AdvancedShop"
                        local A_3 = "Items"
                        local A_4 = "MK-14"
                        local A_5 = "P90"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "AdvancedShop"
                        local A_3 = "Items"
                        local A_4 = "MK-14"
                        local A_5 = "Revolver"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "AdvancedShop"
                        local A_3 = "Items"
                        local A_4 = "MK-14"
                        local A_5 = "SPAS-55"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                        local A_1 = "BuyItem"
                        local A_2 = "AdvancedShop"
                        local A_3 = "Items"
                        local A_4 = "MK-14"
                        local A_5 = "USP-S"
                        local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                        Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    end
                end)  
              
              
                local Humanoid = game.Players.LocalPlayer.Character.Humanoid
                game.Players.LocalPlayer.Chatted:Connect(function(msg)
                    if msg == "/getguns" then
                        fireclickdetector(game:GetService("Workspace").Pickups.Titan.Touch.ClickDetector)
                        wait(0.1)
                        fireclickdetector(game:GetService("Workspace").Pickups["Tear Gas Nade"].Touch.ClickDetector)
                        wait(0.1)
                        fireclickdetector(game:GetService("Workspace").Pickups["Officer Revolver A"].Touch.ClickDetector)
                        wait(0.1)
                        fireclickdetector(game:GetService("Workspace").Pickups["Dual MP-7s"].Touch.ClickDetector)
                        wait(0.1)
                        fireclickdetector(game:GetService("Workspace").Pickups["Grenade Launcher"].Touch.ClickDetector)
                        wait(0.1)
                        fireclickdetector(game:GetService("Workspace").Pickups.FAMAS.Touch.ClickDetector)
                        wait(0.1)
                        fireclickdetector(game:GetService("Workspace").Pickups.Paladin.Touch.ClickDetector)
                        wait(0.1)
                        fireclickdetector(game:GetService("Workspace").Pickups["MK-14"].Touch.ClickDetector)
                        wait(0.1)
                        fireclickdetector(game:GetService("Workspace").Pickups.Flamethrower.Touch.ClickDetector)
                    end
                end)  
              
              
              
              
              
                    --------[[TAB MOET HIER EINDIGEN, HIERNA IS HET NORMAAL.]]-------
              
              
              
              
              
              
                --slow autofarm
                local farm = Window:NewTab("Autofarm")
                local farmSection = farm:NewSection("Slow Autofarm")
                farmSection:NewToggle("Autofarm Vault", "Autofarm the vault.", function(state)
                    if state then
                        getgenv(2).Toggle = true
                        while Toggle  == true do
                            wait()
                            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(286.24005126953, 553.20562744141, -2273.0639648438)
                            local A_1 = "Vault"
                            local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidStart
                            Event:FireServer(A_1)
                            local A_1 = "Vault"
                            local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidInteract
                            Event:FireServer(A_1)
                        end
                    else 
                        getgenv(2).Toggle = false
                    end
                end)
              
                farmSection:NewToggle("Autofarm Safe", "Autofarm the Safe.", function(state)
                    if state then
                        getgenv(3).Toggle = true
                        while Toggle  == true do
                            wait()
                            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-911.42926025391, 540.59320068359, -1507.029296875)
                            local A_1 = "Safe"
                            local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidStart
                            Event:FireServer(A_1)
                            local A_1 = "Safe"
                            local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnRaidInteract
                            Event:FireServer(A_1)
                        end
                    else 
                        getgenv(3).Toggle = false
                    end
                end)
              
              
                --fast autofarm
                local FastfarmSection = farm:NewSection("Fast Autofarm")
                FastfarmSection:NewToggle("Fix Reactor Spam", "Join nighthawk group to use", function(state)
                    if state then
                        getgenv(1).Toggle = true
                        while Toggle == true do
                            local Event = game:GetService("ReplicatedStorage").Systems["Raid System"].Events.OnReactorFix
                            Event:FireServer()
                            wait()
                        end
                    else
                        getgenv(1).Toggle = false
                    end
                end)
                print("buy")
                
                local HonorSection = farm:NewSection("Honor Autofarm")
                HonorSection:NewToggle("Honor Autofarm", "I suggest using autoclicker to claim the honor.", function(state)
                    if state then
                        getgenv(2).Toggle = true
                        while Toggle  == true do
                            wait()
                            local body = game.Players.LocalPlayer.Character.HumanoidRootPart
                
                            for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Missions.Main.MissionList:GetChildren()) do
                                if v:IsA "Frame" then 
                                    if v.Name == "Patrol Vault for 5 Minutes" then
                                        print("Starting...")
                                        print(v.Name)
                                        body.CFrame = CFrame.new(1.0845682621002, 553.96350097656, -2252.1564941406)
                                        wait(315)
                                    elseif v.Name == "Patrol Border Gate for 5 Minutes" then
                                        print("Starting...")
                                        print(v.Name)
                                        body.CFrame = CFrame.new(-215.52420043945, 572.93487548828, -1901.7037353516)
                                        wait(315)
                                        print("Done")
                                    elseif v.Name == "Patrol Safe for 5 Minutes" then
                                        print("Starting...")
                                        print(v.Name)
                                        body.CFrame = CFrame.new(-798.55194091797, 557.24066162109, -1666.0010986328)
                                        wait(315)
                                        print("Done")
                                    end
                                end
                            end
                        end
                    else 
                        getgenv(2).Toggle = false
                    end
                end)
                
                
                
                --buy section
              
              
                --auto buy
                local buy = Window:NewTab("Shop stuff")
                local BuyAllSection = buy:NewSection("Buy All Weapons.")
                BuyAllSection:NewButton("Buy Everything", "Will Buy Everything For You.", function()
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Auger"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local player = game.Players.LocalPlayer
                    local rl = game:GetService("ReplicatedStorage").Assets.Weapons.Medkit:Clone()
                    rl.Parent = player.Backpack
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "C4"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "L95-S"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Hacking Device"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "M16A4"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "MAC-10"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "MP-7"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Red Sword"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "SCAR-L"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "SPAS-55"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Time Bomb"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Titan"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "C4"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "ICR-3"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Medi-Gun"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "X9 Pistol"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "MK-14"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "Auger"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "MZ-12"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "P90"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "Revolver"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "SPAS-55"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                    local A_1 = "BuyItem"
                    local A_2 = "AdvancedShop"
                    local A_3 = "Items"
                    local A_4 = "MK-14"
                    local A_5 = "USP-S"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                end)
              
                --click to buy
                local ClickBuy = buy:NewSection("Click To Buy.")
                ClickBuy:NewButton("Buy Red Sword (250)", "Get red sword from distance", function()
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Red Sword"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                end)
              
                ClickBuy:NewButton("Buy C4 (400)", "Get c4 from distance", function()
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "C4"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                end)
              
                ClickBuy:NewButton("Buy Hacking Device (400)", "Get hacking device from distance", function()
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Hacking Device"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                end)
              
                ClickBuy:NewButton("Buy Medi Gun (1000)", "Get medigun from distance", function()
                    local A_1 = "BuyItem"
                    local A_2 = "RebelShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Medi-Gun"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                end)
              
                ClickBuy:NewButton("Buy time bomb (1000)", "Get timebomb from distance", function()
                    local A_1 = "BuyItem"
                    local A_2 = "CivShop"
                    local A_3 = "Items"
                    local A_4 = "M16A4"
                    local A_5 = "Time Bomb"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                end)
              
                ClickBuy:NewButton("Get Passport (Free)", "Will get you a passport:>", function()
                    local A_1 = "BuyItem"
                    local A_2 = "PassportShop"
                    local A_3 = "Items"
                    local A_4 = "Passport"
                    local A_5 = "Passport"
                    local Event = game:GetService("ReplicatedStorage").Remotes.Shop
                    Event:InvokeServer(A_1, A_2, A_3, A_4, A_5)
                end)
              
              
                print("chaos")
                local chaos = Window:NewTab("Lag Server")
                local chaosSection = chaos:NewSection("This will lag the server.")
                local chaosSection1 = chaos:NewSection("Equip GrenadeLauncher or Passport to start.")
                chaosSection1:NewButton("Spam Grenades", "Rejoin to stop.", function()
                    while true do
                        wait() 
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-110, -110, -110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-10, -10, -110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-10, -110, -10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-100, -10, -10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-10, -10, -10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(110, -110, -110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(10, -10, -110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(10, -110, -10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(100, -10, -10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(10, -10, -10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-110, 110, -110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-10, 10, -110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-10, 110, -10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-100, 10, -10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-10, 10, -10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-110, -110, 110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-10, -10, 110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-10, -110, 10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-100, -10, 10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-10, -10, 10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(-110, -110, -110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(10, 10, 110)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(10, 110, 10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(100, 10, 10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                        local A_1 = "GrenadeLauncher"
                        local A_2 = Vector3.new(10, 10, 10)
                        local A_3 = "Grenade Launcher"
                        local Event = game:GetService("ReplicatedStorage").Modules.Projectiles.Remotes.Created
                        Event:FireServer(A_1, A_2, A_3)
                    end
                end)
              
                print("teleport")
              
                --teleports
                local teleports = Window:NewTab("Teleport")
                local teleportsSection = teleports:NewSection("Teleport Places")
                teleportsSection:NewButton("Vault", "Teleports you to vault.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(288.91915893555, 561.79974365234, -2273.4873046875)
                end)   
              
                teleportsSection:NewButton("Place Near Vault", "Teleports you close to the vault.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-97.359481811523, 551.96960449219, -2230.068359375)
                end)
              
                teleportsSection:NewButton("Appartment", "Teleports you to an Appartment.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-223.64752197266, 571.70037841797, -2412.7272949219)
                end)
              
                teleportsSection:NewButton("Border", "Teleports you to the border.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-193.30702209473, 574.29821777344, -1839.0023193359)
                end)
              
                teleportsSection:NewButton("Cafe", "Teleports you to the cafe.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-73.912132263184, 549.19323730469, -1884.1300048828)
                end)
                teleportsSection:NewButton("Cave near cafe", "Teleports you to the cafe cave.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(27.202188491821, 521.15344238281, -1683.8842773438)
                end)
              
                teleportsSection:NewButton("Nighthawk Spawn", "Teleports you to Nighthawk spawn.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-531.03851318359, 577.68914794922, -1853.3787841797)
                end)
              
                teleportsSection:NewButton("Broken Glass", "Teleports you to Broken Glass.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-213.57571411133, 642.15814208984, -1638.0130615234)
                end)
              
                teleportsSection:NewButton("Dark Knight Spawn", "Teleports you to DK spawn.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-442.04147338867, 642.30816650391, -1627.3150634766)
                end)
              
                teleportsSection:NewButton("Safe", "Teleports you to the safe.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-890.03094482422, 552.06896972656, -1525.5651855469)
                end)
              
                teleportsSection:NewButton("Rebel Spawn", "Teleports you to the Rebel Spawn.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1075.3908691406, 586.67199707031, -1324.3911132813)
                end)
              
                teleportsSection:NewButton("Scientist Spawn", "Teleports you to Scientist Spawn.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-535.07531738281, 575.23358154297, -1798.6588134766)
                end)
              
                teleportsSection:NewButton("Reactor", "Teleports you to the reactor.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-639.49011230469, 556.90222167969, -1795.1322021484)
                end)
              
                teleportsSection:NewButton("Armory", "Teleports you to Armory.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-919.91851806641, 596.41198730469, -1830.2003173828)
                end)
              
                teleportsSection:NewButton("border glass", "Teleports you to Border Glass.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-253.57690429688, 640.59460449219, -1913.4090576172)
                end)
              
                teleportsSection:NewButton("Camera Chairs", "Teleports you to camera chairs.", function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-364.44537353516, 641.32653808594, -1920.8878173828)
                end)
              
                print("credits")
                local Credits = Window:NewTab("Credits") 

                local GoodSection = Credits:NewSection("SpaceMan#3664 (me)")
                GoodSection:NewButton("For making GrindHub.", "", function()
                    print("yeah")
                end)
              
                print("settings")
                --settings
                local settings = Window:NewTab("settings")
                local settingsSection = settings:NewSection("settings")
                settingsSection:NewKeybind("Toggle UI", "Press RightShift To Toggle UI", Enum.KeyCode.RightShift, function()
                    Library:ToggleUI()
                end)
            end