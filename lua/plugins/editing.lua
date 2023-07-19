return {
  -- editing
  'tpope/vim-repeat',
  {
    "andrewradev/inline_edit.vim", -- narrow region
    config = function()
      vim.g.inline_edit_autowrite = 1
      vim.keymap.set("v", "<leader>nr", ":InlineEdit<cr>")
    end
  },
  -- auto increment, vis & visincr
  'vim-scripts/vis',
  -- :B, :S
  'vim-scripts/VisIncr',
  -- :I, :I -1, :II, etc
  'jiangmiao/auto-pairs',
  'vim-scripts/swapcol.vim',

  -- conversion
  'tpope/vim-abolish',
  'tpope/vim-surround',
  -- 'scrooloose/nerdcommenter',
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup({
        -- Add a space b/w comment and the line
        padding = true,
        -- Whether the cursor should stay at its position
        sticky = true,
        mappings = {
          basic = true,
          extra = false,
        }
      })
    end
  },

  -- format
  'nvie/vim-rst-tables',
  {
    'dhruvasagar/vim-table-mode',
    config = function()
      vim.keymap.set("n", "<leader>tm", ":TableModeToggle<cr>")
    end
  },
  'godlygeek/tabular',

  -- information
  'tpope/vim-fugitive',
  {
    'RRethy/vim-illuminate',
    config = function()
      vim.keymap.set("n", "<leader>ll", ":IlluminateToggle<cr>")
    end
  },
  'bronson/vim-trailing-whitespace',
  { 'tversteeg/registers.nvim',  branch = 'main', },

  -- splitjoin
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {{ "gS", "<cmd>TSJToggle<cr>" }},
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
        max_join_length = 240,
        dot_repeat = true,
      })
    end,
  },

  -- selection
  {
    "gcmt/wildfire.vim",
    config = function()
      vim.g.wildfire_objects = { "iw", "i'", 'i"', "i)", "i]", "i}", "ip", "it" }
    end
  },
}