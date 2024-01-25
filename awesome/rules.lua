--      ██████╗ ██╗   ██╗██╗     ███████╗███████╗
--      ██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
--      ██████╔╝██║   ██║██║     █████╗  ███████╗
--      ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
--      ██║  ██║╚██████╔╝███████╗███████╗███████║
--      ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local beautiful = require("beautiful")

-- define screen height and width
local screen_height = function()
    return awful.screen.focused().geometry.height
end
local screen_width = function()
    return awful.screen.focused().geometry.width
end

-- define module table
local rules = {}


-- ===================================================================
-- Rules
-- ===================================================================


-- return a table of client rules including provided keys / buttons
function rules.create(clientkeys, clientbuttons)
    return {
        -- All clients will match this rule.
        {
            rule = {},
            properties = {
                titlebars_enabled = beautiful.titlebars_enabled,
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,
                buttons = clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.centered
            },
        },
        -- Floating clients.
        {
            rule_any = {
                class = {
                    "Nm-connection-editor",
                },
                role = {
                    "pop-up",
                },
                type = {
                    "dialog"
                }
            },
            properties = { floating = true }
        },

        -- "Switch to tag"
        -- These clients make you switch to their tag when they appear
        {
            rule_any = {
                class = {
                    "Slack"
                },
            },
            properties = { tag = "9" }
        },
        -- rofi rule
        {
            rule_any = { name = { "rofi" } },
            properties = { maximized = false, floating = true, titlebars_enabled = true },
        },
        -- {
        --     rule_any = {
        --         class = {
        --             "Alacritty",
        --         },
        --     },
        --     properties = {
        --         floating = true,
        --         width = 1800,
        --         height = 1600,
        --         x = 4800,
        --         y = 300,
        --     }
        -- },
        -- Pavucontrol & Bluetooth Devices
        {
            rule_any = { class = { "Pavucontrol" }, name = { "Bluetooth Devices" } },
            properties = { floating = false }
        },
    }
end

-- return module table
return rules
