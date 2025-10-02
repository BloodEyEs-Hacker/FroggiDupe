-- FroggiDupe - Простой рабочий дюп для Grow A Garden
local Player = game:GetService("Players").LocalPlayer

-- Простой интерфейс
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local DupeButton = Instance.new("TextButton")
local Status = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeSimple"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Frame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 8)

Title.Parent = Frame
Title.Size = UDim2.new(0, 230, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "🐸 FroggiDupe"
Title.TextColor3 = Color3.fromRGB(0, 255, 136)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold

DupeButton.Parent = Frame
DupeButton.Size = UDim2.new(0, 200, 0, 35)
DupeButton.Position = UDim2.new(0, 25, 0, 60)
DupeButton.Text = "🔄 Запустить Дюп"
DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 16
DupeButton.Font = Enum.Font.GothamBold

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.Parent = DupeButton
ButtonCorner.CornerRadius = UDim.new(0, 6)

ToggleButton.Parent = Frame
ToggleButton.Size = UDim2.new(0, 200, 0, 35)
ToggleButton.Position = UDim2.new(0, 25, 0, 105)
ToggleButton.Text = "⏸️ Остановить"
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 16
ToggleButton.Font = Enum.Font.GothamBold

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.Parent = ToggleButton
ToggleCorner.CornerRadius = UDim.new(0, 6)

Status.Parent = Frame
Status.Size = UDim2.new(0, 230, 0, 20)
Status.Position = UDim2.new(0, 10, 0, 150)
Status.BackgroundTransparency = 1
Status.Text = "Статус: Ожидание..."
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 14
Status.Font = Enum.Font.Gotham

-- Переменные
local isDuping = false
local dupeConnection = nil

-- Функция дюпа
function startDupe()
    if isDuping then return end
    
    isDuping = true
    Status.Text = "Статус: Дюп активен ✅"
    DupeButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    
    dupeConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not isDuping then return end
        
        pcall(function()
            local backpack = Player:FindFirstChild("Backpack")
            if backpack then
                -- Дюп фруктов
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name:lower(), "fruit") then
                        tool.Parent = Player.Character
                        wait(0.1)
                        tool.Parent = backpack
                        wait(0.1)
                    end
                end
                
                -- Дюп питомцев
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name:lower(), "pet") then
                        tool.Parent = Player.Character
                        wait(0.1)
                        tool.Parent = backpack
                        wait(0.1)
                    end
                end
                
                -- Дюп семян
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name:lower(), "seed") then
                        tool.Parent = Player.Character
                        wait(0.1)
                        tool.Parent = backpack
                        wait(0.1)
                    end
                end
            end
        end)
    end)
end

-- Функция остановки
function stopDupe()
    isDuping = false
    if dupeConnection then
        dupeConnection:Disconnect()
        dupeConnection = nil
    end
    Status.Text = "Статус: Остановлен ❌"
    DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
end

-- Обработчики кнопок
DupeButton.MouseButton1Click:Connect(function()
    startDupe()
end)

ToggleButton.MouseButton1Click:Connect(function()
    stopDupe()
end)

-- Авто-покупка (простая версия)
local function autoBuy()
    pcall(function()
        -- Магазин семян
        local seedShop = workspace:FindFirstChild("SeedShop") 
        if seedShop then
            local clickDetector = seedShop:FindFirstChildOfClass("ClickDetector")
            if clickDetector then
                fireclickdetector(clickDetector)
            end
        end
        
        -- Магазин яиц
        local eggShop = workspace:FindFirstChild("EggShop") or workspace:FindFirstChild("PetShop")
        if eggShop then
            local clickDetector = eggShop:FindFirstChildOfClass("ClickDetector")
            if clickDetector then
                fireclickdetector(clickDetector)
            end
        end
    end)
end

-- Кнопка авто-покупки
local BuyButton = Instance.new("TextButton")
BuyButton.Parent = Frame
BuyButton.Size = UDim2.new(0, 90, 0, 25)
BuyButton.Position = UDim2.new(0, 25, 0, 145)
BuyButton.Text = "🛒 Купить"
BuyButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
BuyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
BuyButton.TextSize = 12
BuyButton.Font = Enum.Font.GothamBold

local BuyCorner = Instance.new("UICorner")
BuyCorner.Parent = BuyButton
BuyCorner.CornerRadius = UDim.new(0, 4)

BuyButton.MouseButton1Click:Connect(autoBuy)

-- Перемещение интерфейса
local dragging = false
local dragInput, dragStart, startPos

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("🐸 FroggiDupe загружен! Просто нажми 'Запустить Дюп'")
