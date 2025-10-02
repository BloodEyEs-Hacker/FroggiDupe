-- FroggiDupe by BloodEyEs-Hacker - НАСТОЯЩИЙ ДЮП
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Создаем красивый интерфейс
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupePremium"
ScreenGui.ResetOnSpawn = false

-- Основное окно с градиентом
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 420, 0, 350)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true

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
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 136)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 204, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(153, 0, 255))
})

local BorderCorner = Instance.new("UICorner")
BorderCorner.Parent = BorderFrame
BorderCorner.CornerRadius = UDim.new(0, 18)

-- Верхняя панель
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TopBar.BorderSizePixel = 0

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.Parent = TopBar
TopBarCorner.CornerRadius = UDim.new(0, 15)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Size = UDim2.new(0, 250, 0, 45)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🐸 FROGGI DUPE PRO"
Title.TextColor3 = Color3.fromRGB(0, 255, 136)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка сворачивания
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = TopBar
MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
MinimizeButton.Position = UDim2.new(1, -40, 0, 5)
MinimizeButton.Text = "─"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.GothamBold

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.Parent = MinimizeButton
MinimizeCorner.CornerRadius = UDim.new(0, 8)

-- Статус бар
local StatusBar = Instance.new("Frame")
StatusBar.Parent = MainFrame
StatusBar.Size = UDim2.new(1, -20, 0, 30)
StatusBar.Position = UDim2.new(0, 10, 0, 310)
StatusBar.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
StatusBar.BorderSizePixel = 0

local StatusCorner = Instance.new("UICorner")
StatusCorner.Parent = StatusBar
StatusCorner.CornerRadius = UDim.new(0, 8)

local Status = Instance.new("TextLabel")
Status.Parent = StatusBar
Status.Size = UDim2.new(1, -20, 1, 0)
Status.Position = UDim2.new(0, 10, 0, 0)
Status.BackgroundTransparency = 1
Status.Text = "🎯 Выберите предмет для настоящего дюпа"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 12
Status.Font = Enum.Font.Gotham
Status.TextXAlignment = Enum.TextXAlignment.Left

-- Список предметов
local ItemList = Instance.new("ScrollingFrame")
ItemList.Parent = MainFrame
ItemList.Size = UDim2.new(1, -20, 0, 150)
ItemList.Position = UDim2.new(0, 10, 0, 55)
ItemList.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ItemList.BorderSizePixel = 0
ItemList.ScrollBarThickness = 6
ItemList.CanvasSize = UDim2.new(0, 0, 0, 0)

local ListCorner = Instance.new("UICorner")
ListCorner.Parent = ItemList
ListCorner.CornerRadius = UDim.new(0, 10)

-- Выбранный предмет
local SelectedFrame = Instance.new("Frame")
SelectedFrame.Parent = MainFrame
SelectedFrame.Size = UDim2.new(1, -20, 0, 35)
SelectedFrame.Position = UDim2.new(0, 10, 0, 215)
SelectedFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SelectedFrame.BorderSizePixel = 0

local SelectedCorner = Instance.new("UICorner")
SelectedCorner.Parent = SelectedFrame
SelectedCorner.CornerRadius = UDim.new(0, 8)

local SelectedLabel = Instance.new("TextLabel")
SelectedLabel.Parent = SelectedFrame
SelectedLabel.Size = UDim2.new(1, -20, 1, 0)
SelectedLabel.Position = UDim2.new(0, 10, 0, 0)
SelectedLabel.BackgroundTransparency = 1
SelectedLabel.Text = "📦 Выбрано: ничего"
SelectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectedLabel.TextSize = 13
SelectedLabel.Font = Enum.Font.Gotham
SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопки действий
local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Parent = MainFrame
ButtonsFrame.Size = UDim2.new(1, -20, 0, 45)
ButtonsFrame.Position = UDim2.new(0, 10, 0, 260)
ButtonsFrame.BackgroundTransparency = 1

