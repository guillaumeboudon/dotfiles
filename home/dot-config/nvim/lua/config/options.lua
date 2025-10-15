-- ==============================================================================
-- > General Vim settings
-- ==============================================================================

local opt = vim.opt

-- > Essentials -----------------------------------------------------------------

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- > General behavior -----------------------------------------------------------

opt.backspace = "indent,eol,start"       -- Apply standard backspace behavior
opt.clipboard = "unnamed"                -- Use system clipboard
opt.encoding = "utf-8"                   -- Default encoding
opt.ttimeoutlen = 0                      -- Remove timeout when pressing Escape
opt.hidden = true                        -- Enable modified buffers to be hidden
opt.wrap = false                         -- Don't wrap long lines by default
opt.linebreak = true                     -- Wrap lines at word boundaries when wrap is enabled
opt.list = true                          -- Show whitespace as special characters
opt.listchars = { tab = "» ", extends = "›", precedes = "‹", nbsp = "·", trail = "·" }
opt.mouse = "a"                          -- Enable mouse support in all modes
opt.showmatch = true                     -- Highlight matching brackets
opt.showmode = false                     -- Hide mode indicator (lightline shows it)
opt.lazyredraw = true                    -- Improve rendering performance
opt.shortmess:append("tI")               -- Don't show intro message on startup
opt.laststatus = 2                       -- Always show status bar
opt.scrolloff = 5                        -- Keep cursor away from top/bottom edges
opt.sidescrolloff = 10                   -- Keep cursor away from left/right edges
opt.updatetime = 100                     -- Faster update time for plugins (default: 4000ms)

-- > Cursor and line numbering --------------------------------------------------

opt.number = true                        -- Show absolute line numbers
opt.relativenumber = false               -- Disable relative line numbers

-- > Window splitting -----------------------------------------------------------

opt.splitbelow = true                    -- Open horizontal splits below
opt.splitright = true                    -- Open vertical splits to the right

-- > Indentation ----------------------------------------------------------------

opt.autoindent = true                    -- Copy indent from current line when starting new line
opt.expandtab = true                     -- Use spaces instead of tabs
opt.shiftround = true                    -- Round indent to multiple of shiftwidth
opt.tabstop = 2                          -- Width of a tab character
opt.shiftwidth = 2                       -- Number of spaces for each indent level
opt.softtabstop = 2                      -- Number of spaces for tab in insert mode

-- > Search ---------------------------------------------------------------------

opt.hlsearch = true                      -- Highlight search results
opt.ignorecase = true                    -- Ignore case in search patterns
opt.incsearch = true                     -- Search incrementally as you type
opt.smartcase = true                     -- Case-sensitive if pattern contains uppercase
opt.inccommand = "nosplit"               -- Show live preview of substitute command

-- > Alerts ---------------------------------------------------------------------

opt.errorbells = false                   -- Disable error bells
opt.visualbell = false                   -- Disable visual bell

-- > Backups and swap files -----------------------------------------------------

opt.backup = true                        -- Enable backup of saved files
opt.writebackup = true                   -- Enable backup during save
opt.swapfile = false                     -- Disable swap files
opt.undofile = true                      -- Enable persistent undo
opt.backupdir = vim.fn.expand("~/.cache/vim/backups")  -- Directory for backup files
opt.undodir = vim.fn.expand("~/.cache/vim/undos")      -- Directory for undo files
opt.tags:prepend(".tags;")               -- Look for tags file in current directory and parents

-- > Folding --------------------------------------------------------------------

opt.foldenable = false                   -- Folding disabled by default
opt.foldmethod = "marker"                -- Fold based on markers
opt.foldlevelstart = 99                  -- Start with all folds open

-- > Completion -----------------------------------------------------------------

opt.completeopt = { "longest", "menuone", "preview" }  -- Completion behavior
opt.complete:append("kspell")            -- Include spell dictionary when spell checking is enabled
opt.wildmenu = true                      -- Enable enhanced command-line completion
opt.wildmode = "full"                    -- Command-line completion mode

-- > Disable language providers -------------------------------------------------

vim.g.loaded_node_provider = 0           -- Disable Node.js provider (speeds up startup)
vim.g.loaded_perl_provider = 0           -- Disable Perl provider (speeds up startup)

-- > True color support ---------------------------------------------------------

opt.termguicolors = true                 -- Enable 24-bit RGB colors
