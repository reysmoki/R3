-- Contoh Napoleon Hub Tanpa Sistem Key

if napoleonLoaded then return end
getgenv().napoleonLoaded = true

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Refinement/main/Library.lua"))()

local Window = Library:CreateWindow("My Custom Hub")
local Tab = Window:CreateTab("Main")

Tab:CreateButton({
    Name = "Anti AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    end
})

Tab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
})
