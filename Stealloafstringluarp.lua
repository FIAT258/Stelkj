------------------------------------------------
-- RAYFIELD LOAD
------------------------------------------------
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

------------------------------------------------
-- WINDOW
------------------------------------------------
local Window = Rayfield:CreateWindow({
   Name = "Fiat Hub",
   LoadingTitle = "Fiat Hub",
   LoadingSubtitle = "Script em Beta",
   ShowText = "Fiat Hub",
   Theme = "Default",
   ToggleUIKeybind = "K",
})

------------------------------------------------
-- TABS
------------------------------------------------
local StealTab = Window:CreateTab("Loadstring Steal", 4483362458)
local RepTab   = Window:CreateTab("Repliqued Storg", 4483362458)
local DiscTab  = Window:CreateTab("Discord", 4483362458)

------------------------------------------------
-- ===== LOADSTRING STEAL =====
------------------------------------------------
StealTab:CreateParagraph({
   Title = "Aviso",
   Content = "script está em beta não espere muito"
})

local CapturedLoadstrings = {}
local SelectedLoadstring = nil

local LoadstringDropdown = StealTab:CreateDropdown({
   Name = "Loadstrings Capturados",
   Options = {},
   CurrentOption = {},
   MultiSelection = false,
   Callback = function(opt)
      SelectedLoadstring = opt[1]
   end,
})

StealTab:CreateButton({
   Name = "Copy",
   Callback = function()
      if SelectedLoadstring then
         setclipboard(SelectedLoadstring)
      end
   end,
})

StealTab:CreateButton({
   Name = "Reset",
   Callback = function()
      table.clear(CapturedLoadstrings)
      LoadstringDropdown:Refresh({}, true)
      SelectedLoadstring = nil
   end,
})

------------------------------------------------
-- HOOK REAL (HTTPGET)
------------------------------------------------
local oldHttpGet
oldHttpGet = hookfunction(game.HttpGet, function(self, url, ...)
   if typeof(url) == "string" then
      local entry = 'loadstring(game:HttpGet("'..url..'"))()'
      if not table.find(CapturedLoadstrings, entry) then
         table.insert(CapturedLoadstrings, entry)
         LoadstringDropdown:Refresh(CapturedLoadstrings, true)
      end
   end
   return oldHttpGet(self, url, ...)
end)

------------------------------------------------
-- ===== REPLICATED STORG =====
------------------------------------------------
local ServicesUsed = {}
local SelectedService = nil

local RepDropdown = RepTab:CreateDropdown({
   Name = "Serviços Usados",
   Options = {},
   CurrentOption = {},
   MultiSelection = false,
   Callback = function(opt)
      SelectedService = opt[1]
   end,
})

RepTab:CreateButton({
   Name = "Copy",
   Callback = function()
      if SelectedService then
         setclipboard(SelectedService)
      end
   end,
})

------------------------------------------------
-- HOOK GetService
------------------------------------------------
local oldGetService
oldGetService = hookfunction(game.GetService, function(self, service)
   if typeof(service) == "string" then
      if not table.find(ServicesUsed, service) then
         table.insert(ServicesUsed, service)
         RepDropdown:Refresh(ServicesUsed, true)
      end
   end
   return oldGetService(self, service)
end)

------------------------------------------------
-- ===== DISCORD =====
------------------------------------------------
DiscTab:CreateParagraph({
   Title = "Créditos",
   Content = "Script feito por Fiat\nAdms falsos: Lorenzo"
})

DiscTab:CreateButton({
   Name = "Get Discord sever",
   Callback = function()
      setclipboard("--------?")
   end,
})

------------------------------------------------
-- FINAL
------------------------------------------------
Rayfield:Notify({
   Title = "Fiat Hub",
   Content = "Interface carregada com sucesso",
   Duration = 4
})
