return {
  -- {
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   config = function()
  --     require('nvim-autopairs').setup {}
  --   end,
  -- },
  {
    'kylechui/nvim-surround',
    version = '*',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
  {
    'Wansmer/treesj',
    config = function()
      require('treesj').setup {
        use_default_keymaps = false,
        max_join_length = 300,
      }
      vim.keymap.set('n', '<leader>.', '<cmd>TSJToggle<CR>', { desc = 'TSJ toggle' })
    end,
  },
  {
    'abecodes/tabout.nvim',
    lazy = false,
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>',
        backwards_tabkey = '<S-Tab>',
        act_as_tab = false,
        act_as_shift_tab = false,
        default_tab = '<C-t>',
        default_shift_tab = '<C-d>',
        enable_backwards = true,
        completion = false,
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' },
        },
        ignore_beginning = true,
        exclude = {},
      }
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'L3MON4D3/LuaSnip',
    },
    opt = true,
    event = 'InsertCharPre',
    priority = 1000,
  },
}
