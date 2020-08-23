" Disable highlight when <leader><space> is pressed
map <silent> <leader><space> :noh<CR>

" Useful mappings for managing windows
map vs :vsplit
map sp :split

" Vertically resize the current window
map vr :vertical resize

" Move between splits
nmap <C-Right> <C-W><C-L>
nmap <C-Left> <C-W><C-H>
nmap <C-Up> <C-W><C-K>
nmap <C-Down> <C-W><C-J>

" Remap Vim 0 to first non-blank character
map 0 ^

" Move the current line up or down
nmap <silent> <Esc>j mz:m+<CR>`z
nmap <silent> <Esc>k mz:m-2<CR>`z
vmap <silent> <Esc>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <silent> <Esc>k :m'<-2<cr>`>my`<mzgv`yo`z

" NerdTree
nmap <C-n> :NERDTreeToggle %<CR>

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

" UltiSnips
map <leader>u :UltiSnipsEdit<CR>

" Move to next ALE issue
nmap <silent> <F2> <Plug>(ale_next_wrap)

" Expand or shrink the current region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Source Vim
nnoremap <leader>sv :source %<CR>

" Change tab with <Tab>
:map <Tab> :bnext <cr>
:map <S-Tab> :bprev <cr>

"snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" GOLang
imap <F8> <esc>:DlvAddBreakpoint<CR>
vmap <F8> <esc>:DlvAddBreakpoint<CR>
nmap <F8> :DlvAddBreakpoint<CR>

imap <F9> <esc>:DlvClearAll<CR>
vmap <F9> <esc>:DlvClearAll<CR>
nmap <F9> :DlvClearAll<CR>

imap <F7> <esc>:DlvDebug<CR>
vmap <F7> <esc>:DlvDebug<CR>
nmap <F7> :DlvDebug<CR>

" F2 to save
imap <F2> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
nmap <F2> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
vmap <F2> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
