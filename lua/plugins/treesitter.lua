require'nvim-treesitter.configs'.setup {
  -- 添加不同语言
  ensure_installed = {
    "vim", "help", "bash", "query",
    "c",
    "cpp",
    "json",
    "javascript", "typescript", "tsx", "css",
    "lua",
    "python",
    "rust",
    "go",
    "markdown", "markdown_inline",
  },

  highlight = { enable = true },
  indent = { enable = true },

  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
