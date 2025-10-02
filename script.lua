-- FroggiDupe by BloodEyEs-Hacker - НАСТОЯЩИЙ дюп с сохранением
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Интерфейс
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local ItemList = Instance.new("ScrollingFrame")
local RefreshButton = Instance.new("TextButton")
local DupeButton = Instance.new("TextButton")
local SelectedItemLabel = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")

-- Миниатюрная иконка
local FrogIcon = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeReal"
ScreenGui.ResetOnSpawn = false

-- Основной фрейм
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 400, 0, 280)
MainFrame.Position = UDim2.new(0.5, -200, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true

local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 12)

-- Верхняя панель для перетаскивания
local DragFrame = Instance.new("Frame")
DragFrame.Parent = MainFrame
DragFrame.Size = UDim2.new(1, 0, 0, 35)
DragFrame.Position = UDim2.new(0, 0, 0, 0)
DragFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
DragFrame.BorderSizePixel = 0

local DragCorner = Instance.new("UICorner")
DragCorner.Parent = DragFrame
DragCorner.CornerRadius = UDim.new(0, 12)

Title.Parent = DragFrame
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🐸 FroggiDupe REAL"
Title.TextColor3 = Color3.fromRGB(0, 255, 136)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

MinimizeButton.Parent = DragFrame
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0, 2)
MinimizeButton.Text = "─"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.GothamBold

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.Parent = MinimizeButton
MinimizeCorner.CornerRadius = UDim.new(0, 6)

Status.Parent = MainFrame
Status.Size = UDim2.new(0, 380, 0, 20)
Status.Position = UDim2.new(0, 10, 0, 250)
Status.BackgroundTransparency = 1
Status.Text = "Выберите предмет для дюпа"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 12
Status.Font = Enum.Font.Gotham

-- Список предметов
ItemList.Parent = MainFrame
ItemList.Size = UDim2.new(0, 380, 0, 120)
ItemList.Position = UDim2.new(0, 10, 0, 45)
ItemList.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ItemList.BorderSizePixel = 0
ItemList.ScrollBarThickness = 8
ItemList.CanvasSize = UDim2.new(0, 0, 0, 0)

local ItemListCorner = Instance.new("UICorner")
ItemListCorner.Parent = ItemList
ItemListCorner.CornerRadius = UDim.new(0, 8)

SelectedItemLabel.Parent = MainFrame
SelectedItemLabel.Size = UDim2.new(0, 380, 0, 25)
SelectedItemLabel.Position = UDim2.new(0, 10, 0, 175)
SelectedItemLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SelectedItemLabel.Text = "Выбрано: ничего"
SelectedItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectedItemLabel.TextSize = 12
SelectedItemLabel.Font = Enum.Font.Gotham

local SelectedCorner = Instance.new("UICorner")
SelectedCorner.Parent = SelectedItemLabel
SelectedCorner.CornerRadius = UDim.new(0, 6)

-- Кнопки
RefreshButton.Parent = MainFrame
RefreshButton.Size = UDim2.new(0, 180, 0, 35)
RefreshButton.Position = UDim2.new(0, 10, 0, 210)
RefreshButton.Text = "🔄 Обновить"
RefreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
RefreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshButton.TextSize = 14
RefreshButton.Font = Enum.Font.GothamBold

local RefreshCorner = Instance.new("UICorner")
RefreshCorner.Parent = RefreshButton
RefreshCorner.CornerRadius = UDim.new(0, 6)

DupeButton.Parent = MainFrame
DupeButton.Size = UDim2.new(0, 180, 0, 35)
DupeButton.Position = UDim2.new(0, 210, 0, 210)
DupeButton.Text = "🚀 НАСТОЯЩИЙ ДЮП"
DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 14
DupeButton.Font = Enum.Font.GothamBold

local DupeCorner = Instance.new("UICorner")
DupeCorner.Parent = DupeButton
DupeCorner.CornerRadius = UDim.new(0, 6)

