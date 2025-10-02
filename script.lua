-- FroggiDupe by BloodEyEs-Hacker - Настоящий дюп с выбором предметов
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

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
local IconFrame = Instance.new("Frame")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeReal"

-- Основной фрейм
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true

local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 8)

-- Заголовок с областью перетаскивания
local DragFrame = Instance.new("Frame")
DragFrame.Parent = MainFrame
DragFrame.Size = UDim2.new(1, 0, 0, 30)
DragFrame.Position = UDim2.new(0, 0, 0, 0)
DragFrame.BackgroundTransparency = 1
DragFrame.Active = true

Title.Parent = DragFrame
Title.Size = UDim2.new(0, 200, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🐸 FroggiDupe REAL"
Title.TextColor3 = Color3.fromRGB(0, 255, 136)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка сворачивания
MinimizeButton.Parent = DragFrame
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0, 0)
MinimizeButton.Text = "─"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.GothamBold

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.Parent = MinimizeButton
MinimizeCorner.CornerRadius = UDim.new(0, 6)

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
ItemList.Position = UDim2.new(0, 10, 0, 50)
ItemList.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ItemList.BorderSizePixel = 0
ItemList.ScrollBarThickness = 6
ItemList.CanvasSize = UDim2.new(0, 0, 0, 0)

local ItemListCorner = Instance.new("UICorner")
ItemListCorner.Parent = ItemList
ItemListCorner.CornerRadius = UDim.new(0, 6)

SelectedItemLabel.Parent = MainFrame
SelectedItemLabel.Size = UDim2.new(0, 280, 0, 30)
SelectedItemLabel.Position = UDim2.new(0, 10, 0, 260)
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
RefreshButton.Position = UDim2.new(0, 10, 0, 300)
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
DupeButton.Position = UDim2.new(0, 10, 0, 345)
DupeButton.Text = "🚀 НАЧАТЬ ДЮП"
DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 16
DupeButton.Font = Enum.Font.GothamBold

local DupeCorner = Instance.new("UICorner")
DupeCorner.Parent = DupeButton
DupeCorner.CornerRadius = UDim.new(0, 6)

-- Миниатюрная иконка лягушки
FrogIcon.Parent = ScreenGui
FrogIcon.Size = UDim2.new(0, 60, 0, 60)
FrogIcon.Position = UDim2.new(0, 10, 0, 10)
FrogIcon.Text = "🐸"
FrogIcon.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
FrogIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
FrogIcon.TextSize = 24
FrogIcon.Font = Enum.Font.GothamBold
FrogIcon.Visible = false

local FrogCorner = Instance.new("UICorner")
FrogCorner.Parent = FrogIcon
FrogCorner.CornerRadius = UDim.new(1, 0)

-- Фрейм для иконки (красивая обводка)
IconFrame.Parent = FrogIcon
IconFrame.Size = UDim2.new(1, 4, 1, 4)
IconFrame.Position = UDim2.new(0, -2, 0, -2)
IconFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IconFrame.ZIndex = -1

local IconGradient = Instance.new("UIGradient")
IconGradient.Parent = IconFrame
IconGradient.Rotation = 45
IconGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 136)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 204, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(153, 0, 255))
})

local IconFrameCorner = Instance.new("UICorner")
IconFrameCorner.Parent = IconFrame
IconFrameCorner.CornerRadius = UDim.new(1, 0)

-- Переменные
local selectedItem = nil
local itemButtons = {}
local isMinimized = false
local dragging = false
local dragInput, dragStart, startPos

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

-- Функция сворачивания/разворачивания
function toggleMinimize()
    if isMinimized then
        -- Разворачиваем
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 320, 0, 400)}):Play()
        MainFrame.Visible = true
        FrogIcon.Visible = false
        MinimizeButton.Text = "─"
        isMinimized = false
    else
        -- Сворачиваем
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        wait(0.3)
        MainFrame.Visible = false
        FrogIcon.Visible = true
        FrogIcon.Position = MainFrame.Position
        MinimizeButton.Text = "＋"
        isMinimized = true
    end
end

-- Функция перетаскивания основного окна
local function setupDrag(frame)
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
end

-- Функция перетаскивания иконки
local function setupIconDrag(icon)
    icon.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = icon.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    icon.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
end

-- Обработка перетаскивания
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        if isMinimized then
            FrogIcon.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        else
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
end)

-- Функция настоящего дюпа
function realDupe()
    if not selectedItem then
        Status.Text = "❌ Выберите предмет сначала!"
        return
    end
    
    pcall(function()
        local backpack = Player:FindFirstChild("Backpack")
        local character = Player.Character
        
        if backpack and character then
            local original = selectedItem
            
            -- Метод 1: Быстрое перекладывание
            original.Parent = character
            wait(0.1)
            
            local clone = original:Clone()
            clone.Parent = backpack
            
            original.Parent = backpack
            
            Status.Text = "✅ Дюп успешен: " .. original.Name
            
            -- Метод 2: RemoteEvents
            local remotes = {
                game:GetService("ReplicatedStorage"):FindFirstChild("DuplicateItem"),
                game:GetService("ReplicatedStorage"):FindFirstChild("CloneItem")
            }
            
            for _, remote in ipairs(remotes) do
                if remote and remote:IsA("RemoteEvent") then
                    remote:FireServer(original)
                    Status.Text = "✅ Дюп через Remote: " .. original.Name
                    break
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

MinimizeButton.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

FrogIcon.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

-- Настройка перетаскивания
setupDrag(DragFrame)
setupIconDrag(FrogIcon)

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
print("🧩 Перетаскивайте за верхнюю панель")
print("🔻 Сворачивайте в иконку кнопкой '─'")
