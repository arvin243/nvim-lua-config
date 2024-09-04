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
    config = function()
      require('nvim-treesitter.install').compilers = { 'gcc' }
    end,
  },
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod", "gowork", "gotmpl" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      -- local lsp = require("plugins.lsp")
      require("go").setup({
        go = "go",
        goimports = "gopls",
        gofmt = "gofumpt",
        fillstruct = "gopls",
        -- max_line_len = 256,

        lsp_cfg = true,
        -- lsp_on_attach = lsp.on_attach,
        lsp_gofumpt = true,
        lsp_codelens = true,
        lsp_inlay_hints = { enable = false },

        luasnip = true,
      })

      -- snippet
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("go").setup({
        -- other setups ....
        lsp_cfg = {
          capabilities = capabilities,
          -- other setups
        },
      })

      -- -- use format from lsp
      -- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   pattern = "*.go",
      --   callback = function()
      --     require("go.format").goimport()
      --   end,
      --   group = format_sync_grp,
      -- })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      local g = vim.g
      g.mkdp_auto_start = 0
      g.mkdp_auto_close = 1
      g.mkdp_refresh_slow = 0
      g.mkdp_command_for_global = 0
      g.mkdp_open_to_the_world = 0
      g.mkdp_open_ip = ''
      g.mkdp_echo_preview_url = 0
      g.mkdp_browserfunc = ''
      g.mkdp_markdown_css = ''
      g.mkdp_highlight_css = ''
      g.mkdp_port = ''
      g.mkdp_page_title = "「${name}」"
      g.mkdp_preview_options = {
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
      }
    end
  },
  {
    "scalameta/nvim-metals",
    ft = { "scala" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      local metals_config = require("metals").bare_config()

      -- Example of settings
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      }
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    end
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "0.1.*",
    build = function() require "typst-preview".update() end,
  },
  { "jceb/vim-orgmode", ft = { "org" }, },
}
