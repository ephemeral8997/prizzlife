-- Breaking Plus Made by Naiko Exploits --

repeat
    task.wait()
until game:IsLoaded() and task.wait(0.5) and workspace.DistributedGameTime > 5

if game:GetService("CoreGui"):FindFirstChild("Plus") then
    return warn("Script already running")
elseif tostring(game.GameId) == "271119130" then
    Instance.new("BoolValue", game:GetService("CoreGui")).Name = "Plus"
else
    return warn("Incorrect game")
end

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- General variables --

local Version = 4.5
local NeededPlaceId = nil
local RoundMode = nil
local UserType = 0
local LocalPlayer = game.Players.LocalPlayer
local UI = LocalPlayer.PlayerGui.ScreenGui
local CustomButton = UI.buttons.log
local CustomMenu = UI.credits
local ClassicCredits = UI.shop.top.credits
local PlayerList = LocalPlayer.PlayerGui.PlayerList
local SelectedPlayer = nil
local PlayerButtons = PlayerList.Buttons
local PlayersList = PlayerList.PlayerList
local ClonedCredits = ClassicCredits:Clone()
local FirstPurchasable = game.ReplicatedStorage.model.invbut:Clone()
local SecondPurchasable = game.ReplicatedStorage.model.invbut:Clone()
local ThirdPurchasable = game.ReplicatedStorage.model.invbut:Clone()
local FourthPurchasable = game.ReplicatedStorage.model.invbut:Clone()
local TeleportingProc = nil
local SelectedAnimation = 0
local Credits = tonumber(ClassicCredits.Text:sub(-ClassicCredits.Text:len(), -8))
local invbut = game.ReplicatedStorage.model.invbut:Clone()
local invbut2 = game.ReplicatedStorage.model.invbut:Clone()
local ERainSource = game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Assets/ERainSource")
local CandyCrownSource = game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Assets/CandyCrownSource")
local RoyalRedSource = game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Assets/RoyalRedSource")
local NotDisabled = true
local NotDisabled2 = true
local NotDisabled3 = true
local NotDisabled4 = true
local Debugging = nil
local Sent2 = true

-- General functions --

function ColoredPrint(Text: string, color: Color3, Icon: table)
    task.spawn(function()
        local TextFinder = "‎" .. Text .. (string.sub(game:GetService("HttpService"):GenerateGUID(false), 1, 10))
        print(TextFinder)
        game.CoreGui:WaitForChild("DevConsoleMaster", 1000):WaitForChild("DevConsoleWindow", 1000):WaitForChild("DevConsoleUI", 1000):WaitForChild("MainView", 1000)
        local function update(Parent)
            local loadingLabel = nil
            for index, label in pairs(Parent:GetDescendants()) do
                if label:IsA("TextLabel") and string.find(label.Text, TextFinder, 1, true) ~= nil then
                    loadingLabel = label
                    loadingLabel:SetAttribute("hasbefore", true)
                    loadingLabel.RichText = true
                    local originalTime = string.sub(label.text, 1, 11)
                    loadingLabel.Text = string.format("<font color='rgb(%s,%s,%s)' size='15'>%s %s </font>", math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255), originalTime, Text)
                    if Icon == nil then
                    elseif type(Icon[1]) == type(0) then
                        if Icon[2] == false then
                            loadingLabel.Parent.image.Image = "rbxassetid://" .. tostring(Icon[1])
                            loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                        else
                            loadingLabel.Parent.image.Image = "rbxassetid://" .. tostring(Icon[1])
                            loadingLabel.Parent.image.ImageColor3 = color
                        end
                    elseif Icon[1]:lower() == "error" or Icon[1]:lower() == "err" or Icon[1]:lower() == "fail" then
                        if Icon[2] == false then
                            loadingLabel.Parent.image.Image = "rbxasset://textures/DevConsole/Error.png"
                            loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                        else
                            loadingLabel.Parent.image.Image = "rbxassetid://97467062933153"
                            loadingLabel.Parent.image.ImageColor3 = color
                        end
                    elseif Icon[1]:lower() == "information" or Icon[1]:lower() == "info" then
                        if Icon[2] == false then
                            loadingLabel.Parent.image.Image = "rbxasset://textures/DevConsole/Info.png"
                            loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                        else
                            loadingLabel.Parent.image.Image = "rbxassetid://98895588220731"
                            loadingLabel.Parent.image.ImageColor3 = color
                        end
                    elseif Icon[1]:lower() == "warning" or Icon[1]:lower() == "warn" then
                        if Icon[2] == false then
                            loadingLabel.Parent.image.Image = "rbxasset://textures/DevConsole/Warning.png"
                            loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                        else
                            loadingLabel.Parent.image.Image = "rbxassetid://129253285072281"
                            loadingLabel.Parent.image.ImageColor3 = color
                        end
                    elseif Icon[1]:lower() == "plus" or Icon[1]:lower() == "extra" then
                        loadingLabel.Parent.image.Image = "rbxassetid://127360009371476"
                        loadingLabel.Parent.image.ImageColor3 = color
                    elseif Icon[1]:lower() == "success" or Icon[1]:lower() == "check" or Icon[1]:lower() == "tick" then
                        if Icon[2] == false then
                            loadingLabel.Parent.image.Image = "rbxassetid://75097763556603"
                            loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                        else
                            loadingLabel.Parent.image.Image = "rbxassetid://87889653826033"
                            loadingLabel.Parent.image.ImageColor3 = color
                        end
                    end
                    loadingLabel.Parent.image:GetPropertyChangedSignal("Image"):Once(function()
                        loadingLabel.Parent.image.ImageColor3 = Color3.new(255, 255, 255)
                    end)
                    break
                end
            end
        end
        task.wait(0.009)
        update(game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"))
        local Done = 0
        task.spawn(function()
            if game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"):WaitForChild("ClientLog", 5).CanvasSize.Y.Offset >= 8500 then
                game:GetService("LogService").MessageOut:Connect(function(message, messageType)
                    if Done < 22 then
                        task.wait(0.01)
                        Done = Done + 1
                        update(game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"))
                    end
                end)
            end
        end)
        game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"):WaitForChild("ClientLog", 5).ChildAdded:Connect(function(child2)
            update(child2)
        end)
        game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI.ChildAdded:Connect(function(child)
            if child.Name == "MainView" then
                task.wait()
                update(child)
                child:WaitForChild("ClientLog", 5).ChildAdded:Connect(function(child2)
                    update(child2)
                end)
            end
        end)
    end)
end

