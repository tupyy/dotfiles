local status_ok, cokeline = pcall(require, "cokeline")

if not status_ok then
    return
end

local get_hex = require("cokeline/utils").get_hex
local mappings = require("cokeline/mappings")

cokeline.setup({
    mappings = {
        cycle_prev_next = true,
    },
    default_hl = {
        fg = function(buffer)
            return buffer.is_focused and get_hex("Normal","fg") or get_hex("Comment","fg")
        end,
        bg = get_hex("None","bg"),
    },
    buffers = {
        new_buffers_position= "next",
    },
    rendering = {
        max_buffer_width = 30,
    },
})
