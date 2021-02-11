" Search by filename instead of full path
let g:ctrlp_by_filename = 1

" Max window height of 15
let g:ctrlp_match_window = 'max:30'

" Disable setting local working directory
let g:ctrlp_working_path_mode = 0

" Scan for dotfiles and dotdirs
let g:ctrlp_show_hidden = 1

" Listing files instead of Vim's \"globpath()\"
let g:ctrlp_user_command = [
  \ '.git/'
  \ ]

" Allow files core type
let g:ctrlp_types = ['fil']

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'vendor':  '\v[\/](vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
