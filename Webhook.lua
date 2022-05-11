local OSTime = os.time();
local Time = os.date('!*t', OSTime);
local LocalPlayerName = game.Players.LocalPlayer.Name;
local LocalPlayerId = game.Players.LocalPlayer.UserId;
local Embed = {
    title = 'A user has executed the script!';
    color = '99999';
    footer = { text = game.JobId };
    author = {
        name = LocalPlayerName;
    };
    fields = {
        {
            name = "Game ID:";
            value = game.PlaceId;
        }
    };
    timestamp = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec);
};
(syn and syn.request or http_request) {
    Url = 'https://discord.com/api/webhooks/936729734547656764/bgTN3bXHqbop2y1mUI-fYZairpGI6kxf4QUbJhVaFAnXj_zNES62d_ywv8ng8YG1PUE1';
    Method = 'POST';
    Headers = {
        ['Content-Type'] = 'application/json';
    };
    Body = game:GetService'HttpService':JSONEncode( { embeds = { Embed } } );
};