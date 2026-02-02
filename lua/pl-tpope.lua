return {
	{ "tpope/vim-abolish",  event = "VeryLazy" },                     -- change case, etc
	{ "tpope/vim-sleuth" },                                           -- auto tab/indent
	{ "tpope/vim-fugitive", event = { "BufReadPre", "BufNewFile" } }, -- git
}
