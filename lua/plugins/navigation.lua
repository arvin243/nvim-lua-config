return {
  "christoomey/vim-tmux-navigator",

  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function() require("telescope").load_extension("fzf") end,
      },
    },
    config = function()
      local telescope = require('telescope.builtin')
      vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
      vim.keymap.set("n", "<leader>sf", telescope.live_grep, {})
      vim.keymap.set("n", "<leader>bb", telescope.buffers, {})
      vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
      vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
      vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
      vim.keymap.set('n', '<leader>dd', telescope.diagnostics, {})
      vim.keymap.set('n', '<leader>ts', telescope.treesitter, {})
      vim.keymap.set("n", "gr", telescope.lsp_references, {})
      vim.keymap.set("n", "gb", telescope.git_branches, {})

      require('telescope').setup {
        defaults = {
          mappings = {
            n = { ['<c-d>'] = require('telescope.actions').delete_buffer },
            i = { ['<c-d>'] = require('telescope.actions').delete_buffer },
          },
        },
      }
    end
  },
}
