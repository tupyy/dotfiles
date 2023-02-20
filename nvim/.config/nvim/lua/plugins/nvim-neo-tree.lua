local ok_status, neotree = pcall(require, "neo-tree")

if not ok_status then
	return
end

local function openWithFocus(state)
	local node = state.tree:get_node()
	if require("neo-tree.utils").is_expandable(node) then
		state.commands["toggle_node"](state)
	else
		state.commands["open"](state)
		vim.cmd("Neotree reveal")
	end
end

local function getTelescopeOpts(state, path)
  return {
    cwd = path,
    search_dirs = { path },
    attach_mappings = function (prompt_bufnr, map)
      local actions = require "telescope.actions"
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local action_state = require "telescope.actions.state"
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if (filename == nil) then
          filename = selection[1]
        end
        -- any way to open the file without triggering auto-close event of neo-tree?
        require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
      end)
      return true
    end
  }
end

neotree.setup({
	close_if_last_window = false,
	use_popups_for_input = false,
	close_floats_on_escape_key = true,
	-- popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	default_component_configs = {
		container = {
			enable_character_fade = true,
		},
		indent_size = 1,
		name = {
			trailing_slash = true,
      use_git_status_colors = true,
		},
	},
  -- source_selector = {
  --   winbar = true,
  --   statusline = false
  -- },
	window = {
		position = "float",
		width = "30%",
		popup = {
			position = { col = "100%", row = "3" },
			size = function(state)
				local root_name = vim.fn.fnamemodify(state.path, ":~")
				local root_len = string.len(root_name) + 4
				return {
					width = math.max(root_len, 50),
					height = vim.o.lines - 6,
				}
			end,
		},
		mappings = {
			["<2-leftmouse>"] = openWithFocus,
			["<cr>"] = openWithFocus,
			-- relative path in add prompt
			a = {
				"add",
				config = { show_path = "relative" },
			},
			A = {
				-- "add_directory",
				-- config = { show_path = "relative" },
				"add",
				config = { show_path = "absolute" },
			},
      ["tf"] = "telescope_find",
      ["tg"] = "telescope_grep",
		},
  },
  filesystem = {
    group_empty_dirs = true,
    bind_to_cwd = false,
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      never_show = { ".git" },
    },
    components = {
      harpoon_index = function(config, node, state)
        local Marked = require("harpoon.mark")
        local path = node:get_id()
        local succuss, index = pcall(Marked.get_index_of, path)
        if succuss and index and index > 0 then
          return {
            text = string.format("=>%d ", index), -- <-- Add your favorite harpoon like arrow here
            highlight = config.highlight or "NeoTreeDirectoryIcon",
          }
        else
          return {}
        end
      end
    },
    renderers = {
      file = {
        {"icon"},
        {"name", use_git_status_colors = true},
        {"harpoon_index"}, --> This is what actually adds the component in where you want it
        {"diagnostics"},
        {"git_status", highlight = "NeoTreeDimText"},
      }
    },
    commands = {
      telescope_find = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require('telescope.builtin').find_files(getTelescopeOpts(state, path))
      end,
      telescope_grep = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require('telescope.builtin').live_grep(getTelescopeOpts(state, path))
      end,
    },
	},
	buffers = {
		follow_current_file = true, -- This will find and focus the file in the active buffer every
		-- time the current file is changed while the tree is open.
		group_empty_dirs = true, -- when true, empty folders will be grouped together
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			},
		},
	},
	event_handlers = {
		{
			-- auto close
			event = "file_opened",
			handler = function(file_path)
				require("neo-tree").close_all()
			end,
		},
		{
			-- show netrw hijacked buffer in buffer list
			event = "neo_tree_buffer_enter",
			handler = function()
				vim.schedule(function()
					local position = vim.api.nvim_buf_get_var(0, "neo_tree_position")
					if position == "current" then
						vim.bo.buflisted = true
					end
				end)
			end,
		},
		{
			event = "file_open_requested",
			handler = function(args)
				local state = args.state
				local path = args.path
				local open_cmd = args.open_cmd or "edit"

				-- use last window if possible
				local suitable_window_found = false
				local nt = require("neo-tree")
				if nt.config.open_files_in_last_window then
					local prior_window = nt.get_prior_window()
					if prior_window > 0 then
						local success = pcall(vim.api.nvim_set_current_win, prior_window)
						if success then
							suitable_window_found = true
						end
					end
				end

				-- find a suitable window to open the file in
				if not suitable_window_found then
					if state.window.position == "right" then
						vim.cmd("wincmd t")
					else
						vim.cmd("wincmd w")
					end
				end
				local attempts = 0
				while attempts < 4 and vim.bo.filetype == "neo-tree" do
					attempts = attempts + 1
					vim.cmd("wincmd w")
				end
				if vim.bo.filetype == "neo-tree" then
					-- Neo-tree must be the only window, restore it's status as a sidebar
					local winid = vim.api.nvim_get_current_win()
					local width = require("neo-tree.utils").get_value(state, "window.width", 40, false)
					vim.cmd("vsplit " .. path)
					vim.api.nvim_win_set_width(winid, width)
				else
					vim.cmd(open_cmd .. " " .. path)
				end

				-- If you don't return this, it will proceed to open the file using built-in logic.
				return { handled = true }
			end,
		},
	},
})
