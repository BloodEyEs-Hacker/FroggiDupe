-- FroggiDupe Money by BloodEyEs-Hacker - Дюп денег через продажу фруктов
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Интерфейс
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeMoney"
ScreenGui.ResetOnSpawn = false

-- Основное окно
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 400, 0, 350)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.Parent = MainFrame
MainCorner.CornerRadius = UDim.new(0, 15)

-- Градиентная обводка
local BorderFrame = Instance.new("Frame")
BorderFrame.Parent = MainFrame
BorderFrame.Size = UDim2.new(1, 6, 1, 6)
BorderFrame.Position = UDim2.new(0, -3, 0, -3)
BorderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BorderFrame.ZIndex = -1

local BorderGradient = Instance.new("UIGradient")
BorderGradient.Parent = BorderFrame
BorderGradient.Rotation = 45
BorderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 165, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 0))
})

local BorderCorner = Instance.new("UICorner")
BorderCorner.Parent = BorderFrame
BorderCorner.CornerRadius = UDim.new(0, 18)

-- Верхняя панель
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TopBar.BorderSizePixel = 0

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.Parent = TopBar
TopBarCorner.CornerRadius = UDim.new(0, 15)

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Size = UDim2.new(0, 250, 0, 50)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "💰 FROGGI MONEY DUPE"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = TopBar
MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
MinimizeButton.Position = UDim2.new(1, -40, 0, 7)
MinimizeButton.Text = "─"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.GothamBold

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.Parent = MinimizeButton
MinimizeCorner.CornerRadius = UDim.new(0, 8)

-- Поле ввода суммы
local AmountFrame = Instance.new("Frame")
AmountFrame.Parent = MainFrame
AmountFrame.Size = UDim2.new(1, -20, 0, 70)
AmountFrame.Position = UDim2.new(0, 10, 0, 60)
AmountFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
AmountFrame.BorderSizePixel = 0

local AmountCorner = Instance.new("UICorner")
AmountCorner.Parent = AmountFrame
AmountCorner.CornerRadius = UDim.new(0, 10)

local AmountLabel = Instance.new("TextLabel")
AmountLabel.Parent = AmountFrame
AmountLabel.Size = UDim2.new(1, 0, 0, 25)
AmountLabel.Position = UDim2.new(0, 0, 0, 5)
AmountLabel.BackgroundTransparency = 1
AmountLabel.Text = "💵 ВВЕДИТЕ СУММУ:"
AmountLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AmountLabel.TextSize = 14
AmountLabel.Font = Enum.Font.GothamBold

local AmountBox = Instance.new("TextBox")
AmountBox.Parent = AmountFrame
AmountBox.Size = UDim2.new(1, -20, 0, 35)
AmountBox.Position = UDim2.new(0, 10, 0, 30)
AmountBox.PlaceholderText = "Например: 1000000"
AmountBox.Text = ""
AmountBox.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
AmountBox.TextColor3 = Color3.fromRGB(255, 255, 255)
AmountBox.TextSize = 16
AmountBox.Font = Enum.Font.Gotham
AmountBox.ClearTextOnFocus = false

local AmountBoxCorner = Instance.new("UICorner")
AmountBoxCorner.Parent = AmountBox
AmountBoxCorner.CornerRadius = UDim.new(0, 8)

-- Список фруктов
local FruitsLabel = Instance.new("TextLabel")
FruitsLabel.Parent = MainFrame
FruitsLabel.Size = UDim2.new(1, -20, 0, 25)
FruitsLabel.Position = UDim2.new(0, 10, 0, 140)
FruitsLabel.BackgroundTransparency = 1
FruitsLabel.Text = "🍎 ВАШИ ФРУКТЫ:"
FruitsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FruitsLabel.TextSize = 14
FruitsLabel.Font = Enum.Font.GothamBold

local FruitsList = Instance.new("ScrollingFrame")
FruitsList.Parent = MainFrame
FruitsList.Size = UDim2.new(1, -20, 0, 100)
FruitsList.Position = UDim2.new(0, 10, 0, 170)
FruitsList.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
FruitsList.BorderSizePixel = 0
FruitsList.ScrollBarThickness = 6
FruitsList.CanvasSize = UDim2.new(0, 0, 0, 0)

local FruitsCorner = Instance.new("UICorner")
FruitsCorner.Parent = FruitsList
FruitsCorner.CornerRadius = UDim.new(0, 8)

-- Выбранный фрукт
local SelectedFruitLabel = Instance.new("TextLabel")
SelectedFruitLabel.Parent = MainFrame
SelectedFruitLabel.Size = UDim2.new(1, -20, 0, 30)
SelectedFruitLabel.Position = UDim2.new(0, 10, 0, 280)
SelectedFruitLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SelectedFruitLabel.Text = "📦 Выбрано: ничего"
SelectedFruitLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectedFruitLabel.TextSize = 13
SelectedFruitLabel.Font = Enum.Font.Gotham

