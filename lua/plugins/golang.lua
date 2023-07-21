return {
  "ray-x/go.nvim",
  ft = { "go", "gomod", "gowork", "gotmpl" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  dependencies = {                                        -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      gofmt = "gofumpt",
      fillstruct = "gopls",
      lsp_gofumpt = true,
      lsp_codelens = true,
      lsp_inlay_hints = {
        enable = false,
      }
    })

    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').gofmt()
      end,
      group = format_sync_grp,
    })
  end,
}
