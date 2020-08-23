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

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Jumping around files
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Development
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'valloric/MatchTagAlways'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sebdah/vim-delve'
Plug 'fatih/vim-go'

" Easier jumping around/editing
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" Miscellaneous
Plug 'chrisbra/csv.vim'
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
Plug 'christoomey/vim-system-copy'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'prettier/vim-prettier', { 'do': 'npm  install' }
Plug 'majutsushi/tagbar'

Plug 'ryanoasis/vim-devicons'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
