return {
	"nvim-telescope/telescope.nvim",
	requires = {
		"folke/trouble"
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local trouble = require("trouble.sources.telescope")


		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-t>"] = trouble.open,
					},
					n = {
						["<C-t>"] = trouble.open,
					},

				}
			}
		})
	end
}
