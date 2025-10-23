--[[ UI Stuff ]]--
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "ZeroWare V2 | Stable",
    Author = "NFT Battle",
    Folder = "ZeroWare V2 (NFT Battle)",
    NewElements = true,
    
    HideSearchBar = true,
    
    OpenButton = {
        Title = "ZeroWare",
        CornerRadius = UDim.new(1,0),
        StrokeThickness = 3,
        Enabled = true,
        Draggable = true,
        OnlyMobile = true,
        
        Color = ColorSequence.new(
            Color3.fromHex("#2a66d4ff"), 
            Color3.fromHex("#771faaff")
        )
    }
})

local Sections = {
    AutomationSec = Window:Section({ Title = "Automation", Icon = "cog", Opened = true }),
    EventSec = Window:Section({ Title = "Event", Icon = "calendar-fold", Opened = true }),
}
local Tabs = {
    -- Automation
    CaseTab = AutomationSec:Tab({Title = "", Icon = "gift"}),
    SellTab = AutomationSec:Tab({Title = "", Icon = "wallet"}),
    UpgradeTab = AutomationSec:Tab({Title = "", Icon = "circle-fading-arrow-up"}),
    RocketTab = AutomationSec:Tab({Title = "", Icon = "rocket"}),
    AutofarmTab = AutomationSec:Tab({Title = "", Icon = "wheat"}),

    -- Event
    EventTab = EventSec:Tab({Title = "Halloween", Icon = "ghost"}),
}

--[[ automation case ]]--

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Stars = LocalPlayer._StarsValue

local function OpenCase(Name, Quantity)
    local OpenCase = ReplicatedStorage.Events.OpenCase
    OpenCase:InvokeServer(Name, Quantity)
end 

--                       1          2             3            4           5           6              7            8           9       10        11         12           13      14      15     16      17       18   
local defaultCases = ["Beggar", "Plodder", "Office Clerk", "Manager", "Director", "Oligarch", "Frozen Heart", "Bubble Gum", "Cats", "Dream", "M5 F90", "Porsche 911", "URUS", "Gold", "Dark", "Palm", "Burj", "Luxury"]

--                     1          2           3            4
local eventCases = ["Witchy", "Hollow", "Underworld", "Nightmare"]

--                    1        2
local freeCases = ["Trash", "Daily"]

--                    1           2          3           4
local paidCases = ["Starter", "Premium", "15% Pepe", "All In"]

CaseTab:Section({ Title = "Automation Cases" })
local case_config = {
    Enabled = false,
    CaseName = "",
    OpenQuantity = 1
}

CaseTab:Dropdown({
    Flag = "automation_current_case",
    Title = "Select Case",
    Values = {
        {
            Title = defaultCases[1],
            Icon = "gift"
        },
        {
            Title = defaultCases[2],
            Icon = "gift"
        },
        {
            Title = defaultCases[3],
            Icon = "gift"
        },
        {
            Title = defaultCases[4],
            Icon = "gift"
        },
        {
            Title = defaultCases[5],
            Icon = "gift"
        },
        {
            Title = defaultCases[6],
            Icon = "gift"
        },
        {
            Title = defaultCases[7],
            Icon = "gift"
        },
        {
            Title = defaultCases[8],
            Icon = "gift"
        },
        {
            Title = defaultCases[9],
            Icon = "gift"
        },
        {
            Title = defaultCases[10],
            Icon = "gift"
        },
        {
            Title = defaultCases[11],
            Icon = "gift"
        },
        {
            Title = defaultCases[12],
            Icon = "gift"
        },
        {
            Title = defaultCases[13],
            Icon = "gift"
        },
        {
            Title = defaultCases[14],
            Icon = "gift"
        },
        {
            Title = defaultCases[15],
            Icon = "gift"
        },
        {
            Title = defaultCases[16],
            Icon = "gift"
        },
        {
            Title = defaultCases[17],
            Icon = "gift"
        },
        {
            Title = defaultCases[18],
            Icon = "gift"
        },
        {
            Title = eventCases[1],
            Icon = "ghost"
        },
        {
            Title = eventCases[2],
            Icon = "ghost"
        },
        {
            Title = eventCases[3],
            Icon = "ghost"
        },
        {
            Title = eventCases[4],
            Icon = "ghost"
        },
        {
            Title = freeCases[1],
            Icon = "rat"
        },
        {
            Title = freeCases[2],
            Icon = "rat"
        },
        {
            Title = paidCases[1],
            Icon = "dollar-sign"
        },
        {
            Title = paidCases[2],
            Icon = "dollar-sign"
        },
        {
            Title = paidCases[3],
            Icon = "dollar-sign"
        },
        {
            Title = paidCases[4],
            Icon = "dollar-sign"
        }
    },
    Value = freeCases[1],
    Callback = function(option) 
        case_config.CaseName = option.Title
    end
})

CaseElementsTab:Slider({
    Flag = "automation_open_quantity_value",
    Title = "Open Quantity",
    Step = 1,
    Value = {
        Min = 1,
        Max = 10,
        Default = 1,
    },
    Callback = function(value)
        case_config.OpenQuantity = value
    end
})

CaseTab:Toggle({
    Flag = "automation_auto_open_value",
    Title = "Auto Open",
    Desc = nil,
    Icon = "package-open",
    Type = "Checkbox",
    Default = false,
    Callback = function(state) 
        case_config = state
    end
})

RunService.RenderStepped:Connect(function()
    if case_config.Enabled then
        OpenCase(case_config.CaseName, case_config.OpenQuantity)
    end
end)
