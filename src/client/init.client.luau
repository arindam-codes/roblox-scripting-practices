--[[
print("Script Started")
local Players  = game:GetService("Players")

local player = Players.LocalPlayer

print("Got player")
local character = player.Character or player.CharacterAdded:Wait()

if not character then
    warn("Character not found")
    return
end

print("Got character")

local humanoid = character:WaitForChild("Humanoid", 10)

if not humanoid then
    warn("Humanoid not found ")
    return
end

print("Got humanoid")

print(humanoid.Health)

-- understood "inifinte yied possible" error means something luau didnt find what we wanted to find on that location 

-- Players.gam_devX.PlayerScripts.Client:7: attempt to index nil with 'WaitForChild'
-- understood this eroor bcz its not loading the character at start so we need to add 
-- characterAdded:Wait()

-- understood timeout without timeout if humanoid doesnt load it wil search for ever
-- and script will block forever or roblox can show the infinite error
-- thats why we need to add timeout local humanoid = character:WaitForChild("Humanoid", 10)
-- it will serach humanoid for 10 seconds
-- if humanoid found within 10 seconds return child
-- else warn


]]

-- method 1: longer
--[[
local part = workspace:WaitForChild("bridgeTrigger")
part.Anchored = true

part.Touched:Connect(function(hitPart)
    
    local character = hitPart.Parent
    local player = game.Players:GetPlayerFromCharacter(character)

    if not player then return end
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.JumpPower = 0
    humanoid.JumpHeight = 0
    
end
)
]]

--[[
    Workspace
 └── Character (Model)   ← THIS is what you want
      ├── Humanoid
      ├── HumanoidRootPart
      ├── Head
      ├── LeftHand / RightHand
      ├── Accessories
      │    └── Pal Hair (Accessory)
      │         └── Handle (BasePart)  ← this often touches things
      ├── Shirt / Pants
      └── Other body parts
]]

-- sometimes on touched function handle can be touched too with that part 
-- so we can do hiPart.Parent ~= character but equals to Pal Hair
-- so we need to use ( not findfirstancestor bcz this is random for every players user id)
-- we need to use findfirstancestorofclass which is a model and then model:WaitForChild("Humanoid")
-- thus we get humanoid


--[[
local part = workspace:WaitForChild("bridgeTrigger")
part.Anchored = true

part.Touched:Connect(function(hitPart)
    local character = hitPart:FindFirstAncestorOfClass("Model")
    if not character then return end
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.JumpPower = 0
    humanoid.JumpHeight = 0

end
)
]]




