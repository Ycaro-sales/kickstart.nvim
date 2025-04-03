return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'stevearc/conform.nvim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'L3MON4D3/LuaSnip',
      'j-hui/fidget.nvim',
      'saghen/blink.cmp',
    },

    config = function()
      require('fidget').setup {}
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'rust_analyzer',
          'gopls',
          'clangd',
          'basedpyright',
        },
        handlers = {
          function(server_name) -- default handler (optional)
            local capabilities = require('blink-cmp').get_lsp_capabilities()
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
            }
          end,

          zls = function()
            local lspconfig = require 'lspconfig'
            lspconfig.zls.setup {
              root_dir = lspconfig.util.root_pattern('.git', 'build.zig', 'zls.json'),
              settings = {
                zls = {
                  enable_inlay_hints = true,
                  enable_snippets = true,
                  warn_style = true,
                },
              },
            }
            vim.g.zig_fmt_parse_errors = 0
            vim.g.zig_fmt_autosave = 0
          end,
          ['lua_ls'] = function()
            local capabilities = require('blink-cmp').get_lsp_capabilities()
            local lspconfig = require 'lspconfig'
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = { version = 'Lua 5.1' },
                  diagnostics = {
                    globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
                  },
                },
              },
            }
          end,
        },
      }

      vim.diagnostic.config {
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = 'minimal',
          border = 'rounded',
          source = true,
          header = '',
          prefix = '',
        },
  -- Alternatively, customize specific options
  -- virtual_lines = {
  --  -- Only show virtual line diagnostics for the current cursor line
  --  current_line = true,
  -- },
      }
    end,
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      'saghen/blink.compat',
      'jalvesaq/cmp-nvim-r',
      'L3MON4D3/LuaSnip',
      'j-hui/fidget.nvim',
    },

    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      keymap = { preset = 'super-tab' },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      completion = {
        trigger = { show_on_insert_on_trigger_character = true },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        list = { selection = { preselect = true, auto_insert = false } },
        ghost_text = { enabled = true },
        menu = {
          auto_show = true,
          draw = {
            treesitter = { 'lsp' },
            columns = {
                { 'kind_icon', gap = 1, 'label' },
                { 'label_description' },
            },
          },
        },
      },
      snippets = {preset = 'luasnip'},
      sources = {
        default = { 'lsp', 'path', 'buffer' },
        providers = {},
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>pf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
}
