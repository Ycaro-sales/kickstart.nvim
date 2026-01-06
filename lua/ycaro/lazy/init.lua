return {
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'tpope/vim-dispatch',
  'tpope/vim-rsi',
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
  },
  {
    'mbbill/undotree',

    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end,
  },
  {
    'laytan/cloak.nvim',
    config = function()
      require('cloak').setup {
        enabled = true,
        cloak_character = '*',
        -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
        highlight_group = 'Comment',
        patterns = {
          {
            -- Match any file starting with ".env".
            -- This can be a table to match multiple file patterns.
            file_pattern = {
              '.env*',
              'wrangler.toml',
              '.dev.vars',
            },
            -- Match an equals sign and any character after it.
            -- This can also be a table of patterns to cloak,
            -- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
            cloak_pattern = '=.+',
          },
        },
      }
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>c', group = '[C]ode',     mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
  { 'williamboman/mason.nvim',  opts = {} },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'kawre/leetcode.nvim',
    lazy = true,
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    opts = {},
  },
}
