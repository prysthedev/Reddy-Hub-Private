shared.waitTimeBeforeJoiningNewServer = 20

repeat wait() until game:IsLoaded()

print("Created by Reddy#6616")

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

local RunService = game:GetService("RunService")
local http_service = game:GetService("HttpService")

function teleport(location)
    bLocation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if game.Players.LocalPlayer.Character.Humanoid.Sit then
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = location
end

collectShips = RunService.Stepped:Connect(function()
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if table.find(Ships, v.Name) then
            local shipName = v.Name
            for i,v in pairs(game:GetService("Workspace")[v.Name]:GetDescendants()) do     
                if v.Name == "ProximityPrompt" then                    
                    teleport(v.Parent.CFrame)
                    for i,v in pairs(game:GetService("Workspace")[shipName]:GetDescendants()) do
                        if v.ClassName == "Folder" and v.Name == "Rarities" then
                            local args = {
                                [1] = workspace[shipName]:FindFirstChild(v.Parent.Name)
                            }
                            game:GetService("ReplicatedStorage").CloudFrameShared.DataStreams.OpenChestFunction:InvokeServer(unpack(args))
                        end
                    end
                end
            end
        end
    end
end)

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

wait(shared.waitTimeBeforeJoiningNewServer)
Teleport()