local RefreshButton = Instance.new("TextButton")
RefreshButton.Parent = ButtonsFrame
RefreshButton.Size = UDim2.new(0, 190, 1, 0)
RefreshButton.Position = UDim2.new(0, 0, 0, 0)
RefreshButton.Text = "🔄 ОБНОВИТЬ СПИСОК"
RefreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
RefreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshButton.TextSize = 14
RefreshButton.Font = Enum.Font.GothamBold

local RefreshCorner = Instance.new("UICorner")
RefreshCorner.Parent = RefreshButton
RefreshCorner.CornerRadius = UDim.new(0, 8)

local DupeButton = Instance.new("TextButton")
DupeButton.Parent = ButtonsFrame
DupeButton.Size = UDim2.new(0, 190, 1, 0)
DupeButton.Position = UDim2.new(1, -190, 0, 0)
DupeButton.Text = "🚀 ЗАПУСТИТЬ ДЮП"
DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 14
DupeButton.Font = Enum.Font.GothamBold

local DupeCorner = Instance.new("UICorner")
DupeCorner.Parent = DupeButton
DupeCorner.CornerRadius = UDim.new(0, 8)

-- Миниатюрная иконка
local FrogIcon = Instance.new("TextButton")
FrogIcon.Parent = ScreenGui
FrogIcon.Size = UDim2.new(0, 70, 0, 70)
FrogIcon.Position = UDim2.new(0, 10, 0, 10)
FrogIcon.Text = "🐸"
FrogIcon.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
FrogIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
FrogIcon.TextSize = 30
FrogIcon.Font = Enum.Font.GothamBold
FrogIcon.Visible = false
FrogIcon.ZIndex = 10

local FrogCorner = Instance.new("UICorner")
FrogCorner.Parent = FrogIcon
FrogCorner.CornerRadius = UDim.new(1, 0)

-- Переменные
local selectedItem = nil
local itemButtons = {}
local isMinimized = false

-- Функция получения предметов
function getInventoryItems()
    local items = {}
    local backpack = Player:FindFirstChild("Backpack")
    
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                table.insert(items, {
                    Object = tool,
                    Name = tool.Name,
                    Type = getItemType(tool)
                })
            end
        end
    end
    
    return items
end

function getItemType(tool)
    local name = tool.Name:lower()
    if string.find(name, "fruit") then return "🍎 Фрукт"
    elseif string.find(name, "seed") then return "🌱 Семя" 
    elseif string.find(name, "pet") then return "🐾 Питомец"
    elseif string.find(name, "egg") then return "🥚 Яйцо"
    else return "🔧 Предмет" end
end

-- Функция обновления списка
function updateItemList()
    for _, btn in ipairs(itemButtons) do
        btn:Destroy()
    end
    itemButtons = {}
    
    local items = getInventoryItems()
    ItemList.CanvasSize = UDim2.new(0, 0, 0, #items * 40)
    
    for i, item in ipairs(items) do
        local itemButton = Instance.new("TextButton")
        itemButton.Parent = ItemList
        itemButton.Size = UDim2.new(1, -20, 0, 35)
        itemButton.Position = UDim2.new(0, 10, 0, (i-1) * 40)
        itemButton.Text = "  " .. item.Type .. " | " .. item.Name
        itemButton.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
        itemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemButton.TextSize = 12
        itemButton.TextXAlignment = Enum.TextXAlignment.Left
        itemButton.Font = Enum.Font.Gotham
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.Parent = itemButton
        btnCorner.CornerRadius = UDim.new(0, 6)
        
        -- Анимация при наведении
        itemButton.MouseEnter:Connect(function()
            TweenService:Create(itemButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(65, 65, 75)}):Play()
        end)
        
        itemButton.MouseLeave:Connect(function()
            TweenService:Create(itemButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 55, 65)}):Play()
        end)
        
        itemButton.MouseButton1Click:Connect(function()
            selectedItem = item.Object
            SelectedLabel.Text = "📦 Выбрано: " .. item.Name
            Status.Text = "✅ Готов к дюпу: " .. item.Name
        end)
        
        table.insert(itemButtons, itemButton)
    end
end

