return {
  -- {"scrooloose/nerdcommenter", event = { "BufReadPre", "BufNewFile" } },
  {
    "numToStr/Comment.nvim",
    keys = { "<leader>cc", "<leader>bc" },
    config = function()
      require("Comment").setup({
        -- Add a space b/w comment and the line
        padding = true,
        -- Whether the cursor should stay at its position
        sticky = true,
        toggler = {
          ---Line-comment toggle keymap
          line = ',cc',
          ---Block-comment toggle keymap
          block = ',bc',
        },
        mappings = {
          basic = true,
          extra = false,
        }
      })
    end
  }
}
