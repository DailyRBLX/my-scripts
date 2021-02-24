local run = game:GetService("RunService")

spawn(function()
    while true do run.Heartbeat:wait()
        settings().Physics.AllowSleep = false
        settings().Physics.ThrottleAdjustTime = math.huge-math.huge
        setsimulationradius(1e9, 1e9)
        run.Stepped:wait()
    end
 end)


 local LocalPlayer = game.Players.LocalPlayer
 local httpService = game:GetService("HttpService")
 return function(jsontable)
     local convertedtbl = httpService:JSONDecode(jsontable)
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
         wait()
         tool.Parent = workspace
         local part = convertedtbl[index]
         local cf = Vector3.new(part.CFrameX,part.CFrameY,part.CFrameZ)
         local rot = Vector3.new(part.RotationX,part.RotationY,part.RotationZ)
 
         local bodypos = Instance.new("BodyPosition")
         bodypos.Position = cf
         wait()
         bodypos.Parent = tool.Handle

         tool.Handle.Rotation = rot


         wait()
     end
 end
