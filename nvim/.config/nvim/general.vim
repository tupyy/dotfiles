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

" Use spaces instead of tabs
set expandtab

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

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "gopls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
