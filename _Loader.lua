if game.PlaceId == 2866967438 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Fishing%20Simulator'))()
elseif game.PlaceId == 885450884 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/The%20Grand%20Crossing'))()
elseif game.PlaceId == 6677985923 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Millionaire%20Empire%20Tycoon'))()
elseif game.PlaceId == 2248408710 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Destruction%20Simulator'))()
elseif game.PlaceId == 648362523 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Breaking%20Point'))()
elseif game.PlaceId == 834827615 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Breaking%20Point'))()
elseif game.PlaceId == 834829150 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Breaking%20Point'))()
elseif game.PlaceId == 1410026010 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Breaking%20Point'))()
elseif game.PlaceId == 1426048327 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Breaking%20Point'))()
elseif game.PlaceId == 901462028 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Breaking%20Point'))()
elseif game.PlaceId == 694768217 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Breaking%20Point'))()
elseif game.PlaceId == 6878438976 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/robloxthings/main/Developer%20Inc'))()
elseif game.PlaceId == 8585657145 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/Anime%20Hero%20Simulator'))()
else
    print("Game is not supported!")
end

local Settings = {
    InviteCode = "YFgFhUWNFC"
}

local HttpService = game:GetService("HttpService")
local RequestFunction

if syn and syn.request then
    RequestFunction = syn.request
elseif request then
    RequestFunction = request
elseif http and http.request then
    RequestFunction = http.request
elseif http_request then
    RequestFunction = http_request
end

local DiscordApiUrl = "http://127.0.0.1:%s/rpc?v=1"

if not RequestFunction then
    return print("Your executor does not support http requests.")
end

for i = 6453, 6464 do
    local DiscordInviteRequest = function()
        local Request = RequestFunction({
            Url = string.format(DiscordApiUrl, tostring(i)),
            Method = "POST",
            Body = HttpService:JSONEncode({
                nonce = HttpService:GenerateGUID(false),
                args = {
                    invite = {code = Settings.InviteCode},
                    code = Settings.InviteCode
                },
                cmd = "INVITE_BROWSER"
            }),
            Headers = {
                ["Origin"] = "https://discord.com",
                ["Content-Type"] = "application/json"
            }
        })
    end
    spawn(DiscordInviteRequest)
end