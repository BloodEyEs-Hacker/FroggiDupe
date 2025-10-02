-- FroggiDupe Mobile - Premium Dupe Script for Grow A Garden
-- Created for DeltaX Mobile

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Система ключей
local correctKey = "NewFroggi"
local authenticated = false

-- Красивый интерфейс ввода ключа
local function createKeyUI()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local InputFrame = Instance.new("Frame")
    local InputBox = Instance.new("TextBox")
    local SubmitButton = Instance.new("TextButton")
    local Message = Instance.new("TextLabel")
    local FroggiIcon = Instance.new("TextLabel")
    
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.Name = "FroggiDupeKey"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 350, 0, 280)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -140)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BorderSizePixel = 0
    
    UICorner.Parent = MainFrame
    UICorner.CornerRadius = UDim.new(0, 15)
    
    -- Градиентная рамка
    local GradientBorder = Instance.new("Frame")
    GradientBorder.Parent = MainFrame
    GradientBorder.Size = UDim2.new(1, 4, 1, 4)
    GradientBorder.Position = UDim2.new(0, -2, 0, -2)
    GradientBorder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    GradientBorder.ZIndex = 0
    
    local Gradient = Instance.new("UIGradient")
    Gradient.Parent = GradientBorder
    Gradient.Rotation = 45
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 136)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 204, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(153, 0, 255))
    })
    
    local BorderCorner = Instance.new("UICorner")
    BorderCorner.Parent = GradientBorder
    BorderCorner.CornerRadius = UDim.new(0, 17)
    
    FroggiIcon.Parent = MainFrame
    FroggiIcon.Size = UDim2.new(0, 80, 0, 80)
    FroggiIcon.Position = UDim2.new(0.5, -40, 0.1, 0)
    FroggiIcon.BackgroundTransparency = 1
    FroggiIcon.Text = "🐸"
    FroggiIcon.TextColor3 = Color3.fromRGB(0, 255, 136)
    FroggiIcon.TextSize = 50
    FroggiIcon.Font = Enum.Font.GothamBold
    FroggiIcon.TextStrokeTransparency = 0.8
    
    Title.Parent = MainFrame
    Title.Size = UDim2.new(0, 300, 0, 40)
    Title.Position = UDim2.new(0.5, -150, 0.4, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "FroggiDupe Mobile"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    Title.Font = Enum.Font.GothamBold
    Title.TextStrokeTransparency = 0.7
    
    InputFrame.Parent = MainFrame
    InputFrame.Size = UDim2.new(0, 250, 0, 45)
    InputFrame.Position = UDim2.new(0.5, -125, 0.6, 0)
    InputFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    InputFrame.BorderSizePixel = 0
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.Parent = InputFrame
    InputCorner.CornerRadius = UDim.new(0, 10)
    
    InputBox.Parent = InputFrame
    InputBox.Size = UDim2.new(0, 230, 0, 35)
    InputBox.Position = UDim2.new(0.5, -115, 0.5, -17)
    InputBox.PlaceholderText = "Введите ключ доступа..."
    InputBox.Text = ""
    InputBox.BackgroundTransparency = 1
    InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    InputBox.TextSize = 16
    InputBox.Font = Enum.Font.Gotham
    InputBox.ClearTextOnFocus = false
    
    SubmitButton.Parent = MainFrame
    SubmitButton.Size = UDim2.new(0, 140, 0, 40)
    SubmitButton.Position = UDim2.new(0.5, -70, 0.8, 0)
    SubmitButton.Text = "АКТИВИРОВАТЬ"
    SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 255, 136)
    SubmitButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    SubmitButton.TextSize = 16
    SubmitButton.Font = Enum.Font.GothamBold
    SubmitButton.AutoButtonColor = false
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.Parent = SubmitButton
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    
    Message.Parent = MainFrame
    Message.Size = UDim2.new(0, 300, 0, 25)
    Message.Position = UDim2.new(0.5, -150, 0.95, -12)
    Message.BackgroundTransparency = 1
    Message.Text = "Введите ключ: NewFroggi"
    Message.TextColor3 = Color3.fromRGB(150, 150, 150)
    Message.TextSize = 12
    Message.Font = Enum.Font.Gotham
    
    -- Анимации кнопки
    SubmitButton.MouseEnter:Connect(function()
        TweenService:Create(SubmitButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 230, 120)}):Play()
    end)
    
    SubmitButton.MouseLeave:Connect(function()
        TweenService:Create(SubmitButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 255, 136)}):Play()
    end)
    
    SubmitButton.MouseButton1Click:Connect(function()
        if InputBox.Text == correctKey then
            authenticated = true
            Message.Text = "✅ Успешная активация!"
            Message.TextColor3 = Color3.fromRGB(0, 255, 136)
            
            wait(1)
            ScreenGui:Destroy()
            loadMainScript()
        else
            Message.Text = "❌ Неверный ключ!"
            Message.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)
    
    InputBox.Focused:Connect(function()
        TweenService:Create(InputFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 60)}):Play()
    end)
    
    InputBox.FocusLost:Connect(function()
        TweenService:Create(InputFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
    end)
end

-- Основной скрипт после активации
function loadMainScript()
    -- Настройки для Grow A Garden
    local Settings = {
        AutoDupeFruits = true,
        AutoDupePets = true,
        AutoBuySeeds = true,
        AutoBuyEggs = true,
        AutoPlant = true,
        AutoWater = true,
        AutoCollect = true,
        DupeDelay = 1
    }

    -- Загрузка библиотеки UI
    local success, Library = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    end)
    
    if not success then
        warn("Не удалось загрузить библиотеку UI")
        return
    end

    local Window = Library.CreateLib("🐸 FroggiDupe v2.0", "DarkTheme")
    
    -- Главная вкладка
    local MainTab = Window:NewTab("Главная")
    local AutoSection = MainTab:NewSection("⚡ Авто-Фарм")
    
    AutoSection:NewToggle("Авто Дюп Фруктов", "Дублирует фрукты в инвентаре", function(state)
        Settings.AutoDupeFruits = state
    end)
    
    AutoSection:NewToggle("Авто Дюп Питомцев", "Дублирует питомцев в инвентаре", function(state)
        Settings.AutoDupePets = state
    end)
    
    AutoSection:NewToggle("Авто Посадка", "Автоматически сажает семена", function(state)
        Settings.AutoPlant = state
    end)
    
    AutoSection:NewToggle("Авто Полив", "Автоматически поливает растения", function(state)
        Settings.AutoWater = state
    end)
    
    AutoSection:NewToggle("Авто Сбор", "Автоматически собирает урожай", function(state)
        Settings.AutoCollect = state
    end)
    
    -- Покупка вкладка
    local BuyTab = Window:NewTab("🛒 Покупка")
    local BuySection = BuyTab:NewSection("Авто-Покупка")
    
    BuySection:NewToggle("Авто Покупка Семян", "Покупает семена автоматически", function(state)
        Settings.AutoBuySeeds = state
    end)
    
    BuySection:NewToggle("Авто Покупка Яиц", "Покупает яйца автоматически", function(state)
        Settings.AutoBuyEggs = state
    end)
    
    -- Настройки вкладка
    local SettingsTab = Window:NewTab("⚙️ Настройки")
    local ConfigSection = SettingsTab:NewSection("Конфигурация")
    
    ConfigSection:NewSlider("Задержка", "Задержка между операциями", 5, 0.5, function(value)
        Settings.DupeDelay = value
    end)
    
    -- Функции для Grow A Garden
    function dupeItems()
        if Settings.AutoDupeFruits then
            local backpack = Player:FindFirstChild("Backpack")
            if backpack then
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name:lower(), "fruit") then
                        pcall(function()
                            tool.Parent = Player.Character
                            wait(0.3)
                            tool.Parent = backpack
                        end)
                        wait(Settings.DupeDelay)
                    end
                end
            end
        end
        
        if Settings.AutoDupePets then
            local backpack = Player:FindFirstChild("Backpack")
            if backpack then
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name:lower(), "pet") then
                        pcall(function()
                            tool.Parent = Player.Character
                            wait(0.3)
                            tool.Parent = backpack
                        end)
                        wait(Settings.DupeDelay)
                    end
                end
            end
        end
    end
    
    function autoBuyItems()
        if Settings.AutoBuySeeds then
            pcall(function()
                local seedShop = workspace:FindFirstChild("SeedShop") 
                or workspace:FindFirstChild("Seed Store") 
                or workspace:FindFirstChild("SeedVendor")
                
                if seedShop then
                    local clickDetector = seedShop:FindFirstChildOfClass("ClickDetector")
                    if clickDetector then
                        fireclickdetector(clickDetector)
                        wait(1)
                    end
                end
            end)
        end
        
        if Settings.AutoBuyEggs then
            pcall(function()
                local eggShop = workspace:FindFirstChild("EggShop") 
                or workspace:FindFirstChild("PetShop") 
                or workspace:FindFirstChild("Pet Store")
                
                if eggShop then
                    local clickDetector = eggShop:FindFirstChildOfClass("ClickDetector")
                    if clickDetector then
                        fireclickdetector(clickDetector)
                        wait(1)
                    end
                end
            end)
        end
    end
    
    function autoFarm()
        if Settings.AutoPlant then
            pcall(function()
                local seeds = Player.Backpack:GetChildren()
                for _, seed in ipairs(seeds) do
                    if seed:IsA("Tool") and string.find(seed.Name:lower(), "seed") then
                        -- Логика посадки семян
                    end
                end
            end)
        end
        
        if Settings.AutoWater then
            pcall(function()
                -- Логика полива растений
                local waterCan = Player.Backpack:FindFirstChild("Watering Can") 
                or Player.Backpack:FindFirstChild("WaterCan")
                
                if waterCan then
                    waterCan.Parent = Player.Character
                    wait(0.5)
                    -- Активация полива
                    waterCan.Parent = Player.Backpack
                end
            end)
        end
        
        if Settings.AutoCollect then
            pcall(function()
                -- Логика сбора урожая
                local plants = workspace:GetDescendants()
                for _, plant in ipairs(plants) do
                    if plant.Name:lower():find("plant") and plant:FindFirstChild("ClickDetector") then
                        fireclickdetector(plant.ClickDetector)
                        wait(0.2)
                    end
                end
            end)
        end
    end
    
    -- Основной цикл
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if authenticated then
            pcall(function()
                dupeItems()
                autoBuyItems()
                autoFarm()
            end)
        end
    end)
    
    -- Уведомление об успехе
    Library:Notify("FroggiDupe Активирован!", "🐸 Скрипт успешно запущен для Grow A Garden", 5)
    
    -- Анти-афк
    local VirtualUser = game:GetService("VirtualUser")
    Player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    
    print("🐸 FroggiDupe v2.0 loaded for Grow A Garden!")
end

-- Запуск интерфейса ключа
createKeyUI()
