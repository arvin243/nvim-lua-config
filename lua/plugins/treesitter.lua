return {
  'nvim-treesitter/playground',
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    priority = 1000,
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- add languages
        ensure_installed = {
          "bash", "query",
          "c", "cpp",
          "json",
          "javascript", "typescript", "tsx", "css",
          "lua",
          "python",
          -- "rust",
          "go",
          "markdown", "markdown_inline",
          "vim",
        },

        highlight = { enable = true, disable = {} },
        indent = { enable = true },
        -- incremental_selection = {}

        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      }
    end
  }
}