
-- changes color of a part

local part = Instance.new("Part", workspace)

part.Name = "TestPart"
part.Anchored = true
part.Color = Color3.fromRGB(255, 0, 0)
part.Position = Vector3.new(0, 4, 8)

local bridge = workspace.WoodenBridge
bridge.Anchored = true
bridge.CanCollide = false
bridge.Transparency  = 100


local function onTouched(touchedObject)
    print("Something Touched the \"TestPart\"")

    bridge.CanCollide = true
    bridge.Transparency = 0
    
end


part.Touched:Connect(onTouched)