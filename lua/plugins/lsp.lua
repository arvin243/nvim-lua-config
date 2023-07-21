return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local util = require "lspconfig/util"

      -- refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = buffer,
        callback = function()
          vim.lsp.buf.format { async = false }
        end
      })

      require("lspconfig").gopls.setup({
        cmd = { "gopls", "serve" },
        fieltypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
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
      -- -- gofumpt on save
      -- vim.api.nvim_create_autocmd('BufWritePre', {
      --   pattern = '*.go',
      --   callback = function()
      --     vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
      --   end
      -- })

      vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>")
      vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
      vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

      require("lspconfig").lua_ls.setup {
        capabilities = capabilities,
      }
      require("lspconfig").marksman.setup {}
      require("lspconfig").pyright.setup {}
      require("lspconfig").rust_analyzer.setup {}
    end
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim", -- a bridge between mason.nvim and lspconfig
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",         -- golang
          "lua_ls",        -- lua
          "marksman",      -- markdown
          "pyright",       -- python
          "rust_analyzer", -- rust
        },
      })
    end
  },
}
