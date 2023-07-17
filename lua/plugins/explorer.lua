return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<cr>")

      require("nvim-tree").setup({
        auto_reload_on_write = true,
        update_focused_file = { enable = true },
        diagnostics = { enable = false, },
        actions = {
          open_file = { quit_on_open = true, }
        },
        update_cwd = true,
      })
      vim.cmd([[doautocmd NvimTree BufEnter *]])
    end
}