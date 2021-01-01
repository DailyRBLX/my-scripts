local LocalPlayer = game.Players.LocalPlayer
local httpService = game:GetService("HttpService")
return function(jsontable)
    local convertedtbl = httpService:JSONDecode(tostring(jsontable))
    local maxindex = #convertedtbl
    local index = 0
    local ogindex = 0
    for index2, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if index > maxindex then
            return
        end
        index = index + 1
        tool.Parent = LocalPlayer.Character
        tool.Handle.Mesh:Destroy()
        local part = convertedtbl[index]
        local cf = CFrame.new(part.CFrameX,part.CFrameY,part.CFrameZ)
        local rot = Vector3.new(part.RotationX,part.RotationY,part.RotationZ)

        tool.Grip = cf
        tool.Handle.Orientation = rot
        wait()
    end
end
