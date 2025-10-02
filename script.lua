-- FroggiDupe Money ULTRA by BloodEyEs-Hacker - Премиум дизайн
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Создаем интерфейс
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeMoneyULTRA"
ScreenGui.ResetOnSpawn = false

-- Анимация появления
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.Parent = MainFrame
MainCorner.CornerRadius = UDim.new(0, 20)

-- Неоновая обводка
local BorderGlow = Instance.new("Frame")
BorderGlow.Parent = MainFrame
BorderGlow.Size = UDim2.new(1, 8, 1, 8)
BorderGlow.Position = UDim2.new(0, -4, 0, -4)
BorderGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BorderGlow.ZIndex = -1

local BorderGradient = Instance.new("UIGradient")
BorderGradient.Parent = BorderGlow
BorderGradient.Rotation = 45
BorderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 150, 50)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(50, 255, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 150, 255))
})

local BorderCorner = Instance.new("UICorner")
BorderCorner.Parent = BorderGlow
BorderCorner.CornerRadius = UDim.new(0, 24)

-- Анимация появления
TweenService:Create(MainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 450, 0, 500),
    Position = UDim2.new(0.5, -225, 0.5, -250)
}):Play()

wait(0.8)

-- Верхняя панель с градиентом
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 60)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TopBar.BorderSizePixel = 0

local TopBarGradient = Instance.new("UIGradient")
TopBarGradient.Parent = TopBar
TopBarGradient.Rotation = 90
TopBarGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 30))
})

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.Parent = TopBar
TopBarCorner.CornerRadius = UDim.new(0, 20)

-- Заголовок с иконкой
local TitleContainer = Instance.new("Frame")
TitleContainer.Parent = TopBar
TitleContainer.Size = UDim2.new(0, 300, 0, 60)
TitleContainer.Position = UDim2.new(0, 15, 0, 0)
TitleContainer.BackgroundTransparency = 1

local FrogIcon = Instance.new("TextLabel")
FrogIcon.Parent = TitleContainer
FrogIcon.Size = UDim2.new(0, 40, 0, 40)
FrogIcon.Position = UDim2.new(0, 0, 0, 10)
FrogIcon.BackgroundTransparency = 1
FrogIcon.Text = "🐸"
FrogIcon.TextColor3 = Color3.fromRGB(0, 255, 136)
FrogIcon.TextSize = 30
FrogIcon.Font = Enum.Font.GothamBold

