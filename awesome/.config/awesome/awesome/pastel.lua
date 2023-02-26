--      ██████╗  █████╗ ███████╗████████╗███████╗██╗
--      ██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██║
--      ██████╔╝███████║███████╗   ██║   █████╗  ██║
--      ██╔═══╝ ██╔══██║╚════██║   ██║   ██╔══╝  ██║
--      ██║     ██║  ██║███████║   ██║   ███████╗███████╗
--      ╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local gears = require("gears")
local lain = require("lain")

local pastel = {}


-- ===================================================================
-- Pastel setup
-- ===================================================================
local initial_layout = {
    {
        screen = 3,
        tag = 6,
        layout = lain.layout.centerwork
    }
}

local function get_layout(screen_index, tag)
    local default_layout = awful.layout.suit.tile
    for _, screen_layout in pairs(initial_layout) do
        if screen_layout.screen == screen_index and screen_layout.tag == tag then
            return screen_layout.layout
        end
    end
    return default_layout
end

pastel.initialize = function()
    -- Import components
    require("components.exit-screen")
    require("components.volume-adjust")

    -- Import panels
    local top_panel = require("components.top-panel")

    -- Set up each screen (add tags & panels)
    awful.screen.connect_for_each_screen(function(s)
        for i = 1, 9, 1 do

            awful.tag.add(i, {
                icon = gears.filesystem.get_configuration_dir() .. "/icons/tags/pastel/" .. i .. ".png",
                icon_only = false,
                layout = get_layout(s.index, i),
                screen = s,
                selected = i == 1
            })
        end

        -- Add the top panel to every screen
        if s.index ~= 2 then
            top_panel.create(s)
        end
    end)
end

return pastel
