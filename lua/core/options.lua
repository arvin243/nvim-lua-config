local opt = vim.opt

opt.relativenumber = false
opt.number = true
opt.wrap = false
opt.cursorline = true

-- indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true


-- enable mouse
opt.mouse:append("a")

-- split window
opt.splitright = true
opt.splitbelow = true

-- search case
opt.ignorecase = true
opt.smartcase = true

-- apperance
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd[[colorscheme gruvbox]]
