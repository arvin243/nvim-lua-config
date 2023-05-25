vim.g.mapleader = ","
local keymap = vim.keymap
local bufopts = { silent = true, noremap = true }

keymap.set("n", "<esc>", ":nohl<CR>")
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<c-q>", "<nop>")

-- buffer
keymap.set("n", "[b", ":bprevious<CR>")
keymap.set("n", "]b", ":bnext<CR>")

keymap.set("v", "Y", '"+y')
keymap.set("n", "<leader>ft", ":set ft=")

-- command mode and insert mode emacs-style {
keymap.set("c", "<c-b>", "<left>")
keymap.set("c", "<c-f>", "<right>")
keymap.set("c", "<c-n>", "<down>")
keymap.set("c", "<c-p>", "<up>")
keymap.set("c", "<c-a>", "<home>")
keymap.set("c", "<c-e>", "<end>")
keymap.set("c", "<c-d>", "<del>")
keymap.set("c", "<m-b>", "<s-left>")
keymap.set("c", "<m-f>", "<s-right>")

keymap.set("i", "<c-b>", "<left>")
keymap.set("i", "<c-f>", "<right>")
keymap.set("i", "<c-a>", "<home>")
keymap.set("i", "<c-e>", "<end>")
keymap.set("i", "<c-d>", "<del>")
keymap.set("i", "<c-k>", "<esc>lC")

-- faster scroll
keymap.set("n", "<c-e>", "2<c-e>")
keymap.set("n", "<c-y>", "2<c-y>")

keymap.set("v", "<leader>nr", ":InlineEdit<cr>")

-- search
local telescope = require('telescope.builtin')
-- local pickers = require('telescope.pickers')
keymap.set("n", "<leader>fg", telescope.live_grep, {})
keymap.set("n", "<leader>sf", telescope.live_grep, {})
keymap.set("n", "<leader>bb", telescope.buffers, {})
keymap.set('n', '<leader>ff', telescope.find_files, {})
keymap.set('n', '<leader>fb', telescope.buffers, {})
keymap.set('n', '<leader>fh', telescope.help_tags, {})
keymap.set('n', '<leader>dd', telescope.diagnostics, {})
keymap.set('n', '<leader>ts', telescope.treesitter, {})
keymap.set("n", "gr", telescope.lsp_references, {})
keymap.set("n", "gb", telescope.git_branches, {})

keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")


-- nnoremap <leader>wp :set wrap<cr>
-- " customize placeholder _TODO_
-- " nnoremap <leader><c-t> a_TODO_<esc>
-- nnoremap <leader><c-t> b/_TODO_<cr>:nohl<cr>"_c6l
-- nnoremap <leader>tt b/_TODO_<cr>:nohl<cr>"_c6l
-- inoremap <c-t> <esc>/_TODO_<cr>:nohl<cr>"_c6l

-- " Create a new tab with tu
-- nnoremap tu :tabe<CR>
-- nnoremap tn :tabnew<cr>
-- " Move the tabs with tn and ti
-- nnoremap t+ :tabmove +<CR>
-- nnoremap t- :tabmove -<CR>

-- toggle
keymap.set("n", "<leader>ee", ":NvimTreeToggle<cr>")
keymap.set("n", "<leader>tm", ":TableModeToggle<cr>")
keymap.set("n", "<leader>ll", ":IlluminateToggle<cr>")

-- run vim run
keymap.set("n", "<leader>rr", ":call RunVimRun()<cr>")
