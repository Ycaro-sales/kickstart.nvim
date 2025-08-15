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
}
