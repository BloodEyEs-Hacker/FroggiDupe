-- FroggiDupe ULTIMATE by BloodEyEs-Hacker - ВСЕ методы дюпа
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

-- Создаем интерфейс
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeULTIMATE"
ScreenGui.ResetOnSpawn = false

-- Основное окно
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 450, 0, 500)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0

local MainCorner = Instance.new("UICorner")
MainCorner.Parent = MainFrame
MainCorner.CornerRadius = UDim.new(0, 15)

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
Title.Size = UDim2.new(0, 300, 0, 50)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🐸 FROGGI DUPE ULTIMATE"
Title.TextColor3 = Color3.fromRGB(0, 255, 136)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = TopBar
MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
MinimizeButton.Position = UDim2.new(1, -45, 0, 5)
MinimizeButton.Text = "─"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18
MinimizeButton.Font = Enum.Font.GothamBold

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.Parent = MinimizeButton
MinimizeCorner.CornerRadius = UDim.new(0, 8)

-- Список предметов
local ItemList = Instance.new("ScrollingFrame")
ItemList.Parent = MainFrame
ItemList.Size = UDim2.new(1, -20, 0, 150)
ItemList.Position = UDim2.new(0, 10, 0, 60)
ItemList.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ItemList.BorderSizePixel = 0
ItemList.ScrollBarThickness = 6

local ListCorner = Instance.new("UICorner")
ListCorner.Parent = ItemList
ListCorner.CornerRadius = UDim.new(0, 10)

-- Выбранный предмет
local SelectedLabel = Instance.new("TextLabel")
SelectedLabel.Parent = MainFrame
SelectedLabel.Size = UDim2.new(1, -20, 0, 30)
SelectedLabel.Position = UDim2.new(0, 10, 0, 220)
SelectedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SelectedLabel.Text = "📦 Выбрано: ничего"
SelectedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectedLabel.TextSize = 14
SelectedLabel.Font = Enum.Font.Gotham

local SelectedCorner = Instance.new("UICorner")
SelectedCorner.Parent = SelectedLabel
SelectedCorner.CornerRadius = UDim.new(0, 8)

-- Методы дюпа
local MethodsFrame = Instance.new("ScrollingFrame")
MethodsFrame.Parent = MainFrame
MethodsFrame.Size = UDim2.new(1, -20, 0, 150)
MethodsFrame.Position = UDim2.new(0, 10, 0, 260)
MethodsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
MethodsFrame.BorderSizePixel = 0
MethodsFrame.ScrollBarThickness = 6
MethodsFrame.CanvasSize = UDim2.new(0, 0, 0, 300)

local MethodsCorner = Instance.new("UICorner")
MethodsCorner.Parent = MethodsFrame
MethodsCorner.CornerRadius = UDim.new(0, 10)

-- Кнопки
local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Parent = MainFrame
ButtonsFrame.Size = UDim2.new(1, -20, 0, 50)
ButtonsFrame.Position = UDim2.new(0, 10, 0, 420)
ButtonsFrame.BackgroundTransparency = 1

local RefreshButton = Instance.new("TextButton")
RefreshButton.Parent = ButtonsFrame
RefreshButton.Size = UDim2.new(0, 140, 1, 0)
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
DupeButton.Size = UDim2.new(0, 140, 1, 0)
DupeButton.Position = UDim2.new(0.5, -70, 0, 0)
DupeButton.Text = "🚀 ЗАПУСТИТЬ ВСЁ"
DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 14
DupeButton.Font = Enum.Font.GothamBold

local DupeCorner = Instance.new("UICorner")
DupeCorner.Parent = DupeButton
DupeCorner.CornerRadius = UDim.new(0, 8)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = ButtonsFrame
StatusLabel.Size = UDim2.new(0, 140, 1, 0)
StatusLabel.Position = UDim2.new(1, -140, 0, 0)
StatusLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
StatusLabel.Text = "⚡ Готов"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.Gotham

local StatusCorner = Instance.new("UICorner")
StatusCorner.Parent = StatusLabel
StatusCorner.CornerRadius = UDim.new(0, 8)

