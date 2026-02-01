return {
	{
		'saghen/blink.cmp',
		event = 'InsertEnter',
		version = 'v0.*',
		dependencies = {
			'rafamadriz/friendly-snippets',
		},
		opts = {
			keymap = {
				preset = 'default',
				-- Same experience as your current config
				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-e>'] = { 'hide', 'fallback' },
				['<CR>'] = { 'accept', 'fallback' },
				['<Tab>'] = { 'select_next', 'fallback' },
				['<S-Tab>'] = { 'select_prev', 'fallback' },
				['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},

			sources = {
				default = { 'lsp', 'path', 'buffer', 'snippets' },
			},

			completion = {
				menu = {
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},

			signature = { enabled = true },
		}
	}
}
