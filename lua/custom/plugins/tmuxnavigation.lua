return {
	'christoomey/vim-tmux-navigator',
	config = function()
		vim.keymap.set('n', '<c-h>', '<Cmd>TmuxNavigateLeft<CR>')
		vim.keymap.set('n', '<c-j>', '<Cmd>TmuxNavigateDown<CR>')
		vim.keymap.set('n', '<c-k>', '<Cmd>TmuxNavigateUp<CR>')
		vim.keymap.set('n', '<c-l>', '<Cmd>TmuxNavigateRight<CR>')
	end

}

