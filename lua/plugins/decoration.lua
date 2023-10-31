return {
  -- theme
  {
    -- 'srcery-colors/srcery-vim',
    "morhetz/gruvbox",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.cmd([[colorscheme gruvbox]])
    end
  },

  -- status bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { theme = 'gruvbox' },
      })
    end
  },

  -- welcome
  {
    "mhinz/vim-startify",
    config = function()
      vim.g.startify_change_to_dir = 0
      vim.g.startify_change_to_vcs_root = 1
      vim.g.startify_session_dir = '$HOME/.vim/sessions'
      vim.g.startify_files_number = 20
    end
  },

  -- { 'echasnovski/mini.nvim', version = false },

  -- signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      })
    end
  },
}
