-- auto install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- sync plugins when save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- appearance
  use {
    'srcery-colors/srcery-vim',
    'morhetz/gruvbox',

    'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' }, -- status bar

    'mhinz/vim-startify',
  }

  -- editing
  use {
    'tpope/vim-repeat',
    'andrewradev/inline_edit.vim', -- narrow region
    -- auto increment, vis & visincr
    'vim-scripts/vis',
    -- :B, :S
    'vim-scripts/VisIncr',
    -- :I, :I -1, :II, etc
    'gcmt/wildfire.vim',
    'jiangmiao/auto-pairs',

    { 'AndrewRadev/splitjoin.vim', branch = 'main', },
    'vim-scripts/swapcol.vim',

    -- conversion
    'tpope/vim-abolish',
    'tpope/vim-surround',
    "numToStr/Comment.nvim",
    -- 'scrooloose/nerdcommenter',

    -- format
    'nvie/vim-rst-tables',
    'dhruvasagar/vim-table-mode',
    'godlygeek/tabular',

    -- information
    "lewis6991/gitsigns.nvim",
    'tpope/vim-fugitive',
    'RRethy/vim-illuminate',
    'bronson/vim-trailing-whitespace',
    { 'tversteeg/registers.nvim',  branch = 'main', },
  }


  -- syntax & autocomplete
  use {
    -- treesitter
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow", -- rainbow bracket

    -- lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", -- a bridge between mason.nvim and lspconfig
    "neovim/nvim-lspconfig",

    {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip" },
        { "hrsh7th/cmp-copilot" },
      },
    },
    "L3MON4D3/LuaSnip", -- snippets engine, otherwise auto-completion will fail
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path", -- file path

    { "github/copilot.vim", branch = 'release', event = "InsertEnter" },

    -- playground
    'nvim-treesitter/playground',
  }

  -- nevigation
  use {
    -- explorer
    {
      'nvim-tree/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        vim.cmd([[doautocmd NvimTree BufEnter *]])
      end
    },

    "christoomey/vim-tmux-navigator",

    {
      'nvim-telescope/telescope.nvim',
      branch = 'master',
      dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function() require("telescope").load_extension("fzf") end,
      }
    },
  }

  -- language
  use({
    {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end
    },
    {
      "scalameta/nvim-metals",
      requires = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
      }
    },
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