function UIBlur(Frame)
    pcall(function()
        local Lighting = game:GetService("Lighting")
        local camera = workspace.CurrentCamera

        local BLUR_SIZE = Vector2.new(10, 10)
        local PART_SIZE = 0.01
        local PART_TRANSPARENCY = 1 - 1e-7
        local START_INTENSITY = 0.35
        local Selected = Frame

        Selected:SetAttribute("BlurIntensity", START_INTENSITY)

        local BLUR_OBJ = Instance.new("DepthOfFieldEffect")
        BLUR_OBJ.FarIntensity = 0
        BLUR_OBJ.NearIntensity = Selected:GetAttribute("BlurIntensity")
        BLUR_OBJ.FocusDistance = 0.25
        BLUR_OBJ.InFocusRadius = 0
        BLUR_OBJ.Parent = Lighting

        local PartsList = {}
        local BlursList = {}
        local BlurObjects = {}
        local BlurredGui = {}

        BlurredGui.__index = BlurredGui

        function rayPlaneIntersect(planePos, planeNormal, rayOrigin, rayDirection)
            local n = planeNormal
            local d = rayDirection
            local v = rayOrigin - planePos

            local num = n.x * v.x + n.y * v.y + n.z * v.z
            local den = n.x * d.x + n.y * d.y + n.z * d.z
            local a = -num / den

            return rayOrigin + a * rayDirection, a
        end

        function rebuildPartsList()
            PartsList = {}
            BlursList = {}
            for blurObj, part in pairs(BlurObjects) do
                table.insert(PartsList, part)
                table.insert(BlursList, blurObj)
            end
        end

        function BlurredGui.new(frame, shape)
            local blurPart = Instance.new("Part")
            blurPart.Size = Vector3.new(1, 1, 1) * 0.01
            blurPart.Anchored = true
            blurPart.CanCollide = false
            blurPart.CanTouch = false
            blurPart.Material = Enum.Material.Glass
            blurPart.Transparency = PART_TRANSPARENCY
            blurPart.Parent = workspace.CurrentCamera

            local mesh
            if shape == "Rectangle" then
                mesh = Instance.new("BlockMesh")
                mesh.Parent = blurPart
            elseif shape == "Oval" then
                mesh = Instance.new("SpecialMesh")
                mesh.MeshType = Enum.MeshType.Sphere
                mesh.Parent = blurPart
            end

            local ignoreInset = false
            local currentObj = frame

            while true do
                currentObj = currentObj.Parent

                if currentObj and currentObj:IsA("ScreenGui") then
                    ignoreInset = currentObj.IgnoreGuiInset
                    break
                elseif currentObj == nil then
                    break
                end
            end

            local new = setmetatable({
                Frame = frame,
                Part = blurPart,
                Mesh = mesh,
                IgnoreGuiInset = ignoreInset,
            }, BlurredGui)

            BlurObjects[new] = blurPart
            rebuildPartsList()
            pcall(function()
                game:GetService("RunService"):BindToRenderStep("...", Enum.RenderPriority.Camera.Value + 1, function()
                    pcall(function()
                        blurPart.CFrame = camera.CFrame * CFrame.new(0, 0, 0)
                        BlurredGui.updateAll()
                    end)
                end)
                return new
            end)
        end

        function updateGui(blurObj)
            if not blurObj.Frame.Visible then
                blurObj.Part.Transparency = 1
                return
            end

            local camera = workspace.CurrentCamera
            local frame = blurObj.Frame
            local part = blurObj.Part
            local mesh = blurObj.Mesh

            part.Transparency = PART_TRANSPARENCY

            local corner0 = frame.AbsolutePosition + BLUR_SIZE
            local corner1 = corner0 + frame.AbsoluteSize - BLUR_SIZE * 2
            local ray0, ray1

            if blurObj.IgnoreGuiInset then
                ray0 = camera:ViewportPointToRay(corner0.X, corner0.Y, 1)
                ray1 = camera:ViewportPointToRay(corner1.X, corner1.Y, 1)
            else
                ray0 = camera:ScreenPointToRay(corner0.X, corner0.Y, 1)
                ray1 = camera:ScreenPointToRay(corner1.X, corner1.Y, 1)
            end

            local planeOrigin = camera.CFrame.Position + camera.CFrame.LookVector * (0.05 - camera.NearPlaneZ)
            local planeNormal = camera.CFrame.LookVector
            local pos0 = rayPlaneIntersect(planeOrigin, planeNormal, ray0.Origin, ray0.Direction)
            local pos1 = rayPlaneIntersect(planeOrigin, planeNormal, ray1.Origin, ray1.Direction)

            local pos0 = camera.CFrame:PointToObjectSpace(pos0)
            local pos1 = camera.CFrame:PointToObjectSpace(pos1)

            local size = pos1 - pos0
            local center = (pos0 + pos1) / 2

            mesh.Offset = center
            mesh.Scale = size / PART_SIZE
        end

        function BlurredGui.updateAll()
            BLUR_OBJ.NearIntensity = tonumber(Selected:GetAttribute("BlurIntensity"))

            for i = 1, #BlursList do
                updateGui(BlursList[i])
            end

            local cframes = table.create(#BlursList, workspace.CurrentCamera.CFrame)
            workspace:BulkMoveTo(PartsList, cframes, Enum.BulkMoveMode.FireCFrameChanged)

            BLUR_OBJ.FocusDistance = 0.25 - camera.NearPlaneZ
        end

        function BlurredGui:Destroy()
            self.Part:Destroy()
            BlurObjects[self] = nil
            rebuildPartsList()
        end

        BlurredGui.new(Selected, "Rectangle")

        BlurredGui.updateAll()
        return BlurredGui
    end)
end

function Debug(Message)
    if Debugging == true then
        ColoredPrint("[Debug] " .. Message, Color3.fromRGB(230, 255, 107), { "info", true })
        game.StarterGui:SetCore("SendNotification", {
            Title = "Debug message",
            Text = Message,
        })
    end
end

function StareAt(Player)
    _G.GeneralStare = Player
    local position = Vector3.new(0, 1, 0 --[[Make it negative something to pop ur head out lol]])
    LocalPlayer.Character:SetAttribute("Staring", true)
    repeat
        task.wait(0.025)
        local lookAtCFrame
        if Player.Character ~= nil and LocalPlayer.Character ~= nil and Player.Character:FindFirstChild("Head") and LocalPlayer.Character:FindFirstChild("Head") then
            lookAtCFrame = CFrame.lookAt(Player.Character.Head.Position, LocalPlayer.Character.Head.Position)
        else
            return
        end
        local _, yRotation, _ = lookAtCFrame:ToEulerAnglesYXZ()
        local cframe
        if LocalPlayer.Character.HumanoidRootPart.Rotation.X >= 170 then
            cframe = CFrame.new(position) * CFrame.fromOrientation(math.rad(270), math.rad(math.deg(yRotation) + LocalPlayer.Character.HumanoidRootPart.Rotation.Y), math.rad(180))
        elseif LocalPlayer.Character.HumanoidRootPart.Rotation.X <= 170 then
            cframe = CFrame.new(position) * CFrame.fromOrientation(math.rad(270), (math.rad(math.deg(yRotation) - LocalPlayer.Character.HumanoidRootPart.Rotation.Y + 180)), math.rad(180))
        else
            return
        end
        if LocalPlayer.Character:GetAttribute("Staring") == true then
            LocalPlayer.Character.Torso.Neck.C0 = cframe
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("neck", cframe)
        end
    until Player.Character == nil or not Player.Character:FindFirstChild("Head") or LocalPlayer.Character:GetAttribute("Staring") ~= true or _G.GeneralStare ~= Player
    if LocalPlayer.Character:GetAttribute("Staring") == true and LocalPlayer.Character:FindFirstChild("Head") then
        local cframe = CFrame.new(Vector3.new(0, 1, 0)) * CFrame.fromOrientation(math.rad(270), (math.rad(0)), math.rad(180))
        LocalPlayer.Character.Torso.Neck.C0 = cframe
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("neck", cframe)
    end
end

function fling(subject) -- Credits to Nameless' fling
    pcall(function()
        subject = game.Players:FindFirstChild(subject)

        local old, fpdh = nil, workspace.FallenPartsDestroyHeight
        local player = game.Players.LocalPlayer

        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")

        local root = humanoid and humanoid.RootPart

        local tchar = subject.Character or subject.CharacterAdded:Wait()
        local thumanoid
        local troot
        local thead

        local accessory = nil
        local handle

        if tchar:FindFirstChildOfClass("Humanoid") then
            thumanoid = tchar:FindFirstChildOfClass("Humanoid")
        end

        if thumanoid and thumanoid.RootPart then
            troot = thumanoid.RootPart
        end

        if tchar:FindFirstChild("Head") then
            thead = tchar.Head
        end

        if accessory and accessory:FindFirstChild("Handle") then
            handle = accessory.Handle
        end

        if char and humanoid and root then
            if root.Velocity.Magnitude < 50 then
                old = root.CFrame
            end

            if thumanoid and thumanoid.Sit then
            end

            if thead then
                workspace.CurrentCamera.CameraSubject = thead
            elseif not thead and handle then
                workspace.CurrentCamera.CameraSubject = handle
            elseif thumanoid and troot then
                workspace.CurrentCamera.CameraSubject = thumanoid
            end

            if not tchar:FindFirstChildWhichIsA("BasePart") then
                return
            end

            local fpos = function(basepart, vector, angle)
                root.CFrame = CFrame.new(basepart.Position) * vector * angle
                char:SetPrimaryPartCFrame(CFrame.new(basepart.Position) * vector * angle)
                root.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
            end

            local safebasepart = function(basepart)
                local delay = 2
                local time = tick()
                local angle = 0

                repeat
                    if root and thumanoid then
                        if basepart.Velocity.Magnitude < 50 then
                            angle = angle + 100

                            fpos(basepart, CFrame.new(0, 1.5, 0) + thumanoid.MoveDirection * basepart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, -1.5, 0) + thumanoid.MoveDirection * basepart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(2.25, 1.5, -2.25) + thumanoid.MoveDirection * basepart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(-2.25, -1.5, 2.25) + thumanoid.MoveDirection * basepart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, 1.5, 0) + thumanoid.MoveDirection, CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, -1.5, 0) + thumanoid.MoveDirection, CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()
                        else
                            fpos(basepart, CFrame.new(0, 1.5, thumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, -1.5, -thumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, 1.5, thumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, 1.5, troot.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, -1.5, -troot.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, 1.5, troot.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                            task.wait()

                            fpos(basepart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                        end
                    else
                        break
                    end
                until basepart.Velocity.Magnitude > 500 or basepart.Parent ~= subject.Character or subject.Parent ~= game.Players or (not subject.Character) == tchar or thumanoid.Sit or humanoid.Health <= 0 or tick() > time + delay
            end

            workspace.FallenPartsDestroyHeight = 0 / 0

            local bv = Instance.new("BodyVelocity", root)
            bv.Name = "fling"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)

            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

            if troot and thead then
                if (troot.CFrame.p - thead.CFrame.p).Magnitude > 5 then
                    safebasepart(thead)
                else
                    safebasepart(troot)
                end
            elseif troot and not thead then
                safebasepart(thead)
            elseif not troot and not thead and accessory and handle then
                safebasepart(handle)
            end

            bv:Destroy()

            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            workspace.CurrentCamera.CameraSubject = humanoid

            repeat
                root.CFrame = old * CFrame.new(0, 0.5, 0)
                char:SetPrimaryPartCFrame(old * CFrame.new(0, 0.5, 0))
                humanoid:ChangeState("GettingUp")
                for _, x in ipairs(char:GetChildren()) do
                    if x:IsA("BasePart") then
                        x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                    end
                end
                task.wait()
            until (root.Position - old.p).Magnitude < 25

            workspace.FallenPartsDestroyHeight = fpdh
        end
    end)
end

function Notify(Message, Button)
    pcall(function()
        if Message == nil then
            return
        else
            if Button == nil then
                Button = "Ok"
            end
            local CustomNotify = UI.msgbox:Clone()
            CustomNotify.Parent = UI
            CustomNotify.Name = "CustomMsg"
            CustomNotify.ok.Text = Button
            CustomNotify.Visible = true
            CustomNotify.ImageLabel.TextLabel.Text = Message
            CustomNotify.ok.MouseButton1Click:Connect(function()
                CustomNotify:Destroy()
            end)
        end
    end)
end

function NotifyButtons(Message, Button, Button2, Function1, Function2)
    pcall(function()
        if Message == nil then
            return
        else
            if Button == nil then
                Button = "Ok"
            end
            if Button2 == nil then
                Button2 = "Cancel"
            end
            local CustomNotify = UI.msgbox:Clone()
            local But1 = CustomNotify.ok
            local But2 = CustomNotify.ok:Clone()
            CustomNotify.Parent = UI
            CustomNotify.Name = "ButtonMsg"
            But1.Text = Button
            But1.AnchorPoint = Vector2.new(0.5, 0)
            But1.Position = UDim2.new(0.275, 0, 1, -50)
            But2.Text = Button2
            But2.Parent = CustomNotify
            But2.AnchorPoint = Vector2.new(0.5, 0)
            But2.Position = UDim2.new(0.725, 0, 1, -50)
            CustomNotify.Visible = true
            CustomNotify.ImageLabel.TextLabel.Text = Message
            But1.MouseButton1Click:Once(function()
                local Returned = Function1()
                if Returned[1] == "Load" then
                    local CustomLoad = UI.shop.load:Clone()
                    CustomLoad.Parent = CustomNotify
                    CustomLoad.Visible = true
                    CustomLoad.Position = UDim2.new(0, -3, 0, -22)
                    CustomLoad.BackgroundTransparency = 1
                    CustomLoad.ZIndex = 100
                    CustomLoad.Folder["1"].ZIndex = 100
                    CustomLoad.Folder["2"].ZIndex = 100
                    CustomLoad.Folder["3"].ZIndex = 100
                    CustomLoad.TextLabel.ZIndex = 100
                    CustomLoad.TextLabel.Text = tostring(Returned[2])
                    CustomLoad.TextLabel.Position = UDim2.new(0, 0, 0.21, 0)
                    local ShadowImage = CustomNotify.ImageLabel:Clone()
                    local AntiClick = Instance.new("TextButton", CustomNotify)
                    AntiClick.ZIndex = 2000
                    AntiClick.Active = true
                    AntiClick.BackgroundTransparency = 1
                    AntiClick.Size = UDim2.new(1, 0, 1, 0)
                    AntiClick.Text = ""
                    ShadowImage:ClearAllChildren()
                    ShadowImage.ZIndex = 50
                    ShadowImage.Parent = CustomNotify
                    ShadowImage.Active = true
                    ShadowImage.ImageTransparency = 0.4
                    ShadowImage.ImageColor3 = Color3.fromRGB(150, 150, 150)
                    game:GetService("TweenService"):Create(ShadowImage, TweenInfo.new(0.25), { ImageColor3 = Color3.fromRGB(0, 0, 0) }):Play()
                    task.wait(tonumber(Returned[3]))
                    CustomNotify:Destroy()
                else
                    CustomNotify:Destroy()
                end
            end)
            But2.MouseButton1Click:Once(function()
                local Returned = Function2()
                if Returned[1] == "Load" then
                    local CustomLoad = UI.shop.load:Clone()
                    CustomLoad.Parent = CustomNotify
                    CustomLoad.Visible = true
                    CustomLoad.Position = UDim2.new(0, -3, 0, -22)
                    CustomLoad.BackgroundTransparency = 1
                    CustomLoad.ZIndex = 100
                    CustomLoad.Folder["1"].ZIndex = 100
                    CustomLoad.Folder["2"].ZIndex = 100
                    CustomLoad.Folder["3"].ZIndex = 100
                    CustomLoad.TextLabel.ZIndex = 100
                    CustomLoad.TextLabel.Text = tostring(Returned[2])
                    CustomLoad.TextLabel.Position = UDim2.new(0, 0, 0.21, 0)
                    local ShadowImage = CustomNotify.ImageLabel:Clone()
                    local AntiClick = Instance.new("TextButton", CustomNotify)
                    AntiClick.ZIndex = 2000
                    AntiClick.Active = true
                    AntiClick.BackgroundTransparency = 1
                    AntiClick.Size = UDim2.new(1, 0, 1, 0)
                    AntiClick.Text = ""
                    ShadowImage:ClearAllChildren()
                    ShadowImage.ZIndex = 50
                    ShadowImage.Active = true
                    ShadowImage.Parent = CustomNotify
                    ShadowImage.ImageTransparency = 0.4
                    ShadowImage.ImageColor3 = Color3.fromRGB(150, 150, 150)
                    game:GetService("TweenService"):Create(ShadowImage, TweenInfo.new(0.25), { ImageColor3 = Color3.fromRGB(0, 0, 0) }):Play()
                    task.wait(tonumber(Returned[3]))
                    CustomNotify:Destroy()
                else
                    CustomNotify:Destroy()
                end
            end)
        end
    end)
end

function respawn(disguised) -- better way
    local args = {
        [1] = 42,
        [2] = disguised,
    }
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end

function lag(Requests, Debugger)
    pcall(function()
        if Requests ~= nil and type(Requests) == type(0) then
            if Debugger == true then
                Debug("Requested " .. Requests .. " respawns")
            end

            for i = 1, Requests do
                task.spawn(function()
                    respawn(false) --fireclickdetector(game:GetService("Workspace").disguise.SurfaceGui.ImageLabel.Part.ClickDetector) old way
                end)
            end
        else
            return
        end
    end)
end

function serverhop(Notification)
    if true then
        local lower, upper, Sfind, split, sub, format, len, match, gmatch, gsub, byte
        do
            local string = string
            lower, upper, Sfind, split, sub, format, len, match, gmatch, gsub, byte = string.lower, string.upper, string.find, string.split, string.sub, string.format, string.len, string.match, string.gmatch, string.gsub, string.byte
        end
        local order = "Desc"
        local Servers = {}
        local url = format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=%s&limit=100", game.PlaceId, order)
        local starting = tick()
        repeat
            local good, result = pcall(function()
                return game:HttpGet(url)
            end)
            if not good then
                wait(2)
                continue
            end
            local decoded = game:GetService("HttpService"):JSONDecode(result)
            if #decoded.data ~= 0 then
                Servers = decoded.data
                for i, v in pairs(Servers) do
                    if v.maxPlayers and v.playing and v.maxPlayers - 1 > v.playing and v.id ~= game.JobId then
                        Server = v
                        break
                    end
                end
                if Server then
                    break
                end
            end
            url = format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=%s&limit=100&cursor=%s", game.PlaceId, order, decoded.nextPageCursor)
        until tick() - starting >= 600
        if not Server or #Servers == 0 then
            return
        end

        if Notification == true then
            Notify("Going to server " .. Server.playing .. "/" .. Server.maxPlayers)
        end
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Server.id)
    end
