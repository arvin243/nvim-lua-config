local opt = vim.opt

-- apperance
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd[[colorscheme gruvbox]]

-- display
opt.relativenumber = false
opt.wrap = false
opt.cursorline = true
opt.hidden        = true;
opt.showcmd       = false;
opt.inccommand    = "nosplit";

-- scroll
opt.scrolloff      = 4;
opt.sidescrolloff  = 10;
opt.laststatus     = 2;

-- enable mouse
-- opt.mouse:append("a")
opt.mouse = "nv";

-- split window
opt.splitright = true
opt.splitbelow = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch  = true;
opt.hlsearch   = true;
-- opt.wildignorecase = true;

-- temp files, backup, swap, etc
opt.backup         = false;
opt.writebackup    = false;
opt.swapfile       = false;

-- spell
opt.spell = false;

-- errorbell
opt.errorbells = false;

-- match bracket
opt.showmatch = true;
opt.matchtime = 2;

-- editing
opt.autoread = true; -- auto read if file is modified in other place
opt.title = true;
opt.wildmenu = true;

-- history
opt.history = 1000;

--
-- bw local
--

opt.foldenable     = true;

-- indentation
opt.autoindent  = true;
opt.tabstop     = 4;
opt.shiftwidth  = 4;
opt.softtabstop = 4;
opt.expandtab   = true;
opt.smartindent = true;

-- appearance
opt.number         = true;
opt.textwidth      = 120;

-- undo file
opt.undofile = false;

-- faster scroll
opt.ttyfast = true;
opt.lazyredraw = true;

--
-- window local
--

vim.wo.wrap = false;

