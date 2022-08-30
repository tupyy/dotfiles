source ~/.config/nvim/plugins.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/keybinds.vim
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/plugin/lua-lsp.vim

if !has('nvim')
	source ~/.config/nvim/vim_specific.vim

    require('telescope').load_extension('gh')
endif