local SelectedCorner = Instance.new("UICorner")
SelectedCorner.Parent = SelectedFruitLabel
SelectedCorner.CornerRadius = UDim.new(0, 8)

-- Кнопки
local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Parent = MainFrame
ButtonsFrame.Size = UDim2.new(1, -20, 0, 40)
ButtonsFrame.Position = UDim2.new(0, 10, 0, 320)
ButtonsFrame.BackgroundTransparency = 1

local RefreshButton = Instance.new("TextButton")
RefreshButton.Parent = ButtonsFrame
RefreshButton.Size = UDim2.new(0, 120, 1, 0)
RefreshButton.Position = UDim2.new(0, 0, 0, 0)
RefreshButton.Text = "🔄 ОБНОВИТЬ"
RefreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
RefreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshButton.TextSize = 14
RefreshButton.Font = Enum.Font.GothamBold

local RefreshCorner = Instance.new("UICorner")
RefreshCorner.Parent = RefreshButton
RefreshCorner.CornerRadius = UDim.new(0, 8)

local DupeButton = Instance.new("TextButton")
DupeButton.Parent = ButtonsFrame
DupeButton.Size = UDim2.new(0, 120, 1, 0)
DupeButton.Position = UDim2.new(0.5, -60, 0, 0)
DupeButton.Text = "💰 ДЮП ДЕНЕГ"
DupeButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 14
DupeButton.Font = Enum.Font.GothamBold

local DupeCorner = Instance.new("UICorner")
DupeCorner.Parent = DupeButton
DupeCorner.CornerRadius = UDim.new(0, 8)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = ButtonsFrame
StatusLabel.Size = UDim2.new(0, 120, 1, 0)
StatusLabel.Position = UDim2.new(1, -120, 0, 0)
StatusLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
StatusLabel.Text = "⚡ Готов"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.Gotham

local StatusCorner = Instance.new("UICorner")
StatusCorner.Parent = StatusLabel
StatusCorner.CornerRadius = UDim.new(0, 8)

-- Иконка
local MoneyIcon = Instance.new("TextButton")
MoneyIcon.Parent = ScreenGui
MoneyIcon.Size = UDim2.new(0, 70, 0, 70)
MoneyIcon.Position = UDim2.new(0, 10, 0, 10)
MoneyIcon.Text = "💰"
MoneyIcon.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
MoneyIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
MoneyIcon.TextSize = 30
MoneyIcon.Font = Enum.Font.GothamBold
MoneyIcon.Visible = false

local MoneyCorner = Instance.new("UICorner")
MoneyCorner.Parent = MoneyIcon
MoneyCorner.CornerRadius = UDim.new(1, 0)

-- Переменные
local selectedFruit = nil
local fruitButtons = {}
local isMinimized = false

-- Получение фруктов из инвентаря
function getFruits()
    local fruits = {}
    local backpack = Player:FindFirstChild("Backpack")
    
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and string.find(tool.Name:lower(), "fruit") then
                table.insert(fruits, {
                    Object = tool,
                    Name = tool.Name,
                    Rarity = getFruitRarity(tool)
                })
            end
        end
    end
    
    return fruits
end

function getFruitRarity(tool)
    local name = tool.Name:lower()
    if string.find(name, "legendary") then return "🌟 Легендарный"
    elseif string.find(name, "epic") then return "💜 Эпический"
    elseif string.find(name, "rare") then return "💙 Редкий" 
    else return "💚 Обычный" end
end

