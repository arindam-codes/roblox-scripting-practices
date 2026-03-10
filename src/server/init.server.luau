--[[local function calaculateDamege(baseDamage, multiplier)
    return baseDamage * multiplier
end

print(calaculateDamege(10, 2)) -- Output: 20
--[[for i = 1, 20, 1 do
    if i % 3 == 0 and i % 5 == 0 then
        print("FizzBuzz")
    elseif i % 5 ==0 then
        print("Buzz")
    elseif i % 3 == 0 then
        print("Fizz")
    else
        print(i)
    end
end]]

--[[
local player = {
    name = "Arindam",
    level = 100,
    gold = 250
}

print("Player " .. player.name .. " has " .. player.gold .. " gold") ]]
--[[
local inventory = {"Sword", "Shield", "Potion", "Helmet"}

for i, item in inventory do 
    print("Item " .. i .. ": ".. item)
end]]

--[[
local enemies = {"Zombie", "Goblin", "Skeleton"}

for _, enemy in pairs(enemies) do
    
    if enemy ~= "Goblin" then
        print(enemy)
    else
        print("Dragon")
    end
end
]]
