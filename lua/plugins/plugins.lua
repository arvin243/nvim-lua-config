-- auto install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

  -- appearance
  use {
    'srcery-colors/srcery-vim',
    'morhetz/gruvbox',

    'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' }, -- status bar

    'mhinz/vim-startify',
  }

  -- editing
  use {
    'bronson/vim-trailing-whitespace',
    'tpope/vim-abolish',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'tpope/vim-unimpaired',
    'AndrewRadev/splitjoin.vim',
    'jiangmiao/auto-pairs',
    -- TODO: wildfire

    -- narrow region
    'andrewradev/inline_edit.vim',

    -- auto increment, vis & visincr
    'vim-scripts/vis',
    -- :B, :S
    'vim-scripts/VisIncr',
    -- :I, :I -1, :II, etc

    "numToStr/Comment.nvim",
    "lewis6991/gitsigns.nvim",

    'godlygeek/tabular',
    'vim-scripts/swapcol.vim',
  }

  -- syntax & autocomplete
  use {
    -- treesitter
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow", -- rainbow bracket

    -- lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path", -- 文件路径

    "github/copilot.vim", branch = 'release',
  }

  -- nevigation
  use {
    'nvim-tree/nvim-tree.lua',  -- explorer
    "christoomey/vim-tmux-navigator",
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
