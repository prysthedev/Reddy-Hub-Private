shared.autoCollectCoins = false

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("Spotify Island")
local b = w:CreateFolder("AutoFarm")
local playerCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local coinsFolder = game:GetService("Workspace").LevelSections.Start.Coins.SpotifyIsland

b:Toggle("Auto Collect Coins",function(bool)
    shared.autoCollectCoins = bool

    if shared.autoCollectCoins then
        for i, coin in pairs(coinsFolder:GetDescendants()) do
            if coin.name == "BasicCoin" or coin.name == "RareCoin" or coin.name == "LegendaryCoin" then
                playerCFrame = CFrame.new(coin.CFrame)
                print("Collected coin")
                wait(0.1)
            end
        end
    end
end)