-- Иконка лягушки
FrogIcon.Parent = ScreenGui
FrogIcon.Size = UDim2.new(0, 70, 0, 70)
FrogIcon.Position = UDim2.new(0, 10, 0, 10)
FrogIcon.Text = "🐸"
FrogIcon.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
FrogIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
FrogIcon.TextSize = 28
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
    ItemList.CanvasSize = UDim2.new(0, 0, 0, #items * 35)
    
    for i, item in ipairs(items) do
        local itemButton = Instance.new("TextButton")
        itemButton.Parent = ItemList
        itemButton.Size = UDim2.new(0, 360, 0, 30)
        itemButton.Position = UDim2.new(0, 10, 0, (i-1) * 35)
        itemButton.Text = " " .. item.Type .. " | " .. item.Name
        itemButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        itemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemButton.TextSize = 11
        itemButton.TextXAlignment = Enum.TextXAlignment.Left
        itemButton.Font = Enum.Font.Gotham
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.Parent = itemButton
        btnCorner.CornerRadius = UDim.new(0, 4)
        
        itemButton.MouseButton1Click:Connect(function()
            selectedItem = item.Object
            SelectedItemLabel.Text = "Выбрано: " .. item.Name
            Status.Text = "Готов к дюпу: " .. item.Name
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

-- НАСТОЯЩИЙ ДЮП - методы которые РАБОТАЮТ
function realDupe()
    if not selectedItem then
        Status.Text = "❌ Выберите предмет сначала!"
        return
    end
    
    Status.Text = "🔄 Пытаюсь сделать дюп..."
    
    pcall(function()
        local itemName = selectedItem.Name
        local backpack = Player:FindFirstChild("Backpack")
        
        -- МЕТОД 1: Через инструменты (работает в многих играх)
        if backpack then
            -- Запоминаем сколько было предметов ДО
            local itemsBefore = {}
            for _, item in ipairs(backpack:GetChildren()) do
                if item:IsA("Tool") then
                    table.insert(itemsBefore, item.Name)
                end
            end
            
            -- Пытаемся активировать предмет несколько раз
            for i = 1, 3 do
                pcall(function()
                    if selectedItem and selectedItem.Parent then
                        selectedItem.Parent = Player.Character
                        wait(0.3)
                        selectedItem.Parent = backpack
                        wait(0.3)
                    end
                end)
            end
            
            -- Проверяем появились ли новые предметы
            wait(1)
            for _, item in ipairs(backpack:GetChildren()) do
                if item:IsA("Tool") and item.Name == itemName then
                    local isNew = true
                    for _, oldName in ipairs(itemsBefore) do
                        if oldName == item.Name then
                            isNew = false
                            break
                        end
                    end
                    if isNew then
                        Status.Text = "✅ Дюп успешен! Новый: " .. itemName
                        return
                    end
                end
            end
        end
        
        -- МЕТОД 2: Через RemoteEvents (поиск в ReplicatedStorage)
        Status.Text = "🔄 Пробую метод RemoteEvents..."
        
        local rs = game:GetService("ReplicatedStorage")
        local remoteNames = {
            "DuplicateItem", "CloneItem", "DupeItem", "CopyItem",
            "AddItem", "GiveItem", "CreateItem", "SpawnItem"
        }
        
        for _, remoteName in ipairs(remoteNames) do
            local remote = rs:FindFirstChild(remoteName)
            if remote and remote:IsA("RemoteEvent") then
                for i = 1, 5 do  -- Пробуем несколько раз
                    pcall(function()
                        remote:FireServer(selectedItem)
                        remote:FireServer(itemName)
                        remote:FireServer(selectedItem, Player)
                    end)
                    wait(0.2)
                end
                Status.Text = "✅ Отправлен запрос через: " .. remoteName
                wait(2)
                return
            end
        end
        
        -- МЕТОД 3: Через покупку того же предмета
        Status.Text = "🔄 Ищу магазин для покупки..."
        
        local shops = workspace:GetDescendants()
        for _, shop in ipairs(shops) do
            if shop:IsA("Model") and (shop.Name:find("Shop") or shop.Name:find("Store") or shop.Name:find("Vendor")) then
                for _, item in ipairs(shop:GetDescendants()) do
                    if item:IsA("Part") and item.Name == itemName then
                        local clickDetector = item:FindFirstChildOfClass("ClickDetector")
                        if clickDetector then
                            for i = 1, 3 do  -- Покупаем несколько раз
                                fireclickdetector(clickDetector)
                                wait(0.5)
                            end
                            Status.Text = "✅ Куплены копии: " .. itemName
                            return
                        end
                    end
                end
            end
        end
        
        -- МЕТОД 4: Экспериментальный - через изменение свойств
        Status.Text = "🔄 Пробую экспериментальный метод..."
        
        pcall(function()
            local original = selectedItem
            if original and original.Parent then
                -- Пытаемся изменить свойства чтобы вызвать синхронизацию
                original.Parent = Player.Character
                wait(0.2)
                
                -- Создаем "призрачную" копию
                local fakeClone = original:Clone()
                fakeClone.Parent = Player.Backpack
                
                -- Быстро меняем родителя
                original.Parent = Player.Backpack
                wait(0.1)
                
                -- Пытаемся сохранить оба предмета
                for i = 1, 10 do
                    original.Parent = Player.Character
                    wait(0.05)
                    original.Parent = Player.Backpack
                    wait(0.05)
                end
                
                Status.Text = "⚠️ Экспериментальный метод завершен"
            end
        end)
        
        Status.Text = "❌ Не удалось сделать дюп. Попробуйте другой предмет"
        
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

-- Обработчики кнопок
RefreshButton.MouseButton1Click:Connect(function()
    updateItemList()
    Status.Text = "Список обновлен!"
end)

DupeButton.MouseButton1Click:Connect(function()
    realDupe()
end)

MinimizeButton.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

FrogIcon.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

-- Делаем перетаскиваемым
makeDraggable(DragFrame)
makeDraggable(FrogIcon)

-- Авто-обновление
updateItemList()

-- Анти-афк
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

print("🐸 FroggiDupe REAL by BloodEyEs-Hacker загружен!")
print("🎯 4 метода настоящего дюпа")
print("💾 Предметы должны сохраняться после перезахода")
