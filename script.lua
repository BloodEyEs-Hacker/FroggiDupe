-- FroggiDupe by BloodEyEs-Hacker - Широкое меню для телефона
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
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
local IconFrame = Instance.new("Frame")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeReal"
ScreenGui.ResetOnSpawn = false

-- Основной фрейм (ШИРОКИЙ)
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 400, 0, 280)  -- Шире, но ниже
MainFrame.Position = UDim2.new(0.5, -200, 0, 10)  -- По центру сверху
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true

local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 12)

-- Вся верхняя панель для перетаскивания
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
Title.Text = "🐸 FroggiDupe"
Title.TextColor3 = Color3.fromRGB(0, 255, 136)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Кнопка сворачивания
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

-- Список предметов (широкий)
ItemList.Parent = MainFrame
ItemList.Size = UDim2.new(0, 380, 0, 120)  -- Широкий, но невысокий
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

-- Кнопки в ряд
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
DupeButton.Text = "🚀 ДЮП"
DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 14
DupeButton.Font = Enum.Font.GothamBold

local DupeCorner = Instance.new("UICorner")
DupeCorner.Parent = DupeButton
DupeCorner.CornerRadius = UDim.new(0, 6)

-- Миниатюрная иконка лягушки
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

-- Красивая обводка для иконки
IconFrame.Parent = FrogIcon
IconFrame.Size = UDim2.new(1, 6, 1, 6)
IconFrame.Position = UDim2.new(0, -3, 0, -3)
IconFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IconFrame.ZIndex = 9

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
    ItemList.CanvasSize = UDim2.new(0, 0, 0, #items * 35)
    
    for i, item in ipairs(items) do
        local itemButton = Instance.new("TextButton")
        itemButton.Parent = ItemList
        itemButton.Size = UDim2.new(0, 360, 0, 30)  -- Широкие кнопки
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

-- Функция сворачивания/разворачивания
function toggleMinimize()
    if isMinimized then
        -- Разворачиваем
        MainFrame.Visible = true
        FrogIcon.Visible = false
        MinimizeButton.Text = "─"
        isMinimized = false
    else
        -- Сворачиваем
        MainFrame.Visible = false
        FrogIcon.Visible = true
        FrogIcon.Position = MainFrame.Position
        MinimizeButton.Text = "＋"
        isMinimized = true
    end
end

-- Упрощенное перетаскивание для телефона
local function setupMobileDrag(frame)
    local dragging = false
    local dragStart, startPos
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- Обработка перетаскивания для телефона
UserInputService.TouchMoved:Connect(function(input, processed)
    if not processed then
        if DragFrame.Active and UserInputService:IsMouseButtonPressed(Enum.UserInputType.Touch) then
            local mouse = UserInputService:GetMouseLocation()
            if not isMinimized then
                MainFrame.Position = UDim2.new(0, mouse.X - MainFrame.AbsoluteSize.X/2, 0, mouse.Y - 20)
            else
                FrogIcon.Position = UDim2.new(0, mouse.X - FrogIcon.AbsoluteSize.X/2, 0, mouse.Y - FrogIcon.AbsoluteSize.Y/2)
            end
        end
    end
end)

-- Альтернативный метод перетаскивания (простой)
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

-- Делаем всё перетаскиваемым
makeDraggable(DragFrame)
makeDraggable(FrogIcon)

-- Авто-обновление при открытии
updateItemList()

-- Анти-афк
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

print("🐸 FroggiDupe Mobile by BloodEyEs-Hacker загружен!")
print("📱 Оптимизировано для телефона")
print("👆 Таскайте меню пальцем за верхнюю панель")
print("🔻 Сворачивайте в иконку лягушки")