local Title = Instance.new("TextLabel")
Title.Parent = TitleContainer
Title.Size = UDim2.new(0, 250, 0, 60)
Title.Position = UDim2.new(0, 45, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "FROGGI MONEY\n<font size='12'>ULTRA PREMIUM</font>"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.RichText = true

-- Кнопки управления
local ControlsFrame = Instance.new("Frame")
ControlsFrame.Parent = TopBar
ControlsFrame.Size = UDim2.new(0, 100, 0, 60)
ControlsFrame.Position = UDim2.new(1, -110, 0, 0)
ControlsFrame.BackgroundTransparency = 1

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = ControlsFrame
MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
MinimizeButton.Position = UDim2.new(0, 5, 0, 10)
MinimizeButton.Text = "─"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18
MinimizeButton.Font = Enum.Font.GothamBold

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.Parent = MinimizeButton
MinimizeCorner.CornerRadius = UDim.new(0, 10)

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = ControlsFrame
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(0, 55, 0, 10)
CloseButton.Text = "×"
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.TextSize = 20
CloseButton.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner")
CloseCorner.Parent = CloseButton
CloseCorner.CornerRadius = UDim.new(0, 10)

-- Контентная область
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.Size = UDim2.new(1, -20, 1, -80)
ContentFrame.Position = UDim2.new(0, 10, 0, 70)
ContentFrame.BackgroundTransparency = 1

-- Секция ввода суммы
local AmountSection = Instance.new("Frame")
AmountSection.Parent = ContentFrame
AmountSection.Size = UDim2.new(1, 0, 0, 90)
AmountSection.Position = UDim2.new(0, 0, 0, 0)
AmountSection.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
AmountSection.BorderSizePixel = 0

local AmountCorner = Instance.new("UICorner")
AmountCorner.Parent = AmountSection
AmountCorner.CornerRadius = UDim.new(0, 15)

local AmountTitle = Instance.new("TextLabel")
AmountTitle.Parent = AmountSection
AmountTitle.Size = UDim2.new(1, -20, 0, 25)
AmountTitle.Position = UDim2.new(0, 15, 0, 10)
AmountTitle.BackgroundTransparency = 1
AmountTitle.Text = "💵 СУММА ДЛЯ ДЮПА"
AmountTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
AmountTitle.TextSize = 16
AmountTitle.Font = Enum.Font.GothamBold
AmountTitle.TextXAlignment = Enum.TextXAlignment.Left

local AmountBoxContainer = Instance.new("Frame")
AmountBoxContainer.Parent = AmountSection
AmountBoxContainer.Size = UDim2.new(1, -20, 0, 45)
AmountBoxContainer.Position = UDim2.new(0, 10, 0, 35)
AmountBoxContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
AmountBoxContainer.BorderSizePixel = 0

local AmountBoxCorner = Instance.new("UICorner")
AmountBoxCorner.Parent = AmountBoxContainer
AmountBoxCorner.CornerRadius = UDim.new(0, 10)

local AmountBox = Instance.new("TextBox")
AmountBox.Parent = AmountBoxContainer
AmountBox.Size = UDim2.new(1, -20, 1, -10)
AmountBox.Position = UDim2.new(0, 10, 0, 5)
AmountBox.PlaceholderText = "Введите сумму (например: 1000000)"
AmountBox.Text = ""
AmountBox.BackgroundTransparency = 1
AmountBox.TextColor3 = Color3.fromRGB(255, 255, 255)
AmountBox.TextSize = 16
AmountBox.Font = Enum.Font.Gotham
AmountBox.ClearTextOnFocus = false

-- Секция выбора предмета
local ItemSection = Instance.new("Frame")
ItemSection.Parent = ContentFrame
ItemSection.Size = UDim2.new(1, 0, 0, 200)
ItemSection.Position = UDim2.new(0, 0, 0, 100)
ItemSection.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ItemSection.BorderSizePixel = 0

local ItemCorner = Instance.new("UICorner")
ItemCorner.Parent = ItemSection
ItemCorner.CornerRadius = UDim.new(0, 15)

local ItemTitle = Instance.new("TextLabel")
ItemTitle.Parent = ItemSection
ItemTitle.Size = UDim2.new(1, -20, 0, 25)
ItemTitle.Position = UDim2.new(0, 15, 0, 10)
ItemTitle.BackgroundTransparency = 1
ItemTitle.Text = "🎒 ВАШ ИНВЕНТАРЬ"
ItemTitle.TextColor3 = Color3.fromRGB(0, 255, 136)
ItemTitle.TextSize = 16
ItemTitle.Font = Enum.Font.GothamBold
ItemTitle.TextXAlignment = Enum.TextXAlignment.Left

local ItemsList = Instance.new("ScrollingFrame")
ItemsList.Parent = ItemSection
ItemsList.Size = UDim2.new(1, -20, 0, 140)
ItemsList.Position = UDim2.new(0, 10, 0, 40)
ItemsList.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ItemsList.BorderSizePixel = 0
ItemsList.ScrollBarThickness = 6
ItemsList.CanvasSize = UDim2.new(0, 0, 0, 0)

local ItemsCorner = Instance.new("UICorner")
ItemsCorner.Parent = ItemsList
ItemsCorner.CornerRadius = UDim.new(0, 10)

local SelectedItemLabel = Instance.new("TextLabel")
SelectedItemLabel.Parent = ItemSection
SelectedItemLabel.Size = UDim2.new(1, -20, 0, 25)
SelectedItemLabel.Position = UDim2.new(0, 10, 0, 185)
SelectedItemLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
SelectedItemLabel.Text = "📦 Выбрано: ничего"
SelectedItemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectedItemLabel.TextSize = 13
SelectedItemLabel.Font = Enum.Font.Gotham

local SelectedCorner = Instance.new("UICorner")
SelectedCorner.Parent = SelectedItemLabel
SelectedCorner.CornerRadius = UDim.new(0, 8)

-- Секция действий
local ActionSection = Instance.new("Frame")
ActionSection.Parent = ContentFrame
ActionSection.Size = UDim2.new(1, 0, 0, 80)
ActionSection.Position = UDim2.new(0, 0, 0, 310)
ActionSection.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ActionSection.BorderSizePixel = 0

local ActionCorner = Instance.new("UICorner")
ActionCorner.Parent = ActionSection
ActionCorner.CornerRadius = UDim.new(0, 15)

local RefreshButton = Instance.new("TextButton")
RefreshButton.Parent = ActionSection
RefreshButton.Size = UDim2.new(0, 130, 0, 45)
RefreshButton.Position = UDim2.new(0, 15, 0, 15)
RefreshButton.Text = "🔄 ОБНОВИТЬ"
RefreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 200)
RefreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshButton.TextSize = 14
RefreshButton.Font = Enum.Font.GothamBold

