local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local shiftPressed = false
local lastShiftTime = 0

local function setJumpPower(jumpPower)
    humanoid.JumpPower = jumpPower
end

-- Function to handle shift key press
local function onShiftKeyDown()
    shiftPressed = true
    lastShiftTime = tick()  -- Record the time when shift was pressed
end

-- Function to handle space key press
local function onSpaceKeyDown()
    if shiftPressed then
        local currentTime = tick()
        if currentTime - lastShiftTime <= 0.2 then
            setJumpPower(70)  -- Set jump power to 200 if both keys were pressed in quick succession
            
           local hint = Instance.new("Hint")
            hint.Parent = game.Workspace
            hint.Text = "Angle"
            wait (0.5)
            hint:Destroy()
            
            -- Reset jump power after 0.5 seconds
            wait(0.5)
            setJumpPower(50)  -- Reset jump power back to default
        end
    end
    shiftPressed = false  -- Reset shiftPressed flag after handling space key
end

-- Connect key press events
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
        onShiftKeyDown()
    elseif input.KeyCode == Enum.KeyCode.Space then
        onSpaceKeyDown()
    end
end)
