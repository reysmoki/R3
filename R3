if napoleonLoaded then return end
getgenv().napoleonLoaded = true

-- UI Library (gunakan yang ringan dan familiar)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Refinement/main/Library.lua"))()

local Window = Library:CreateWindow("Napoleon Lite")
local MainTab = Window:CreateTab("Main")

-- Discord
local discord_invite = "discord.gg/bWzCFPk83g"

-- ✅ Anti-AFK
MainTab:CreateButton({
    Name = "Enable Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
        print("Anti-AFK Enabled")
    end
})

-- 🔄 Rejoin Server
MainTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
})

-- 📎 Copy Discord
MainTab:CreateButton({
    Name = "Join Discord (Copy Link)",
    Callback = function()
        setclipboard(discord_invite)
        print("Discord invite copied to clipboard!")
    end
})

-- 🧩 Game-specific Script Loader
local gameScripts = {
    [6931042565] = "https://raw.githubusercontent.com/raydjs/napoleonHub/main/games/volleyball.lua", -- Volleyball Legends
    [7018190066] = "https://raw.githubusercontent.com/raydjs/napoleonHub/main/games/example.lua", -- Example Game
    -- Tambahkan game ID lain di sini
}

MainTab:CreateButton({
    Name = "Load Script for This Game",
    Callback = function()
        local id = game.GameId
        local url = gameScripts[id]
        if url then
            local success, err = pcall(function()
                loadstring(game:HttpGet(url))()
            end)
            if not success then
                warn("Gagal load script:", err)
            end
        else
            warn("Tidak ada script untuk game ini.")
        end
    end
})