local RefreshCorner = Instance.new("UICorner")
RefreshCorner.Parent = RefreshButton
RefreshCorner.CornerRadius = UDim.new(0, 10)

local DupeButton = Instance.new("TextButton")
DupeButton.Parent = ActionSection
DupeButton.Size = UDim2.new(0, 130, 0, 45)
DupeButton.Position = UDim2.new(0.5, -65, 0, 15)
DupeButton.Text = "💰 ДЮП ДЕНЕГ"
DupeButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 14
DupeButton.Font = Enum.Font.GothamBold

local DupeCorner = Instance.new("UICorner")
DupeCorner.Parent = DupeButton
DupeCorner.CornerRadius = UDim.new(0, 10)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = ActionSection
StatusLabel.Size = UDim2.new(0, 130, 0, 45)
StatusLabel.Position = UDim2.new(1, -145, 0, 15)
StatusLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
StatusLabel.Text = "⚡ ГОТОВ"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.GothamBold

local StatusCorner = Instance.new("UICorner")
StatusCorner.Parent = StatusLabel
StatusCorner.CornerRadius = UDim.new(0, 10)

-- Миниатюрная иконка
local MiniIcon = Instance.new("TextButton")
MiniIcon.Parent = ScreenGui
MiniIcon.Size = UDim2.new(0, 0, 0, 0)
MiniIcon.Position = UDim2.new(0, 10, 0, 10)
MiniIcon.Text = "💰"
MiniIcon.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
MiniIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
MiniIcon.TextSize = 20
MiniIcon.Font = Enum.Font.GothamBold
MiniIcon.Visible = false

local MiniCorner = Instance.new("UICorner")
MiniCorner.Parent = MiniIcon
MiniCorner.CornerRadius = UDim.new(1, 0)

-- Переменные
local selectedItem = nil
local itemButtons = {}
local isMinimized = false

-- Получение ВСЕХ предметов из инвентаря
function getAllItems()
    local items = {}
    local backpack = Player:FindFirstChild("Backpack")
    
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local itemType = getItemType(tool)
                table.insert(items, {
                    Object = tool,
                    Name = tool.Name,
                    Type = itemType,
                    Icon = getItemIcon(itemType)
                })
            end
        end
    end
    
    return items
end

function getItemType(tool)
    local name = tool.Name:lower()
    if string.find(name, "fruit") then return "Фрукт"
    elseif string.find(name, "seed") then return "Семя" 
    elseif string.find(name, "pet") then return "Питомец"
    elseif string.find(name, "egg") then return "Яйцо"
    elseif string.find(name, "tool") then return "Инструмент"
    elseif string.find(name, "weapon") then return "Оружие"
    else return "Предмет" end
end

function getItemIcon(itemType)
    if itemType == "Фрукт" then return "🍎"
    elseif itemType == "Семя" then return "🌱"
    elseif itemType == "Питомец" then return "🐾" 
    elseif itemType == "Яйцо" then return "🥚"
    elseif itemType == "Инструмент" then return "🔧"
    elseif itemType == "Оружие" then return "⚔️"
    else return "📦" end
end

-- Обновление списка предметов
function updateItemsList()
    for _, btn in ipairs(itemButtons) do
        btn:Destroy()
    end
    itemButtons = {}
    
    local items = getAllItems()
    ItemsList.CanvasSize = UDim2.new(0, 0, 0, #items * 45)
    
    for i, item in ipairs(items) do
        local itemButton = Instance.new("TextButton")
        itemButton.Parent = ItemsList
        itemButton.Size = UDim2.new(1, -20, 0, 40)
        itemButton.Position = UDim2.new(0, 10, 0, (i-1) * 45)
        itemButton.Text = "  " .. item.Icon .. " " .. item.Type .. " | " .. item.Name
        itemButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        itemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemButton.TextSize = 12
        itemButton.TextXAlignment = Enum.TextXAlignment.Left
        itemButton.Font = Enum.Font.Gotham
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.Parent = itemButton
        btnCorner.CornerRadius = UDim.new(0, 8)
        
        -- Анимации кнопки
        itemButton.MouseEnter:Connect(function()
            TweenService:Create(itemButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(65, 65, 75),
                Size = UDim2.new(1, -15, 0, 42)
            }):Play()
        end)
        
        itemButton.MouseLeave:Connect(function()
            TweenService:Create(itemButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(50, 50, 60),
                Size = UDim2.new(1, -20, 0, 40)
            }):Play()
        end)
        
        itemButton.MouseButton1Click:Connect(function()
            selectedItem = item.Object
            SelectedItemLabel.Text = "📦 Выбрано: " .. item.Name
            StatusLabel.Text = "✅ ГОТОВ"
            
            -- Анимация выбора
            TweenService:Create(itemButton, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(0, 150, 255)
            }):Play()
        end)
        
        table.insert(itemButtons, itemButton)
    end
