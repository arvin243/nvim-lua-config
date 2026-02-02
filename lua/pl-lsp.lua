return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		keys = {
			{ "<C-]>",      vim.lsp.buf.definition },  -- gd
			{ "gi",         vim.lsp.buf.implementation }, -- gI
			{ "<leader>rn", vim.lsp.buf.rename },      -- cr
			{ "<leader>D",  vim.lsp.buf.type_definition },
			-- { "<leader>do", vim.diagnostic.open_float }, -- wrong cmd

			-- lazyvim already included some keys https://www.lazyvim.org/keymaps#lsp
			-- { "gD", vim.lsp.buf.declaration },
			-- { "gd", vim.lsp.buf.definition },
			-- { "[d", vim.diagnostic.goto_prev },
			-- { "]d", vim.diagnostic.goto_next },
			-- { "gr", vim.lsp.buf.references },
			-- { "K", vim.lsp.buf.hover },
			-- { "<C-k>", vim.lsp.buf.signature_help },
		},
		opts = {
			inlay_hints = {
				enabled = true,
				exclude = {},
			},
		},
		config = function()
			-- Ensure blink.cmp capabilities are used
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			-- Helper to set up and enable a server
			local function setup_server(name, config)
				config = config or {}
				config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
				vim.lsp.config(name, config)
				vim.lsp.enable(name)
			end

			-- Lua
			setup_server('lua_ls', {
				settings = {
					Lua = {
						runtime = { version = 'LuaJIT' },
						diagnostics = { globals = { "vim" } },
					}
				},
			})

			-- Standard servers
			setup_server('marksman')
			setup_server('pyright')
			setup_server('rust_analyzer')

			-- Go
			setup_server('gopls', {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern("go.work", "go.mod", ".git")(fname) or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
				end,
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

			-- Auto-format on save for Go
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
				end,
			})
		end,
	},

	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		cmd = { "Mason", "MasonUpdate" },
		build = "<cmd>MasonUpdate", -- :MasonUpdate updates registry contents
		opts = {
			ui = {
				icons =
				{ package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" }
			}
		},
	},

	{
		"williamboman/mason-lspconfig.nvim", -- a bridge between mason.nvim and lspconfig
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"gopls",     -- golang
				-- "jqls",      -- json
				"lua_ls",    -- lua
				"marksman",  -- markdown
				"pyright",   -- python
				"rust_analyzer", -- rust
				"sqlls",     -- sql
				"ts_ls",     -- ts
				-- "typst_lsp", -- typst
				"yamlls",    -- yaml
			},
			automatic_installation = true,
		},
	},
}
