""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Cosmin Tupangiu
"
" Sections:
"   -> General
"   -> Front-end
"   -> Back-end
"   -> Colors and Fonts
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Filetype on
filetype on

" Automatically save before commands like :next
set autowrite

" With a map leader, it's possible to do extra key combinations
let g:mapleader = ','

" Add persistent undoing
try
  set undodir=~/.config/nvim/undodir
  set undofile
catch
endtry

" Disable making a backup before overwriting a file
set nowritebackup


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Front-end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set line numbering
set number

" Sets relative numbering
set relativenumber

" Height of the command bar
set cmdheight=2

" By default the sign column will appear when there are signs to show and disappear when there aren't.
set signcolumn=yes

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Folding
set foldenable
set foldlevelstart=10
set foldmethod=syntax
set foldopen-=block
set foldcolumn=0

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Use spaces instead of tabs
set expandtab

" 1 tab = 2 spaces
set shiftwidth=4
set tabstop=4
set showtabline=4

" Do not wrap lines
set nowrap

" Keep cursor in middle of screen
"set scrolloff=999


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Back-end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
set spell
set spelllang=en_us

" Turn on the wild menu
set wildmode=longest,list,full

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc,*/.git/*,*/.DS_Store,*/node_modules/*

" A buffer becomes hidden when it is abandoned
set hidden

" Update markers and swap file
set updatetime=200

" Do not show insertion completion menu messages
set shortmess+=c

" Ignore case when searching
set ignorecase

" When searching, try to be be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regex, turn magic on
set magic

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Allow for copy and pasting from clipboard
set clipboard=unnamedplus

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Close buffer without closing the split
nmap ,d :b#<bar>bd#<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable 256 colors palette
set t_Co=256

" Use dracula theme
colorscheme gruvbox

