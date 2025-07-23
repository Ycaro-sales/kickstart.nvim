return {
  {
    'NStefan002/screenkey.nvim', -- show keys pressed (:Screenkey)
    cmd = 'Screenkey',
    config = true,
  },
  {
    'kylechui/nvim-surround',
    version = '^3.0.0', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  --
  -- {
  --
  --   'altermo/ultimate-autopair.nvim',
  --   event = { 'InsertEnter', 'CmdlineEnter' },
  --   branch = 'v0.6', --recommended as each new version will have breaking changes
  --   opts = {},
  -- },
  {
    'RRethy/nvim-treesitter-endwise',
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
    'kawre/neotab.nvim',
    event = 'InsertEnter',
    opts = {
      -- configuration goes here
    },
  },
  -- {
  --   'abecodes/tabout.nvim',
  --   lazy = false,
  --   config = function()
  --     require('tabout').setup {
  --       tabkey = '<Tab>',
  --       backwards_tabkey = '<S-Tab>',
  --       act_as_tab = true,
  --       act_as_shift_tab = true,
  --       default_tab = '<C-t>',
  --       default_shift_tab = '<C-d>',
  --       enable_backwards = true,
  --       completion = false,
  --       tabouts = {
  --         { open = "'", close = "'" },
  --         { open = '"', close = '"' },
  --         { open = '`', close = '`' },
  --         { open = '(', close = ')' },
  --         { open = '[', close = ']' },
  --         { open = '{', close = '}' },
  --       },
  --       ignore_beginning = true,
  --       exclude = {},
  --     }
  --   end,
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'L3MON4D3/LuaSnip',
  --   },
  --   opt = true,
  --   event = 'InsertCharPre',
  --   priority = 1000,
  -- },
  {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end,
      }
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set('n', '<leader>sd', '<cmd>AerialToggle!<CR>')
    end,
  },
}
