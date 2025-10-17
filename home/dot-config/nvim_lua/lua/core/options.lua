-- =============================================================================
-- > Neovim Options
-- =============================================================================

local opt = vim.opt
local g = vim.g

-- -----------------------------------------------------------------------------
-- > Essentials
-- -----------------------------------------------------------------------------

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- -----------------------------------------------------------------------------
-- > Miscelaneous
-- -----------------------------------------------------------------------------

opt.backspace = { "indent", "eol", "start" } -- Standard <BS> behavior
opt.clipboard = "unnamedplus"                -- Use system clipboard
opt.encoding = "utf-8"                       -- UTF-8 by default
opt.ttimeoutlen = 0                          -- Avoid delay on escape
opt.hidden = true                            -- Enable modified buffers to be hidden
opt.wrap = false                             -- Don't wrap long lines
opt.linebreak = true                         -- Break long lines by word
opt.list = true                              -- Show whitespace
opt.listchars = {
  tab = "» ",
  extends = "›",
  precedes = "‹",
  nbsp = "·",
  trail = "·"
}
opt.mouse = "a"                              -- Enable mouse
opt.showmatch = true                         -- Highlight matching bracket
opt.showmode = false                         -- Hide mode (shown in statusline)
opt.lazyredraw = true                        -- Better performance
opt.shortmess:append("I")                    -- No intro message
opt.laststatus = 2                           -- Always show statusline
opt.scrolloff = 5                            -- Keep cursor away from edges
opt.sidescrolloff = 10
opt.updatetime = 100                         -- Faster CursorHold events

-- -----------------------------------------------------------------------------
-- > Cursor and Line Numbering
-- -----------------------------------------------------------------------------

opt.number = true
opt.relativenumber = false
opt.splitbelow = true
opt.splitright = true
opt.cursorline = false                       -- Can be enabled if desired

-- -----------------------------------------------------------------------------
-- > Indentation
-- -----------------------------------------------------------------------------

opt.autoindent = true
opt.expandtab = true
opt.shiftround = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- -----------------------------------------------------------------------------
-- > Search
-- -----------------------------------------------------------------------------

opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true
opt.inccommand = "nosplit"                   -- Live preview for :substitute

-- -----------------------------------------------------------------------------
-- > Alerts
-- -----------------------------------------------------------------------------

opt.errorbells = false
opt.visualbell = true
vim.cmd("set t_vb=")

-- -----------------------------------------------------------------------------
-- > Backups, Swaps, Undo
-- -----------------------------------------------------------------------------

opt.backup = true
opt.writebackup = true
opt.swapfile = false
opt.undofile = true

-- Create backup/undo directories if they don't exist
local cache_dir = vim.fn.stdpath("cache")
local backup_dir = cache_dir .. "/backups"
local undo_dir = cache_dir .. "/undos"

vim.fn.mkdir(backup_dir, "p")
vim.fn.mkdir(undo_dir, "p")

opt.backupdir = backup_dir
opt.undodir = undo_dir

-- Tags
opt.tags:prepend(".tags")

-- -----------------------------------------------------------------------------
-- > Folding
-- -----------------------------------------------------------------------------

opt.foldenable = false                       -- Disabled by default
opt.foldmethod = "marker"
opt.foldlevelstart = 99

-- -----------------------------------------------------------------------------
-- > Completion
-- -----------------------------------------------------------------------------

opt.completeopt = { "longest", "menuone", "preview" }
opt.complete:append("kspell")                -- Add spell dict when enabled
opt.wildmenu = true
opt.wildmode = "full"

-- -----------------------------------------------------------------------------
-- > Disable Providers (Performance)
-- -----------------------------------------------------------------------------

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python3_provider = 0

-- -----------------------------------------------------------------------------
-- > Terminal Colors
-- -----------------------------------------------------------------------------

opt.termguicolors = true
