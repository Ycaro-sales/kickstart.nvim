return {
  'echasnovski/mini.sessions',
  version = '*',
  config = function()
    local function get_session_name()
      local name = 'Session'
      local branch = vim.trim(vim.fn.system 'git branch --show-current')

      branch = branch:gsub('/', '_')
      branch = branch:gsub('-', '_')

      if vim.v.shell_error == 0 then
        return name .. '_' .. branch .. '.vim'
      else
        return name .. '.vim'
      end
    end
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }
    require('mini.sessions').setup {
      -- Whether to read default session if Neovim opened without file arguments
      autoread = false,

      -- Whether to write currently read session before quitting Neovim
      autowrite = true,

      -- Directory where global sessions are stored (use `''` to disable)
      directory = '',

      -- File for local session (use `''` to disable)
      file = get_session_name(),

      -- Whether to force possibly harmful actions (meaning depends on function)
      force = { read = true, write = true, delete = true },

      -- Hook functions for actions. Default `nil` means 'do nothing'.
      hooks = {
        -- Before successful action
        pre = { read = nil, write = nil, delete = nil },
        -- After successful action
        post = { read = nil, write = nil, delete = nil },
      },

      -- Whether to print session path after action
      verbose = { read = true, write = true, delete = true },
    }

    vim.keymap.set('n', '<leader>sl', function()
      MiniSessions.read(get_session_name())
    end)

    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        MiniSessions.write(get_session_name())
      end,
    })
  end,
}
