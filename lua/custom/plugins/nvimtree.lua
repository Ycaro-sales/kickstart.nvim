return { -- disable netrw at the very start of your init.lua
  'nvim-tree/nvim-tree.lua',
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      renderer = {
        group_empty = true,
      },
      filters = {},
      git = {
        ignore = false,
      },
    })
  end
}
