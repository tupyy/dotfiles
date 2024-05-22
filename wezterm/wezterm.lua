local wezterm = require("wezterm")
local act = wezterm.action

local VIM_ICON = utf8.char(0xe62b)

return {
    check_for_updates = false,
    -- UI
    font_size = 16,
    font = wezterm.font('JetBrainsMono Nerd Font', { italic = false }),
    color_scheme = "Dracula (base16)",
    colors = {
        split = "#444444",
    },
    enable_scroll_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    window_decorations = "TITLE",
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
        -- scroll
        { key = 'UpArrow',   mods = 'SHIFT', action = wezterm.action.ScrollByLine(-1) },
        { key = 'DownArrow', mods = 'SHIFT', action = wezterm.action.ScrollByLine(1) },
        -- search
        { key = 'f',         mods = 'CTRL',  action = wezterm.action.Search 'CurrentSelectionOrEmptyString' },
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
    key_tables = {
        search_mode = {
            { key = 'Enter',  mods = 'NONE', action = act.CopyMode 'PriorMatch' },
            { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
            { key = 'n',      mods = 'CTRL', action = act.CopyMode 'NextMatch' },
            { key = 'p',      mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
            { key = 'r',      mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
            { key = 'u',      mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
            {
                key = 'PageUp',
                mods = 'NONE',
                action = act.CopyMode 'PriorMatchPage',
            },
            {
                key = 'PageDown',
                mods = 'NONE',
                action = act.CopyMode 'NextMatchPage',
            },
            { key = 'UpArrow',   mods = 'NONE', action = act.CopyMode 'PriorMatch' },
            { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
        },
    }
}
