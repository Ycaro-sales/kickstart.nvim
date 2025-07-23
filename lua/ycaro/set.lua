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
