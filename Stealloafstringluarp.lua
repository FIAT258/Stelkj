-- FIAT HUB â€“ LOADSTRING STEAL | RAYFIELD ATUAL

------------------------------------------------
-- RAYFIELD
------------------------------------------------
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "FIAT HUB",
    LoadingTitle = "FIAT HUB",
    LoadingSubtitle = "by fiat",
    Theme = "Ocean",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false
})

------------------------------------------------
-- SERVICES
------------------------------------------------
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

------------------------------------------------
-- TABS
------------------------------------------------
local StealTab = Window:CreateTab("loadstring steal", 6862780938)
local RS_Tab   = Window:CreateTab("repliqued storg", 6862780938)
local DiscordTab = Window:CreateTab("Discord", 6862780938)

------------------------------------------------
-- LOADSTRING STEAL (LOGIC)
------------------------------------------------
local CapturedLoadstrings = {}
local SelectedLoadstring = nil

-- Hook loadstring
local old_loadstring = loadstring
getgenv().loadstring = function(src)
    if typeof(src) == "string" then
        table.insert(CapturedLoadstrings, src)
        if LoadstringDropdown then
            LoadstringDropdown:Refresh(CapturedLoadstrings, true)
        end
    end
    return old_loadstring(src)
end

------------------------------------------------
-- UI â€“ LOADSTRING STEAL
------------------------------------------------
StealTab:CreateLabel("script estÃ¡ em beta nÃ£o espere muito")

local LoadstringDropdown = StealTab:CreateDropdown({
    Name = "Captured Loadstrings",
    Options = {},
    CurrentOption = nil,
    Callback = function(v)
        SelectedLoadstring = v
    end
})

StealTab:CreateButton({
    Name = "copy",
    Callback = function()
        if SelectedLoadstring then
            setclipboard(SelectedLoadstring)
        end
    end
})

StealTab:CreateButton({
    Name = "reset",
    Callback = function()
        table.clear(CapturedLoadstrings)
        LoadstringDropdown:Refresh({}, true)
        SelectedLoadstring = nil
    end
})

------------------------------------------------
-- REPLICATED STORAGE SCAN
------------------------------------------------
local RS_Items = {}
local SelectedRS = nil

local function scanRS()
    table.clear(RS_Items)
    for _,v in pairs(ReplicatedStorage:GetChildren()) do
        table.insert(RS_Items, v.Name)
    end
end

scanRS()

local RSDropdown = RS_Tab:CreateDropdown({
    Name = "ReplicatedStorage Items",
    Options = RS_Items,
    CurrentOption = nil,
    Callback = function(v)
        SelectedRS = v
    end
})

RS_Tab:CreateButton({
    Name = "copy",
    Callback = function()
        if SelectedRS then
            setclipboard(SelectedRS)
        end
    end
})

------------------------------------------------
-- DISCORD
------------------------------------------------
DiscordTab:CreateLabel("script feito por Fiat")
DiscordTab:CreateLabel("Adms falsos: Lorenzo")

DiscordTab:CreateButton({
    Name = "Get Discord Server",
    Callback = function()
        setclipboard("--------?")
    end
})

------------------------------------------------
-- FINAL
------------------------------------------------
Rayfield:LoadConfiguration()
