return {
	-- theme
	{
		"morhetz/gruvbox",
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.g.gruvbox_contrast_dark = "hard"
			vim.g.gruvbox_transparent_bg = "1"
			vim.cmd("colorscheme gruvbox")
			vim.cmd("highlight Normal guibg=None ctermbg=None")
		end,
	},

	-- status bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = { theme = "gruvbox" },
			})
		end,
	},

	-- { "echasnovski/mini.nvim", version = false },

	-- signs
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},

	-- welcome
	{
		"mhinz/vim-startify",
		config = function()
			vim.g.startify_change_to_dir = 0
			vim.g.startify_change_to_vcs_root = 1
			vim.g.startify_files_number = 20
			-- vim.g.startify_session_dir = "$HOME/.config/nvim/"
		end,
	},
	-- {
	--   "nvimdev/dashboard-nvim",
	--   event = "UIEnter",
	--   config = function()
	--     require('dashboard').setup {
	--       theme = "hyper",
	--       shortcut_type = "number",
	--       change_to_vcs_root = true,
	--       config = {
	--         -- week_header = { enable = true },
	--         mru = { limit = 10, icon = 'MRU', label = '', cwd_only = false },
	--         project = { enable = true, limit = 10, icon = 'Proj', label = '', action = 'Telescope find_files cwd=' },
	--         shortcut = {
	--           { desc = 'LazyUpdate', group = 'Include',  action = 'Lazy update',          key = 'u', },
	--           { desc = 'Mason',      group = 'Include',  action = 'Mason',                key = 'm', },
	--           { desc = 'Files',      group = 'Function', action = 'Telescope find_files', key = 'f', },
	--           { desc = 'Grep',       group = 'Function', action = 'Telescope live_grep',  key = 'g', },
	--         },
	--       },
	--     }
	--   end,
	--   dependencies = {
	--     'nvim-tree/nvim-web-devicons',
	--     "nvim-telescope/telescope.nvim",
	--   },
	-- },
}
