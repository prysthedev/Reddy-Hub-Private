local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("Developer Inc.")
local b = w:CreateFolder("Main")

print("Created by Reddy#6616")

function autoFarm()
    while shared.autoFarm == true do
    local args = {
        [1] = 149
    }
        
    game:GetService("ReplicatedStorage").Remotes.cashEventSecured:FireServer(unpack(args))
    wait(0.1)
    end
end

b:Toggle("Auto Farm",function(bool)
    shared.autoFarm = bool
	autoFarm()
end)