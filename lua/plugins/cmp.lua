return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "github/copilot.vim" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/cmp-copilot" },
    { "hrsh7th/cmp-path" }, -- file path
  },
  config = function()
    local cmp = require("cmp")

    -- used lately
    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    cmp.setup({
      snippet = {},
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(), -- exit completion, esc works too
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- important settings
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'copilot' }, -- copilot.nvim?
        { name = 'path' },
      }, { { name = 'buffer' }, })
    })
  end
}
