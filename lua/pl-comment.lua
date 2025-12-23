return {
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        ignore_blank_line = false,
        start_of_line = false,
        pad_comment_parts = true,
      },
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = 'gc',

        -- Toggle comment on current line
        comment_line = '<leader>cc',

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = 'gc',
      },
      hooks = {
        pre = function() end,
        post = function() end,
      },
    },
    config = function(_, opts)
      require('mini.comment').setup(opts)

      -- Add block comment keybinding to match your current setup
      vim.keymap.set({ 'n', 'v' }, '<leader>bc', function()
        return require('mini.comment').toggle_lines(vim.fn.line('.'), vim.fn.line('v'))
      end, { expr = true, desc = 'Toggle block comment' })
    end,
  }
}