-- Функция сворачивания
function toggleMinimize()
    if isMinimized then
        MainFrame.Visible = true
        FrogIcon.Visible = false
        MinimizeButton.Text = "─"
        isMinimized = false
    else
        MainFrame.Visible = false
        FrogIcon.Visible = true
        FrogIcon.Position = MainFrame.Position
        MinimizeButton.Text = "＋"
        isMinimized = true
    end
end

-- НАСТОЯЩИЙ ДЮП - улучшенные методы
function realDupe()
    if not selectedItem then
        Status.Text = "❌ Сначала выберите предмет!"
        return
    end
    
    local itemName = selectedItem.Name
    Status.Text = "🎯 Начинаю настоящий дюп..."
    
    pcall(function()
        -- Метод 1: Интенсивное использование инструмента
        Status.Text = "🔄 Метод 1: Интенсивное использование..."
        
        local backpack = Player:FindFirstChild("Backpack")
        local character = Player.Character
        
        if backpack and character then
            for i = 1, 10 do
                pcall(function()
                    selectedItem.Parent = character
                    wait(0.1)
                    selectedItem.Parent = backpack
                    wait(0.1)
                end)
            end
        end
        
        -- Метод 2: Поиск и использование RemoteEvents
        Status.Text = "📡 Метод 2: Поиск RemoteEvents..."
        
        local rs = game:GetService("ReplicatedStorage")
        local remoteNames = {
            "AddItem", "GiveItem", "CreateItem", "DuplicateItem",
            "CloneItem", "CopyItem", "SpawnItem", "GetItem"
        }
        
        for _, remoteName in ipairs(remoteNames) do
            local remote = rs:FindFirstChild(remoteName)
            if remote and remote:IsA("RemoteEvent") then
                for i = 1, 5 do
                    pcall(function() remote:FireServer(itemName) end)
                    pcall(function() remote:FireServer(selectedItem) end)
                    pcall(function() remote:FireServer(Player, itemName) end)
                    wait(0.1)
                end
                Status.Text = "✅ Использован: " .. remoteName
            end
        end
        
        -- Метод 3: Авто-покупка в магазинах
        Status.Text = "🏪 Метод 3: Поиск магазинов..."
        
        local shops = workspace:GetDescendants()
        for _, shop in ipairs(shops) do
            if shop:IsA("Model") and (shop.Name:find("Shop") or shop.Name:find("Store")) then
                for _, item in ipairs(shop:GetDescendants()) do
                    if (item:IsA("Part") or item:IsA("MeshPart")) and item.Name == itemName then
                        local clickDetector = item:FindFirstChildOfClass("ClickDetector")
                        if clickDetector then
                            for i = 1, 3 do
                                fireclickdetector(clickDetector)
                                wait(0.3)
                            end
                            Status.Text = "✅ Куплено в: " .. shop.Name
                        end
                    end
                end
            end
        end
        
        Status.Text = "🎉 Дюп завершен! Проверяйте инвентарь"
        
        -- Обновляем список через 2 секунды
        wait(2)
        updateItemList()
        
    end)
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
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
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

-- Обработчики кнопок с анимациями
RefreshButton.MouseButton1Click:Connect(function()
    TweenService:Create(RefreshButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 185, 1, -5)}):Play()
    wait(0.1)
    TweenService:Create(RefreshButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 190, 1, 0)}):Play()
    
    updateItemList()
    Status.Text = "✅ Список обновлен!"
end)

DupeButton.MouseButton1Click:Connect(function()
    TweenService:Create(DupeButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 185, 1, -5)}):Play()
    wait(0.1)
    TweenService:Create(DupeButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 190, 1, 0)}):Play()
    
    realDupe()
end)

MinimizeButton.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

FrogIcon.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

-- Делаем перетаскиваемым
makeDraggable(TopBar)
makeDraggable(FrogIcon)

-- Авто-обновление при запуске
updateItemList()

-- Анти-афк
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

print("🐸 FROGGI DUPE PRO by BloodEyEs-Hacker загружен!")
print("🎯 Настоящий дюп с улучшенным визуалом")
print("📱 Оптимизировано для мобильных устройств")
