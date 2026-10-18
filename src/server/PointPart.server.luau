local Players = game:GetService("Players")

local function leaderBoardOn(player)
        
    local leaderBoard = Instance.new("Folder", player)

    leaderBoard.Name = "LeaderBoard"

    local points = Instance.new("IntValue", leaderBoard)
    points.Name = "Points"
    points.Value = 0

end

Players.PlayerAdded:Connect(leaderBoardOn)

local pointPart = Instance.new("Part", workspace)
pointPart.Name = "PointPart"
pointPart.Anchored = true
pointPart.CanCollide = true
pointPart.Position = Vector3.new(0, 5, 4)

-- colors
local blue = Color3.fromRGB(0,0,255)
local green = Color3.fromRGB(0,255,0)
local red = Color3.fromRGB(255,0,0)

-- points
local smallPoints = 10
local largePoints = 50
local loosePoints = 100

-- give points
local function givePoints(player)
    local currentColor = pointPart.Color
    local playerStats = player:WaitForChild("LeaderBoard")
    local playerPoints = playerStats:WaitForChild("Points")

    if currentColor == blue then
        playerPoints.Value += smallPoints
    elseif currentColor == green then
        playerPoints.Value += largePoints
    else
        playerPoints.Value -= loosePoints
    end

    pointPart:Destroy()

    local particle = Instance.new("ParticleEmitter")
    particle.Color = ColorSequence.new(currentColor)
    particle.Parent = player.Character:WaitForChild("Head")

    task.wait(1)
    particle:Destroy()
end

local function partTouched(thePart)

    local player = Players:GetPlayerFromCharacter(thePart.Parent)

    if player then
        givePoints(player)
    end
end


pointPart.Touched:Connect(partTouched)




-- loops
while true do
    pointPart.Color = blue
    task.wait(3)

    pointPart.Color = green
    task.wait(2)

    pointPart.Color = red
    task.wait(1)
end

-- its the default 1st parameter luau provides from the event fired for ex. .Touched() will pass Part in 1st parameter
-- while .playerAdded will pass player in 1st parameter
    --     local leaderBoard = Instance.new("Folder", player)
    --     that why this line leaderBoard's parent is player


-- obv below while true loop will never run
-- 

