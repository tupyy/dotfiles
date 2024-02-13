local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

-- Shorten function name
local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- disable highlight
keymap("n", "<leader><space>", ":noh<CR>", opts)

-- vertical and horizontal
keymap("n", "vs", ":vsplit<CR>", opts)
keymap("n", "sp", ":CR>", opts)

-- move between splits
keymap("n", "<C-Right>", "<C-W><C-L>", opts)
keymap("n", "<C-Left>", "<C-W><C-H>", opts)
keymap("n", "<C-Up>", "<C-W><C-K>", opts)
keymap("n", "<C-Down>", "<C-W><C-J>", opts)

-- trees
keymap("n", "<C-n>", ":Fern . -drawer -toggle -reveal=%<CR>", { remap = true })
keymap("n", "<leader>tf", ":Fern . -drawer -toggle -reveal=%<CR>", { remap = true })
keymap("n", "<C-h>", ":Files<CR>", opts)
keymap("n", "<leader>tn", ":NeoTreeFocusToggle<CR>", opts)

-- float term
keymap("n", "<leader>ft", ":ToggleTerm<CR>", opts)
keymap("n", "<leader>ftb", ":ToggleTerm size=30 direction=horizontal<CR>", opts)
keymap("n", "<leader>ftv", ":ToggleTerm size=100 direction=vertical<CR>", opts)

-- tag bar
keymap("n", "<leader>tt", ":TagbarToggle<CR>", opts)

-- telescope
keymap("n", "<leader>tl", ":Telescope<CR>", opts)

-- f2 to save
keymap("n", "<F2>", "<esc>:w<CR>:echo expand(\"%f\") . \" saved.\"<CR>", opts)
keymap("i", "<F2>", "<esc>:w<CR>:echo expand(\"%f\") . \" saved.\"<CR>", opts)
keymap("v", "<F2>", "<esc>:w<CR>:echo expand(\"%f\") . \" saved.\"<CR>", opts)

-- tabs
keymap("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
keymap("n", "<A-v>", "<Cmd>BufferCloseAllButCurrent<CR>", opts)

-- builtin telescope
keymap("n", "<leader>rg", ":lua require'telescope.builtin'.live_grep{}<CR>", opts)
keymap("n", "<leader>b", ":lua require'telescope.builtin'.buffers{}<CR>", opts)
keymap("n", "<leader>ff", ":lua require'telescope.builtin'.find_files{}<CR>", opts)
keymap("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)

-- lsp
keymap("n", "<space>gr", ":lua require'telescope.builtin'.lsp_references{}<CR>", opts)
keymap("n", "<space>gi", ":lua require'telescope.builtin'.lsp_implementations{}<CR>", opts)
keymap("n", "<space>gD", ":lua require'telescope.builtin'.lsp_type_definitions{}<CR>", opts)
keymap("n", "<space>gd", ":lua require'telescope.builtin'.lsp_definitions{}<CR>", opts)
keymap("n", "<space>gs", ":lua require'telescope.builtin'.lsp_document_symbols{}<CR>", opts)
keymap("n", "<space>gm", ":lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<CR>", opts)
keymap("n", "<space>gi", ":lua require.'telescope.builtin'.lsp_incoming_calls{}<CR>", opts)
keymap("n", "<space>go", ":lua require'telescope.builtin'.lsp_outgoing_calls{}<CR>", opts)
keymap("n", "<space>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<space>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<space>d", ":lua require'telescope.builtin'.diagnostics{}<CR>", opts)
keymap("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>n", ":lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<leader>p", ":lua vim.diagnostic.goto_prev()<CR>", opts)

-- reload nvim
keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", opts)

-- lazygit
keymap("n", "gl", ":lua _LAZYGIT_TOGGLE()<CR>", opts)

--barbar
keymap("n", "<leader>bb", ":BufferPick<CR>", opts)
keymap("n", "<leader>bp", ":BufferPin<CR>", opts)

-- smart split resize mode
keymap("n", "<leader>sm", ":SmartResizeMode<CR>", opts)

-- trouble
-- Lua
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)

-- spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
    desc = "Open Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

-- dap
vim.keymap.set('n', '<leader>dt', function() require('dap-go').debug_test() end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

-- breakpoints
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dB', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<leader>dbc', function() require('dap').clear_breakpoints() end)
vim.keymap.set('n', '<leader>dbl', function() require('dap').list_breakpoints() end)

vim.keymap.set('n', '<leader>dU', function() require('dapui').toggle() end)
vim.keymap.set('n', '<leader>dd', function() require('dap').disconnect() end)
vim.keymap.set('n', '<leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
