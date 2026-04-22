vim.opt.guicursor = ''

vim.o.clipboard = 'unnamedplus'
vim.g.have_nerd_font = true

vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.splitbelow = false
vim.opt.splitright = true

vim.opt.showmode = true

vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

vim.opt.timeoutlen = 300

vim.opt.splitright = true

vim.opt.inccommand = 'split'
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = '80'

vim.o.termguicolors = true
vim.o.conceallevel = 2

-- Experimental UI2: floating cmdline and messages
vim.o.cmdheight = 0
vim.o.foldlevel = 99

require('vim._core.ui2').enable({
  enable = true,
  msg = {
    targets = {
      [''] = 'msg',
      empty = 'cmd',
      bufwrite = 'msg',
      confirm = 'cmd',
      emsg = 'pager',
      echo = 'msg',
      echomsg = 'msg',
      echoerr = 'pager',
      completion = 'cmd',
      list_cmd = 'pager',
      lua_error = 'pager',
      lua_print = 'msg',
      progress = 'pager',
      rpc_error = 'pager',
      quickfix = 'msg',
      search_cmd = 'cmd',
      search_count = 'cmd',
      shell_cmd = 'pager',
      shell_err = 'pager',
      shell_out = 'pager',
      shell_ret = 'msg',
      undo = 'msg',
      verbose = 'pager',
      wildlist = 'cmd',
      wmsg = 'msg',
      typed_cmd = 'cmd',
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.3,
      timeout = 5000,
    },
    pager = {
      height = 0.5,
    },
  },
})
