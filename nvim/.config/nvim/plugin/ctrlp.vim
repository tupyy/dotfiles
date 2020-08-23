" Search by filename instead of full path
let g:ctrlp_by_filename = 1

" Max window height of 15
let g:ctrlp_match_window = 'max:15'

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