-- Обновление списка фруктов
function updateFruitsList()
    for _, btn in ipairs(fruitButtons) do
        btn:Destroy()
    end
    fruitButtons = {}
    
    local fruits = getFruits()
    FruitsList.CanvasSize = UDim2.new(0, 0, 0, #fruits * 35)
    
    for i, fruit in ipairs(fruits) do
        local fruitButton = Instance.new("TextButton")
        fruitButton.Parent = FruitsList
        fruitButton.Size = UDim2.new(1, -20, 0, 30)
        fruitButton.Position = UDim2.new(0, 10, 0, (i-1) * 35)
        fruitButton.Text = "  " .. fruit.Rarity .. " | " .. fruit.Name
        fruitButton.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
        fruitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        fruitButton.TextSize = 11
        fruitButton.TextXAlignment = Enum.TextXAlignment.Left
        fruitButton.Font = Enum.Font.Gotham
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.Parent = fruitButton
        btnCorner.CornerRadius = UDim.new(0, 6)
        
        fruitButton.MouseButton1Click:Connect(function()
            selectedFruit = fruit.Object
            SelectedFruitLabel.Text = "📦 Выбрано: " .. fruit.Name
            StatusLabel.Text = "✅ Готов"
        end)
        
        table.insert(fruitButtons, fruitButton)
    end
end

-- МЕТОДЫ ДЮПА ДЕНЕГ
function dupeMoney()
    local amountText = AmountBox.Text
    if not selectedFruit or amountText == "" then
        StatusLabel.Text = "❌ Выберите фрукт и введите сумму"
        return
    end
    
    local amount = tonumber(amountText)
    if not amount or amount <= 0 then
        StatusLabel.Text = "❌ Введите корректную сумму"
        return
    end
    
    StatusLabel.Text = "🎯 Начинаю дюп денег..."
    
    pcall(function()
        local fruitName = selectedFruit.Name
        
        -- Метод 1: RemoteEvent продажи
        StatusLabel.Text = "💰 Метод 1: Продажа через RemoteEvents..."
        
        local sellRemotes = {
            "SellFruit", "SellItem", "Sell", "SellTool",
            "SellFruitRemote", "SellItemRemote", "SellRemote"
        }
        
        for _, remoteName in ipairs(sellRemotes) do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild(remoteName)
            if remote and remote:IsA("RemoteEvent") then
                for i = 1, 5 do
                    pcall(function() remote:FireServer(selectedFruit) end)
                    pcall(function() remote:FireServer(fruitName) end)
                    pcall(function() remote:FireServer(selectedFruit, amount) end)
                    pcall(function() remote:FireServer(fruitName, amount) end)
                    wait(0.1)
                end
                StatusLabel.Text = "✅ Использован: " .. remoteName
            end
        end
        
        -- Метод 2: RemoteEvent добавления денег
        StatusLabel.Text = "💰 Метод 2: Прямое добавление денег..."
        
        local moneyRemotes = {
            "AddMoney", "GiveMoney", "AddCash", "GiveCash",
            "AddCoins", "GiveCoins", "AddCurrency", "GiveCurrency"
        }
        
        for _, remoteName in ipairs(moneyRemotes) do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild(remoteName)
            if remote and remote:IsA("RemoteEvent") then
                for i = 1, 10 do
                    pcall(function() remote:FireServer(amount) end)
                    pcall(function() remote:FireServer(Player, amount) end)
                    pcall(function() remote:FireServer(amount, "FruitSale") end)
                    wait(0.1)
                end
                StatusLabel.Text = "✅ Использован: " .. remoteName
            end
        end
        
        -- Метод 3: ClickDetector'ы продажи
        StatusLabel.Text = "💰 Метод 3: Поиск NPC продавцов..."
        
        local npcs = workspace:GetDescendants()
        for _, npc in ipairs(npcs) do
            if npc:IsA("Model") and (npc.Name:find("Seller") or npc.Name:find("Merchant") or npc.Name:find("Vendor")) then
                for _, part in ipairs(npc:GetDescendants()) do
                    if part:IsA("Part") or part:IsA("MeshPart") then
                        local clickDetector = part:FindFirstChildOfClass("ClickDetector")
                        if clickDetector then
                            for i = 1, 3 do
                                fireclickdetector(clickDetector)
                                wait(0.3)
                            end
                            StatusLabel.Text = "✅ Взаимодействие с: " .. npc.Name
                        end
                    end
                end
            end
        end
        
        -- Метод 4: Создание фейковой продажи
        StatusLabel.Text = "💰 Метод 4: Создание фейковой сделки..."
        
        local allRemotes = game:GetService("ReplicatedStorage"):GetDescendants()
        for _, remote in ipairs(allRemotes) do
            if remote:IsA("RemoteEvent") then
                local name = remote.Name:lower()
                if name:find("fruit") or name:find("sell") or name:find("money") or name:find("cash") then
                    for i = 1, 3 do
                        pcall(function() remote:FireServer(selectedFruit, amount) end)
                        pcall(function() remote:FireServer(fruitName, amount) end)
                        pcall(function() remote:FireServer(Player, selectedFruit, amount) end)
                        wait(0.1)
                    end
                end
            end
        end
        
        StatusLabel.Text = "🎉 Дюп денег завершен! Проверяйте баланс"
        
    end)
end

-- Сворачивание
function toggleMinimize()
    if isMinimized then
        MainFrame.Visible = true
        MoneyIcon.Visible = false
        MinimizeButton.Text = "─"
        isMinimized = false
    else
        MainFrame.Visible = false
        MoneyIcon.Visible = true
        MoneyIcon.Position = MainFrame.Position
        MinimizeButton.Text = "＋"
        isMinimized = true
    end
end

-- Перетаскивание
local function makeDraggable(gui)
    local dragging = false
    local dragInput, dragStart, startPos

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Обработчики кнопок
RefreshButton.MouseButton1Click:Connect(function()
    updateFruitsList()
    StatusLabel.Text = "✅ Фрукты обновлены"
end)

DupeButton.MouseButton1Click:Connect(function()
    dupeMoney()
end)

MinimizeButton.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

MoneyIcon.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

-- Авто-обновление
updateFruitsList()

-- Анти-афк
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

print("💰 FROGGI MONEY DUPE by BloodEyEs-Hacker загружен!")
print("🎯 4 метода дюпа денег через продажу фруктов")
print("💵 Введите сумму и выберите фрукт для дюпа")
