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
      -- gofumpt on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
        end
      })

      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local keymap = vim.keymap
      local opts = { silent = true }
      keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts)
      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)
      keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      require("lspconfig").marksman.setup {}
      require("lspconfig").pyright.setup {}
      require("lspconfig").rust_analyzer.setup {}
    end
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
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
    lazy = false,
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
        automatic_installation = true,
      })
    end
  },
}
