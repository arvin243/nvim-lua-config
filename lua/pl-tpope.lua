return {
	{ "tpope/vim-repeat",   event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	-- { "kylechui/nvim-surround", event = "VeryLazy" },
	{ "tpope/vim-abolish",  event = "VeryLazy" }, -- change case, etc
	{ "tpope/vim-sleuth" },                      -- auto tab/indent
	-- git
	{ "tpope/vim-fugitive", event = { "BufReadPre", "BufNewFile" } },
}
