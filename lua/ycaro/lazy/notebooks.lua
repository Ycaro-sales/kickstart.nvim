return {
  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local otter = require 'otter'
      otter.setup()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
        pattern = { '*.md' },
        callback = function(ev)
          otter.activate()
        end,
      })
    end,
  },
  {
    '3rd/image.nvim', -- display images in kitty terminal
    dependencies = {
      'vhyrro/luarocks.nvim',
      priority = 1001,
      opts = {
        rocks = { 'magick' },
      },
    },
    opts = {
      backend = 'kitty',
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
        },
      },
      max_width = 300,
      max_height = 300,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'noice', '' },
    },
  },
  {
    'benlubas/molten-nvim',
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    dependencies = {
      '3rd/image.nvim',
      'GCBallesteros/jupytext.nvim',
      'quarto-dev/quarto-nvim',
    },
    build = ':UpdateRemotePlugins',
    init = function()
      -- these are examples, not defaults. Please see the readme
      -- -- local quarto = require("quarto")
      local quarto = require 'quarto'

      quarto.setup {
        lspFeatures = {
          -- NOTE: put whatever languages you want here:
          languages = { 'r', 'python', 'rust' },
          chunks = 'all',
          diagnostics = {
            enabled = true,
            triggers = { 'BufWritePost' },
          },
          completion = {
            enabled = true,
          },
        },
        keymap = {
          -- NOTE: setup your own keymaps:
          hover = 'K',
          definition = 'gd',
          rename = 'grn',
          references = 'grr',
          format = '<leader>pf',
        },
        codeRunner = {
          enabled = true,
          default_method = 'molten',
        },
      }

      vim.g.molten_auto_open_output = false

      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_wrap_output = true

      vim.g.molten_output_win_max_height = 20
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
    end,
  },
  {
    'GCBallesteros/jupytext.nvim',
    config = function()
      require('jupytext').setup {
        style = 'markdown',
        output_extension = 'md', -- Default extension. Don't change unless you know what you are doing
        force_ft = 'markdown',
      }
    end,
    lazy = false,
  },
}
