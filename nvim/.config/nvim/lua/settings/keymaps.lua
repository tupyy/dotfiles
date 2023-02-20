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

-- Fern
keymap("n", "<C-n>", ":Fern . -drawer -toggle -reveal=%<CR>", { remap = true })
keymap("n", "<C-h>", ":Files<CR>", opts)

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

-- lsp
keymap("n", "gr", ":lua require'telescope.builtin'.lsp_references{}<CR>", opts)
keymap("n", "gi", ":lua require'telescope.builtin'.lsp_implementations{}<CR>", opts)
keymap("n", "gD", ":lua require'telescope.builtin'.lsp_type_definitions{}<CR>", opts)
keymap("n", "gd", ":lua require'telescope.builtin'.lsp_definitions{}<CR>", opts)
keymap("n", "gs", ":lua require'telescope.builtin'.lsp_document_symbols{}<CR>", opts)
keymap("n", "gi", ":lua vim.lsp.buf.incoming_calls()<CR>", opts)
keymap("n", "go", ":lua vim.lsp.buf.outgoing_calls()<CR>", opts)
keymap("n", "<space>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<space>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)

-- reload nvim
keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", opts)
