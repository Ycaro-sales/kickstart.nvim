local trigger_text = ';'

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
          'arduino_language_server',
          'clangd',
          'basedpyright',
        },
      }

      vim.lsp.config('basedpyright', {
        settings = {
          basedpyright = {
            analysis = {
              -- typeCheckingMode = 'recommended',
              -- typeCheckingMode = 'basic',
              typeCheckingMode = 'standard',
              diagnosticServerOverrides = {
                reportUnusedExpression = 'none',
              },

              -- typeCheckingMode = 'strict',
              inlayHints = {
                callArgumentNames = true,
                genericTypes = true,
              },
            },
          },
        },
      })

      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'Lua 5.1' },
            diagnostics = {
              globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
            },
          },
        },
      })

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
        virtual_text = {
          current_line = false,
        },
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
      keymap = {
        preset = 'default',
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      completion = {
        trigger = { show_on_insert_on_trigger_character = true },
        documentation = { auto_show = true },
        list = { selection = { preselect = true, auto_insert = false } },
        ghost_text = { enabled = false },
        menu = {
          auto_show = true,
          draw = {
            treesitter = { 'lsp' },
            columns = {
              { 'kind_icon', gap = 1, 'label' },
              { 'kind', 'label_description' },
            },
          },
        },
      },
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lsp = {
            score_offset = 90,
          },
          snippets = {
            name = 'snippets',
            enabled = true,
            max_items = 3,
            min_keyword_length = 2,
            module = 'blink.cmp.sources.snippets',
            score_offset = 100,
            -- should_show_items = function()
            --   local col = vim.api.nvim_win_get_cursor(0)[2]
            --   local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
            --   return before_cursor:match(trigger_text .. '%w*$') ~= nil
            -- end,
            -- transform_items = function(_, items)
            --   local line = vim.api.nvim_get_current_line()
            --   local col = vim.api.nvim_win_get_cursor(0)[2]
            --   local before_cursor = line:sub(1, col)
            --   local start_pos, end_pos = before_cursor:find(trigger_text .. '[^' .. trigger_text .. ']*$')
            --   if start_pos then
            --     for _, item in ipairs(items) do
            --       if not item.trigger_text_modified then
            --         ---@diagnostic disable-next-line: inject-field
            --         item.trigger_text_modified = true
            --         item.textEdit = {
            --           newText = item.insertText or item.label,
            --           range = {
            --             start = { line = vim.fn.line '.' - 1, character = start_pos - 1 },
            --             ['end'] = { line = vim.fn.line '.' - 1, character = end_pos },
            --           },
            --         }
            --       end
            --     end
            --   end
            --   return items
            -- end,
          },
        },
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
        mode = 'n',
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
