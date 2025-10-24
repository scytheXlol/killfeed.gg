--[[ UI Stuff ]]--
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ZeroWare V2 | NFT Battle",
   Icon = 'atom',
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Last updated: 10.24.25",
   ShowText = "ZeroWare",
   Theme = "AmberGlow", 

   ToggleUIKeybind = "M",

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ZeroWare: NFT Battle",
      FileName = "nft battle"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"ZEROWARE-JDQK-NIIQ_19284_%#@!"}
   }
})

local Tabs = {
    --Main
    Home = Window:CreateTab("", 'home'),

    --Automation
    Automation = Window:CreateTab("", 'cog'),

    --Event
    Event = Window:CreateTab("", 'calendar-fold'),

    --Settings
    Event = Window:CreateTab("", 'settings-2')
}

--[[ Automation ]]--

local case_config = {
    Enabled = false,
    CaseName = "",
    OpenQuantity = 1
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Stars = LocalPlayer._StarsValue

local function OpenCase(Name, Quantity)
    local OpenCase = ReplicatedStorage.Events.OpenCase
    OpenCase:InvokeServer(Name, Quantity)
end 

local Cases = {
    --            1          2            3             4          5           6             7               8         9        10        11          12         14       15      16     17       18       19       20        21          22           23          24        25        26       27          28         29                   
    default = {"Beggar", "Plodder", "Office Clerk", "Manager", "Director", "Oligarch", "Frozen Heart", "Bubble Gum", "Cats", "Dream", "M5 F90", "Porsche 911", "URUS", "Gold", "Dark", "Palm", "Burj", "Luxury"},                       
    event   = {"Witchy", "Hollow", "Underworld", "Nightmare"},
    free    = {"Trash", "Daily"},
    paid    = {"Starter", "Premium", "15% Pepe", "All In"},
    all     = {"Beggar", "Plodder", "Office Clerk", "Manager", "Director", "Oligarch", "Frozen Heart", "Bubble Gum", "Cats", "Dream", "M5 F90", "Porsche 911", "URUS", "Gold", "Dark", "Palm", "Burj", "Luxury", "Witchy", "Hollow", "Underworld", "Nightmare", "Trash", "Daily", "Starter", "Premium", "15% Pepe", "All In"}
}

Tabs.Automation:CreateSection("Automation Case")

Tabs.Automation:CreateDropdown({
   Name = "Select Case",
   Options = Cases.all,
   CurrentOption = {"Beggar"},
   MultipleOptions = false,
   Flag = "Automation_CurrentCase",
   Callback = function(Options)
    case_config.CaseName=Options[1]
   end,
})

Tabs.Automation:CreateSlider({
   Name = "Open Quantity",
   Range = {1, 10},
   Increment = 1,
   Suffix = "",
   CurrentValue = 1,
   Flag = "Automation_OpenQuantityValue",
   Callback = function(Value)
    case_config.OpenQuanity=Value
   end,
})

Tabs.Automation:CreateToggle({
   Name = "Auto Open",
   CurrentValue = false,
   Flag = "Automation_AutoOpenValue",
   Callback = function(Value)
    case_config.Enabled=Value
   end,
})

RunService.RenderStepped:Connect(function()
    if case_config.Enabled then
        OpenCase(case_config.CaseName, case_config.OpenQuantity)
    end
end)
