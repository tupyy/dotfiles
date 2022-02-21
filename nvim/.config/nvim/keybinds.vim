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

" Move the current line up or down
nmap <silent> <Esc>j mz:m+<CR>`z
nmap <silent> <Esc>k mz:m-2<CR>`z
vmap <silent> <Esc>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <silent> <Esc>k :m'<-2<cr>`>my`<mzgv`yo`z

" Fern
nmap <C-n> :Fern . -drawer -toggle -reveal=%<CR>
nmap <C-h> :Files<CR>

"float term
nmap <leader>ft :FloatermNew --height=0.8 --width=0.8 --wintype=float<CR>

" LSP
nmap <leader>p :lua vim.lsp.diagnostic.goto_prev()<CR>
nmap <leader>n :lua vim.lsp.diagnostic.goto_next()<CR>'

" Tagbar
nmap <leader>tt :TagbarToggle<CR>

" Close window
nmap <leader>cw :close<CR>

" Shot todos
noremap <Leader>r :noautocmd vimgrep /TODO/j **/*.go<CR>:cw<CR>

"Telescope
noremap <Leader>tl :Telescope<CR>

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

" F3 BufOnly
imap <F3> <esc>:w<CR>:BufOnly!<CR>
nmap <F3> <esc>:w<CR>:BufOnly!<CR>
vmap <F3> <esc>:w<CR>:BufOnly!<CR>

" Term
" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(30)<CR>
inoremap <A-t> <Esc>:call TermToggle(30)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(30)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Harpoon
nmap <leader>m :lua require("harpoon.mark").add_file()<CR>
nmap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<CR>

" Telescope
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
