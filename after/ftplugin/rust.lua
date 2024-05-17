local bufnr = vim.api.nvim_get_current_buf()

local nmap = function(keys, func, desc)
	if desc then
		desc = 'LSP: ' .. desc
	end

	vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
nmap('<leader>ss', require('telescope.builtin').lsp_document_symbols, '[S]earch [S]ymbols')
nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

-- See `:help K` for why this eymap

local function show_documentation()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ 'vim', 'help' }, filetype) then
		vim.cmd('h ' .. vim.fn.expand('<cword>'))
	elseif vim.tbl_contains({ 'man' }, filetype) then
		vim.cmd('Man ' .. vim.fn.expand('<cword>'))
	elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
		require('crates').show_popup()
	else
		vim.lsp.buf.hover()
	end
end

nmap('K', show_documentation, 'Hover Documentation')
-- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
nmap('<C->', vim.lsp.buf.signature_help, 'Signature Documentation')

-- Lesser used LSP functionality
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
nmap('<leader>wl', function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')

-- Create a command `:Format` local to the LSP buffer
vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
	vim.lsp.buf.format()
end, { desc = 'Format current buffer with LSP' })
