local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "Doors",
    LoadingTitle = "Doors",
    LoadingSubtitle = "By: Kaoru~#6438",
    ConfigurationSaving = {
		Enabled = false,
		FolderName = "Doors-Kaoru",
		FileName = "Doors-Config"
	},
    KeySystem = false,
    KeySettings = {
        Title = "Doors",
        Subtitle = "Key System",
        Note = "Key: KaoruIsHot,\nIt is also copied to your clipboard.",
        Key = "KaoruIsHot"
    }
})
local MainWindow = Window:CreateTab("Main")
local MiscWindow = Window:CreateTab("Misc")

local CF = CFrame.new
local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart

getgenv().fence = {
    undefinedToggles = {}
}

local KeyChams = {}
MainWindow:CreateToggle({
    Name = 'Key Chams',
    CurrentValue = false,
    Callback = function(KeyChamsToggle)
        for _, Chams in next, KeyChams do
            Chams.Enabled = KeyChamsToggle
        end
    end,
})

function ApplyKeyChams(inst)
    task.wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Adornee = inst
    Cham.Enabled = KeyChams.Enabled
    Cham.RobloxLocked = true
    return Cham
end

task.spawn(function()
    workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
        if inst.Name == 'KeyObtain' then
            table.insert(KeyChams, ApplyKeyChams(inst))
        end
    end)

    for _, Value in ipairs(workspace:GetDescendants()) do
        if Value.Name == "KeyObtain" then
            table.insert(KeyChams, ApplyKeyChams(Value))
        end
    end
end)

local BookChams = {}
MainWindow:CreateToggle({
    Name = 'Book Chams',
    CurrentValue = false,
    Callback = function(BookChamsToggle)
        for _, Chams in next, BookChams do
            Chams.Enabled = BookChamsToggle
        end
    end,
})

local FigureChams = {}
MainWindow:CreateToggle({
    Name = 'Figure Chams',
    CurrentValue = false,
    Callback = function(FigureChamsToggle)
        for _, Chams in next, FigureChams do
            Chams.Enabled = FigureChamsToggle
        end
    end,
})

function ApplyBookChams(inst)
    if inst:IsDescendantOf(game:GetService("Workspace").CurrentRooms:FindFirstChild("50")) and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 50 then
        task.wait()
        local Cham = Instance.new("Highlight")
        Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Cham.FillColor = Color3.new(0, 1, 0.749019)
        Cham.FillTransparency = 0.5
        Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
        Cham.Parent = game:GetService("CoreGui")
        Cham.Enabled = BookChams.Enabled
        Cham.Adornee = inst
        Cham.RobloxLocked = true
        return Cham
    end
end

