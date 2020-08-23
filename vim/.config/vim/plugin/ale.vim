" Set different highlights for the sign column
let g:ale_change_sign_column_color = 1

" Automatically close upon entering Insert mode
let g:ale_close_preview_on_insert = 1

" Enable completion support
let g:ale_completion_enabled = 1

" Automatically import completion results from external modules
let g:ale_completion_tsserver_autoimport = 1

" Go to next error
:nnoremap <silent> <C-k> :ALENext<cr>

" Go to previous error
:nnoremap <silent> <C-j> :ALEPrevious<cr>

" Map of completion types to symbols for completion
let g:ale_completion_symbols = {
  \ 'text': '',
  \ 'method': '',
  \ 'function': '',
  \ 'constructor': '',
  \ 'field': '',
  \ 'variable': '',
  \ 'class': '',
  \ 'interface': '',
  \ 'module': '',
  \ 'property': '',
  \ 'unit': 'v',
  \ 'value': 'v',
  \ 'enum': 't',
  \ 'keyword': 'v',
  \ 'snippet': 'v',
  \ 'color': 'v',
  \ 'file': 'v',
  \ 'reference': 'v',
  \ 'folder': 'v',
  \ 'enum_member': 'm',
  \ 'constant': 'm',
  \ 'struct': 't',
  \ 'event': 'v',
  \ 'operator': 'f',
  \ 'type_parameter': 'p',
  \ '<default>': 'v'
  \ }

" Maximum number of suggestions in completion menus
let g:ale_completion_max_suggestions = 30

" Message format for echoed messages
let g:ale_echo_msg_format = '[%linter%] %s %severity%'

" Fix files on save
let g:ale_fix_on_save = 1

" Map of file type to linter program
let g:ale_linters = {
  \ 'c': ['cppcheck', 'clang', 'gcc'],
  \ 'css': ['csslint', 'stylelint'],
  \ 'html': ['tidy', 'proselint'],
  \ 'java': ['javac', 'pmd'],
  \ 'javascript': ['eslint'],
  \ 'json': ['jsonlint'],
  \ 'markdown': ['proselint'],
  \ 'vim': ['vint'],
  \ 'go': ['gofmt', 'go vet', 'gopls'],
  \ }

" Only use linters from \"g:ale_linters\"
let g:ale_linters_explicit = 1

" Balloon messages will be shown for problems or hover info
let g:ale_set_balloons = 1

" Highlights will be set for problems
let g:ale_set_highlights = 1

" Sign column will be populated with signs marking where problems are
let g:ale_set_signs = 1

" Keep sign column even when there are not any warnings/errors
let g:ale_sign_column_always = 1

" Sign for warnings
let g:ale_sign_warning = ''

" Automatically determine flags to be set for compilers
let g:ale_c_parse_makefile = 1
