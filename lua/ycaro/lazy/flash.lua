-- Navigation with jump motions.
return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      jump = { nohlsearch = true },
      prompt = {
        win_config = {
          border = 'none',
          -- Place the prompt above the statusline.
          row = -3,
        },
      },
      search = {
        exclude = {
          'flash_prompt',
          'qf',
          function(win)
            -- Non-focusable windows.
            return not vim.api.nvim_win_get_config(win).focusable
          end,
        },
      },
      modes = {
        search = { enabled = false },
        char = {
          enabled = false
        }
      },
    },
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      {
        "<c-space>",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter({
            actions = {
              ["<c-space>"] = "next",
              ["<BS>"] = "prev"
            }
          })
        end,
      },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
}
