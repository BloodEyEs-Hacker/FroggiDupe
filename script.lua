-- FroggiDupe Money ULTRA by BloodEyEs-Hacker - НАКРУТКА ДЕНЕГ
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Создаем интерфейс
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeMoneyULTRA"
ScreenGui.ResetOnSpawn = false

-- Основное окно
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true

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
    Size = UDim2.new(0, 450, 0, 400),
    Position = UDim2.new(0.5, -225, 0.5, -200)
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

-- Заголовок
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
FrogIcon.Text = "💰"
FrogIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
FrogIcon.TextSize = 30
FrogIcon.Font = Enum.Font.GothamBold

local Title = Instance.new("TextLabel")
Title.Parent = TitleContainer
Title.Size = UDim2.new(0, 250, 0, 60)
Title.Position = UDim2.new(0, 45, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "FROGGI MONEY\n<font size='12'>НАКРУТКА ДЕНЕГ</font>"
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
AmountSection.Size = UDim2.new(1, 0, 0, 120)
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
AmountTitle.Text = "💵 СУММА ДЛЯ НАКРУТКИ"
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

-- Быстрые суммы
local QuickAmountsFrame = Instance.new("Frame")
QuickAmountsFrame.Parent = AmountSection
QuickAmountsFrame.Size = UDim2.new(1, -20, 0, 30)
QuickAmountsFrame.Position = UDim2.new(0, 10, 0, 85)
QuickAmountsFrame.BackgroundTransparency = 1

local quickAmounts = {"10K", "100K", "1M", "10M"}
for i, amount in ipairs(quickAmounts) do
    local quickBtn = Instance.new("TextButton")
    quickBtn.Parent = QuickAmountsFrame
    quickBtn.Size = UDim2.new(0.23, -5, 1, 0)
    quickBtn.Position = UDim2.new((i-1) * 0.23, 0, 0, 0)
    quickBtn.Text = amount
    quickBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
    quickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    quickBtn.TextSize = 12
    quickBtn.Font = Enum.Font.GothamBold
    
    local quickCorner = Instance.new("UICorner")
    quickCorner.Parent = quickBtn
    quickCorner.CornerRadius = UDim.new(0, 6)
    
    quickBtn.MouseButton1Click:Connect(function()
        AmountBox.Text = amount:gsub("K", "000"):gsub("M", "000000")
    end)
end

-- Секция методов накрутки
local MethodsSection = Instance.new("Frame")
MethodsSection.Parent = ContentFrame
MethodsSection.Size = UDim2.new(1, 0, 0, 150)
MethodsSection.Position = UDim2.new(0, 0, 0, 130)
MethodsSection.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MethodsSection.BorderSizePixel = 0

local MethodsCorner = Instance.new("UICorner")
MethodsCorner.Parent = MethodsSection
MethodsCorner.CornerRadius = UDim.new(0, 15)

local MethodsTitle = Instance.new("TextLabel")
MethodsTitle.Parent = MethodsSection
MethodsTitle.Size = UDim2.new(1, -20, 0, 25)
MethodsTitle.Position = UDim2.new(0, 15, 0, 10)
MethodsTitle.BackgroundTransparency = 1
MethodsTitle.Text = "⚡ МЕТОДЫ НАКРУТКИ"
MethodsTitle.TextColor3 = Color3.fromRGB(0, 255, 136)
MethodsTitle.TextSize = 16
MethodsTitle.Font = Enum.Font.GothamBold
MethodsTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Методы накрутки
local methodsList = {
    {name = "💰 Прямое добавление", desc = "Ищет AddMoney/GiveMoney"},
    {name = "🏦 Через банк/магазин", desc = "Имитирует покупки/продажи"},
    {name = "🎯 Все RemoteEvents", desc = "Пробует все возможные события"},
    {name = "⚡ Авто-клик NPC", desc = "Кликает всех торговцев"}
}

local MethodsList = Instance.new("ScrollingFrame")
MethodsList.Parent = MethodsSection
MethodsList.Size = UDim2.new(1, -20, 0, 100)
MethodsList.Position = UDim2.new(0, 10, 0, 40)
MethodsList.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
MethodsList.BorderSizePixel = 0
MethodsList.ScrollBarThickness = 6
MethodsList.CanvasSize = UDim2.new(0, 0, 0, #methodsList * 50)

local MethodsListCorner = Instance.new("UICorner")
MethodsListCorner.Parent = MethodsList
MethodsListCorner.CornerRadius = UDim.new(0, 10)

-- Секция действий
local ActionSection = Instance.new("Frame")
ActionSection.Parent = ContentFrame
ActionSection.Size = UDim2.new(1, 0, 0, 80)
ActionSection.Position = UDim2.new(0, 0, 0, 290)
ActionSection.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ActionSection.BorderSizePixel = 0

local ActionCorner = Instance.new("UICorner")
ActionCorner.Parent = ActionSection
ActionCorner.CornerRadius = UDim.new(0, 15)

local DupeButton = Instance.new("TextButton")
DupeButton.Parent = ActionSection
DupeButton.Size = UDim2.new(0, 200, 0, 45)
DupeButton.Position = UDim2.new(0.5, -100, 0, 15)
DupeButton.Text = "🚀 НАКРУТИТЬ ДЕНЬГИ"
DupeButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 16
DupeButton.Font = Enum.Font.GothamBold

local DupeCorner = Instance.new("UICorner")
DupeCorner.Parent = DupeButton
DupeCorner.CornerRadius = UDim.new(0, 10)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = ActionSection
StatusLabel.Size = UDim2.new(1, -20, 0, 20)
StatusLabel.Position = UDim2.new(0, 10, 0, 55)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "⚡ Введите сумму и нажмите НАКРУТИТЬ"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center

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
MiniIcon.Active = true

local MiniCorner = Instance.new("UICorner")
MiniCorner.Parent = MiniIcon
MiniCorner.CornerRadius = UDim.new(1, 0)

-- Переменные
local isMinimized = false
local methodButtons = {}

-- ФУНКЦИЯ ПЕРЕТАСКИВАНИЯ
local function makeWindowDraggable(window)
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    window.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = window.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    window.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- МЕТОДЫ НАКРУТКИ ДЕНЕГ
function addMoneyDirect(amount)
    -- Прямое добавление денег через RemoteEvents
    local moneyRemotes = {
        "AddMoney", "GiveMoney", "AddCash", "GiveCash",
        "AddCoins", "GiveCoins", "AddCurrency", "GiveCurrency",
        "MoneyAdded", "CashAdded", "UpdateMoney", "SetMoney"
    }
    
    for _, remoteName in ipairs(moneyRemotes) do
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild(remoteName)
        if remote and remote:IsA("RemoteEvent") then
            for i = 1, 10 do
                pcall(function() remote:FireServer(amount) end)
                pcall(function() remote:FireServer(Player, amount) end)
                pcall(function() remote:FireServer(amount, "Admin") end)
                wait(0.05)
            end
            return true
        end
    end
    return false
end

function addMoneyViaShop(amount)
    -- Через магазинные системы
    local shopRemotes = {
        "Purchase", "Buy", "Sell", "Transaction",
        "ShopPurchase", "BuyItem", "SellItem"
    }
    
    for _, remoteName in ipairs(shopRemotes) do
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild(remoteName)
        if remote and remote:IsA("RemoteEvent") then
            for i = 1, 5 do
                pcall(function() remote:FireServer("Money", amount) end)
                pcall(function() remote:FireServer("Cash", amount) end)
                pcall(function() remote:FireServer(Player, "Money", amount) end)
                wait(0.1)
            end
            return true
        end
    end
    return false
end

function addMoneyAllRemotes(amount)
    -- Пробуем все RemoteEvents подряд
    local allRemotes = game:GetService("ReplicatedStorage"):GetDescendants()
    local success = false
    
    for _, remote in ipairs(allRemotes) do
        if remote:IsA("RemoteEvent") then
            for i = 1, 3 do
                pcall(function() 
                    remote:FireServer(amount)
                    remote:FireServer(Player, amount)
                    remote:FireServer("Money", amount)
                    success = true
                end)
                wait(0.02)
            end
        end
    end
    return success
end

function clickAllNPCs()
    -- Кликаем всех NPC для триггера событий
    local npcCount = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name:find("NPC") or obj.Name:find("Merchant") or obj.Name:find("Seller")) then
            for _, part in ipairs(obj:GetDescendants()) do
                if part:IsA("Part") or part:IsA("MeshPart") then
                    local clickDetector = part:FindFirstChildOfClass("ClickDetector")
                    if clickDetector then
                        for i = 1, 2 do
                            fireclickdetector(clickDetector)
                            wait(0.2)
                        end
                        npcCount = npcCount + 1
                    end
                end
            end
        end
    end
    return npcCount > 0
end

-- ОСНОВНАЯ ФУНКЦИЯ НАКРУТКИ
function farmMoney()
    local amountText = AmountBox.Text
    if amountText == "" then
        StatusLabel.Text = "❌ ВВЕДИТЕ СУММУ"
        return
    end
    
    -- Конвертируем текст в число (убираем K/M)
    local amount = tonumber(amountText:gsub("K", "000"):gsub("M", "000000"))
    if not amount or amount <= 0 then
        StatusLabel.Text = "❌ НЕКОРРЕКТНАЯ СУММА"
        return
    end
    
    StatusLabel.Text = "🎯 НАЧИНАЮ НАКРУТКУ..."
    
    -- Анимация кнопки
    TweenService:Create(DupeButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 190, 0, 42)}):Play()
    wait(0.1)
    TweenService:Create(DupeButton, TweenInfo.new(0.1), {Size = UDim2.new(0, 200, 0, 45)}):Play()
    
    pcall(function()
        -- Метод 1: Прямое добавление
        StatusLabel.Text = "💰 Метод 1: Прямое добавление..."
        if addMoneyDirect(amount) then
            StatusLabel.Text = "✅ Деньги добавлены!"
            wait(2)
            return
        end
        
        -- Метод 2: Через магазин
        StatusLabel.Text = "🏪 Метод 2: Через магазинные системы..."
        if addMoneyViaShop(amount) then
            StatusLabel.Text = "✅ Магазинная система!"
            wait(2)
            return
        end
        
        -- Метод 3: Все RemoteEvents
        StatusLabel.Text = "🎯 Метод 3: Все возможные события..."
        if addMoneyAllRemotes(amount) then
            StatusLabel.Text = "✅ События сработали!"
            wait(2)
            return
        end
        
        -- Метод 4: NPC
        StatusLabel.Text = "⚡ Метод 4: Взаимодействие с NPC..."
        if clickAllNPCs() then
            StatusLabel.Text = "✅ NPC активированы!"
            wait(2)
            return
        end
        
        StatusLabel.Text = "❌ НЕ УДАЛОСЬ НАКРУТИТЬ"
        
    end)
