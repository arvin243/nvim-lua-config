vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = buffer,
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})

require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

-- refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require("mason-lspconfig").setup({
  ensure_installed = {
    "gopls", -- golang
    "lua_ls", -- lua
    "marksman", -- markdown
    "pyright", -- python
    "rust_analyzer", -- rust
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').gopls.setup({
  cmd = { 'gopls' },
  settings = {
    gopls = {
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      gofumpt = true,
      staticcheck = true,
    },
  },
})

require'lspconfig'.lua_ls.setup {
  capabilities = capabilities,
}

require'lspconfig'.marksman.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}

