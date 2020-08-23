let mapleader=","
:map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Disable highlight when <leader><space> is pressed
map <silent> <leader><space> :noh<CR>

" F2 to save
imap <F2> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
vmap <F2> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
nmap <F2> :w<CR>:echo expand("%f") . " saved."<CR>

" F3 to save
imap <F3> <esc>:wq<CR>:echo expand("%f") . " saved."<CR>
vmap <F3> <esc>:wq<CR>:echo expand("%f") . " saved."<CR>
nmap <F3> :wq<CR>:echo expand("%f") . " saved."<CR>

" Close buffer without closing the split
nmap ,d :b#<bar>bd#<CR>

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

:nnoremap <F5> :buffers<CR>:buffer<Space>
:map <Tab> :bnext <cr>
:map <S-Tab> :bprev <cr>
set wildchar=<Tab> wildmenu wildmode=full

" map change split keys
nmap <C-Right> <C-W><C-L>
nmap <C-Left> <C-W><C-H>
nmap <C-Up> <C-W><C-K>