function ApplyEntityChams(inst)
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(1, 0, 0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Enabled = FigureChams.Enabled
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local SpotLight = Instance.new("SpotLight")
SpotLight.Brightness = 1
SpotLight.Face = Enum.NormalId.Front
SpotLight.Range = 90
SpotLight.Parent = game.Players.LocalPlayer.Character.Head
SpotLight.Enabled = false

MiscWindow:CreateToggle({
    Name = 'Headlight',
    CurrentValue = false,
    Callback = function(Headlight)
        SpotLight.Enabled = Headlight
    end,
})

MiscWindow:CreateToggle({
    Name = 'No seek arms/obstructions',
    CurrentValue = false,
    Callback = function(NoSeek)
        fence.undefinedToggles.NoSeek = NoSeek
    end,
})

MiscWindow:CreateToggle({
    Name = 'Instant Interact',
    CurrentValue = false,
    Callback = function(InstantInteract)
        fence.undefinedToggles.InstantInteract = InstantInteract
    end,
})

MiscWindow:CreateButton({
    Name = 'Skip Level',
    Callback = function()
        pcall(function()
            local HasKey = false
            local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
            for _, Value in ipairs(CurrentDoor.Parent:GetDescendants()) do
                if Value.Name == "KeyObtain" then
                    HasKey = Value
                end
            end
            if HasKey then
                game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                task.wait(0.3)
                fireproximityprompt(HasKey.ModulePrompt,0)
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                task.wait(0.3)
                fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
            end
            if LatestRoom == 50 then
                CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
            end
            game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
            task.wait(0.3)
            CurrentDoor.ClientOpen:FireServer()
        end)
    end,
})

MiscWindow:CreateToggle({
    Name = 'Auto Skip Level',
    CurrentValue = false,
    Callback = function(AutoSkip)
        fence.undefinedToggles.AutoSkip = AutoSkip
    end,
})

MiscWindow:CreateButton({
    Name = 'No jumpscares',
    Callback = function()
        xpcall(function()
            game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
        end, function()
            warn'"No jumpscares" Already Destroyed'
        end)
    end,
})

MiscWindow:CreateToggle({
    Name = 'Avoid Rush/Ambush',
    CurrentValue = false,
    Callback = function(AvoidRush)
        fence.undefinedToggles.AvoidRush = AvoidRush
    end,
})

MiscWindow:CreateToggle({
    Name = 'No Screech',
    CurrentValue = false,
    Callback = function(NoScreech)
        fence.undefinedToggles.NoScreech = NoScreech
    end,
})

MiscWindow:CreateToggle({
    Name = 'Always Win Heartbeat',
    CurrentValue = false,
    Callback = function(AlwaysWin)
        fence.undefinedToggles.AlwaysWin = AlwaysWin
    end,
})

MiscWindow:CreateToggle({
    Name = 'Predict Chases',
    CurrentValue = false,
    Callback = function(PredictChases)
        fence.undefinedToggles.PredictChases = PredictChases
    end,
})

MiscWindow:CreateToggle({
    Name = 'Notify When Mob Spawns',
    CurrentValue = false,
    Callback = function(NotifyMob)
        fence.undefinedToggles.NotifyMob = NotifyMob
    end,
})

MiscWindow:CreateButton({
    Name = 'Skip Level 50',
    Callback = function()
        local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
        game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
    end,
})

-- << Main code down here >> -- 
task.spawn(function()
    while true do task.wait()
        pcall(function()
            if fence.undefinedToggles.AutoSkip and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value < 100 then
                local HasKey = false
                local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom.Value
                local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom)]:WaitForChild("Door")
                for _, Value in ipairs(CurrentDoor.Parent:GetDescendants()) do
                    if Value.Name == "KeyObtain" then
                        HasKey = Value
                    end
                end
                if HasKey then
                    game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                    task.wait(0.3)
                    fireproximityprompt(HasKey.ModulePrompt,0)
                    game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                    task.wait(0.3)
                    fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
                end
                if LatestRoom == 50 then
                    CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
                end
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                task.wait(0.3)
                CurrentDoor.ClientOpen:FireServer()
            end
        end)
    end

    game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(descendant)
        if fence.undefinedToggles.NoSeek and descendant.Name == ("Seek_Arm" or "ChandelierObstruction") then
            task.wait()
            descendant:Destroy()
        end
    end)

    game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
        if fence.undefinedToggles.InstantInteract then
            fireproximityprompt(prompt)
        end
    end)
    
    local old; old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
        local args = {...}
        local method = getnamecallmethod()
        
        if tostring(self) == 'Screech' and method == "FireServer" and fence.undefinedToggles.NoScreech then
            args[1] = true
            return old(self,unpack(args))
        end
        if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and fence.undefinedToggles.AlwaysWin then
            args[2] = true
            return old(self,unpack(args))
        end
        
        return old(self,...)
    end))

    workspace.CurrentCamera.ChildAdded:Connect(function(child)
        if child.Name == "Screech" and fence.undefinedToggles.NoScreech then
            child:Destroy()
        end
    end)
end)

LatestRoom.Changed:Connect(function()
    if fence.undefinedToggles.PredictChases then
        local n = ChaseStart.Value - LatestRoom.Value
        if 0 < n and n < 4 then
            Rayfield:Notify("Warning!", "Event in " .. tostring(n) .. " rooms.", 4483362458)
        end
    end
    if BookChams.Enabled then
        if LatestRoom.Value == 50 then
            task.spawn(function()
                task.wait(1)
                for _, Room in game:GetService("Workspace").CurrentRooms["50"].Assets:GetDescendants() do
                    if Room.Name == "LiveHintBook" then
                        table.insert(BookChams, ApplyBookChams(Room))
                    end
                end
            end)
        end
    end
    if FigureChams.Enabled then
        if LatestRoom.Value == 50 then
            task.spawn(function()
                task.wait(1)
                while true do task.wait()
                    local Entity = game:GetService("Workspace").CurrentRooms["50"].FigureSetup:WaitForChild("FigureRagdoll", 5)
                    Entity:WaitForChild("Torso", 2.5)
                    table.insert(FigureChams, ApplyEntityChams(Entity))
                end
            end)
        end
    end
    workspace.ChildAdded:Connect(function(inst)
        if inst.Name == "RushMoving" and fence.undefinedToggles.NotifyMob then
            if fence.undefinedToggles.AvoidRush then
                task.delay(0.5, function()
                    Rayfield:Notify("Warning!", "Avoiding Rush. Please wait.", 4483362458)
                end)
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local con = game:GetService("RunService").Heartbeat:Connect(function()
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                end)
                
                inst.Destroying:Wait()
                con:Disconnect()

                game.Players.LocalPlayer.Character:MoveTo(OldPos)
            else
                Rayfield:Notify("Warning!", "Rush has spawned, hide!", 4483362458)
            end
        elseif inst.Name == "AmbushMoving" and fence.undefinedToggles.NotifyMob then
            if fence.undefinedToggles.AvoidRush then
                task.delay(0.5, function()
                    Rayfield:Notify("Warning!", "Avoiding Ambush. Please wait.", 4483362458)
                end)
                local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                local con = game:GetService("RunService").Heartbeat:Connect(function()
                    game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                end)
                
                inst.Destroying:Wait()
                con:Disconnect()
                
                game.Players.LocalPlayer.Character:MoveTo(OldPos)
            else
                Rayfield:Notify("Warning!", "Ambush has spawned, hide!", 4483362458)
            end
        end
    end)
end)
