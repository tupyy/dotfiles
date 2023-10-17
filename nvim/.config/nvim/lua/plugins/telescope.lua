local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local icons = require("utils.icons")

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
    defaults = {
        file_ignore_patterns = { ".git", "node_modules", "vendor" },

        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<c-d>"] = require("telescope.actions").delete_buffer,

                -- ["<C-u>"] = actions.preview_scrolling_up,
                -- ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        file_browser = {
            require("telescope.themes").get_dropdown({
                previewer = false,
                -- even more opts
            }),
            -- set this to true if you don't have any file explorer plugin installed when starting nvim
            hijack_netrw = false,
            mappings = {
                ["i"] = {
                    ["<A-c>"] = fb_actions.create, -- create file/folder at current path
                    ["<A-r>"] = fb_actions.rename, -- rename
                    ["<A-d>"] = fb_actions.remove, -- delete
                    ["<A-y>"] = fb_actions.copy, -- copy
                    ["<A-m>"] = fb_actions.move, -- move
                    ["<C-w>"] = fb_actions.goto_cwd, -- go to current working dir
                    ["<C-g>"] = fb_actions.goto_parent_dir, -- parent dir
                },
                ["n"] = {
                    -- unmap toggling `fb_actions.toggle_browser`
                    f = false, -- false so it won't conflict with which_key
                },
            },
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({
                previewer = false,
                -- even more opts
            }),
        },
    },
})

telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
