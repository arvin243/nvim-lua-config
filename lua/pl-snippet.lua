return {
  {
    "garymjr/nvim-snippets",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      friendly_snippets = true,
    },
    config = function()
      -- Add custom snippets
      vim.snippet.expand([[
        snippet dt
          `date +%Y-%m-%d`
        snippet ts10
          `date +%s`
        snippet ts13
          `date +%s%3N`
      ]])
    end,
  },
}
