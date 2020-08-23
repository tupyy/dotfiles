" Enable syntax highlighting
syntax enable

" Enable filetype plugins
filetype plugin indent on

" Auto indent current line when starting a new line
set autoindent

" Set to auto read when a file is changed from the outside
set autoread

" Default to \"dark\"
set background=dark

" Configure backspace so it acts as it should act
set backspace="indent,eol,start"

" List of directories for the backup file
set backupdir="~/.local/share/nvim/backup"

" Bell will not be rung for all events
set belloff="all"

" Specifies how keyword completion works with Ctrl+P or Ctrl+N are used
set complete=".,w,b,u,t"

" Give messages when adding a cscope database
set cscopeverbose

" List of directories for the swap file
set directory="~/.local/share/nvim/swap//"

" Change the way text is displayed
set display="lastline,msgsep"

" String encoding
set encoding="utf-8"

" Characters to fill the statuslines and vertical separators
set fillchars=""

" Describes how automatic formatting is done
set formatoptions="tcqj"

" Sets how many lines of history Vim has to remember
set history=10000

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Always show the status line
set laststatus=2

" Strings to use in \"list\" mode
set listchars="tab:> ,trail:-,nbsp:+"

" Which bases to be considered when using Ctrl+A and Ctrl+X
set nrformats="bin,hex"

" Show line and column number of cursor position
set ruler

" Changes the \"mksession\" command
set sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize"

" Read upon startup and written to when exiting
set shada="!,'100,<50,s10,h"

" Avoid all Enter prompts caused by file messages
set shortmess="filnxtToOF"

" Show (partial) commands in the last line of the screen
set showcmd

" Minimal number of columns to control horizontally
set sidescroll=1

" Inserts blanks according to \"shiftwidth\"
set smarttab

" Maximum number of tab pages to be opened by the \"-p\" argument
set tabpagemax=50

" Filenames for the \"tag\" command
set tags="./tags;,tags"

" Time in ms to wait for a key code sequence to complete
set ttimeoutlen=50

" List of directory names for undo files
set undodir="~/.local/nvim/undo"

" Turn on the Wild menu
set wildmenu

" List of words that change how command line completion is done
set wildoptions="pum,tagfile"