end

-- Дюп денег
function dupeMoney()
    local amountText = AmountBox.Text
    if not selectedItem or amountText == "" then
        StatusLabel.Text = "❌ ВЫБЕРИТЕ ПРЕДМЕТ И СУММУ"
        return
    end
    
    local amount = tonumber(amountText)
    if not amount or amount <= 0 then
        StatusLabel.Text = "❌ НЕКОРРЕКТНАЯ СУММА"
        return
    end
    
    StatusLabel.Text = "🎯 НАЧИНАЮ ДЮП..."
    
    -- Анимация кнопки
    TweenService:Create(DupeButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 125, 0, 42)}):Play()
    wait(0.1)
    TweenService:Create(DupeButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 130, 0, 45)}):Play()
    
    pcall(function()
        local itemName = selectedItem.Name
        
        -- Все методы дюпа денег
        local methods = {
            {"💰 Продажа через RemoteEvents", function()
                local remotes = {"SellFruit", "SellItem", "Sell", "AddMoney", "GiveMoney"}
                for _, remoteName in ipairs(remotes) do
                    local remote = game:GetService("ReplicatedStorage"):FindFirstChild(remoteName)
                    if remote then
                        for i = 1, 5 do
                            pcall(function() remote:FireServer(selectedItem, amount) end)
                            pcall(function() remote:FireServer(itemName, amount) end)
                            wait(0.1)
                        end
                    end
                end
            end},
            
            {"🏪 Взаимодействие с NPC", function()
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("Model") and (obj.Name:find("Seller") or obj.Name:find("Merchant")) then
                        for _, part in ipairs(obj:GetDescendants()) do
                            local clickDetector = part:FindFirstChildOfClass("ClickDetector")
                            if clickDetector then
                                for i = 1, 3 do
                                    fireclickdetector(clickDetector)
                                    wait(0.3)
                                end
                            end
                        end
                    end
                end
            end},
            
            {"⚡ Все возможные RemoteEvents", function()
                local allRemotes = game:GetService("ReplicatedStorage"):GetDescendants()
                for _, remote in ipairs(allRemotes) do
                    if remote:IsA("RemoteEvent") then
                        for i = 1, 2 do
                            pcall(function() remote:FireServer(selectedItem, amount) end)
                            pcall(function() remote:FireServer(amount) end)
                            wait(0.05)
                        end
                    end
                end
            end}
        }
        
        for i, method in ipairs(methods) do
            StatusLabel.Text = method[1] .. " (" .. i .. "/" .. #methods .. ")"
            pcall(method[2])
            wait(1)
        end
        
        StatusLabel.Text = "🎉 ДЮП ЗАВЕРШЕН!"
        
        -- Обновляем список через 2 секунды
        wait(2)
        updateItemsList()
        StatusLabel.Text = "⚡ ГОТОВ"
        
    end)
end

-- Сворачивание с анимацией
function toggleMinimize()
    if isMinimized then
        -- Разворачиваем
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 450, 0, 500),
            Position = UDim2.new(0.5, -225, 0.5, -250)
        }):Play()
        MainFrame.Visible = true
        MiniIcon.Visible = false
        MinimizeButton.Text = "─"
        isMinimized = false
    else
        -- Сворачиваем
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        wait(0.5)
        MainFrame.Visible = false
        MiniIcon.Visible = true
        MiniIcon.Position = MainFrame.Position
        TweenService:Create(MiniIcon, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 60, 0, 60)
        }):Play()
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

-- Обработчики кнопок с анимациями
RefreshButton.MouseButton1Click:Connect(function()
    TweenService:Create(RefreshButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 125, 0, 42)}):Play()
    wait(0.1)
    TweenService:Create(RefreshButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 130, 0, 45)}):Play()
    
    updateItemsList()
    StatusLabel.Text = "✅ ОБНОВЛЕНО"
end)

DupeButton.MouseButton1Click:Connect(function()
    dupeMoney()
end)

MinimizeButton.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    wait(0.5)
    ScreenGui:Destroy()
end)

MiniIcon.MouseButton1Click:Connect(function()
    toggleMinimize()
end)

-- Делаем перетаскиваемым
makeDraggable(TopBar)
makeDraggable(MiniIcon)

-- Авто-обновление при запуске
updateItemsList()

-- Анти-афк
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

print("💰 FROGGI MONEY ULTRA by BloodEyEs-Hacker загружен!")
print("🎯 Премиум дизайн с анимациями")
print("📱 Полная поддержка мобильных устройств")
