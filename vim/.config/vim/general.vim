filetype on
syntax on

" Automatically save before commands like :next
set autowrite

" Disable making a backup before overwriting a file
set nowritebackup

" Show matching brackets when text indicator is over them
set showmatch

" Folding
set foldenable
set foldlevelstart=10
set foldmethod=syntax
set foldopen-=block
set foldcolumn=1

set hidden
set hlsearch
set tabstop=4 shiftwidth=4 expandtab
set nu
set relativenumber

" Keep cursor in middle of screen
set scrolloff=999

" Turn on the wild menu
set wildmode=longest,list,full

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc,*/.git/*,*/.DS_Store,*/node_modules/*

" Allow for copy and pasting from clipboard
set clipboard=unnamedplus

"colors
set t_Co=256
set background=dark
colorscheme gruvbox
