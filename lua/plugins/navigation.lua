return {
  "christoomey/vim-tmux-navigator",

  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        dependencies = { "junegunn/fzf.vim" },
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end
      },
    },
    config = function()
      local keymap = vim.keymap
      local builtin = require('telescope.builtin')
      keymap.set('n', '<leader>ff', builtin.find_files, {})
      keymap.set("n", "<leader>fg", builtin.live_grep, {})
      keymap.set('n', '<leader>fb', builtin.buffers, {})
      keymap.set('n', '<leader>fh', builtin.help_tags, {})

      keymap.set("n", "<leader>sf", builtin.live_grep, {})
      keymap.set("n", "<leader>bb", builtin.buffers, {})
      keymap.set('n', '<leader>dd', builtin.diagnostics, {})
      keymap.set('n', '<leader>ts', builtin.treesitter, {})
      keymap.set("n", "gr", builtin.lsp_references, {})
      keymap.set("n", "gb", builtin.git_branches, {})

      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--fixed-strings",
            "--smart-case",
            "--trim",
          },
          layout_config = {
            width = 0.8,
            height = 0.8,
          },
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        },
        pickers = {
          buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
            }
          },
        },
      })
    end
  }
}