end
-----------------
function rejoin(Notification)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    if Notification == true then
        Notify("Rejoining the server")
    end
end

-- Data --

function DefaultData(Path, Option)
    if isfile("NaikoScript/BreakingPlus/" .. Path) ~= false then
        return ColoredPrint("Option already exists", Color3.fromRGB(252, 210, 150), { "info", true })
    else
        writefile("NaikoScript/BreakingPlus/" .. Path, Option)
        return ColoredPrint("Set default data", Color3.fromRGB(125, 230, 75), { "success", true })
    end
end

function ChangeData(Path, Option, WithFolder)
    if WithFolder == false then
        if isfile(Path) ~= false then
            writefile(Path, Option)
        end
    else
        if isfile("NaikoScript/BreakingPlus/" .. Path) ~= false then
            writefile("NaikoScript/BreakingPlus/" .. Path, Option)
        end
    end
end

function ReturnData(Path, WithFolder)
    if WithFolder == false then
        if isfile(Path) ~= false then
            return readfile(Path)
        end
    else
        if isfile("NaikoScript/BreakingPlus/" .. Path) ~= false then
            return readfile("NaikoScript/BreakingPlus/" .. Path)
        end
        return nil
    end
end

if not isfolder("NaikoScript") and not isfolder("NaikoScript/BreakingPlus") then
    makefolder("NaikoScript")
    makefolder("NaikoScript/BreakingPlus")
    DefaultData("Feature1.txt", "false")
    DefaultData("Feature2.txt", "true")
    DefaultData("Feature3.txt", "false")
    DefaultData("Feature4.txt", "true")
    DefaultData("Feature5.txt", "false")
    DefaultData("Feature6.txt", "false")
    DefaultData("Feature7.txt", "false")
    DefaultData("Feature8.txt", "false")
    DefaultData("TutSettings.txt", "false")
    UserType = 1
elseif isfolder("NaikoScript") and not isfolder("NaikoScript/BreakingPlus") then
    UserType = 2
    DefaultData("Feature1.txt", "false")
    DefaultData("Feature2.txt", "true")
    DefaultData("Feature3.txt", "false")
    DefaultData("Feature4.txt", "true")
    DefaultData("Feature5.txt", "false")
    DefaultData("Feature6.txt", "false")
    DefaultData("Feature7.txt", "false")
    DefaultData("Feature8.txt", "false")
    DefaultData("TutSettings.txt", "false")
    makefolder("NaikoScript/BreakingPlus")
elseif isfolder("NaikoScript") and isfolder("NaikoScript/BreakingPlus") then
    DefaultData("Feature1.txt", "false")
    DefaultData("Feature2.txt", "true")
    DefaultData("Feature3.txt", "false")
    DefaultData("Feature4.txt", "true")
    DefaultData("Feature5.txt", "false")
    DefaultData("Feature6.txt", "false")
    DefaultData("Feature7.txt", "false")
    DefaultData("Feature8.txt", "false")
    DefaultData("TutSettings.txt", "false")
    UserType = 3
end
local ValueUser = Instance.new("NumberValue")
ValueUser.Parent = game:GetService("CoreGui")
ValueUser.Name = "UserType"
ValueUser.Value = UserType

--------------

task.spawn(function()
    LocalPlayer.PlayerGui:FindFirstChild("ScreenGui").ChildAdded:Connect(function(child)
        if child.Name == "messagelabel" and child:IsA("TextLabel") then
            if string.find(child.text, "Selected game mode: ") then
                local Prepare = string.gsub(child.text, "Selected game mode: ", "")
                RoundMode = Prepare
                Debug("Mode is " .. RoundMode)
            end
        end
    end)
end)

local LoadingPurchase = UI.shop.load:Clone()
LoadingPurchase.Visible = false
LoadingPurchase.Parent = CustomMenu

AnimationOnStart = function()
    LoadingPurchase.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    game:GetService("TweenService"):Create(LoadingPurchase, TweenInfo.new(0.25), { BackgroundColor3 = Color3.fromRGB(0, 0, 0) }):Play()
end
local f1 = function()
    if httprequest then
        task.spawn(function()
            httprequest({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    Origin = "https://discord.com",
                },
                Body = game:GetService("HttpService"):JSONEncode({
                    cmd = "INVITE_BROWSER",
                    nonce = game:GetService("HttpService"):GenerateGUID(false),
                    args = { code = "vAWJMYJYcR" },
                }),
            })
        end)
        return { "Load", "Joining server", 3 }
    elseif setclipboard then
        setclipboard("discord.gg/vAWJMYJYcR")
        Notify("Failed to join automaticly. Copied the server invite link instead")
        return {}
    else
        Notify("Failed to automaticly join or copy the server invite link. join by manually typing it discord.gg/vAWJMYJYcR")
        return {}
    end
end
task.spawn(function()
    NotifyButtons("The script has been made by naiko exploits. Join discord server? (Optional)", "Join server", "Cancel", f1, function()
        return {}
    end)
end)
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/r/main/r.lua"))()
end)
task.spawn(function()
    local AnimDelay = 0.8
    local LoadDelay = 1
    local Cost = 3
    FirstPurchasable.Position = UDim2.new(0.05, 0, 0, 5)
    FirstPurchasable.Parent = CustomMenu.sectionframes
    FirstPurchasable.Visible = true
    FirstPurchasable.offsale:Destroy()
    FirstPurchasable.type.Text = tostring(Cost)
    FirstPurchasable.type.TextColor3 = Color3.fromRGB(255, 255, 255)
    FirstPurchasable.type.TextSize = 15
    FirstPurchasable.name.Text = "/e rain"
    FirstPurchasable.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=3405267362"
    FirstPurchasable.MouseButton1Click:Connect(function()
        if NotDisabled2 == true then
            NotDisabled2 = false
            if Credits < Cost then
                NotDisabled2 = true
                Notify("Not enough credits to purchase this.")
            else
                FirstPurchasable.type.Text = "Loading..."
                task.spawn(function()
                    LoadingPurchase.Visible = true
                    AnimationOnStart()
                    task.wait(AnimDelay)
                    LoadingPurchase.Visible = false
                end)
                local args = {
                    [1] = 66,
                    [2] = "Animations",
                    [3] = "Exclusive",
                }

                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
                loadstring(ERainSource)()
                wait(LoadDelay)
                FirstPurchasable.type.Text = tostring(Cost)
                NotDisabled2 = true
            end
        else
        end
    end)
end)
-------------------------------------
task.spawn(function()
    local AnimDelay = 2.5
    local LoadDelay = 2.75
    local Cost = 10000
    SecondPurchasable.Position = UDim2.new(0.36, 0, 0, 5)
    SecondPurchasable.Parent = CustomMenu.sectionframes
    SecondPurchasable.Visible = true
    SecondPurchasable.offsale:Destroy()
    SecondPurchasable.type.Text = tostring(Cost)
    SecondPurchasable.type.TextColor3 = Color3.fromRGB(255, 255, 255)
    SecondPurchasable.type.TextSize = 15
    SecondPurchasable.name.Text = "Antlers case"
    SecondPurchasable.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=2675792665"
    SecondPurchasable.MouseButton1Click:Connect(function()
        if NotDisabled2 == true then
            NotDisabled2 = false
            if Credits < Cost then
                NotDisabled2 = true
                Notify("Not enough credits to purchase this.")
            else
                SecondPurchasable.type.Text = "Loading..."
                task.spawn(function()
                    LoadingPurchase.Visible = true
                    AnimationOnStart()
                    task.wait(AnimDelay)
                    LoadingPurchase.Visible = false
                end)
                local args = {
                    [1] = 66,
                    [2] = "Accessories",
                    [3] = "Knife Antlers",
                }

                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
                wait(LoadDelay)
                SecondPurchasable.type.Text = tostring(Cost)
                NotDisabled2 = true
            end
        else
        end
    end)
end)
------------------
task.spawn(function()
    local AnimDelay = 2.5
    local LoadDelay = 2.75
    local Cost = 10000
    ThirdPurchasable.Position = UDim2.new(0.67, 0, 0, 5)
    ThirdPurchasable.Parent = CustomMenu.sectionframes
    ThirdPurchasable.Visible = true
    ThirdPurchasable.offsale:Destroy()
    ThirdPurchasable.type.Text = tostring(Cost)
    ThirdPurchasable.type.TextColor3 = Color3.fromRGB(255, 255, 255)
    ThirdPurchasable.type.TextSize = 15
    ThirdPurchasable.name.Text = "Candy Crown"
    ThirdPurchasable.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=4544072210"
    ThirdPurchasable.MouseButton1Click:Connect(function()
        if NotDisabled2 == true then
            NotDisabled2 = false
            if Credits < Cost then
                NotDisabled2 = true
                Notify("Not enough credits to purchase this.")
            else
                ThirdPurchasable.type.Text = "Loading..."
                task.spawn(function()
                    LoadingPurchase.Visible = true
                    AnimationOnStart()
                    task.wait(AnimDelay)
                    LoadingPurchase.Visible = false
                end)
                local args = {
                    [1] = 66,
                    [2] = "Knife Skins",
                    [3] = "Winter Gift",
                }

                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
                loadstring(CandyCrownSource)()
                wait(LoadDelay)
                ThirdPurchasable.type.Text = tostring(Cost)
                NotDisabled2 = true
            end
        else
        end
    end)
end)
------------------
task.spawn(function()
    local AnimDelay = 2.5
    local LoadDelay = 2.75
    local Cost = 10000
    FourthPurchasable.Position = UDim2.new(0.05, 0, 0, 115)
    FourthPurchasable.Parent = CustomMenu.sectionframes
    FourthPurchasable.Visible = true
    FourthPurchasable.offsale:Destroy()
    FourthPurchasable.type.Text = tostring(Cost)
    FourthPurchasable.type.TextColor3 = Color3.fromRGB(255, 255, 255)
    FourthPurchasable.type.TextSize = 15
    FourthPurchasable.name.Text = "Royal Red"
    FourthPurchasable.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=2676022029"
    FourthPurchasable.MouseButton1Click:Connect(function()
        if NotDisabled2 == true then
            NotDisabled2 = false
            if Credits < Cost then
                NotDisabled2 = true
                Notify("Not enough credits to purchase this.")
            else
                FourthPurchasable.type.Text = "Loading..."
                task.spawn(function()
                    LoadingPurchase.Visible = true
                    AnimationOnStart()
                    task.wait(AnimDelay)
                    LoadingPurchase.Visible = false
                end)
                local args = {
                    [1] = 66,
                    [2] = "Chair Skins",
                    [3] = "Winter",
                }

                game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
                loadstring(RoyalRedSource)()
                wait(LoadDelay)
                FourthPurchasable.type.Text = tostring(Cost)
                NotDisabled2 = true
            end
        else
        end
    end)
end)
----------
for i, v in pairs(CustomMenu.sectionframes:GetChildren()) do
    if v ~= FirstPurchasable and v ~= SecondPurchasable and v ~= ThirdPurchasable and v ~= FourthPurchasable then
        v:Destroy()
    end
