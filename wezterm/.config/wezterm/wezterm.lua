local wezterm = require("wezterm")

return {
    -- UI
    font_size = 16,
    color_scheme = "gruvbox_material_dark_hard",
    color_schemes = {
        ["gruvbox_material_dark_hard"] = {
            foreground = "#D4BE98",
            background = "#1D2021",
            cursor_bg = "#D4BE98",
            cursor_border = "#D4BE98",
            cursor_fg = "#1D2021",
            selection_bg = "#D4BE98",
            selection_fg = "#3C3836",

            ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
            brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
        },
    },
    colors = {
        split = "#444444",
    },
    enable_scroll_bar = true,
    tab_bar_at_bottom = true,
    window_background_opacity = 1,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    -- Keys

    keys = {
        {
            key = "s",
            mods = "ALT",
            action = wezterm.action.SplitPane({
                direction = "Right",
                size = { Percent = 50 },
            }),
        },
        {
            key = "s",
            mods = "ALT | SHIFT",
            action = wezterm.action.SplitPane({
                direction = "Down",
                size = { Percent = 50 },
            }),
        },

        {
            key = "x",
            mods = "ALT",
            action = wezterm.action.CloseCurrentPane({
                confirm = false,
            }),
        },
        {
            key = "RightArrow",
            mods = "ALT",
            action = wezterm.action.ActivatePaneDirection("Right"),
        },
        {
            key = "LeftArrow",
            mods = "ALT",
            action = wezterm.action.ActivatePaneDirection("Left"),
        },
        {
            key = "DownArrow",
            mods = "ALT",
            action = wezterm.action.ActivatePaneDirection("Down"),
        },
        {
            key = "UpArrow",
            mods = "ALT",
            action = wezterm.action.ActivatePaneDirection("Up"),
        },
        {
            key = "t",
            mods = "ALT",
            action = wezterm.action.SpawnTab("CurrentPaneDomain"),
        }
    },
}
