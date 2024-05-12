return {
	'saecki/crates.nvim',
	tag = 'stable',
	config = function()
		local autocmd = vim.api.nvim_create_autocmd

		require('crates').setup()
		autocmd('filetype', {
			pattern = 'toml',
			callback = function()
				local crates = require('crates')

				vim.keymap.set('n', '<leader>ct', crates.toggle, { silent = true, desc = 'Toggle crates.nvim' })
				vim.keymap.set('n', '<leader>cr', crates.reload, { silent = true, desc = 'Reload crates.nvim' })

				vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, { silent = true, desc = 'Show versions popup' })
				vim.keymap.set('n', '<leader>cf', crates.show_features_popup, { silent = true, desc = 'Show features popup' })
				vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup,
					{ silent = true, desc = 'Show dependencies popup' })

				vim.keymap.set('n', '<leader>ce', crates.expand_plain_crate_to_inline_table,
					{ silent = true, desc = 'Expand plain crate to inline table' })
				vim.keymap.set('n', '<leader>cE', crates.extract_crate_into_table,
					{ silent = true, desc = 'Extract crate into table' })

				vim.keymap.set('n', '<leader>cu', crates.update_crate, { silent = true, desc = 'Update crate' })
				vim.keymap.set('v', '<leader>cu', crates.update_crates, { silent = true, desc = 'Update crates' })
				vim.keymap.set('n', '<leader>ca', crates.update_all_crates, { silent = true, desc = 'Update all crates' })
				vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, { silent = true, desc = 'Upgrade crate' })
				vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, { silent = true, desc = 'Upgrades crate' })
				vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, { silent = true, desc = 'Upgrade all crates' })

				vim.keymap.set('n', '<leader>cH', crates.open_homepage, { silent = true, desc = 'Open homepage' })
				vim.keymap.set('n', '<leader>cR', crates.open_repository, { silent = true, desc = 'Open repository' })
				vim.keymap.set('n', '<leader>cD', crates.open_documentation, { silent = true, desc = 'Open documentation' })
				vim.keymap.set('n', '<leader>cC', crates.open_crates_io, { silent = true, desc = 'Open crates io' })
			end
		}
		)
	end,
}