end
Die = nil
SpamSound = nil
HiddenNames = false
HideBlood = false

task.spawn(function()
    while task.wait(0.1) do
        if HiddenNames == true then
            for i, Player in pairs(game.Players:GetPlayers()) do
                if Player.Character ~= nil and Player.Character:FindFirstChildOfClass("Humanoid") then
                    local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
                    if Humanoid.DisplayDistanceType == Enum.HumanoidDisplayDistanceType.None and not Humanoid:GetAttribute("hidename2") == true then
                        Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
                        Humanoid.NameDisplayDistance = 100
                        Humanoid:SetAttribute("hidename", true)
                    elseif Humanoid.Sit == true then
                        Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
                        Humanoid.NameDisplayDistance = 100
                        Humanoid:SetAttribute("hidename2", true)
                    end
                end
            end
        elseif HiddenNames == false then
            for i, Player in pairs(game.Players:GetPlayers()) do
                if Player.Character ~= nil and Player.Character:FindFirstChildOfClass("Humanoid") then
                    local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
                    if Humanoid:GetAttribute("hidename") == true then
                        Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                    elseif Humanoid:GetAttribute("hidename2") == true and LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
                        Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if HideBlood == true then
            game:GetService("CoreGui"):WaitForChild("TopBarApp", 15):FindFirstChild("FullScreenFrame").Visible = false
        elseif HideBlood == false then
            game:GetService("CoreGui"):WaitForChild("TopBarApp", 15):FindFirstChild("FullScreenFrame").Visible = true
        end
    end
end)

task.spawn(function()
    local Path = game:GetService("ReplicatedStorage").model.Sound
    repeat
        if SpamSound == true then
            Path.Playing = true
            Path.TimePosition = math.random(10, 75) / 100
        end
        wait(0.5)
    until nil
end)

task.spawn(function()
    task.spawn(function()
        repeat
            task.wait()
        until game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil
        task.wait()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Died:Wait()
        if Die == true then
            Die = false
            lag(2, true)
            task.wait(0.01)
            Die = true
        end
    end)
    game.Players.LocalPlayer.CharacterAppearanceLoaded:Connect(function(char)
        task.spawn(function()
            repeat
                task.wait()
            until char:FindFirstChildOfClass("Humanoid") ~= nil
            char:FindFirstChildOfClass("Humanoid").Died:Wait()
            if Die == true then
                Die = false
                lag(2, true)
                task.wait(0.01)
                Die = true
            end
        end)
    end)
end)
local function SettingsToggleButton(Frame, DoFunction, UndoFunction)
    local Button = Frame.Autosave.ImageButton
    local AnimationHappening = false -- testing
    Button.MouseButton1Click:Connect(function()
        task.spawn(function()
            task.spawn(function()
                if Button.fill.Visible == true then
                    Button.fill.Visible = false
                else
                    Button.fill.Visible = true
                end
            end)
            AnimationHappening = true
            game:GetService("TweenService"):Create(Button.glow, TweenInfo.new(0.175), { ImageTransparency = 0 }):Play()
            task.wait(0.175)
            game:GetService("TweenService"):Create(Button.glow, TweenInfo.new(0.175), { ImageTransparency = 1 }):Play()
            task.wait(0.185)
            AnimationHappening = false
        end)
        if Button.fill.Visible == false then
            UndoFunction()
        else
            DoFunction()
        end
    end)

    Button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(Button.glow, TweenInfo.new(0.2), { ImageTransparency = 0.7 }):Play()
    end)
    Button.MouseLeave:Connect(function()
        if AnimationHappening == false then
            game:GetService("TweenService"):Create(Button.glow, TweenInfo.new(0.2), { ImageTransparency = 1 }):Play()
        end
    end)
end
--
local SettingScroll = UI.setting.ScrollingFrame
local Settings = SettingScroll:FindFirstChild("performance"):Clone()
local General = SettingScroll:FindFirstChild("general")
repeat
    task.wait()
until Settings:FindFirstChild("sframe") ~= nil
local Feature = Settings:FindFirstChild("sframe")
local Feature2 = Feature:Clone()
local Feature3 = Feature:Clone()
local Feature4 = Feature:Clone()
local Feature5 = Feature:Clone()
local Feature6 = Feature:Clone()
local Feature7 = Feature:Clone()
local Feature8 = Feature:Clone()
local Display2 = Feature:Clone()
--[[
  CheckFile("BreakingPlus/Feature1.txt","false")
  CheckFile("BreakingPlus/Feature2.txt","false")
  CheckFile("BreakingPlus/Feature3.txt","false")
CheckFile("BreakingPlus/Feature4.txt","false")
CheckFile("BreakingPlus/Feature5.txt","false")
CheckFile("BreakingPlus/Feature6.txt","false")
]]
Feature.TextLabel.Text = "Hide Blood"
Feature2.TextLabel.Text = "Improve UI"
Feature3.TextLabel.Text = "FullBright"
Feature4.TextLabel.Text = "Auto ServerHop"
Feature5.TextLabel.Text = "Play Loud Noise"
Feature6.TextLabel.Text = "Debug Messages"
Feature7.TextLabel.Text = "Legacy Autofarm"
Feature8.TextLabel.Text = "Show Hidden Names"
Display2.TextLabel.Text = "Display Knife 2"
Feature5.Parent = Settings
Feature6.Parent = Settings
Feature4.Parent = Settings
Feature3.Parent = Settings
Feature2.Parent = Settings
Feature7.Parent = Settings
Feature8.Parent = Settings
Display2.Parent = General
Feature2.Position = UDim2.new(0, 0, 0, 55)
Feature3.Position = UDim2.new(0, 0, 0, 85)
Feature4.Position = UDim2.new(0, 0, 0, 115)
Feature5.Position = UDim2.new(0, 0, 0, 145)
Feature6.Position = UDim2.new(0, 0, 0, 175)
Feature7.Position = UDim2.new(0, 0, 0, 205)
Feature8.Position = UDim2.new(0, 0, 0, 235)
Display2.Position = UDim2.new(0, 0, 0, 145)
Settings.Parent = SettingScroll
Settings.Name = "breakingplus"
local UIGradient = Instance.new("UIGradient")
UIGradient.Parent = Settings:FindFirstChild("TextLabel")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 174)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 160, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 160, 255)),
})
Settings:FindFirstChild("TextLabel").Text = "Breaking +"
Settings.Position = UDim2.new(0, 0, 0, 600)

local UIBluring = false
local Animations = false
local DoingAnimation = false
local Legacy = true
local AutoServerHop = true
local SavedPosition = Vector2.new(0, 0)
local SavedPosition2 = Vector2.new(0, 0)
local DisplayKnifeOrigin = nil
local BindEvent = Instance.new("BindableEvent")

for i, v in pairs(General:GetChildren()) do
    if v.TextLabel.Text == "Display Knife" then
        DisplayKnifeOrigin = v
    end
end

for i, v in pairs(General:GetChildren()) do
    if v.Position.Y.Offset > 145 or v.Position.Y.Offset == 145 and v ~= Display2 then
        v.Position = v.Position + UDim2.new(0, 0, 0, 30)
    end
end
for i, v in pairs(SettingScroll:GetChildren()) do
    if v ~= General then
        v.Position = v.Position + UDim2.new(0, 0, 0, 30)
    end
end
local server = UI:FindFirstChild("server1")
local Scale = Instance.new("UIScale")
Scale.Parent = server
local Tween = game:GetService("TweenService"):Create(server, TweenInfo.new(0.4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), { Size = UDim2.new(0, 250, 0, 300) })
local Tween2 = game:GetService("TweenService"):Create(server, TweenInfo.new(0.2, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), { Size = UDim2.new(0, 250, 0, 0) })
local Tween3 = game:GetService("TweenService"):Create(Scale, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), { Scale = 0 })
game:GetService("Workspace").disguise.SurfaceGui.noother.Part.ClickDetector.MouseClick:Connect(function()
    CustomMenu.Visible = false
    for i, v in pairs(UI:GetChildren()) do
        task.spawn(function()
            if v.Name == "setting" or v.Name == "trade" or v.Name == "shop" or v.Name == "inv" or v.Name == "tradelog" then
                v.Visible = false
            end
        end)
    end
    if Animations == true then
        server.Size = UDim2.new(0, 250, 0, 0)
        Scale.Scale = 1
        Tween3:Cancel()
        Tween2:Cancel()
        Tween:Play()
        server.ScrollingFrame.CanvasPosition = SavedPosition2
    end
end)

local Clone3 = server.TextButton:Clone()
server.TextButton:Destroy()
Clone3.Parent = server
Clone3.MouseButton1Click:Connect(function()
    if Animations == true then
        SavedPosition2 = server.ScrollingFrame.CanvasPosition
        server.Size = UDim2.new(0, 250, 0, 300)
        Scale.Scale = 1
        Tween:Cancel()
        Tween2:Play()
        Tween3:Play()
        task.wait(0.2)
        server.Visible = false
    else
        server.Visible = false
    end
end)

local setting = UI.setting
local Scale = Instance.new("UIScale")
Scale.Parent = setting
local Tween = game:GetService("TweenService"):Create(setting, TweenInfo.new(0.4, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), { Size = UDim2.new(0, 250, 0, 240) })
local Tween2 = game:GetService("TweenService"):Create(setting, TweenInfo.new(0.2, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), { Size = UDim2.new(0, 250, 0, 0) })
local Tween3 = game:GetService("TweenService"):Create(Scale, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), { Scale = 0 })
DoingAnimation = false
local Clone = UI.buttons.setting:Clone()
UI.buttons.setting:Destroy()
Clone.Parent = UI.buttons

Clone.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Clone, TweenInfo.new(0.25), { ImageTransparency = 0 }):Play()
    game:GetService("TweenService"):Create(Clone.TextLabel, TweenInfo.new(0.25), { TextTransparency = 0 }):Play()
