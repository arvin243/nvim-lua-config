local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  require("plugins.decoration"),
  require("plugins.editing"),

  -- syntax
  require("plugins.treesitter"),
  -- "p00f/nvim-ts-rainbow", -- rainbow bracket

  require("plugins.lsp"),

  -- completion
  require("plugins.cmp"),
  -- "L3MON4D3/LuaSnip", -- snippets engine, otherwise auto-completion will fail
  -- "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  require("plugins.copilot"),

  require("plugins.navigation"),
  require("plugins.explorer"),
  require("plugins.languages"),

  -- others
  -- require("plugins.wilder"),
})
