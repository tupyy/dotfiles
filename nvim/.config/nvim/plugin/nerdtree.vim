" Natural sort (1, 10, 100, 2 -> 1, 2, 10, 100)
let NERDTreeNaturalSort = 1

" Which files NERDTree should ignore
let NERDTreeIgnore = [
  \ '\~$',
  \ '\.o$',
  \ '\.pyc$',
  \ '\.DS_Store$',
  \ '\.git$[[dir]]',
  \ '^node_modules$'
  \ ]

" Respect \"wildignore\"
let NERDTreeRespectWildIgnore = 1

" Close NERDTree after opening a file
let NERDTreeQuitOnOpen = 0

" Show hidden files
let NERDTreeShowHidden = 1

" Which side to display the NERDTree window
let g:NERDTreeWinPos = "left"

" Size of the NERDTree window
let g:NERDTreeWinSize = 40

" Disables the \"Bookmarks\" label \"Press ? for help\"
let NERDTreeMinimalUI = 1

" Delete the buffer if said file has been renamed or deleted
let NERDTreeAutoDeleteBuffer = 1

" Turn on Git status with flags
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeChDirMode = 1

" Highlight file names
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Git symbols for NERDTree
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

" Automatically open NERDTree on start
"autocmd VimEnter * if argc() == 1 | NERDTreeToggle % | wincmd p | endif

" Automatically close Vim if NERDTree is the last buffer
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