end)
Clone.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Clone, TweenInfo.new(0.25), { ImageTransparency = 0.5 }):Play()
    game:GetService("TweenService"):Create(Clone.TextLabel, TweenInfo.new(0.25), { TextTransparency = 0.5 }):Play()
end)

Clone.MouseButton1Click:Connect(function()
    for i, v in pairs(UI:GetChildren()) do
        if v.Name == "Breaking+" or v.Name == "trade" or v.Name == "shop" or v.Name == "inv" or v.Name == "tradelog" or v.Name == "server1" then
            v.Visible = false
        end
    end
    if Animations == true then
        if DoingAnimation == true then
            return
        end
        local normal = not setting.Visible
        setting.Visible = not setting.Visible
        if normal == true then
            DoingAnimation = true
            setting.Size = UDim2.new(0, 250, 0, 0)
            Scale.Scale = 1
            Tween3:Cancel()
            Tween2:Cancel()
            --local Tween4 = game:GetService("TweenService"):Create(setting.ScrollingFrame,TweenInfo.new(0.6,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{CanvasPosition = SavedPosition})
            Tween:Play()
            setting.ScrollingFrame.CanvasPosition = SavedPosition
            --Tween4:Play()
            task.wait(0.4)
            DoingAnimation = false
        elseif normal == false then
            SavedPosition = setting.ScrollingFrame.CanvasPosition
            DoingAnimation = true
            setting.Visible = true
            setting.Size = UDim2.new(0, 250, 0, 240)
            Scale.Scale = 1
            Tween:Cancel()
            Tween2:Play()
            Tween3:Play()
            task.wait(0.2)
            DoingAnimation = false
            setting.Visible = false
        end
    else
        setting.Visible = not setting.Visible
    end
end)
local Clone2 = setting.TextButton:Clone()
setting.TextButton:Destroy()
Clone2.Parent = setting
Clone2.MouseButton1Click:Connect(function()
    if Animations == true then
        DoingAnimation = true
        SavedPosition = setting.ScrollingFrame.CanvasPosition
        setting.Size = UDim2.new(0, 250, 0, 240)
        Scale.Scale = 1
        Tween:Cancel()
        Tween2:Play()
        Tween3:Play()
        task.wait(0.2)
        DoingAnimation = false
        setting.Visible = false
    else
        setting.Visible = false
    end
end)

for _, Selection in pairs(setting:GetChildren()) do
    if Selection:IsA("GuiBase2d") then
        local Parent = Selection:FindFirstAncestorWhichIsA("GuiBase")
        if Parent ~= nil then
            Selection.Size = UDim2.new(Selection.Size.X.Offset / Parent.AbsoluteSize.X + Selection.Size.X.Scale, 0, Selection.Size.Y.Offset / Parent.AbsoluteSize.Y + Selection.Size.Y.Scale, 0)
            Selection.Position = UDim2.new(Selection.Position.X.Offset / Parent.AbsoluteSize.X + Selection.Position.X.Scale, 0, Selection.Position.Y.Offset / Parent.AbsoluteSize.Y + Selection.Position.Y.Scale, 0)
        end
    end
end

for _, Selection in pairs(server:GetChildren()) do
    if Selection:IsA("GuiBase2d") then
        local Parent = Selection:FindFirstAncestorWhichIsA("GuiBase")
        if Parent ~= nil then
            Selection.Size = UDim2.new(Selection.Size.X.Offset / Parent.AbsoluteSize.X + Selection.Size.X.Scale, 0, Selection.Size.Y.Offset / Parent.AbsoluteSize.Y + Selection.Size.Y.Scale, 0)
            Selection.Position = UDim2.new(Selection.Position.X.Offset / Parent.AbsoluteSize.X + Selection.Position.X.Scale, 0, Selection.Position.Y.Offset / Parent.AbsoluteSize.Y + Selection.Position.Y.Scale, 0)
        end
    end
end

for i, v in pairs(UI.buttons:GetChildren()) do
    if v ~= CustomButton then
        v.MouseButton1Click:Connect(function()
            CustomMenu.Visible = false
        end)
    end
end

task.spawn(function()
    if ReturnData("TutSettings.txt") == "false" then
        UI.setting.Visible = false
        local Tween = game:GetService("TweenService"):Create(Clone, TweenInfo.new(0.75, Enum.EasingStyle.Linear), { ImageColor3 = Color3.fromRGB(100, 15, 15) })
        local Tween2 = game:GetService("TweenService"):Create(Clone, TweenInfo.new(0.75, Enum.EasingStyle.Linear), { ImageColor3 = Color3.fromRGB(255, 255, 255) })
        Tween:Play()
        local Connection
        local OpenedSettings = false
        local Connection2
        Connection2 = Tween2.Completed:Connect(function()
            if OpenedSettings == false then
                Tween:Play()
            else
                Connection2:Disconnect()
            end
        end)
        Connection = Tween.Completed:Connect(function()
            if OpenedSettings == false then
                Tween2:Play()
            else
                Connection2:Disconnect()
            end
        end)
        Clone.MouseButton1Click:Once(function()
            OpenedSettings = true
            ChangeData("TutSettings.txt", "true")
            Tween:Pause()
            Tween2:Play()
            UI.setting.ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
            UI.setting.ScrollingFrame.ScrollingEnabled = false
            task.wait(0.25)
            game:GetService("TweenService"):Create(UI.setting.ScrollingFrame, TweenInfo.new(4, Enum.EasingStyle.Sine), { CanvasPosition = Vector2.new(0, 692) }):Play()
            task.wait(4)
            UI.setting.ScrollingFrame.ScrollingEnabled = true
        end)
    end
end)

UI.loading:GetPropertyChangedSignal("Text"):Connect(function()
    if UI.loading.Text == "" then
        UI.loading.Text = "discord.gg/vAWJMYJYcR"
    end
end)

local function CreateBlurHitbox(Origin, Position, Size, Radius, Anchor)
    local UICorner = Instance.new("UICorner")
    local Frame = Instance.new("Frame")
    Frame.AnchorPoint = Anchor
    Frame.Position = Position
    Frame.Size = Size
    Frame.Visible = Origin.Visible
    Frame.Name = "UIBlurFrame"
    Frame.BackgroundTransparency = 1
    Frame.Parent = Origin
    UICorner.Parent = Frame
    UICorner.CornerRadius = Radius
    UIBlur(Frame)
    BindEvent.Event:Connect(function()
        if UIBluring == true then
            Frame.Visible = Origin.Visible
        else
            Frame.Visible = false
        end
    end)
    Origin.Changed:Connect(function()
        if UIBluring == true then
            Frame.Visible = Origin.Visible
        else
            Frame.Visible = false
        end
    end)
end

for i, v in pairs(UI:GetChildren()) do
    if v.Name == "rank" then
        CreateBlurHitbox(v, UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0.94, 0, 0.9, 0), UDim.new(0, 12), Vector2.new(0.5, 0.5))
    elseif v.Name == "setting" then
        CreateBlurHitbox(v, UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0.94, 0, 0.95, 0), UDim.new(0, 12), Vector2.new(0.5, 0.5))
    elseif v.Name == "profile" then
        CreateBlurHitbox(v, UDim2.new(0.5, 0, 0.5, 0), UDim2.new(0.95, 0, 0.91, 0), UDim.new(0, 12), Vector2.new(0.5, 0.5))
    elseif v.Name == "server1" then
        CreateBlurHitbox(v, UDim2.new(0.5, 0, 0.025, 0), UDim2.new(0.94, 0, 0.86, 0), UDim.new(0, 12), Vector2.new(0.5, 0))
    elseif v.Name == "decision" then
        CreateBlurHitbox(v, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), UDim.new(0, 10), Vector2.new(0, 0))
    end
end

Display2Function = function()
    DisplayKnifeOrigin.Autosave.ImageButton.fill.ImageTransparency = 1
    DisplayKnifeOrigin.Autosave.ImageButton.ImageTransparency = 0
    game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(53, "Display Knife", false)
    game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(53, "Display Knife 2", true)
end
Display2UnFunction = function()
    game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(53, "Display Knife 2", false)
end
SettingsToggleButton(Display2, Display2Function, Display2UnFunction)
if LocalPlayer.settings:FindFirstChild("Display Knife 2").Value == false then
    Display2.Autosave.ImageButton.fill.Visible = false
    Display2.Autosave.ImageButton.fill.ImageTransparency = 0
    Display2UnFunction()
elseif LocalPlayer.settings:FindFirstChild("Display Knife 2").Value == true then
    Display2.Autosave.ImageButton.fill.Visible = true
    Display2.Autosave.ImageButton.fill.ImageTransparency = 0
    Display2Function()
else
    Display2.Autosave.ImageButton.fill.Visible = false
    Display2.Autosave.ImageButton.fill.ImageTransparency = 0
    Display2UnFunction()
end
LocalPlayer.settings["Display Knife"]:GetPropertyChangedSignal("Value"):Connect(function()
    if LocalPlayer.settings["Display Knife"].Value == true then
        Display2.Autosave.ImageButton.fill.Visible = false
        Display2.Autosave.ImageButton.fill.ImageTransparency = 0
    end
end)

Feature8Function = function()
    HiddenNames = true
    ChangeData("Feature8.txt", "true")
end
Feature8UnFunction = function()
    HiddenNames = false
    ChangeData("Feature8.txt", "false")
end
SettingsToggleButton(Feature8, Feature8Function, Feature8UnFunction)
pcall(function()
    if ReturnData("Feature8.txt") == "false" then
        Feature8.Autosave.ImageButton.fill.Visible = false
        Feature8.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature8UnFunction()
    elseif ReturnData("Feature8.txt") == "true" then
        Feature8.Autosave.ImageButton.fill.Visible = true
        Feature8.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature8Function()
    else
        Feature8.Autosave.ImageButton.fill.Visible = false
        Feature8.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature8Function()
        DefaultData("Feature8.txt", "false")
    end
end)

Feature7Function = function()
    Legacy = true
    ChangeData("Feature7.txt", "true")
end
Feature7UnFunction = function()
    Legacy = false
    ChangeData("Feature7.txt", "false")
end
SettingsToggleButton(Feature7, Feature7Function, Feature7UnFunction)
pcall(function()
    if ReturnData("Feature7.txt") == "false" then
        Feature7.Autosave.ImageButton.fill.Visible = false
        Feature7.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature7UnFunction()
    elseif ReturnData("Feature7.txt") == "true" then
        Feature7.Autosave.ImageButton.fill.Visible = true
        Feature7.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature7Function()
    else
        Feature7.Autosave.ImageButton.fill.Visible = false
        Feature7.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature7UnFunction()
        DefaultData("Feature7.txt", "false")
    end
end)

Feature6Function = function()
    ChangeData("Feature6.txt", "true")
    Debugging = true
    Debug("Started debugging")
end
Feature6UnFunction = function()
    ChangeData("Feature6.txt", "false")
    Debugging = false
    Debug("Stopped debugging")
end
SettingsToggleButton(Feature6, Feature6Function, Feature6UnFunction)
pcall(function()
    if ReturnData("Feature6.txt") == "false" then
        Feature6.Autosave.ImageButton.fill.Visible = false
        Feature6.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature6UnFunction()
    elseif ReturnData("Feature6.txt") == "true" then
        Feature6.Autosave.ImageButton.fill.Visible = true
        Feature6.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature6Function()
    else
        Feature6.Autosave.ImageButton.fill.Visible = false
        Feature6.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature6UnFunction()
        DefaultData("Feature6.txt", "false")
    end
end)

