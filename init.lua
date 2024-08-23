--
-- defaults
--
local opt                = vim.opt
local keymap             = vim.keymap

-- for nvim-tree
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- apperance
opt.termguicolors        = true
opt.signcolumn           = "yes"
-- vim.cmd[[colorscheme gruvbox]]

-- display
opt.relativenumber       = true
opt.wrap                 = false
opt.cursorline           = true
opt.hidden               = true;
opt.showcmd              = false;
opt.inccommand           = "nosplit";

-- scroll
opt.scrolloff            = 4;
opt.sidescrolloff        = 10;
opt.laststatus           = 2;

-- enable mouse
-- opt.mouse:append("a")
opt.mouse                = "nv";

-- split window
opt.splitright           = true
opt.splitbelow           = true

-- search
opt.ignorecase           = true
opt.smartcase            = true
opt.incsearch            = true;
opt.hlsearch             = true;
-- opt.wildignorecase = true;

-- temp files, backup, swap, etc
opt.backup               = false;
opt.writebackup          = false;
opt.swapfile             = false;

-- spell
opt.spell                = false;

-- errorbell
opt.errorbells           = false;

-- match bracket
opt.showmatch            = true;
opt.matchtime            = 2;

-- editing
opt.autoread             = true; -- auto read if file is modified in other place
opt.title                = true;
opt.wildmenu             = true;

-- history
opt.history              = 1000;

-- fold
opt.foldenable           = true;
opt.foldmethod           = "indent"
opt.foldlevel            = 99
opt.foldenable           = true
opt.foldlevelstart       = 99

-- indentation
opt.autoindent           = true;
opt.tabstop              = 4;
opt.shiftwidth           = 4;
opt.softtabstop          = 4;
opt.expandtab            = true;
opt.smartindent          = true;
vim.cmd [[autocmd FileType lua,jsom,yaml setlocal ts=2 sts=2 sw=2]]
vim.cmd [[autocmd FileType json set formatprg=jq]]
vim.cmd [[autocmd BufNewFile,BufRead *.typst set filetype=typst]]
vim.cmd [[autocmd BufNewFile,BufRead *.typ set filetype=typst]]

-- appearance
opt.number           = true;
opt.textwidth        = 120;

-- undo file
opt.undofile         = false;

-- faster scroll
opt.ttyfast          = true;
opt.lazyredraw       = true;

-- window local
vim.wo.wrap          = false;

--
-- keymaps
--

vim.g.mapleader      = "," -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.localmapleader = ","
local bufopts        = { silent = true, noremap = true }

keymap.set("n", "<esc>", ":nohl<CR>")
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<c-q>", "<nop>")

-- buffer
keymap.set("n", "[b", ":bprevious<CR>")
keymap.set("n", "]b", ":bnext<CR>")

keymap.set("v", "Y", '"+y')
-- keymap.set("n", "<leader>ft", ":set ft=")

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
keymap.set("i", "jk", "<esc>")

-- faster scroll
keymap.set("n", "<c-e>", "2<c-e>")
keymap.set("n", "<c-y>", "2<c-y>")

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

-- run vim run
keymap.set("n", "<leader>rr", ":call RunVimRun()<cr>")
keymap.set("n", "<leader>rt", ":call RunVimTest()<cr>")

