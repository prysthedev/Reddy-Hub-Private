local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/reddythedev/Reddy-Hub/main/UI%20Engine'))()

local window = library:AddWindow("Fishing Simulator", nil)
local main = window:AddTab()
main:Show()

tab:AddLabel("Hello World!")

main:AddButton("Give ...", function()
	print("Gave ... !")
end)

tab:AddTextBox("Teleport to Player", function(text)
	teleport_to(game:GetService("Players"):FindFirstChild("text") or game:GetService("Players").LocalPlayer)
end)