end

-- Создание кнопок методов
for i, method in ipairs(methodsList) do
    local methodButton = Instance.new("TextButton")
    methodButton.Parent = MethodsList
    methodButton.Size = UDim2.new(1, -20, 0, 45)
    methodButton.Position = UDim2.new(0, 10, 0, (i-1) * 50)
    methodButton.Text = method.name .. "\n<font size='10'>" .. method.desc .. "</font>"
    methodButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    methodButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    methodButton.TextSize = 12
    methodButton.Font = Enum.Font.Gotham
    methodButton.RichText = true
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.Parent = methodButton
    btnCorner.CornerRadius = UDim.new(0, 8)
    
    table.insert(methodButtons, methodButton)
end

-- Сворачивание
function toggleMinimize()
    if isMinimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 450, 0, 400),
            Position = UDim2.new(0.5, -225, 0.5, -200)
        }):Play()
        MainFrame.Visible = true
        MiniIcon.Visible = false
        MinimizeButton.Text = "─"
        isMinimized = false
    else
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

-- Обработчики кнопок
DupeButton.MouseButton1Click:Connect(function()
    farmMoney()
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

-- Перетаскивание
makeWindowDraggable(MainFrame)
makeWindowDraggable(MiniIcon)

-- Анти-афк
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

print("💰 FROGGI MONEY ULTRA by BloodEyEs-Hacker загружен!")
print("🎯 Накрутка денег без продажи предметов")
print("⚡ 4 метода прямого добавления денег")
