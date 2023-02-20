local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
-- Color scheme
Plug 'morhetz/gruvbox'

-- Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- Used by logs of plugins
Plug 'nvim-lua/plenary.nvim'

-- Jumping around
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lambdalisue/fern.vim'

-- Development
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

-- Tagbar
Plug "majutsushi/tagbar"

-- Tabs
Plug 'noib3/nvim-cokeline'
Plug 'romgrk/barbar.nvim'

-- Commentary
Plug 'tpope/vim-commentary'

-- terminal
Plug 'akinsho/toggleterm.nvim'

-- alpha new
Plug 'goolord/alpha-nvim'

-- autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer' -- buffer completion
Plug 'hrsh7th/cmp-path' -- path completion
Plug 'hrsh7th/cmp-cmdline' -- cmdline completion
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip' -- snipet compelention
Plug 'hrsh7th/nvim-cmp' -- completion plugin

-- LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim' -- formatters and linters
Plug 'folke/neodev.nvim' -- full doc of lua, signatures
Plug 'ray-x/lsp_signature.nvim' -- lsp signature help
Plug 'ray-x/go.nvim' -- lsp golang
Plug 'ray-x/guihua.lua'
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'

-- telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

-- icons
Plug 'kyazdani42/nvim-web-devicons'

-- debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

-- experiment
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'ThePrimeagen/harpoon'

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
