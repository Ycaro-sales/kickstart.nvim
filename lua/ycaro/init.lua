require 'ycaro.set'
require 'ycaro.remap'
require 'ycaro.lazy_init'

vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/neovim/bin/python3'

-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   pattern = '*',
--   callback = function()
--     vim.cmd [[hi WinBar guibg=NONE]]
--     vim.cmd [[hi WinBarNC guibg=NONE]]
--   end,
-- })
--
vim.cmd("packadd nvim.undotree")

vim.keymap.set("n", "<leader>u", function()
  require("undotree").open({
    command = math.floor(vim.api.nvim_win_get_width(0) / 4) .. "vnew",
  })
end, { desc = "[U]ndotree toggle" })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(e)
    local opts = { buffer = e.buf }
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[LSP] Go to definition' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[LSP] Go to declaration' })
    vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = '[LSP] Go to References' })

    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = '[LSP] Open floating diagnostic message' })

    local client = vim.lsp.get_client_by_id(e.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, e.buf) then
      vim.keymap.set('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = e.buf })
      end)
    end
  end,
})
