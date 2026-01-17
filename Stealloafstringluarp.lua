------------------------------------------------
-- RAYFIELD
------------------------------------------------
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Fiat Hub",
    LoadingTitle = "Fiat Hub",
    LoadingSubtitle = "Beta",
    ToggleUIKeybind = "K"
})

------------------------------------------------
-- TABS
------------------------------------------------
local StealTab = Window:CreateTab("Loadstring Steal")
local RepTab   = Window:CreateTab("Repliqued Storg")
local DiscTab  = Window:CreateTab("Discord")

------------------------------------------------
-- LOADSTRING STEAL
------------------------------------------------
StealTab:CreateParagraph({
    Title = "Aviso",
    Content = "script está em beta não espere muito"
})

local Loadstrings = {}
local SelectedLoadstring = nil

local LS_Dropdown = StealTab:CreateDropdown({
    Name = "Loadstrings",
    Options = {},
    CurrentOption = "",
    Callback = function(v)
        SelectedLoadstring = v
    end
})

StealTab:CreateButton({
    Name = "Copy",
    Callback = function()
        if SelectedLoadstring and SelectedLoadstring ~= "" then
            setclipboard(SelectedLoadstring)
        end
    end
})

StealTab:CreateButton({
    Name = "Reset",
    Callback = function()
        table.clear(Loadstrings)
        LS_Dropdown:Refresh({}, true)
        SelectedLoadstring = nil
    end
})

------------------------------------------------
-- LOADSTRING HOOK (REAL)
------------------------------------------------
local old_loadstring
old_loadstring = hookfunction(loadstring, function(code)
    if typeof(code) == "string" then
        if not table.find(Loadstrings, code) then
            table.insert(Loadstrings, code)
            LS_Dropdown:Refresh(Loadstrings, true)
        end
    end
    return old_loadstring(code)
end)

------------------------------------------------
-- REPLICATED STORG / SERVICES
------------------------------------------------
local Services = {}
local SelectedService = nil

local RepDropdown = RepTab:CreateDropdown({
    Name = "Services",
    Options = {},
    CurrentOption = "",
    Callback = function(v)
        SelectedService = v
    end
})

RepTab:CreateButton({
    Name = "Copy",
    Callback = function()
        if SelectedService and SelectedService ~= "" then
            setclipboard(SelectedService)
        end
    end
})

------------------------------------------------
-- GetService HOOK
------------------------------------------------
local old_GetService
old_GetService = hookfunction(game.GetService, function(self, service)
    if typeof(service) == "string" then
        if not table.find(Services, service) then
            table.insert(Services, service)
            RepDropdown:Refresh(Services, true)
        end
    end
    return old_GetService(self, service)
end)

------------------------------------------------
-- DISCORD
------------------------------------------------
DiscTab:CreateParagraph({
    Title = "Script feito por Fiat",
    Content = "Adms falsos: Lorenzo"
})

DiscTab:CreateButton({
    Name = "Get Discord sever",
    Callback = function()
        setclipboard("--------?")
    end
})
