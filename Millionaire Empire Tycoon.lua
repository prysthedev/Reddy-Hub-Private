getgenv().autoFarm = false
getgenv().autoRebirth = false

print("Created by Reddy#6616")

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Millionaire Empire Tycoon")

local b = w:CreateFolder("Main")

b:Toggle("Auto Unlock Buttons (Claim tycoon first)",function(bool)
    getgenv().autoFarm = bool
    autoFarm()
end)

b:Toggle("Auto Rebirth (ULTRA OP, Claim tycoon first)",function(bool)
    getgenv().autoRebirth = bool
    autoRebirth()
end)

b:Button("Give Infinite Money",function()
    local A_1 = "Cash"
    local A_2 = 10000000000000000
    local Event = game:GetService("ReplicatedStorage").Events.CrateClaim
    Event:FireServer(A_1, A_2)
end)

b:Button("Get OP Knife",function()
    game:GetService("ReplicatedStorage").Console:FireServer()
end)

b:Button("Get Free AutoCollect",function()
    game:GetService("ReplicatedStorage").AutoCollect:FireServer()
end)

b:Button("Copy Discord Invite",function()
    setclipboard("https://discord.gg/HjdtekKvDs")
end)

function autoFarm()
    spawn(function()
        while getgenv().autoFarm == true do
            if game:GetService("Workspace")["Legend's 2P Tycoon Kit"].Tycoons["Millionaire Tycoon 1"]["P1 Stuff"].P1.Value == game.Players.LocalPlayer.Name then
                local playerHead = game.Players.LocalPlayer.Character.Head
                
                local A_1 = "Cash"
                local A_2 = 10000000000000000
                local Event = game:GetService("ReplicatedStorage").Events.CrateClaim
                Event:FireServer(A_1, A_2)
                for i, v in pairs(game:GetService("Workspace")["Legend's 2P Tycoon Kit"].Tycoons["Millionaire Tycoon 1"]["P1 Stuff"].Buttons:getDescendants()) do
                if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(playerHead, v.Parent, 0)
                wait(0.01)
                end
            end   
            elseif game:GetService("Workspace")["Legend's 2P Tycoon Kit"].Tycoons["Millionaire Tycoon 2"]["P1 Stuff"].P1.Value == game.Players.LocalPlayer.Name then
                local playerHead = game.Players.LocalPlayer.Character.Head
                
                local A_1 = "Cash"
                local A_2 = 10000000000000000
                local Event = game:GetService("ReplicatedStorage").Events.CrateClaim
                Event:FireServer(A_1, A_2)
                for i, v in pairs(game:GetService("Workspace")["Legend's 2P Tycoon Kit"].Tycoons["Millionaire Tycoon 2"]["P1 Stuff"].Buttons:getDescendants()) do
                if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(playerHead, v.Parent, 0)
                wait(0.01)
                end
            end
            elseif game:GetService("Workspace")["Legend's 2P Tycoon Kit"].Tycoons["Millionaire Tycoon 3"]["P1 Stuff"].P1.Value == game.Players.LocalPlayer.Name then
                local playerHead = game.Players.LocalPlayer.Character.Head
                
                local A_1 = "Cash"
                local A_2 = 10000000000000000
                local Event = game:GetService("ReplicatedStorage").Events.CrateClaim
                Event:FireServer(A_1, A_2)
                for i, v in pairs(game:GetService("Workspace")["Legend's 2P Tycoon Kit"].Tycoons["Millionaire Tycoon 3"]["P1 Stuff"].Buttons:getDescendants()) do
                if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(playerHead, v.Parent, 0)
                wait(0.01)
                end
            end
            elseif game:GetService("Workspace")["Legend's 2P Tycoon Kit"].Tycoons["Millionaire Tycoon 4"]["P1 Stuff"].P1.Value == game.Players.LocalPlayer.Name then
                local playerHead = game.Players.LocalPlayer.Character.Head
                
                local A_1 = "Cash"
                local A_2 = 10000000000000000
                local Event = game:GetService("ReplicatedStorage").Events.CrateClaim
                Event:FireServer(A_1, A_2)
                for i, v in pairs(game:GetService("Workspace")["Legend's 2P Tycoon Kit"].Tycoons["Millionaire Tycoon 4"]["P1 Stuff"].Buttons:getDescendants()) do
                if v.Name == "TouchInterest" and v.Parent then
                firetouchinterest(playerHead, v.Parent, 0)
                wait(0.01)
                end
            end
        end
        end
    end)
end

function autoRebirth()
    spawn(function()
        while getgenv().autoRebirth == true do    
            local A_1 = "Cash"
            local A_2 = 10000000000000000
            local Event = game:GetService("ReplicatedStorage").Events.CrateClaim
            Event:FireServer(A_1, A_2)
            local Event = game:GetService("ReplicatedStorage").rebirthEvent
            Event:FireServer()
            wait(0.5)
        end
    end)
end