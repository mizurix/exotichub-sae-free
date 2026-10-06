--// Exotic Hub - Official Master GitHub Loader
local success, err = pcall(function()
    local baseURL = "https://raw.githubusercontent.com/mizurix/exotichub-sae-free/main/"

    print("[*] Fetching Lucide Icons from GitHub...")
    local LucideIcons = loadstring(game:HttpGet(baseURL .. "icons.lua"))()

    print("[*] Fetching UI Library from GitHub...")
    local Library = loadstring(game:HttpGet(baseURL .. "library.lua"))()
    Library.ShowCustomCursor = false

    pcall(function()
        game:GetService("RunService"):UnbindFromRenderStep("ShowCursor")
    end)
    game:GetService("UserInputService").MouseIconEnabled = true

    print("[*] Initializing Window...")
    local Window = Library:CreateWindow({
        Title = "Exotic Hub - Steal An Egg",
        Footer = "v15",
        Size = UDim2.fromOffset(620, 480),
        AutoShow = true,
        ShowCustomCursor = false
    })

    print("[*] Fetching and Running Main Payload...")
    local payloadCode = game:HttpGet(baseURL .. "payload.lua")
    local payloadFunc = loadstring(payloadCode)
    
    payloadFunc({
        IsPremium = function() return true end,
        RegisterReset = function(cb) _G.ResetStealAnEgg = cb end,
        Library = Library,
        Window = Window,
        Icons = LucideIcons
    })

    print("[+] Exotic Hub loaded successfully from GitHub!")
end)

if not success then
    warn("[Loader Error]: " .. tostring(err))
end
