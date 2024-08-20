return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-tree/nvim-web-devicons",
      dependencies = { "junegunn/fzf.vim" },
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end
    },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    { "<leader>fc", "<cmd>Telescope commands<cr>" },
    { "<leader>sf", "<cmd>Telescope live_grep<cr>" },
    { "<leader>bb", "<cmd>Telescope buffers<cr>" },
    { "<leader>dd", "<cmd>Telescope diagnostics<cr>" },
    { "<leader>ts", "<cmd>Telescope treesitter<cr>" },
    { "gr",         "<cmd>Telescope lsp_references<cr>" },
    { "gb",         "<cmd>Telescope git_branches<cr>" },
  },
  opts = function()
    local actions = require("telescope.actions")
    return {
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
          mappings = { i = { ["<c-d>"] = actions.delete_buffer, }, }
        },
      },
    }
  end,
}
