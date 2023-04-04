require('telescope').setup {
  defaults = {
    mappings = {
      n = { ['<c-d>'] = require('telescope.actions').delete_buffer },
      i = { ['<c-d>'] = require('telescope.actions').delete_buffer },
    },
  },
}
