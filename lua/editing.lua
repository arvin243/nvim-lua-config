-- comment
require('Comment').setup({
  -- Add a space b/w comment and the line
  padding = true,
  -- Whether the cursor should stay at its position
  sticky = true,
  mappings = {
    basic = true,
    extra = false,
  }
})

-- narrow region
vim.g.inline_edit_autowrite = 1

-- git
-- command! Gblame :Git blame

-- wildfire
vim.g.wildfire_objects = { "iw", "i'", 'i"', "i)", "i]", "i}", "ip", "it" }
