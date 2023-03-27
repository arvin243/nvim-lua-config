vim.g.mapleader = ","

local keymap = vim.keymap

keymap.set("n", "<esc>", ":nohl<CR>")

-- buffer
keymap.set("n", "[b", ":bprevious<CR>")
keymap.set("n", "]b", ":bnext<CR>")

-- plugins
-- nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>")
