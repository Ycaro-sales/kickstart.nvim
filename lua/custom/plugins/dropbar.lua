return {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		'nvim-telescope/telescope-fzf-native.nvim'
	},
	config = {
		function()
			vim.cmd [[highlight WinBar guibg=NONE]]
			vim.cmd [[highlight WinBarNC guibg=NONE]]
		end

	}


}
