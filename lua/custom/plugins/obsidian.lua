return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
			{
				name = "work",
				path = "~/vaults/work",
			},
		},
		notes_subdir = "notes",
	},
	completion = {
		-- If using nvim-cmp, otherwise set to false
		nvim_cmp = true,
		-- Trigger completion at 2 chars
		min_chars = 2,
		-- Where to put new notes created from completion. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "current_dir",

		-- Control how wiki links are completed with these options:

		-- Whether to add the note ID during completion.
		-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
		-- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
		prepend_note_id = true,

		-- Whether to add the note path during completion.
		-- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
		-- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
		prepend_note_path = false,

		-- Whether to only use paths during completion.
		-- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
		-- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
		use_path_only = false,
	},

	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		-- Toggle check-boxes.
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},
}
