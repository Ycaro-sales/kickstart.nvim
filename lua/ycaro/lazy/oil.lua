return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      columns = {
        'icon',
        -- 'permissions',
        -- "size",
        -- "mtime",
      },
      -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
      delete_to_trash = true,
      -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
      skip_confirm_for_simple_edits = false,
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = 'actions.select_vsplit',
        ['<C-h>'] = 'actions.select_split',
        ['<C-t>'] = 'actions.select_tab',
        ['<c-p>'] = {
          callback = function()
            require('telescope.builtin').find_files()
          end,
        },
        ['<leader>f'] = {
          callback = function()
            require('telescope.builtin').git_files()
          end,
        },
        ['<leader>sg'] = {
          callback = function()
            require('telescope.builtin').live_grep()
          end,
        },
        ['<leader>sr'] = {
          callback = function()
            require('telescope.builtin').resume()
          end,
        },
        ['<leader>sh'] = {
          callback = function()
            require('telescope.builtin').help_tags()
          end,
        },
        ['<C-c>'] = 'actions.close',
        ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      use_default_keymaps = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, '.')
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
    }
  end,

  mappings = {
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
  },
}
