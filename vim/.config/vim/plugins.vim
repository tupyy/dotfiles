source ~/.config/vim/plugin/ale.vim
source ~/.config/vim/plugin/ycm.vim
source ~/.config/vim/plugin/aws-vim.vim

call plug#begin()

" Color schemes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'fatih/molokai'
Plug 'morhetz/gruvbox'

" Development
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/m-kat/aws-vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'fatih/vim-go'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'dense-analysis/ale'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Jumping aroung
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'jnurmine/Zenburn'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

Plug 'ryanoasis/vim-devicons'
call plug#end()
