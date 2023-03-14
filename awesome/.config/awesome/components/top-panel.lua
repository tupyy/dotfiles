--      ████████╗ ██████╗ ██████╗     ██████╗  █████╗ ███╗   ██╗███████╗██╗
--      ╚══██╔══╝██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
--         ██║   ██║   ██║██████╔╝    ██████╔╝███████║██╔██╗ ██║█████╗  ██║
--         ██║   ██║   ██║██╔═══╝     ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
--         ██║   ╚██████╔╝██║         ██║     ██║  ██║██║ ╚████║███████╗███████╗
--         ╚═╝    ╚═════╝ ╚═╝         ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi

-- import widgets
local task_list = require("widgets.task-list")
local tag_list = require("widgets.tag-list")
local separator = require("widgets.horizontal-separator")
local spotify = require("widgets.spotify")
local podman = require("widgets.docker")

-- define module table
local top_panel = {}


-- ===================================================================
-- Bar Creation
-- ===================================================================


top_panel.create = function(s)
    local height = beautiful.top_panel_height

    if s.index == 2 then
        height = beautiful.top_panel_height2
    end

    local panel = awful.wibar({
        screen = s,
        position = "top",
        ontop = true,
        height = height,
        width = s.geometry.width,
    })

    panel:setup {
        expand = "none",
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            tag_list.create(s),
            task_list.create(s)
        },
        {
            layout = wibox.layout.fixed.horizontal,
            require("widgets.calendar").create(s)
        },
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.layout.margin(wibox.widget.systray(), dpi(5), dpi(5), dpi(5), dpi(5)),
            podman(),
            require("widgets.bluetooth"),
            require("widgets.network")(),
            require("widgets.battery"),
            wibox.layout.margin(require("widgets.layout-box"), dpi(5), dpi(5), dpi(5), dpi(5))
        }
    }


    -- ===================================================================
    -- Functionality
    -- ===================================================================


    -- hide panel when client is fullscreen
    local function change_panel_visibility(client)
        if client.screen == s then
            panel.ontop = not client.fullscreen
        end
    end

    -- connect panel visibility function to relevant signals
    client.connect_signal("property::fullscreen", change_panel_visibility)
    client.connect_signal("focus", change_panel_visibility)
end

return top_panel