-- Иконка
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

local FrogCorner = Instance.new("UICorner")
FrogCorner.Parent = FrogIcon
FrogCorner.CornerRadius = UDim.new(1, 0)

-- Переменные
local selectedItem = nil
local itemButtons = {}
local methodButtons = {}
local isMinimized = false

-- Получение предметов
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

-- Обновление списка
function updateItemList()
    for _, btn in ipairs(itemButtons) do btn:Destroy() end
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
        
        itemButton.MouseButton1Click:Connect(function()
            selectedItem = item.Object
            SelectedLabel.Text = "📦 Выбрано: " .. item.Name
            StatusLabel.Text = "✅ Готов"
        end)
        
        table.insert(itemButtons, itemButton)
    end
end

-- ВСЕ МЕТОДЫ ДЮПА
local allMethods = {
    {name = "🔧 Интенсивное использование", func = function(item)
        local backpack = Player:FindFirstChild("Backpack")
        local character = Player.Character
        if backpack and character then
            for i = 1, 20 do
                pcall(function()
                    item.Parent = character
                    wait(0.05)
                    item.Parent = backpack
                    wait(0.05)
                end)
            end
        end
    end},
    
    {name = "📡 RemoteEvent: AddItem", func = function(item)
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("AddItem")
        if remote then for i = 1, 10 do pcall(function() remote:FireServer(item.Name) end) wait(0.1) end end
    end},
    
    {name = "📡 RemoteEvent: GiveItem", func = function(item)
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("GiveItem")
        if remote then for i = 1, 10 do pcall(function() remote:FireServer(Player, item.Name) end) wait(0.1) end end
    end},
    
    {name = "📡 RemoteEvent: CreateItem", func = function(item)
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("CreateItem")
        if remote then for i = 1, 10 do pcall(function() remote:FireServer(item.Name) end) wait(0.1) end end
    end},
    
    {name = "🔄 Все RemoteEvents", func = function(item)
        local rs = game:GetService("ReplicatedStorage")
        for _, remote in ipairs(rs:GetDescendants()) do
            if remote:IsA("RemoteEvent") then
                for i = 1, 3 do
                    pcall(function() remote:FireServer(item.Name) end)
                    pcall(function() remote:FireServer(item) end)
                    pcall(function() remote:FireServer(Player, item.Name) end)
                    wait(0.05)
                end
            end
        end
    end},
    
    {name = "🏪 Авто-покупка", func = function(item)
        for _, obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name == item.Name then
                local clickDetector = obj:FindFirstChildOfClass("ClickDetector")
                if clickDetector then
                    for i = 1, 5 do
                        fireclickdetector(clickDetector)
                        wait(0.2)
                    end
                end
            end
        end
    end},
    
    {name = "🔍 Все ClickDetector'ы", func = function(item)
        for _, obj in ipairs(workspace:GetDescendants()) do
            local clickDetector = obj:FindFirstChildOfClass("ClickDetector")
            if clickDetector then
                for i = 1, 2 do
                    fireclickdetector(clickDetector)
                    wait(0.1)
                end
            end
        end
    end},
    
    {name = "⚡ Супер-скоростной дюп", func = function(item)
        local backpack = Player:FindFirstChild("Backpack")
        local character = Player.Character
        if backpack and character then
            for i = 1, 50 do
                pcall(function()
                    item.Parent = character
                    item.Parent = backpack
                end)
            end
        end
    end},
    
    {name = "🎯 Дюп через инструменты", func = function(item)
        local backpack = Player:FindFirstChild("Backpack")
        if backpack then
            for _, tool in ipairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    for i = 1, 5 do
                        pcall(function()
                            tool.Parent = Player.Character
                            wait(0.1)
                            tool.Parent = backpack
                            wait(0.1)
                        end)
                    end
                end
            end
        end
    end},
    
    {name = "🛠️ Клонирование + Remote", func = function(item)
        pcall(function()
            local clone = item:Clone()
            clone.Parent = Player.Backpack
            
            local remotes = {"AddItem", "GiveItem", "CreateItem"}
            for _, remoteName in ipairs(remotes) do
                local remote = game:GetService("ReplicatedStorage"):FindFirstChild(remoteName)
                if remote then
                    for i = 1, 5 do
                        pcall(function() remote:FireServer(clone) end)
                        wait(0.1)
                    end
                end
            end
        end)
    end},
    
    {name = "🌀 Массовый дюп всего", func = function(item)
        local backpack = Player:FindFirstChild("Backpack")
        if backpack then
            for _, tool in ipairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    for i = 1, 3 do
                        pcall(function()
                            tool.Parent = Player.Character
                            wait(0.05)
                            tool.Parent = backpack
                            wait(0.05)
                        end)
                    end
                end
            end
        end
    end},
    
    {name = "🔥 Экстремальный метод", func = function(item)
        for i = 1, 100 do
            pcall(function()
                item.Parent = Player.Character
                item.Parent = Player.Backpack
                
                local remote = game:GetService("ReplicatedStorage"):FindFirstChild("AddItem")
                if remote then remote:FireServer(item.Name) end
            end)
        end
    end},
    
    {name = "🎪 Случайные действия", func = function(item)
        for i = 1, 30 do
            pcall(function()
                item.Parent = Player.Character
                wait(0.03)
                item.Parent = Player.Backpack
                wait(0.03)
                
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("Part") and math.random(1, 10) == 1 then
                        local clickDetector = obj:FindFirstChildOfClass("ClickDetector")
                        if clickDetector then fireclickdetector(clickDetector) end
                    end
                end
            end)
        end
    end}
}

