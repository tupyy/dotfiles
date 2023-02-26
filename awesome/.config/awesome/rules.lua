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
local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

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
                    "Nm-connection-editor"
                },
                role = {
                    "pop-up",
                    "GtkFileChooserDialog"
                },
                type = {
                    "dialog"
                }
            }, properties = { floating = true }
        },

        -- "Switch to tag"
        -- These clients make you switch to their tag when they appear
        {
            rule_any = {
                class = {
                    "Firefox"
                },
            }, properties = { tag = "8" }
        },
        {
            rule_any = {
                class = {
                    "Slack"
                },
            }, properties = { tag = "9" }
        },
        -- rofi rule 
        {
            rule_any = { name = { "rofi" } },
            properties = { maximized = true, floating = true, titlebars_enabled = false },
        },


        -- File chooser dialog
        {
            rule_any = { role = { "GtkFileChooserDialog" } },
            properties = { floating = true, width = screen_width * 0.55, height = screen_height * 0.65 }
        },

        -- Pavucontrol & Bluetooth Devices
        {
            rule_any = { class = { "Pavucontrol" }, name = { "Bluetooth Devices" } },
            properties = { floating = true }
        },
    }
end

-- return module table
return rules
