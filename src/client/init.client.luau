local Players  = game:GetService("Players")

local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()

if not character then
    warn("Character not found")
    return
end

local humanoid = character:WaitForChild("Humanoid", 10)

if not humanoid then
    warn("Humanoid not found ")
end

print(humanoid.Health)

-- understood "inifinte yied possible" error means something luau didnt find what we wanted to find on that location 

-- Players.gam_devX.PlayerScripts.Client:7: attempt to index nil with 'WaitForChild'
-- understood this eroor bcz its not loading the character at start so we need to add 
-- characterAdded:Wait()

-- understood timeout without timeout if humanoid doesnt load it wil search for ever
-- and script will block forever or roblox can show the infinite error
-- thats why we need to add timeout local humanoid = character:WaitForChild("Humanoid", 10)