-- Создание кнопок методов
function createMethodButtons()
    for _, btn in ipairs(methodButtons) do btn:Destroy() end
    methodButtons = {}
    
    MethodsFrame.CanvasSize = UDim2.new(0, 0, 0, #allMethods * 45)
    
    for i, method in ipairs(allMethods) do
        local methodButton = Instance.new("TextButton")
        methodButton.Parent = MethodsFrame
        methodButton.Size = UDim2.new(1, -20, 0, 40)
        methodButton.Position = UDim2.new(0, 10, 0, (i-1) * 45)
        methodButton.Text = method.name
        methodButton.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
        methodButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        methodButton.TextSize = 12
        methodButton.Font = Enum.Font.Gotham
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.Parent = methodButton
        btnCorner.CornerRadius = UDim.new(0, 6)
        
        methodButton.MouseButton1Click:Connect(function()
            if selectedItem then
                StatusLabel.Text = "⚡ " .. method.name
                pcall(function() method.func(selectedItem) end)
                StatusLabel.Text = "✅ Готов"
            end
        end)
        
        table.insert(methodButtons, methodButton)
    end
end

-- Запуск ВСЕХ методов
function runAllMethods()
    if not selectedItem then
        StatusLabel.Text = "❌ Выберите предмет"
        return
    end
    
    StatusLabel.Text = "🚀 Запускаю ВСЕ методы..."
    
    for i, method in ipairs(allMethods) do
        StatusLabel.Text = "⚡ " .. method.name .. " (" .. i .. "/" .. #allMethods .. ")"
        pcall(function() method.func(selectedItem) end)
        wait(0.5)
    end
    
    StatusLabel.Text = "🎉 Все методы завершены!"
    wait(2)
    updateItemList()
end

-- Сворачивание
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
    updateItemList()
    StatusLabel.Text = "✅ Обновлено"
end)

DupeButton.MouseButton1Click:Connect(function()
    runAllMethods()
end)

MinimizeButton.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

FrogIcon.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

-- Инициализация
makeDraggable(TopBar)
makeDraggable(FrogIcon)
updateItemList()
createMethodButtons()

-- Анти-афк
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

print("🐸 FROGGI DUPE ULTIMATE loaded!")
print("🎯 " .. #allMethods .. " методов дюпа доступно")
print("🚀 Используйте 'ЗАПУСТИТЬ ВСЁ' для максимального эффекта")
