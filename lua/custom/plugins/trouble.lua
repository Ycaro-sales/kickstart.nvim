return {
	"folke/trouble.nvim",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=false win.position=right<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
	opts = {}, -- for default options, refer to the configuration section for custom setup.
}

-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Opens trouble" })
-- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
--   { desc = "Trouble workspace diagnostics" })
-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
--   { desc = "trouble document diagnostics" })
-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end,
--   { desc = "Trouble quickfix list" })
-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Trouble loclist" })
