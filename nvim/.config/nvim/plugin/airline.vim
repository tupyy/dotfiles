" Turn Powerline fonts on
let g:airline_powerline_fonts = 1

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'dracula'

" Turn off spelling piece
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Do not draw separators for empty sections
let g:airline_skip_empty_sections = 1
let w:airline_skip_empty_sections = 1

" Caches the changes to the highlighting groups, should be faster
let g:airline_highlighting_cache = 1

" Skip displaying file format output
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'

" Tagbar, filetype, virtualenv
let g:airline_section_x = ''

" File encoding, file format
let g:airline_section_y = '%3l/%L'

" Percentage, line number, column number
let g:airline_section_z = '%3v'

let g:airline_extensions = [
  \ 'ale',
  \ 'branch',
  \ 'coc',
  \ 'csv',
  \ 'ctrlp',
  \ 'hunks',
  \ 'undotree',
  \ 'vimtex',
  \ 'whitespace'
  \ ]

hi Normal             ctermbg=NONE