--
-- lazy plugins
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- { "folke/lazy.nvim", version = false },
  -- { "LazyVim/LazyVim", version = false },

  require("mdle-completion"),
  require("mdle-telescope"),
  require("mdle-lsp"),
  require("mdle-treesitter"),
  require("mdle-explorer"),
  require("mdle-language"),

  require("mdle-copilot"),
  require("mdle-comment"),
  require("mdle-snippet"),
  require("mdle-navigation"),

  -- decoration
  {
    -- theme
    {
      -- "srcery-colors/srcery-vim",
      "morhetz/gruvbox",
      lazy = false,    -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.g.gruvbox_contrast_dark = "hard"
        vim.cmd([[colorscheme gruvbox]])
      end
    },

    -- status bar
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("lualine").setup({
          options = { theme = "gruvbox" },
        })
      end
    },

    -- welcome
    {
      "mhinz/vim-startify",
      config = function()
        vim.g.startify_change_to_dir = 0
        vim.g.startify_change_to_vcs_root = 1
        vim.g.startify_files_number = 20
        -- vim.g.startify_session_dir = "$HOME/.config/nvim/"
      end
    },
    -- {
    --   "nvimdev/dashboard-nvim",
    --   event = "UIEnter",
    --   config = function()
    --     require('dashboard').setup {
    --       theme = "hyper",
    --       shortcut_type = "number",
    --       change_to_vcs_root = true,
    --       config = {
    --         -- week_header = { enable = true },
    --         mru = { limit = 10, icon = 'MRU', label = '', cwd_only = false },
    --         project = { enable = true, limit = 10, icon = 'Proj', label = '', action = 'Telescope find_files cwd=' },
    --         shortcut = {
    --           { desc = 'LazyUpdate', group = 'Include',  action = 'Lazy update',          key = 'u', },
    --           { desc = 'Mason',      group = 'Include',  action = 'Mason',                key = 'm', },
    --           { desc = 'Files',      group = 'Function', action = 'Telescope find_files', key = 'f', },
    --           { desc = 'Grep',       group = 'Function', action = 'Telescope live_grep',  key = 'g', },
    --         },
    --       },
    --     }
    --   end,
    --   dependencies = {
    --     'nvim-tree/nvim-web-devicons',
    --     "nvim-telescope/telescope.nvim",
    --   },
    -- },

    -- { "echasnovski/mini.nvim", version = false },

    -- signs
    {
      "lewis6991/gitsigns.nvim",
      event = "VeryLazy",
      config = function()
        require("gitsigns").setup({
          signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
          },
        })
      end
    },
  },

  -- keybinding & command
  {
    "folke/which-key.nvim",
    opts = { preset = "mordern" },
    keys = { {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps (which-key)",
    } },
  },

  -- editing
  {
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
    -- { "kylechui/nvim-surround", event = "VeryLazy", config = function() require("nvim-surround").setup({}) end },
    { "tpope/vim-abolish" },         -- change case, etc
    { 'tpope/vim-sleuth' },          -- auto tab/indent
    {
      "andrewradev/inline_edit.vim", -- narrow region
      keys = { { "<leader>nr", mode = "v", "<cmd>InlineEdit<cr>" } },
      config = function()
        vim.g.inline_edit_autowrite = 1
      end
    },
    -- auto increment, vis & visincr
    { "vim-scripts/vis",     cmd = { "B", "S" } },
    { "vim-scripts/VisIncr", cmd = { "I", "II" } }, -- :I, :I -1, :II, etc
    {
      "monaqa/dial.nvim",
      events = "VeryLazy",
      keys = {
        { "<c-a>", mode = { "n", "v" }, "<Plug>(dial-increment)" },
        { "<c-x>", mode = { "n", "v" }, "<Plug>(dial-decrement)" }, },
      config = function()
        local augend = require("dial.augend")
        local weekdays = augend.constant.new({
          elements = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", },
          word = true,
          cyclic = true,
        })
        require("dial.config").augends:register_group {
          default = {
            augend.integer.alias.decimal,
            augend.constant.alias.bool,
            augend.date.alias["%Y/%m/%d"],
            weekdays,
          }
        }
      end
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require('nvim-autopairs').setup({
          disable_filetype = { "TelescopePrompt", "vim" },
        })
      end
    },
    { "vim-scripts/swapcol.vim",    cmd = { "Swapcols" } },
    {
      "tani/dmacro.vim",
      keys = { { "<c-y>", mode = { "n", "i" }, "<Plug>(dmacro-play-macro)" } },
    },

    -- format
    -- { "nvie/vim-rst-tables",        event = {"BufReadPre", "BufNewFile"} },
    { "dhruvasagar/vim-table-mode", cmd = { "TableModeToggle" }, keys = { { "<leader>tm", "<cmd>TableModeToggle<cr>" } } },
    { "godlygeek/tabular",          cmd = { "Tabularize" } },
    {
      "stevearc/conform.nvim",
      event = { "BufWritePre" },
      cmd = { "ConformInfo" },
      keys = { { "<leader>fm", function() require("conform").format({ async = true }) end } },
      opts = {
        formatters_by_ft = {
          go = { "gofumpt" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          lua = { "stylua" },
          python = { "isort", "black" },
          rust = { "rustfmt", lsp_format = "fallback" },
        },
        default_format_opts = { lsp_format = "fallback" },
        format_on_save = { timeout_ms = 500 },
        formatters = { shfmt = { prepend_args = { "-i", "2" }, }, },
      },
      init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end,
    },
    -- git
    { "tpope/vim-fugitive",              event = { "BufReadPre", "BufNewFile" } },

    -- information
    { "RRethy/vim-illuminate",           keys = { { "<leader>ll", "<cmd>IlluminateToggle<cr>" } }, },
    { "bronson/vim-trailing-whitespace", event = { "BufReadPre", "BufNewFile" } },

    -- splitjoin
    {
      "Wansmer/treesj",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      keys = { { "gS", "<cmd>TSJToggle<cr>" } },
      config = function()
        require("treesj").setup({
          use_default_keymaps = false,
          max_join_length = 240,
          dot_repeat = true,
        })
      end,
    },

    -- selection
    {
      "sustech-data/wildfire.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
        require("wildfire").setup()
      end,
    },
  },

  -- {"p00f/nvim-ts-rainbow",}, -- rainbow bracket

  -- diagnostics, references, etc
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics (Trouble)", },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)", },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)", },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                            desc = "Location List (Trouble)", },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)", },
    },
  },

  -- others
  -- require("plugins.wilder"),

  { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } },
})

