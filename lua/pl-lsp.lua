local keymap = vim.keymap
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lspconfig").gopls.setup({
				cmd = { "gopls" },
				fieltypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
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
						usePlaceholders = true,
						completeUnimported = true,
					},
				},
			})

			-- gofumpt on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
				end,
			})

			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { silent = true }
			-- keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts) -- wrong cmd
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			keymap.set("n", "<C-]>", vim.lsp.buf.definition, opts)
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			-- keymap.set("n", "gr", vim.lsp.buf.references, opts)
			keymap.set("n", "K", vim.lsp.buf.hover, opts)
			keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

			require("lspconfig").lua_ls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = { Lua = { diagnostics = { globals = { "vim" } } } }, -- ignore vim global in nvim config
			})
			require("lspconfig").marksman.setup({})
			require("lspconfig").pyright.setup({})
			require("lspconfig").rust_analyzer.setup({})
		end,
	},
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "Mason", "MasonUpdate" },
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim", -- a bridge between mason.nvim and lspconfig
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls", -- golang
					"jqls", -- json
					"lua_ls", -- lua
					"marksman", -- markdown
					"pyright", -- python
					"rust_analyzer", -- rust
					"sqlls", -- sql
					"ts_ls", -- ts
					"typst_lsp", -- typst
					"yamlls", -- yaml
				},
				automatic_installation = true,
			})
		end,
	},
}
