return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = { { "<leader>ee", "<cmd>NvimTreeToggle<cr>" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        auto_reload_on_write = true,
        update_focused_file = { enable = true },
        diagnostics = { enable = false, },
        actions = {
          open_file = { quit_on_open = true, },
        },
        update_cwd = true,
      })
      vim.cmd([[doautocmd NvimTree BufEnter *]])
    end
  },


  { -- edit file system in vim
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Oil" },
    opts = {},
  },
}
