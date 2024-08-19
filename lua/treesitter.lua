return {
  -- { "nvim-treesitter/playground", event = {"BufReadPre", "BufNewFile"} },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    priority = 1000,
    build = ":TSUpdate",
    opts = {
      -- add languages
      ensure_installed = {
        "bash", "query",
        "c", "cpp",
        "json",
        "javascript", "typescript", "tsx", "css",
        "lua", "luadoc",
        "python",
        -- "rust",
        "go",
        "markdown", "markdown_inline",
        "typst",
        "vim", "vimdoc",
      },

      highlight = { enable = true, disable = {} },
      indent = { enable = true },
      -- incremental_selection = {}

      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    },
  }
}
