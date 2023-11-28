return {
	"theprimeagen/refactoring.nvim",
	config = function()
		require('refactoring').setup({})
		-- load refactoring Telescope extension
		require("telescope").load_extension("refactoring")

		vim.keymap.set(
			{ "n", "x" },
			"<leader>rr",
			function() require('telescope').extensions.refactoring.refactors() end
		)
	end
}
