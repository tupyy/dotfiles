source ~/.config/nvim/plugins.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/keybinds.vim
source ~/.config/nvim/lsp.vim

if !has('nvim')
	source ~/.config/nvim/vim_specific.vim
endif