Feature5Function = function()
    ChangeData("Feature5.txt", "true")
    SpamSound = true
    Debug("Started spamming loud sounds")
end
Feature5UnFunction = function()
    ChangeData("Feature5.txt", "false")
    SpamSound = false
    Debug("Stopped spamming loud sounds")
end
SettingsToggleButton(Feature5, Feature5Function, Feature5UnFunction)
pcall(function()
    if ReturnData("Feature5.txt") == "false" then
        Feature5.Autosave.ImageButton.fill.Visible = false
        Feature5.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature5UnFunction()
    elseif ReturnData("Feature5.txt") == "true" then
        Feature5.Autosave.ImageButton.fill.Visible = true
        Feature5.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature5Function()
    else
        Feature5.Autosave.ImageButton.fill.Visible = true
        Feature5.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature5UnFunction()
        DefaultData("Feature5.txt", "false")
    end
end)

Feature4Function = function()
    ChangeData("Feature4.txt", "true")
    AutoServerHop = true
    Debug("Started automatily server hopping")
end
Feature4UnFunction = function()
    ChangeData("Feature4.txt", "false")
    AutoServerHop = false
    Debug("Stopped automatily server hopping")
end
SettingsToggleButton(Feature4, Feature4Function, Feature4UnFunction)
pcall(function()
    if ReturnData("Feature4.txt") == "false" then
        Feature4.Autosave.ImageButton.fill.Visible = false
        Feature4.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature4UnFunction()
    elseif ReturnData("Feature4.txt") == "true" then
        Feature4.Autosave.ImageButton.fill.Visible = true
        Feature4.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature4Function()
    else
        Feature4.Autosave.ImageButton.fill.Visible = false
        Feature4.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature4Function()
        DefaultData("Feature4.txt", "true")
    end
end)

Feature3Function = function()
    ChangeData("Feature3.txt", "true")
    game.Lighting.Ambient = Color3.fromRGB(100, 100, 100)
    game.Lighting.Brightness = 5
    Debug("Enabled fullbright")
end
Feature3UnFunction = function()
    ChangeData("Feature3.txt", "false")
    game.Lighting.Ambient = Color3.fromRGB(0, 0, 0)
    game.Lighting.Brightness = 0
    Debug("Disabled fullbright")
end
SettingsToggleButton(Feature3, Feature3Function, Feature3UnFunction)
pcall(function()
    if ReturnData("Feature3.txt") == "false" then
        Feature3.Autosave.ImageButton.fill.Visible = false
        Feature3.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature3UnFunction()
    elseif ReturnData("Feature3.txt") == "true" then
        Feature3.Autosave.ImageButton.fill.Visible = true
        Feature3.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature3Function()
    else
        Feature3.Autosave.ImageButton.fill.Visible = false
        Feature3.Autosave.ImageButton.fill.ImageTransparency = 0
        Feature3UnFunction()
        DefaultData("Feature3.txt", "false")
    end
end)
FeatureFunction = function()
    ChangeData("Feature1.txt", "true")
    HideBlood = true
    game:GetService("CoreGui"):WaitForChild("TopBarApp", 15):FindFirstChild("FullScreenFrame").Visible = false
    Debug("Started hiding blood")
end
FeatureUnFunction = function()
    ChangeData("Feature1.txt", "false")
    HideBlood = false
    game:GetService("CoreGui"):WaitForChild("TopBarApp", 15):FindFirstChild("FullScreenFrame").Visible = true
    Debug("Stopped hiding blood")
end
SettingsToggleButton(Feature, FeatureFunction, FeatureUnFunction)
pcall(function()
    if ReturnData("Feature1.txt") == "false" then
        Feature.Autosave.ImageButton.fill.Visible = false
        Feature.Autosave.ImageButton.fill.ImageTransparency = 0
        FeatureUnFunction()
    elseif ReturnData("Feature1.txt") == "true" then
        Feature.Autosave.ImageButton.fill.Visible = true
        Feature.Autosave.ImageButton.fill.ImageTransparency = 0
        FeatureFunction()
    else
        Feature.Autosave.ImageButton.fill.Visible = false
        Feature.Autosave.ImageButton.fill.ImageTransparency = 0
        FeatureUnFunction()
        DefaultData("Feature1.txt", "false")
    end
end)
Feature2Function = function()
    ChangeData("Feature2.txt", "true")
    UIBluring = true
    Animations = true
    BindEvent:Fire()
    local Value = Instance.new("Model", game.CoreGui)
    Value.Name = "ImproveUI"
    UI.setting.ImageLabel.ImageColor3 = Color3.fromRGB(15, 15, 15)
    UI.server1.ImageLabel.ImageColor3 = Color3.fromRGB(15, 15, 15)
    UI.profile.ImageLabel.ImageColor3 = Color3.fromRGB(20, 20, 20)
    UI.rank.ImageLabel.ImageColor3 = Color3.fromRGB(20, 20, 20)
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(0, 5)
    UICorner:Clone().Parent = UI.decision
    UICorner2:Clone().Parent = UI.decision.public
    UICorner2:Clone().Parent = UI.decision.secret
    UI.decision.secret.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    task.spawn(function()
        UI.shop.sectionframes.ChildAdded:Wait()
        if ReturnData("Feature2.txt") == "true" then
            local found = false
            local thefound = nil
            for i, v in pairs(UI.shop.sectionbuttons:GetChildren()) do
                if v:FindFirstChild("TextLabel") and v:FindFirstChild("TextLabel").Text == "Other" then
                    thefound = v:FindFirstChild("ImageButton")
                    found = true
                end
            end
            if found == true then
                thefound.Image = "rbxassetid://17375911551"
            end
        end
    end)
    local found = false
    local thefound = nil
    for i, v in pairs(UI.shop.sectionbuttons:GetChildren()) do
        if v:FindFirstChild("TextLabel") and v:FindFirstChild("TextLabel").Text == "Other" then
            thefound = v:FindFirstChild("ImageButton")
            found = true
        end
    end
    if found == true then
        thefound.Image = "rbxassetid://17375911551"
    end
    Debug("Added improvements to the UI")
end
Feature2UnFunction = function()
    ChangeData("Feature2.txt", "false")
    UIBluring = false
    Animations = false
    BindEvent:Fire()
    if game.CoreGui:FindFirstChild("ImproveUI") then
        UI.decision.secret.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
        UI.server1.ImageLabel.ImageColor3 = Color3.fromRGB(30, 30, 30)
        UI.setting.ImageLabel.ImageColor3 = Color3.fromRGB(30, 30, 30)
        UI.profile.ImageLabel.ImageColor3 = Color3.fromRGB(30, 30, 30)
        UI.rank.ImageLabel.ImageColor3 = Color3.fromRGB(30, 30, 30)
        UI.decision.secret:FindFirstChild("UICorner"):Destroy()
        UI.decision.public:FindFirstChild("UICorner"):Destroy()
        UI.decision:FindFirstChild("UICorner"):Destroy()
        game.CoreGui:FindFirstChild("ImproveUI"):Destroy()
        if UI.setting:FindFirstChild("BlurFrame") then
            UI.setting:FindFirstChild("BlurFrame").Visible = false
            task.wait()
            UI.setting:FindFirstChild("BlurFrame"):Destroy()
            workspace.CurrentCamera:ClearAllChildren()
            for i, v in game.Lighting:GetChildren() do
                if v.Name == "DepthOfField" then
                    v:Destroy()
                end
            end
        end
        local found = false
        local thefound = nil
        for i, v in pairs(UI.shop.sectionbuttons:GetChildren()) do
            if v:FindFirstChild("TextLabel") and v:FindFirstChild("TextLabel").Text == "Other" then
                thefound = v:FindFirstChild("ImageButton")
                found = true
            end
        end
        if found == true then
            thefound.Image = "rbxassetid://0"
        end
    else
    end
    Debug("Removed the improvements to the UI")
end
if ReturnData("Feature2.txt") == "false" then
    Feature2.Autosave.ImageButton.fill.Visible = false
    Feature2.Autosave.ImageButton.fill.ImageTransparency = 0
    Feature2UnFunction()
elseif ReturnData("Feature2.txt") == "true" then
    Feature2.Autosave.ImageButton.fill.Visible = true
    Feature2.Autosave.ImageButton.fill.ImageTransparency = 0
    Feature2Function()
else
    Feature2.Autosave.ImageButton.fill.Visible = true
    Feature2.Autosave.ImageButton.fill.ImageTransparency = 0
    Feature2Function()
    DefaultData("Feature2.txt", "true")
