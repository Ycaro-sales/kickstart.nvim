return {
  {
    'preservim/vim-markdown', -- conceal markdown links
  },
  {
    'tadmccorkle/markdown.nvim', -- follow links (C-Enter)
    ft = 'markdown',
    opts = {
      mappings = { link_follow = '<C-Enter>' },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim', -- another markdown beautifier
    main = 'render-markdown',
    opts = {
      anti_conceal = {
        enabled = true,
      },
      checkbox = {
        enabled = true,
      },
      latex = { enabled = true },
    },

    name = 'render-markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  },
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup {
        filetype = { 'markdown', 'conf' },
      }
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
}
