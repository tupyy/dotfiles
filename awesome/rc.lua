--       █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗
--      ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝
--      ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗
--      ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝
--      ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗
--      ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝


-- Standard awesome libraries
local gears = require("gears")
local awful = require("awful")
local machi = require("components.layout-machi")

-- ===================================================================
-- User Configuration
-- ===================================================================


local themes = {
    "pastel", -- 1
    "mirage"  -- 2
}

firefox_profiles = {
    default = "/home/cosmin/.mozilla/firefox/ka3ujls6.default-release-1668496480962",
    one_screen_profile = "/home/cosmin/.mozilla/firefox/9pade12h.cosmin-small-screen"
}

-- change this number to use the corresponding theme
local theme = themes[1]
local theme_config_dir = gears.filesystem.get_configuration_dir() .. "/configuration/" .. theme .. "/"

-- define default apps (global variable so other components can access it)
apps = {
    network_manager = "", -- recommended: nm-connection-editor
    power_manager = "",   -- recommended: xfce4-power-manager
    terminal = function(font_size)
        if font_size == nil then
            return "wezterm"
        end
        return "wezterm" .. " --config font_size=" .. font_size
    end,
    floating_terminal = "alacritty",
    launcher = "rofi -modi drun,run -show drun -sidebar-mode -columns 3 -theme " .. theme_config_dir .. "rofi.rasi",
    lock = "i3lock",
    filebrowser = "nautilus",
    pavucontrol = "pavucontrol"
}

-- define wireless and ethernet interface names for the network widget
-- use `ip link` command to determine these
network_interfaces = {
    wlan = 'wlp0s20f3',
    lan = 'enp44s0u2'
}

-- List of apps to run on start-up
local run_on_start_up = {
    "conky"
}


-- ===================================================================
-- Initialization
-- ===================================================================


-- Import notification appearance
require("components.notifications")

-- Run all the apps listed in run_on_start_up
for _, app in ipairs(run_on_start_up) do
    local findme = app
    local firstspace = app:find(" ")
    if firstspace then
        findme = app:sub(0, firstspace - 1)
    end
    -- pipe commands to bash to allow command to be shell agnostic
    awful.spawn.with_shell(string.format("echo 'pgrep -u $USER -x %s > /dev/null || (%s)' | bash -", findme, app), false)
end

-- Import theme
local beautiful = require("beautiful")
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/" .. theme .. "-theme.lua")
beautiful.layout_machi = machi.get_icon()

-- Initialize theme
local selected_theme = require(theme)
selected_theme.initialize()

-- Import Keybinds
local keys = require("keys")
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

-- Import rules
local create_rules = require("rules").create
awful.rules.rules = create_rules(keys.clientkeys, keys.clientbuttons)

-- Define layouts
awful.layout.layouts = {
    machi.default_layout,
    awful.layout.suit.tile,
}

-- remove gaps if layout is set to max
tag.connect_signal('property::layout', function(t)
    local current_layout = awful.tag.getproperty(t, 'layout')
    if (current_layout == awful.layout.suit.max) then
        t.gap = 0
    else
        t.gap = beautiful.useless_gap
    end
end)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the window as a slave (put it at the end of others instead of setting it as master)
    if not awesome.startup then
        awful.client.setslave(c)
    end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)


-- ===================================================================
-- Client Focusing
-- ===================================================================


-- Autofocus a new client when previously focused one is closed
require("awful.autofocus")

-- Focus clients under mouse
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)


-- ===================================================================
-- Screen Change Functions (ie multi monitor)
-- ===================================================================

-- Reload config when screen geometry changes
screen.connect_signal("property::geometry", awesome.restart)


-- ===================================================================
-- Execute
-- ===================================================================
local executer = require("components/executer")
executer.execute_commands({
    "xrandr --output DP-3-1-5 --rotate left",
    "xset r rate 200 20"
})

-- ===================================================================
-- Garbage collection (allows for lower memory consumption)
-- ===================================================================
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
collectgarbage("setstepmul", 1000)
