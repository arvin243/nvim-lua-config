return {
  -- Mini.nvim suite - lightweight and fast
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      -- Comment
      require('mini.comment').setup({
        mappings = {
          comment = 'gc',
          comment_line = '<leader>cc',
          comment_visual = '<leader>cc',
          textobject = 'gc',
        },
      })

      -- Git diff signs
      require('mini.diff').setup({
        view = {
          style = 'sign',
          signs = { add = '+', change = '~', delete = '_', },
        },
        source = nil, -- auto-detect git
        delay = { text_change = 200, },
        mappings = {
          apply = 'gh',
          reset = 'gH',
          textobject = 'gh',
          goto_first = '[H',
          goto_prev = '[h',
          goto_next = ']h',
          goto_last = ']H',
        },
        options = {
          algorithm = 'histogram',
          indent_heuristic = true,
          linematch = 60,
        },
      })

      -- Surround (replace vim-surround)
      require('mini.surround').setup({
        mappings = {
          add = 'ys',
          delete = 'ds',
          find = '',
          find_left = '',
          highlight = '',
          replace = 'cs',
          update_n_lines = '',
        },
      })

      -- Pairs (replace nvim-autopairs)
      require('mini.pairs').setup()

      -- Additional mini modules you might like:
      -- require('mini.ai').setup()  -- Better text objects
      -- require('mini.move').setup()  -- Move lines/selections
      -- require('mini.splitjoin').setup()  -- Split/join code
    end,
  }
}
