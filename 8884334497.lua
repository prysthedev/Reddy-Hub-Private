local RunService = game:GetService("RunService")
shared.autoClick = false

function autoClick()
    spawn(function()
        while shared.autoClick == true do
            game:GetService("ReplicatedStorage").Remotes.Click:InvokeServer()
            wait()
        end
    end)
end