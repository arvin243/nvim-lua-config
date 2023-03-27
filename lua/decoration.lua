-- theme
vim.g.gruvbox_contrast_dark = 'hard'
-- startify
vim.g.startify_change_to_dir=0
vim.g.startify_change_to_vcs_root=1
vim.g.startify_session_dir='$HOME/.vim/sessions'
vim.g.startify_files_number=20

-- status bar
require('lualine').setup({
  options = {
    theme = 'gruvbox'
  }
})

-- gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}