end
SettingsToggleButton(Feature2, Feature2Function, Feature2UnFunction)
SettingScroll.CanvasSize = UDim2.new(0, 0, 0, 890)
UI.buttons.shop.ImageButton.Position = UDim2.new(1.025, 0, 0, 35)
UI.buttons.shop.ImageButton.Visible = true
UI.version.Text = UI.version.Text .. " | V" .. tostring(Version)
UI.version.Size = UDim2.new(0, 110, 0, 25)
local BackgroundUI = UI.mockinv.top.everydivine:Clone()
BackgroundUI.Parent = CustomMenu.top
BackgroundUI.Visible = true
BackgroundUI.ImageColor3 = Color3.fromRGB(0, 255, 196)
BackgroundUI.ImageTransparency = 0.45
CustomMenu.top.TextButton.ZIndex = 2
ClonedCredits.Parent = CustomMenu.top
ClonedCredits.ZIndex = 2
local Rejoin = UI.buttons.inv:Clone()
Rejoin.Parent = CustomMenu
Rejoin.Name = "rejoin"
Rejoin.Position = UDim2.new(0.375, 0, 0.75, 35)
Rejoin.ImageColor3 = Color3.fromRGB(47, 121, 255)
Rejoin.TextLabel.Text = "Rejoin"
Rejoin.MouseButton1Click:Connect(function()
    rejoin(true)
end)
Rejoin.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Rejoin, TweenInfo.new(0.25), { ImageTransparency = 0 }):Play()
end)
Rejoin.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Rejoin, TweenInfo.new(0.25), { ImageTransparency = 0.5 }):Play()
end)
local Respawn = UI.buttons.inv:Clone()
Respawn.Parent = CustomMenu
Respawn.Name = "respawn"
Respawn.Position = UDim2.new(0.65, 0, 0.625, 35)
Respawn.ImageColor3 = Color3.fromRGB(255, 255, 255)
Respawn.TextLabel.Text = "Respawn"
Respawn.MouseButton1Click:Connect(function()
    respawn(false)
end)
Respawn.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Respawn, TweenInfo.new(0.25), { ImageTransparency = 0 }):Play()
end)
Respawn.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Respawn, TweenInfo.new(0.25), { ImageTransparency = 0.5 }):Play()
end)
local Refresh = UI.buttons.inv:Clone()
Refresh.Parent = CustomMenu
Refresh.Name = "refresh"
Refresh.Position = UDim2.new(0.65, 0, 0.5, 35)
Refresh.ImageColor3 = Color3.fromRGB(255, 255, 255)
Refresh.TextLabel.Text = "Refresh"
Refresh.MouseButton1Click:Connect(function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local OldPos = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
        local CamPos = workspace.CurrentCamera.CFrame
        respawn(false)
        LocalPlayer.CharacterAdded:Once(function(char)
            task.wait()
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = OldPos
            wait()
            workspace.CurrentCamera.CFrame = CamPos
        end)
    elseif game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
        local OldPos = game.Players.LocalPlayer.Character:FindFirstChild("Torso").CFrame
        local CamPos = workspace.CurrentCamera.CFrame
        respawn(false)
        LocalPlayer.CharacterAdded:Once(function(char)
            task.wait()
            game.Players.LocalPlayer.Character:FindFirstChild("Torso").CFrame = OldPos
            wait()
            workspace.CurrentCamera.CFrame = CamPos
        end)
    else
        Notify("Could not refresh | Did not find torso/root. (Suggest to respawn)")
    end
end)
Refresh.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Refresh, TweenInfo.new(0.25), { ImageTransparency = 0 }):Play()
end)
Refresh.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Refresh, TweenInfo.new(0.25), { ImageTransparency = 0.5 }):Play()
end)
local ServerHop = UI.buttons.inv:Clone()
ServerHop.Parent = CustomMenu
ServerHop.Name = "serverhop"
ServerHop.Position = UDim2.new(0.65, 0, 0.75, 35)
ServerHop.ImageColor3 = Color3.fromRGB(166, 255, 137)
ServerHop.TextLabel.Text = "Server hop"
ServerHop.MouseButton1Click:Connect(function()
    serverhop(true)
end)
ServerHop.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(ServerHop, TweenInfo.new(0.25), { ImageTransparency = 0 }):Play()
end)
ServerHop.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(ServerHop, TweenInfo.new(0.25), { ImageTransparency = 0.5 }):Play()
end)
local Lag = UI.buttons.inv:Clone()
Lag.Parent = CustomMenu
Lag.Name = "lag"
Lag.Position = UDim2.new(0.095, 0, 0.75, 35)
Lag.ImageColor3 = Color3.fromRGB(155, 0, 0)
Lag.TextLabel.Text = "Lag server"
local Sent = false
task.spawn(function()
    while true do
        task.wait()
        if Sent == true then
            lag(4, false)
        end
    end
end)
Lag.MouseButton1Click:Connect(function()
    if Sent == false then
        Lag.TextLabel.Text = "Stop lagging"
        Sent = true
    else
        Lag.TextLabel.Text = "Lag server"
        Sent = false
    end
end)
Lag.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Lag, TweenInfo.new(0.25), { ImageTransparency = 0 }):Play()
end)
Lag.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Lag, TweenInfo.new(0.25), { ImageTransparency = 0.5 }):Play()
end)
task.spawn(function()
    task.wait(0.25)
    ClonedCredits.Text = ClassicCredits.Text
    ClassicCredits.Changed:Connect(function()
        ClonedCredits.Text = ClassicCredits.Text
        Credits = tonumber(ClassicCredits.Text:sub(-ClassicCredits.Text:len(), -8))
    end)
end)
local AutoFarm = UI.buttons.inv:Clone()
AutoFarm.Parent = CustomMenu
AutoFarm.Name = "autofarm"
AutoFarm.Position = UDim2.new(0.375, 0, 0.625, 35)
AutoFarm.ImageColor3 = Color3.fromRGB(255, 60, 0)
AutoFarm.TextLabel.Text = "Disable autofarm"
AutoFarm.TextLabel.TextSize = 11
AutoFarm.MouseButton1Click:Connect(function()
    if Sent2 == true then
        Sent2 = false

        AutoFarm.ImageColor3 = Color3.fromRGB(0, 225, 225)
        AutoFarm.TextLabel.Text = "Enable autofarm"
        respawn(false)
    else
        Sent2 = true
        AutoFarm.ImageColor3 = Color3.fromRGB(255, 60, 0)
        AutoFarm.TextLabel.Text = "Disable autofarm"
    end
end)
AutoFarm.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(AutoFarm, TweenInfo.new(0.25), { ImageTransparency = 0 }):Play()
end)
AutoFarm.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(AutoFarm, TweenInfo.new(0.25), { ImageTransparency = 0.5 }):Play()
end)

CustomMenu.Name = "Breaking+"
CustomMenu.top.TextLabel:FindFirstChildOfClass("ImageLabel"):Destroy()
CustomMenu.top.TextLabel.Text = "Breaking +"
CustomMenu.top.TextLabel.ZIndex = 2
CustomButton.ImageColor3 = Color3.fromRGB(0, 200, 125)
CustomButton.Position = UDim2.new(0, -200, 0, 140)
CustomButton.TextLabel.Text = "Breaking +"
CustomButton.Name = "Breaking+"
CustomButton.Visible = true
game:GetService("TweenService"):Create(CustomButton, TweenInfo.new(0.5), { Position = UDim2.new(0, 0, 0, 140) }):Play()

task.spawn(function()
    local char = LocalPlayer.Character
    repeat
        task.wait()
    until char:FindFirstChildOfClass("Humanoid") ~= nil
    if char:FindFirstChildOfClass("Humanoid") ~= nil then
        local Humanoid = char:FindFirstChildOfClass("Humanoid")
        Humanoid.Seated:Connect(function(Sitting, Part)
            if Sitting == true then
                task.wait()
                local Animation = Instance.new("Animation")
                Animation.AnimationId = "rbxassetid://" .. tostring(SelectedAnimation)
                local SittingAnimationPoseCustom = Humanoid:LoadAnimation(Animation)
                SittingAnimationPoseCustom.Priority = Enum.AnimationPriority.Action4
                SittingAnimationPoseCustom.Looped = true
                SittingAnimationPoseCustom:Play(0)
                Humanoid.Seated:Once(function(Sitting, Part)
                    if Sitting == false then
                        SittingAnimationPoseCustom.Looped = false
                        SittingAnimationPoseCustom:Stop(0.2)
                    end
                end)
            end
        end)
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    repeat
        task.wait()
    until char:FindFirstChildOfClass("Humanoid") ~= nil
    if char:FindFirstChildOfClass("Humanoid") ~= nil then
        local Humanoid = char:FindFirstChildOfClass("Humanoid")
        Humanoid.Seated:Connect(function(Sitting, Part)
            if Sitting == true then
                task.wait()
                local Animation = Instance.new("Animation")
                Animation.AnimationId = "rbxassetid://" .. tostring(SelectedAnimation)
                local SittingAnimationPoseCustom = Humanoid:LoadAnimation(Animation)
                SittingAnimationPoseCustom.Priority = Enum.AnimationPriority.Action4
                SittingAnimationPoseCustom.Looped = true
                SittingAnimationPoseCustom:Play(0)
                Humanoid.Seated:Once(function(Sitting, Part)
                    if Sitting == false then
                        SittingAnimationPoseCustom.Looped = false
                        SittingAnimationPoseCustom:Stop(0.2)
                    end
                end)
            end
        end)
    end
end)

function AddEmote(ID, Name, Icon)
    Debug("Added emote ID:" .. ID .. " Name:" .. Name)
    task.spawn(function()
        UI.inv.sectionframes:GetChildren()[4].TextLabel.Visible = false
        local invbut = invbut:Clone()
        invbut.Image = "rbxassetid://" .. Icon
        invbut.name.Text = Name
        invbut.type.Text = ""
        invbut.type.TextColor3 = Color3.fromRGB(255, 79, 82)
        invbut.Parent = UI.inv.sectionframes:GetChildren()[4]
        invbut.MouseButton1Down:Connect(function()
            if invbut.BorderSizePixel == 0 then
                invbut.BorderSizePixel = 2
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(55, "Animations")
                SelectedAnimation = ID
                for i, v in pairs(UI.inv.sectionframes:GetChildren()[4].GridOrder:GetChildren()) do
                    if v ~= invbut and v:IsA("ImageButton") then
                        v.BorderSizePixel = 0
                    end
                end
            else
                invbut.BorderSizePixel = 0
                SelectedAnimation = 0
            end
        end)
    end)
end
--[[
task.spawn(function()
	repeat task.wait() until UI.inv.sectionframes:GetChildren()[4]:FindFirstChild("GridOrder")
	task.wait(0.25)


end)
]]
local function addvipchairs()
    task.wait(1.4)
    task.spawn(function()
        Debug("Added Stellar Chair")
        local invbut = invbut:Clone()
        UI.inv.sectionframes:GetChildren()[3].TextLabel.Visible = false
        invbut.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=3422633744"
        invbut.name.Text = "Stellar"
        invbut.type.Text = "Legendary"
        invbut.type.TextColor3 = Color3.fromRGB(255, 79, 82)
        invbut.Parent = UI.inv.sectionframes:GetChildren()[3]
        invbut.MouseButton1Down:Connect(function()
            if invbut.BorderSizePixel == 0 then
                invbut.BorderSizePixel = 2
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(55, "Chair Skins", "Space", "Stellar")
                for i, v in pairs(UI.inv.sectionframes:GetChildren()[3].GridOrder:GetChildren()) do
                    if v ~= invbut and v:IsA("ImageButton") then
                        v.BorderSizePixel = 0
                    end
                end
            else
                invbut.BorderSizePixel = 0
            end
        end)
    end)

    task.spawn(function()
        Debug("Added Blue Galaxy Chair")
        local invbut2 = invbut2:Clone()
        invbut2.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=1077205771"
        invbut2.name.Text = "Blue Galaxy"
        invbut2.type.Text = "Legendary"
        invbut2.type.TextColor3 = Color3.fromRGB(255, 79, 82)
        invbut2.Parent = UI.inv.sectionframes:GetChildren()[3]
        invbut2.MouseButton1Down:Connect(function()
            if invbut2.BorderSizePixel == 0 then
                invbut2.BorderSizePixel = 2
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(55, "Chair Skins", "Space", "Blue Galaxy")
                for i, v in pairs(UI.inv.sectionframes:GetChildren()[3].GridOrder:GetChildren()) do
                    if v ~= invbut2 and v:IsA("ImageButton") then
                        v.BorderSizePixel = 0
                    end
                end
            else
                invbut2.BorderSizePixel = 0
            end
        end)
    end)
end

