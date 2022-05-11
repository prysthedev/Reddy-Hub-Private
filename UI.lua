local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Mercury",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

local Tab = GUI:Tab{
	Name = "Test1",
}

local Tab2 = GUI:Tab{
	Name = "Test2",
}

Tab:Button{
	Name = "Notification Test",
	Description = "This will send an testing notification.",
	Callback = function()
        GUI:Notification{
            Title = "Alert",
            Text = "You shall bump the thread on V3rmillion!",
            Duration = 3,
            Callback = function() end
        }
    end
}