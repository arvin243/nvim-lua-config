-- default: disable nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  auto_reload_on_write = true,
  update_focused_file = { enable = true },
  diagnostics = { enable = false, },
  actions = {
    open_file = { quit_on_open = true, }
  },
  update_cwd = true,
})
