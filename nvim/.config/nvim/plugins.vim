""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Start Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/bundle/')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schemes
Plug 'dracula/vim'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug 'mhinz/vim-signify'
Plug 'junegunn/gv.vim'
Plug 'samoshkin/vim-mergetool'

" Jumping around files
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

" Development
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'glepnir/lspsaga.nvim'

Plug 'simrat39/rust-tools.nvim'
Plug 'rust-lang/rust.vim'
" Debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'lervag/vimtex'
Plug 'sebdah/vim-delve'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'fatih/vim-go'
Plug 'puremourning/vimspector'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-github.nvim'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

" Easier jumping around/editing
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" Miscellaneous
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'nvim-lua/popup.nvim'
Plug 'junegunn/vim-peekaboo'
Plug 'henrik/vim-indexed-search'
Plug 'chrisbra/csv.vim'
Plug 'vim-utils/vim-man'
Plug 'christoomey/vim-system-copy'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'kshenoy/vim-signature'
Plug 'terryma/vim-multiple-cursors'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vista.vim'
Plug 'theprimeagen/harpoon'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'rhysd/clever-f.vim'
Plug 'MattesGroeger/vim-bookmarks'

Plug 'ryanoasis/vim-devicons'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

source ~/.config/nvim/plugin/tagbar.vim
source ~/.config/nvim/plugin/neo-completion.vim
source ~/.config/nvim/plugin/vim-go.vim
source ~/.config/nvim/plugin/ultisnips.vim
source ~/.config/nvim/plugin/multi-cursor.vim
source ~/.config/nvim/plugin/vimspector.vim
source ~/.config/nvim/plugin/prettier.vim

let g:vimspector_enable_mappings='HUMAN'