task.spawn(function()
    while task.wait(0.8) do
        if not UI.inv.sectionframes:GetChildren()[5]:FindFirstChild("GridOrder") then
            for i, v in pairs(UI.inv.sectionframes:GetChildren()) do
                local MainFrame = Instance.new("Frame")
                local GridLayout = Instance.new("UIGridLayout")
                local Padding = Instance.new("UIPadding")
                local RarityOrder = { Exotic = -6, Divine = -5, Legendary = -4, Rare = -3, Uncommon = -2, Common = -1 }
                MainFrame.Parent = v
                MainFrame.BackgroundTransparency = 1
                MainFrame.Size = UDim2.new(1, 0, 1, 0)
                MainFrame.Name = "GridOrder"
                Padding.Parent = MainFrame
                Padding.PaddingTop = UDim.new(0, 5)
                Padding.PaddingLeft = UDim.new(0, 20)
                GridLayout.CellPadding = UDim2.new(0, 18, 0, 10)
                GridLayout.Parent = MainFrame
                GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
                for i, v in pairs(v:GetChildren()) do
                    if v:IsA("ImageButton") then
                        v.LayoutOrder = RarityOrder[tostring(v.type.Text)] or Random.new((function(str)
                            local seed = 0
                            for i = 1, #str do
                                seed = seed + string.byte(str, i)
                            end
                            return seed
                        end)(tostring(v.type.Text))):NextInteger(-7, -100)
                        v.Parent = MainFrame
                        v.MouseButton1Down:Connect(function()
                            for i, v3 in pairs(MainFrame:GetChildren()) do
                                if v3 ~= v and v3:IsA("ImageButton") then
                                    v3.BorderSizePixel = 0
                                end
                            end
                        end)
                    end
                end
                v.CanvasSize = UDim2.new(0, 0, 0, GridLayout.AbsoluteContentSize.Y + 10)
                v.ChildAdded:Connect(function(v2)
                    task.wait()
                    if v2:IsA("ImageButton") then
                        v2.LayoutOrder = RarityOrder[tostring(v2.type.Text)] or Random.new((function(str)
                            local seed = 0
                            for i = 1, #str do
                                seed = seed + string.byte(str, i)
                            end
                            return seed
                        end)(tostring(v2.type.Text))):NextInteger(-7, -100)
                        v2.Parent = MainFrame
                        v2.MouseButton1Down:Connect(function()
                            for i, v3 in pairs(MainFrame:GetChildren()) do
                                if v3 ~= v2 and v3:IsA("ImageButton") then
                                    v3.BorderSizePixel = 0
                                end
                            end
                        end)
                    end
                    v.CanvasSize = UDim2.new(0, 0, 0, GridLayout.AbsoluteContentSize.Y + 10)
                end)
            end
            task.wait(0.5)
            task.spawn(function()
                addvipchairs()
                local AnimationNamesAvailable = { Sway = { 3200586606, 3200675416 }, Rebel = { 3200332361, 2104492097 }, Slouch = { 2040237465, 2036596243 }, Sleep = { 2040220399, 2039295925 }, Tuck = { 1236272531, 1234316036 }, L = { 955953327, 958005778 }, Lean = { 936006882, 942467432 }, Chill = { 942556290, 942467847 } }

                for i, v in pairs(UI.inv.sectionframes:GetChildren()[4].GridOrder:GetChildren()) do
                    table.foreachi(AnimationNamesAvailable, function(ii, vv)
                        if ii == v.name.Text then
                            AnimationNamesAvailable[ii] = false
                        end
                    end)
                end
                for EmoteName, v in pairs(AnimationNamesAvailable) do
                    if v ~= false then
                        AddEmote(v[1], EmoteName, v[2])
                        task.wait()
                    end
                end
            end)
        end
    end
end)

function PlayerExecute(Player)
    task.wait()
    if Player ~= LocalPlayer then
        PlayerButtons.Size = UDim2.new(0, 130, 0, 180)
        local Cloned = PlayerButtons:FindFirstChild("button"):Clone()
        local Cloned2 = Cloned:Clone()
        local Cloned3 = Cloned:Clone()
        Cloned.Position = UDim2.new(2, 0, 0, 81)
        Cloned.Parent = PlayerButtons
        Cloned.TextLabel.Text = "Trade"
        Cloned.ImageColor3 = Color3.fromRGB(14, 35, 14)
        Cloned.button.ImageColor3 = Color3.fromRGB(85, 170, 0)
        -- Button 2
        Cloned2.Position = UDim2.new(2, 0, 0, 108)
        Cloned2.Parent = PlayerButtons
        Cloned2.TextLabel.Text = "Fling"
        Cloned2.ImageColor3 = Color3.fromRGB(41, 24, 24)
        Cloned2.button.ImageColor3 = Color3.fromRGB(58, 31, 31)
        -- Button 3
        Cloned3.Position = UDim2.new(2, 0, 0, 135)
        Cloned3.Parent = PlayerButtons
        Cloned3.TextLabel.Text = "Head Stare"
        Cloned3.ImageColor3 = Color3.fromRGB(35, 30, 59)
        Cloned3.button.ImageColor3 = Color3.fromRGB(23, 12, 53)
        local Connection
        Connection = PlayerButtons:FindFirstChild("button").Changed:Connect(function()
            if PlayerButtons:FindFirstChild("button").Position.X.Scale ~= 0 then
                Cloned.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale, 0, 0, 81)
                Cloned2.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale, 0, 0, 108)
                Cloned3.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale, 0, 0, 135)
            else
                Connection:Disconnect()
            end
        end)
        Cloned.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(Cloned.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear), { ImageTransparency = 0.8 }):Play()
        end)
        Cloned.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(Cloned.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear), { ImageTransparency = 1 }):Play()
        end)
        Cloned.MouseButton1Click:Connect(function()
            PlayerButtons.Visible = false
            game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(73, Player)
        end)

        Cloned2.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(Cloned2.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear), { ImageTransparency = 0.8 }):Play()
        end)
        Cloned2.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(Cloned2.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear), { ImageTransparency = 1 }):Play()
        end)
        Cloned2.MouseButton1Click:Connect(function()
            PlayerButtons.Visible = false
            if Player.Character ~= nil and Player.Character.Humanoid ~= nil and Player.Character.Humanoid.Sit == false then
                fling(Player.Name)
            else
                Notify("Failed to fling user (they possibly are in the match)", "ok")
            end
        end)

        Cloned3.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(Cloned2.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear), { ImageTransparency = 0.8 }):Play()
        end)
        Cloned3.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(Cloned2.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear), { ImageTransparency = 1 }):Play()
        end)
        Cloned3.MouseButton1Click:Connect(function()
            PlayerButtons.Visible = false
            if Player.Character ~= nil and Player.Character.Head ~= nil then
                StareAt(Player)
            else
                Notify("Failed to stare at user (they didn't have a character/head)", "ok")
            end
        end)
    else
        PlayerButtons.Size = UDim2.new(0, 130, 0, 60)
        local Cloned = PlayerButtons:FindFirstChild("button"):Clone()
        Cloned.Position = UDim2.new(2, 0, 0, 27)
        Cloned.Parent = PlayerButtons
        Cloned.TextLabel.Text = "Headless"
        Cloned.ImageColor3 = Color3.fromRGB(38, 11, 11)
        Cloned.button.ImageColor3 = Color3.fromRGB(125, 15, 15)
        local Connection
        Connection = PlayerButtons:FindFirstChild("button").Changed:Connect(function()
            if PlayerButtons:FindFirstChild("button").Position.X.Scale ~= 0 then
                Cloned.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale, 0, 0, 27)
            else
                Connection:Disconnect()
            end
        end)
        Cloned.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(Cloned.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear), { ImageTransparency = 0.8 }):Play()
        end)
        Cloned.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(Cloned.button, TweenInfo.new(0.1, Enum.EasingStyle.Linear), { ImageTransparency = 1 }):Play()
        end)

        Cloned.MouseButton1Click:Connect(function()
            PlayerButtons.Visible = false
            LocalPlayer.Character.Torso.Neck.C1 = CFrame.new(0, 0, 250)
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("neck", (CFrame.new(0, -100, 0) * CFrame.Angles(-1.6130179166793823, 0, 3)))
        end)
    end
end

for i, v in pairs(PlayersList:GetChildren()) do
    if v:IsA("Frame") and v:FindFirstChild("name") and v.name:FindFirstChild("TextButton") then
        v.name:FindFirstChild("TextButton").MouseButton1Click:Connect(function()
            SelectedPlayer = game.Players:FindFirstChild(v.name:FindFirstChild("TextLabel").Text)
            PlayerExecute(SelectedPlayer)
        end)
    end
end
PlayersList.ChildAdded:Connect(function(v)
    if v:IsA("Frame") and v:FindFirstChild("name") and v.name:FindFirstChild("TextButton") then
        v.name:FindFirstChild("TextButton").MouseButton1Click:Connect(function()
            SelectedPlayer = game.Players:FindFirstChild(v.name:FindFirstChild("TextLabel").Text)
            PlayerExecute(SelectedPlayer)
        end)
    end
end)

task.spawn(function()
    for i, v in pairs(UI.trade.Frame.ScrollingFrame:GetChildren()) do
        repeat
            task.wait()
        until game.Players:FindFirstChild(v.Name):FindFirstChild("tradebanned") or task.wait(3)
        if game.Players:FindFirstChild(v.Name) and game.Players:FindFirstChild(v.Name):FindFirstChild("tradebanned") and game.Players:FindFirstChild(v.Name):FindFirstChild("tradebanned").Value == true then
            v.grad.ImageColor3 = Color3.fromRGB(255, 195, 195)
            v.TextLabel.TextColor3 = Color3.fromRGB(133, 47, 47)
            v.ImageLabel.ImageColor3 = Color3.fromRGB(35, 27, 27)
        end
    end
end)

UI.trade.Frame.ScrollingFrame.ChildAdded:Connect(function(v)
    repeat
        task.wait()
    until game.Players:FindFirstChild(v.Name):FindFirstChild("tradebanned") or task.wait(3)
    if game.Players:FindFirstChild(v.Name) and game.Players:FindFirstChild(v.Name):FindFirstChild("tradebanned") and game.Players:FindFirstChild(v.Name):FindFirstChild("tradebanned").Value == true then
        v.grad.ImageColor3 = Color3.fromRGB(255, 195, 195)
        v.TextLabel.TextColor3 = Color3.fromRGB(133, 47, 47)
        v.ImageLabel.ImageColor3 = Color3.fromRGB(35, 27, 27)
    end
end)

CustomMenu.top.TextButton.MouseButton1Click:Connect(function()
    CustomMenu.Visible = not CustomMenu.Visible
end)

CustomButton.MouseButton1Click:Connect(function()
    CustomMenu.Visible = not CustomMenu.Visible
    for i, v in pairs(UI:GetChildren()) do
        task.spawn(function()
            if v.Name == "setting" or v.Name == "trade" or v.Name == "shop" or v.Name == "inv" or v.Name == "tradelog" or v.Name == "server1" then
                v.Visible = false
            end
        end)
    end
end)

NeededPlaceId = 648362523

local queue_on_teleport = syn and syn.queue_on_teleport or queue_on_teleport
if queue_on_teleport ~= nil then
    --print(type(queue_on_teleport),queue_on_teleport)
    queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Script'))()")
else
    task.spawn(function()
        task.wait(2.5)
        Notify("Your exploit does not support teleport execution")
    end)
end

task.spawn(function()
    while task.wait(1) do
        if #game.Players:GetPlayers() < 8 and Sent2 == true and AutoServerHop == true then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Notification",
                Text = "Server hopping automaticly",
            })
            if TeleportProc == nil then
                TeleportProc = true
                serverhop(true)
                wait(15)
            end
        end
    end
end)

if game.PlaceId == NeededPlaceId then
    repeat
        wait()
    until game:IsLoaded()
    ColoredPrint("Breaking plus has loaded successfully", Color3.fromRGB(0, 200, 125), { "success", true })
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification",
        Text = "Breaking + | V" .. tostring(Version) .. " | loaded successfully.",
        Icon = "rbxassetid://10698497706",
    })
    while true do
        if Sent2 == true then
            task.wait()
            if Legacy == true then
                pcall(function()
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
                end)
                spawn(function()
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v.Name == game.Players.LocalPlayer.Name then
                        else
                            pcall(function()
                                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(30, v)
                            end)
                        end
                    end
                end)
            else
                if RoundMode == "Breaking Point" or RoundMode == "Who Did It" then
                    pcall(function()
                        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
                    end)
                    spawn(function()
                        for i, v in pairs(game.Players:GetPlayers()) do
                            if v.Name == game.Players.LocalPlayer.Name then
                            else
                                pcall(function()
                                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(30, v)
                                end)
                            end
                        end
                    end)
                end
            end
        else
            task.wait(0.5)
        end
    end
else
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification",
        Text = "You need to teleport to the correct mode to autofarm",
    })
    task.wait(5)
    NotifyButtons("You need to teleport to the correct mode to autofarm", "Teleport", "Cancel", function()
        game:GetService("TeleportService"):Teleport(648362523, LocalPlayer)
        return { "Load", "Teleporting", 5 }
    end, function()
        return {}
    end)
    --game:GetService("TeleportService"):Teleport(NeededPlaceId, LocalPlayer)
end
