local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
-- Color scheme
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'EdenEast/nightfox.nvim'

-- Status bar
Plug 'nvim-lualine/lualine.nvim'

-- Used by lots of plugins
Plug 'nvim-lua/plenary.nvim'

-- Jumping around
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lambdalisue/fern.vim'
Plug 'chrisbra/improvedft'

-- Development
Plug 'nvim-treesitter/nvim-treesitter'
-- Plug 'nvim-treesitter/nvim-treesitter-context'
-- Plug 'nvim-treesitter/nvim-treesitter-textobjects'
-- Plug 'nvim-pack/nvim-spectre'

-- Tagbar
Plug "majutsushi/tagbar"

-- Marks
Plug 'chentoast/marks.nvim'

-- Tabs
--Plug 'noib3/nvim-cokeline'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'ghillb/cybu.nvim'
Plug 'mrjones2014/smart-splits.nvim'

-- Commentary
Plug 'tpope/vim-commentary'

-- Git
Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'
Plug 'NeogitOrg/neogit'

-- terminal
Plug 'akinsho/toggleterm.nvim'

-- alpha new
Plug 'goolord/alpha-nvim'

-- autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'       -- buffer completion
Plug 'hrsh7th/cmp-path'         -- path completion
Plug 'hrsh7th/cmp-cmdline'      -- cmdline completion
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip' -- snipet compelention
Plug 'hrsh7th/nvim-cmp'         -- completion plugin

-- LSP
-- Plug 'williamboman/mason.nvim'
-- Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim' -- formatters and linters
Plug 'folke/neodev.nvim'               -- full doc of lua, signatures
Plug 'ray-x/lsp_signature.nvim'        -- lsp signature help
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'

-- Go
--Plug 'ray-x/go.nvim' -- lsp golang
Plug 'ray-x/guihua.lua'
Plug 'fatih/vim-go'

-- D
Plug 'idanarye/vim-dutyl'
Plug 'Sirsireesh/vim-dlang-phobos-highlighter'

-- telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

-- icons
Plug 'kyazdani42/nvim-web-devicons'

-- diverse
Plug 'kylechui/nvim-surround'
Plug 'folke/which-key.nvim'

-- auto pairs
Plug 'hrsh7th/nvim-insx'

-- debugging
Plug 'jbyuki/one-small-step-for-vimkind'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'sebdah/vim-delve'
Plug 'ravenxrz/DAPInstall.nvim'
Plug 'dreamsofcode-io/nvim-dap-go'
Plug 'mfussenegger/nvim-dap-python'

-- experiment
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'ThePrimeagen/harpoon'

-- diagnostics
Plug 'folke/trouble.nvim'
Plug "mrbjarksen/neo-tree-diagnostics.nvim"

-- Hare
Plug 'https://git.sr.ht/~sircmpwn/hare.vim'

-- Arduino
Plug 'edKotinsky/Arduino.nvim'
--Plug 'stevearc/vim-arduino'

vim.call('plug#end')

require('plugins.cokeline')
require('plugins.telescope')
require('plugins.nvim-treesitter')
require('plugins.toggleterm')
require('plugins.alpha-nvim')
require('plugins.go-nvim')
require('plugins.nvim-ufo')
require('plugins.nvim-dap')
require('plugins.nvim-neo-tree')
require('plugins.nvim-surround')
require('plugins.nvim-neodev')
require('plugins.lualine')
require('plugins.lualineTheme')
require('plugins.marks')
require('plugins.insx')
require('plugins.cybu')
require('plugins.barbar')
require('plugins.trouble')
require('plugins.dap-install')
require('plugins.which-key')
require('plugins.dap-go')
require('plugins.dap-python')
require('smart-splits').setup({})
require('plugins.arduino')
require('plugins.neogit')
