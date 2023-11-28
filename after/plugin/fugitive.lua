local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = ThePrimeagen_Fugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }

		opts.desc = 'Git [P]ush'
		vim.keymap.set("n", "<leader>p", function()
			vim.cmd.Git('push')
		end, opts)

		-- rebase always
		opts.desc = 'Git [P]ull'
		vim.keymap.set("n", "<leader>P", function()
			vim.cmd.Git({ 'pull', '--rebase' })
		end, opts)

		-- NOTE: It allows me to easily set the branch i am pushing and any tracking
		-- needed if i did not set the branch up correctly
		opts.desc = 'Git Push Branch'
		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);

		opts.desc = 'Git [F]etch'
		vim.keymap.set("n", "<leader>f", ":Git fetch<cr>", opts);

		opts.desc = 'Git [B]ranch'
		vim.keymap.set("n", "<leader>b", ":Flog<cr>", opts);

		opts.desc = 'Git [B]ranch Split'
		vim.keymap.set("n", "<leader>B", ":Flogspilt<cr>", opts);
	end,
})
