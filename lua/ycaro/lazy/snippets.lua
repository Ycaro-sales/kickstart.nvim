return {
  'L3MON4D3/LuaSnip',
  -- follow latest release.
  version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',

  dependencies = { 'rafamadriz/friendly-snippets' },

  config = function()
    local ls = require 'luasnip'
    require('luasnip.loaders.from_vscode').lazy_load()

    ls.filetype_extend('dart', { 'flutter' })
    ls.filetype_extend('javascript', { 'jsdoc' })

    blink = require 'blink-cmp'

    vim.keymap.set({ 'i', 's' }, '<C-E>', function()
      blink.hide()
      if ls.choice_active() then
        ls.change_choice(1)
      else
        ls.expand()
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-n>', function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-p>', function()
      ls.jump(-1)
    end, { silent = true })
  end,
}
