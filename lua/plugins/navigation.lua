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
      local builtin = require('telescope.builtin')
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>sf", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>dd', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})
      vim.keymap.set("n", "gr", builtin.lsp_references, {})
      vim.keymap.set("n", "gb", builtin.git_branches, {})

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
