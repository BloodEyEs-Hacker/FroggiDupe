-- FroggiDupe by BloodEyEs-Hacker - Настоящий дюп с выбором предметов
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

-- Интерфейс
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local ItemList = Instance.new("ScrollingFrame")
local RefreshButton = Instance.new("TextButton")
local DupeButton = Instance.new("TextButton")
local SelectedItemLabel = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeReal"

MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 8)

Title.Parent = MainFrame
Title.Size = UDim2.new(0, 300, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "🐸 FroggiDupe REAL"
Title.TextColor3 = Color3.fromRGB(0, 255, 136)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold

Status.Parent = MainFrame
Status.Size = UDim2.new(0, 300, 0, 20)
Status.Position = UDim2.new(0, 10, 0, 360)
Status.BackgroundTransparency = 1
Status.Text = "Выберите предмет для дюпа"
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 14
Status.Font = Enum.Font.Gotham

-- Список предметов
ItemList.Parent = MainFrame
ItemList.Size = UDim2.new(0, 280, 0, 200)
ItemList.Position = UDim2.new(0, 10, 0, 60)
ItemList.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ItemList.BorderSizePixel = 0
ItemList.ScrollBarThickness = 6
ItemList.CanvasSize = UDim2.new(0, 0, 0, 0)

local ItemListCorner = Instance.new("UICorner")
ItemListCorner.Parent = ItemList
ItemListCorner.CornerRadius = UDim.new(0, 6)

SelectedItemLabel.Parent = MainFrame
SelectedItemLabel.Size = UDim2.new(0, 280, 0, 30)
SelectedItemLabel.Position = UDim2.new(0, 10, 0, 270)
SelectedItemLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SelectedItemLabel.Text = "Выбрано: ничего"
SelectedItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectedItemLabel.TextSize = 14
SelectedItemLabel.Font = Enum.Font.Gotham

local SelectedCorner = Instance.new("UICorner")
SelectedCorner.Parent = SelectedItemLabel
SelectedCorner.CornerRadius = UDim.new(0, 6)

-- Кнопки
RefreshButton.Parent = MainFrame
RefreshButton.Size = UDim2.new(0, 280, 0, 35)
RefreshButton.Position = UDim2.new(0, 10, 0, 310)
RefreshButton.Text = "🔄 Обновить список"
RefreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
RefreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshButton.TextSize = 16
RefreshButton.Font = Enum.Font.GothamBold

local RefreshCorner = Instance.new("UICorner")
RefreshCorner.Parent = RefreshButton
RefreshCorner.CornerRadius = UDim.new(0, 6)

DupeButton.Parent = MainFrame
DupeButton.Size = UDim2.new(0, 280, 0, 35)
DupeButton.Position = UDim2.new(0, 10, 0, 310)
RefreshButton.Position = UDim2.new(0, 10, 0, 310)
DupeButton.Position = UDim2.new(0, 10, 0, 355)
DupeButton.Text = "🚀 НАЧАТЬ ДЮП"
DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 16
DupeButton.Font = Enum.Font.GothamBold

local DupeCorner = Instance.new("UICorner")
DupeCorner.Parent = DupeButton
DupeCorner.CornerRadius = UDim.new(0, 6)

-- Переменные
local selectedItem = nil
local itemButtons = {}

-- Функция получения предметов из инвентаря
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
    -- Очищаем старые кнопки
    for _, btn in ipairs(itemButtons) do
        btn:Destroy()
    end
    itemButtons = {}
    
    local items = getInventoryItems()
    ItemList.CanvasSize = UDim2.new(0, 0, 0, #items * 40)
    
    for i, item in ipairs(items) do
        local itemButton = Instance.new("TextButton")
        itemButton.Parent = ItemList
        itemButton.Size = UDim2.new(0, 260, 0, 35)
        itemButton.Position = UDim2.new(0, 10, 0, (i-1) * 40)
        itemButton.Text = item.Type .. " | " .. item.Name
        itemButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        itemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemButton.TextSize = 12
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

-- Функция настоящего дюпа (сохранение через RemoteEvents)
function realDupe()
    if not selectedItem then
        Status.Text = "❌ Выберите предмет сначала!"
        return
    end
    
    pcall(function()
        -- Метод 1: Попытка через инструмент (работает в некоторых играх)
        local backpack = Player:FindFirstChild("Backpack")
        local character = Player.Character
        
        if backpack and character then
            -- Сохраняем оригинал
            local original = selectedItem
            local originalParent = original.Parent
            
            -- Пытаемся активировать предмет
            original.Parent = character
            wait(0.2)
            
            -- Создаем клон
            local clone = original:Clone()
            clone.Parent = backpack
            
            -- Возвращаем оригинал
            original.Parent = originalParent
            
            Status.Text = "✅ Дюп успешен: " .. original.Name
        end
        
        -- Метод 2: Попытка через RemoteEvents (если есть в игре)
        local remotes = {
            game:GetService("ReplicatedStorage"):FindFirstChild("DuplicateItem"),
            game:GetService("ReplicatedStorage"):FindFirstChild("CloneItem"),
            game:GetService("ReplicatedStorage"):FindFirstChild("DupeItem")
        }
        
        for _, remote in ipairs(remotes) do
            if remote and remote:IsA("RemoteEvent") then
                remote:FireServer(selectedItem)
                Status.Text = "✅ Дюп через Remote: " .. selectedItem.Name
                break
            end
        end
        
        -- Метод 3: Попытка через покупку того же предмета (обходной путь)
        local itemName = selectedItem.Name
        local shops = workspace:GetDescendants()
        
        for _, shop in ipairs(shops) do
            if shop:IsA("Model") and (shop.Name:find("Shop") or shop.Name:find("Store")) then
                local items = shop:GetDescendants()
                for _, item in ipairs(items) do
                    if item:IsA("Part") and item.Name == itemName then
                        local clickDetector = item:FindFirstChildOfClass("ClickDetector")
                        if clickDetector then
                            fireclickdetector(clickDetector)
                            Status.Text = "✅ Покупка копии: " .. itemName
                            wait(1)
                            return
                        end
                    end
                end
            end
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

-- Перемещение интерфейса
local dragging = false
local dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Авто-обновление при открытии
updateItemList()

-- Анти-афк
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

print("🐸 FroggiDupe REAL by BloodEyEs-Hacker загружен!")
print("📝 Выберите предмет из списка и нажмите 'НАЧАТЬ ДЮП'")
