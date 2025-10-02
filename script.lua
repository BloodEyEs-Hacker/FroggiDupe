-- FroggiDupe by BloodEyEs-Hacker - Настоящий дюп для Grow A Garden
local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")

-- Простой интерфейс
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local DupeButton = Instance.new("TextButton")
local Status = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FroggiDupeReal"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 280, 0, 200)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Frame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 8)

Title.Parent = Frame
Title.Size = UDim2.new(0, 260, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "🐸 FroggiDupe REAL"
Title.TextColor3 = Color3.fromRGB(0, 255, 136)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold

DupeButton.Parent = Frame
DupeButton.Size = UDim2.new(0, 240, 0, 35)
DupeButton.Position = UDim2.new(0, 20, 0, 60)
DupeButton.Text = "🔄 НАЧАТЬ ДЮП"
DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
DupeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DupeButton.TextSize = 16
DupeButton.Font = Enum.Font.GothamBold

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.Parent = DupeButton
ButtonCorner.CornerRadius = UDim.new(0, 6)

ToggleButton.Parent = Frame
ToggleButton.Size = UDim2.new(0, 240, 0, 35)
ToggleButton.Position = UDim2.new(0, 20, 0, 105)
ToggleButton.Text = "⏸️ ОСТАНОВИТЬ ДЮП"
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 16
ToggleButton.Font = Enum.Font.GothamBold

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.Parent = ToggleButton
ToggleCorner.CornerRadius = UDim.new(0, 6)

Status.Parent = Frame
Status.Size = UDim2.new(0, 260, 0, 20)
Status.Position = UDim2.new(0, 10, 0, 150)
Status.BackgroundTransparency = 1
Status.Text = "Статус: Ожидание..."
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 14
Status.Font = Enum.Font.Gotham

-- Переменные
local isDuping = false
local dupeConnection = nil

-- Функция настоящего дюпа через клонирование
function realDupe()
    pcall(function()
        local backpack = Player:FindFirstChild("Backpack")
        if not backpack then return end
        
        -- Ищем фрукты для дублирования
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and (string.find(tool.Name:lower(), "fruit") or string.find(tool.Name:lower(), "seed")) then
                
                -- Создаем клон фрукта/семени
                local clone = tool:Clone()
                clone.Parent = backpack
                
                -- Сохраняем все свойства оригинала
                clone.Name = tool.Name
                clone.TextureId = tool.TextureId
                clone.MeshId = tool.MeshId
                
                -- Копируем все дополнительные свойства
                for _, prop in ipairs({"Weight", "Value", "Rarity", "Level"}) do
                    if tool:FindFirstChild(prop) then
                        local originalValue = tool[prop]
                        if originalValue then
                            clone[prop] = originalValue
                        end
                    end
                end
                
                Status.Text = "Дюп: " .. tool.Name .. " ✅"
                wait(0.5) -- Задержка между дублированием
            end
        end
        
        -- Дюп питомцев
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and string.find(tool.Name:lower(), "pet") then
                
                -- Создаем клон питомца
                local clone = tool:Clone()
                clone.Parent = backpack
                
                -- Сохраняем все свойства
                clone.Name = tool.Name
                clone.TextureId = tool.TextureId
                clone.MeshId = tool.MeshId
                
                -- Копируем специальные свойства питомцев
                for _, prop in ipairs({"Level", "Rarity", "XP", "Evolution"}) do
                    if tool:FindFirstChild(prop) then
                        local originalValue = tool[prop]
                        if originalValue then
                            clone[prop] = originalValue
                        end
                    end
                end
                
                Status.Text = "Дюп: " .. tool.Name .. " ✅"
                wait(0.5) -- Задержка между дублированием
            end
        end
    end)
end

-- Функция запуска дюпа
function startDupe()
    if isDuping then return end
    
    isDuping = true
    Status.Text = "Статус: Дюп активен 🟢"
    DupeButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    
    dupeConnection = RunService.Heartbeat:Connect(function()
        if not isDuping then return end
        realDupe()
    end)
end

-- Функция остановки
function stopDupe()
    isDuping = false
    if dupeConnection then
        dupeConnection:Disconnect()
        dupeConnection = nil
    end
    Status.Text = "Статус: Остановлен 🔴"
    DupeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
end

-- Обработчики кнопок
DupeButton.MouseButton1Click:Connect(function()
    startDupe()
end)

ToggleButton.MouseButton1Click:Connect(function()
    stopDupe()
end)

-- Функция покупки семян/яиц
local function buyItems()
    pcall(function()
        -- Магазин семян
        local seedShops = {
            workspace:FindFirstChild("SeedShop"),
            workspace:FindFirstChild("Seed Store"),
            workspace:FindFirstChild("SeedVendor"),
            workspace:FindFirstChild("Seeds")
        }
        
        for _, shop in ipairs(seedShops) do
            if shop then
                local clickDetector = shop:FindFirstChildOfClass("ClickDetector")
                if clickDetector then
                    fireclickdetector(clickDetector)
                    Status.Text = "Покупка семян..."
                    wait(1)
                end
            end
        end
        
        -- Магазин яиц
        local eggShops = {
            workspace:FindFirstChild("EggShop"),
            workspace:FindFirstChild("PetShop"),
            workspace:FindFirstChild("Pet Store"),
            workspace:FindFirstChild("Eggs")
        }
        
        for _, shop in ipairs(eggShops) do
            if shop then
                local clickDetector = shop:FindFirstChildOfClass("ClickDetector")
                if clickDetector then
                    fireclickdetector(clickDetector)
                    Status.Text = "Покупка яиц..."
                    wait(1)
                end
            end
        end
        
        Status.Text = "Покупка завершена ✅"
    end)
end

-- Кнопка покупки
local BuyButton = Instance.new("TextButton")
BuyButton.Parent = Frame
BuyButton.Size = UDim2.new(0, 100, 0, 25)
BuyButton.Position = UDim2.new(0, 20, 0, 165)
BuyButton.Text = "🛒 КУПИТЬ"
BuyButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
BuyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
BuyButton.TextSize = 12
BuyButton.Font = Enum.Font.GothamBold

local BuyCorner = Instance.new("UICorner")
BuyCorner.Parent = BuyButton
BuyCorner.CornerRadius = UDim.new(0, 4)

BuyButton.MouseButton1Click:Connect(buyItems)

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

-- Анти-афк
local VirtualUser = game:GetService("VirtualUser")
Player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

print("🐸 FroggiDupe REAL by BloodEyEs-Hacker загружен!")
print("🔄 Настоящий дюп с клонированием предметов")
print("📦 Создает копии фруктов, семян и питомцев")
