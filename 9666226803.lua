local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Reddy Hub: Motel Simulator", IntroText = "Reddy Hub"})
local LocalPlayer = game:GetService("Players").LocalPlayer

local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://8945416692",
})

function checkWhatToCook()
    local baconTable = game:GetService("Workspace").Nodes.Breakfast.Bacon
    local pancakeTable = game:GetService("Workspace").Nodes.Breakfast.Pancakes
    local pizzaTable = game:GetService("Workspace").Nodes.Breakfast.Pizzas
    local cookieTable = game:GetService("Workspace").Nodes.Breakfast.Cookies
    local numberOfPancakes = 0
    local numberOfPizzas = 0 
    local numberOfBacons = 0 
    local numberOfCookies = 0

    for i,v in pairs(pancakeTable.Pancakes.Foods:GetDescendants()) do
        if v.Name == "Pancakes" then
            local numberOfPancakes = numberOfPancakes + 1
        end
    end

    for i,v in pairs(pizzaTable.Pizzas.Foods:GetDescendants()) do
        if v.Name == "Pizzas" then
            local numberOfPizzas = numberOfPizzas + 1
            print("done")
        end
    end

    for i,v in pairs(baconTable.Bacon.Foods:GetDescendants()) do
        if v.Name == "Bacon" then
            local numberOfBacons = numberOfBacons + 1
        end
    end

    for i,v in pairs(cookieTable.Cookies.Foods:GetDescendants()) do
        if v.Name == "Cookies" then
            local numberOfCookies = numberOfCookies + 1
        end
    end

    local numbersToSort = {
        {"Pancakes", 1},
        {"Pizzas", 1},
        {"Bacon", 1},
        {"Cookies", 1}
    }

    table.sort(numbersToSort) 
    print("done")

    print(table.concat(numbersToSort))
end

Main:AddToggle({
    Name = "Auto Cook",
    Callback = function(Value)
        shared.autoCook = Value
        while shared.autoCook == true do
            checkWhatToCook()
            wait(2)
        end
    end
})