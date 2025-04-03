vim.lsp.config('*', {
  root_markers = { '.git' },
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },
})

local servers = {
  'clangd',
  'basedpyright',
  'clangd',
  'gopls',
  'lua_ls',
  'rust_analyzer',
}

vim.lsp.enable(servers)

