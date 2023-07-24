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
    -- local lsp = require('plugins.lsp')
    require("go").setup({
      gofmt = "gofumpt",
      fillstruct = "gopls",
      max_line_len = 256,
      lsp_cfg = true,
      -- lsp_on_attach = lsp.on_attach,
      lsp_gofumpt = true,
      lsp_codelens = true,
      -- lsp_inlay_hints = { enable = false },
    })

    local format_sync_grp = vim.api.nvim_create_augroup("Format", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimport()
      end,
      group = format_sync_grp,
    })
  end,
}
