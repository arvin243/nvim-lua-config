return {
  -- {"scrooloose/nerdcommenter", event = { "BufReadPre", "BufNewFile" } },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "<leader>cc", mode = { "n", "v" } },
      { "<leader>bc", mode = { "n", "v" } },
    },
    config = function()
      require("Comment").setup({
        padding = true, -- Add a space b/w comment and the line
        sticky = true,  -- Whether the cursor should stay at its position
        toggler = { line = '<leader>cc', block = '<leader>bc', },
        opleader = { line = '<leader>cc', block = '<leader>bc', },
        mappings = { basic = true, extra = false, }
      })
    end
  }
}
