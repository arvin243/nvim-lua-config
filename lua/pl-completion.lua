return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "zbirenbaum/copilot-cmp", config = function() require("copilot_cmp").setup() end, },
		"hrsh7th/cmp-path", -- file path
		"hrsh7th/cmp-buffer",

		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			config = function() require("copilot").setup({}) end,
		},
		-- snippets
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- local has_words_before = function()
		-- 	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
		-- 	local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
		-- 	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		-- end

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(), -- exit completion, esc works too
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			formatting = {
				fields = { "abbr", "menu" },

				format = function(entry, vim_item)
					vim_item.menu = ({
						nvim_lsp = "[Lsp]",
						luasnip = "[LuaSnip]",
						buffer = "[File]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},

			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "luasnip" },
			}, { { name = "buffer" } }),
		})
	end,
}
