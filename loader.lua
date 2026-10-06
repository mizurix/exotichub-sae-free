local GITHUB_BASE = "https://raw.githubusercontent.com/mizurix/exotic-sae-free/main/"

local success, err = pcall(function()
    local LucideIcons = loadstring(game:HttpGet(GITHUB_BASE .. "full_stage_3.lua"))()

    local Library = loadstring(game:HttpGet(GITHUB_BASE .. "full_stage_2.lua"))()
    Library.ShowCustomCursor = false

    pcall(function()
        game:GetService("RunService"):UnbindFromRenderStep("ShowCursor")
    end)
    game:GetService("UserInputService").MouseIconEnabled = true

    local Window = Library:CreateWindow({
        Title = "Exotic Hub - Steal An Egg",
        Footer = "v15",
        Size = UDim2.fromOffset(620, 480),
        AutoShow = true,
        ShowCustomCursor = false
    })

    local stage4Chunk = loadstring(game:HttpGet(GITHUB_BASE .. "full_stage_4.lua"))
    
    stage4Chunk({
        IsPremium = function() return true end,
        RegisterReset = function() end,
        Library = Library,
        Window = Window,
        Icons = LucideIcons
    })

    print("[+] Steal An Egg Hub loaded successfully from GitHub!")
end)

if not success then
    warn("[Loader Error] Failed to initialize: " .. tostring(err))
end