-- end of lazy plugins

--
-- custom funcs
--

vim.api.nvim_exec([[
  command! TidyJIRA call TidyJIRAFunc()
  function! TidyJIRAFunc()
    :set ft=markdown
    :v/SPPC/d
    :%s/\(SPPC-\d\{5\}\)\s*\nSPPC-\d\{5\}\s*/[[\1](https:\/\/jira.shopee.io\/browse\/\1)] /
    :%s/$/  /
  endfunc
]], true)

vim.api.nvim_exec([[
func! RunVimRun()
  :w
  if &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'go'
    :GoRun %
    " set splitbelow
    " :sp
    " :term go run %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'typst'
    exec "TypstPreview"
  elseif &filetype == 'xhtml'
    :!open % -a Google\ Chrome
  elseif &filetype == 'dot'
    let current_file_name=expand('%:r')
    let output_file_path=current_file_name . '.png'
    exec "!dot -Tpng % -o " . output_file_path
    exec "!open " . output_file_path
  elseif &filetype == 'mermaid'
    " let current_file_name=expand('%:r')
    " let output_file_path=current_file_name . '.png'
    " exec "!mmdc -H -i " . current_file_name . ".mmd -o " output_file_path . " -t bright -b transparent"
    " exec "!open " . output_file_path
    exec "!mermaid %"
  elseif &filetype == 'scala'
    set splitbelow
    :sp
    :term scala %
  endif
endfunc
]], true)

vim.api.nvim_exec([[
func! RunVimTest()
  :w
  if &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'go'
    :GoTestFile -v
  endif
endfunc
]], true)

--
-- for neovide
--
if vim.g.neovide then
  vim.g.neovide_transparency            = 0.8
  vim.g.neovide_hide_mouse_when_typing  = true
  vim.g.neovide_no_idle                 = false
  vim.g.neovide_fullscreen              = true
  vim.g.neovide_remember_window_size    = true
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_antialiasing     = false
  vim.g.neovide_cursor_vfx_mode         = "torpedo"

  keymap.set('n', '<D-s>', ':w<CR>')      -- Save
  keymap.set('v', '<D-c>', '"+y')         -- Copy
  keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
  keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
  keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
  keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
end
