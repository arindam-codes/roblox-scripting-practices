--[[
local table1 = {1, 2, 3}
local table2 = {4, 5, 6}

local metatable = {

    __add = function(table1, table2)
        local elements = {}

        for i in ipairs(table1) do
            elements[i] = table1[i] + table2[i]
        end
        
        return elements
    end
}

setmetatable(table1, metatable)
setmetatable(table2, metatable)

local sum = table1 + table2
print(sum)
]]


--[[
local metaTable = {
    __index = function(table, key)
        
        return "Key is missing: " .. key
    end
}

local myTable = setmetatable({}, metaTable)

print(myTable.missing)
]]

-- __index mathod use 

-- level 1 basic fallback
--[[
defaults = {health = 100, mana = 50}
player = {}


setmetatable(player, {__index = defaults})

print(player.health)
print(player.mana)
]]

-- level 2 -- override parent value

-- defaults = {health = 100, mana = 50}
-- player = {health = 80}

-- this time lua will print health 80 bcz it never ask for metatable bcz the key already exists 

-- local defaults = {health = 100}
-- local player = {health = nil}

-- this time key health exists but setting it to nil in luau it means i am just setting health key dne
-- health = nil means player = {} so it gonna print parent value

-- local defaults = {health = 100}
-- local player = {}
-- player.health = 50

-- this time it gonna print 50 bcz ket exists so it never gonna ask metatable 

--[[
    so if key dne only then lua will ask if metatble exists
                                            if metatable exists search for __index if it exists
                                                if __index exists use it 
]]


-- __newindex method
--[[
local myTable = {}
local metaTable = {
    __newindex = function(table, key, value)
        if type(value) ~= "number" then 
            print("Can't add Key " .. key .. " with value: " .. value)
            return
        end

        rawset(table, key, value)
        print("Value added: " .. tostring(value)) -- converting number to str
    end
}

setmetatable(myTable, metaTable)

myTable.newKey = "newValue"
print(myTable.newKey)

myTable.newKey = 60
print(myTable.newKey)
]]

-- __newindex just for checking ok i am trying to add something but it will not actualy add that 
-- to actually add that we need rawset

-- creating npc class
--[[
local NPC = {}
NPC.__index = NPC

function NPC:new(name, age, health, position, dialogue, quests)

    local self = setmetatable({}, NPC)

    self.name = name
    self.age = age
    self.health = health
    self.position = position
    self.dialogue = dialogue
    self.quests = quests
    self.state = "Idle"
    return self

end

-- Class methods / functions
function NPC:Speak(dialogueIndex)
    -- code block
    return self.dialogue[dialogueIndex]
end

function NPC:AssignQuest(questIndex)
    --code block
    return self.quests[questIndex]
end

function NPC:TakeDamage(damage)
    self.health -= damage
end

function NPC:Move(targetPosition)
    -- code block
    self.Position = targetPosition
end

function NPC:UpdateState(newState)
    self.state = newState
end


local guardNpc = NPC:new("Guard", 29, 100,
    {x = 0, y = 0},
    {"Hello traveler", "Stay safe"},
    {"Find the sword", "Defeat the goblin"}
)

print(guardNpc:speak(1))
]]