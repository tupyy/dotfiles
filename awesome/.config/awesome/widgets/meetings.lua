-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local meetings = {}


-- ===================================================================
-- Create Widget
-- ===================================================================

meetings.create = function(screen)
    local meeting_widget = wibox.widget {
        markup = 'This <i>is</i> a <b>textbox</b>!!!',
        align  = 'center',
        valign = 'center',
        widget = wibox.widget.textbox
    }

    return meeting_widget
end

return meetings
