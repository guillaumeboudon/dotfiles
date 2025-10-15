-- ==============================================================================
-- > Key bindings
-- ==============================================================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- > Leader keys ----------------------------------------------------------------

vim.g.mapleader = ","
vim.g.maplocalleader = "é"

-- ==============================================================================
-- > BÉPO keyboard layout mappings
-- ==============================================================================

-- > Window management ----------------------------------------------------------

-- Use {W} as Ctrl+W for window commands
map("n", "w", "<C-w>", opts)

-- Use {W}{W} to cycle through windows
map("n", "W", "<C-w><C-w>", opts)

-- > Directional navigation: [HJKL] → {CTSR} -----------------------------------

-- Horizontal movement (BÉPO home row)
map({ "n", "v" }, "c", "h", opts)  -- left
map({ "n", "v" }, "r", "l", opts)  -- right

-- Vertical movement (BÉPO home row)
map({ "n", "v" }, "t", "j", opts)  -- down
map({ "n", "v" }, "s", "k", opts)  -- up

-- Jump to top/bottom of screen
map({ "n", "v" }, "C", "H", opts)  -- top of screen
map({ "n", "v" }, "R", "L", opts)  -- bottom of screen

-- Join lines / Help
map({ "n", "v" }, "T", "J", opts)  -- join lines
map({ "n", "v" }, "S", "K", opts)  -- help keyword

-- Fold navigation
map("n", "zs", "zj", opts)  -- next fold
map("n", "zt", "zk", opts)  -- previous fold

-- > Remapped commands: {HJKL} ← [CTSR] ----------------------------------------

-- {J} = "Jusqu'à" (until character, like 't' in QWERTY)
map({ "n", "v" }, "j", "t", opts)  -- until character forward
map({ "n", "v" }, "J", "T", opts)  -- until character backward

-- {L} = "Change" (like 'c' in QWERTY)
map({ "n", "v" }, "l", "c", opts)  -- change motion
map({ "n", "v" }, "L", "C", opts)  -- change to end of line

-- {H} = "Replace" (like 'r' in QWERTY)
map({ "n", "v" }, "h", "r", opts)  -- replace single character
map({ "n", "v" }, "H", "R", opts)  -- replace mode

-- {K} = "Substitute" (like 's' in QWERTY)
map({ "n", "v" }, "k", "s", opts)  -- substitute character
map({ "n", "v" }, "K", "S", opts)  -- substitute line

-- Spell checking navigation
map("n", "]k", "]s", opts)  -- next spelling error
map("n", "[k", "[s", opts)  -- previous spelling error

-- > Display line navigation ----------------------------------------------------

-- Navigate display lines within wrapped text
map({ "n", "v" }, "gs", "gk", opts)  -- up one display line
map({ "n", "v" }, "gt", "gj", opts)  -- down one display line

-- > Tab navigation -------------------------------------------------------------

-- Previous/next tab
map("n", "gb", "gT", opts)  -- previous tab
map("n", "gé", "gt", opts)  -- next tab

-- First/last tab
map("n", "gB", ":tabfirst<CR>", opts)
map("n", "gÉ", ":tablast<CR>", opts)

-- Beginning of display line
map("n", 'g"', "g0", opts)

-- > Angle brackets -------------------------------------------------------------

-- Direct access to < and > (useful for indenting)
map({ "n", "v" }, "«", "<", opts)
map({ "n", "v" }, "»", ">", opts)

-- > Window navigation (BÉPO-adapted) -------------------------------------------

-- Navigate between splits using BÉPO directional keys
map("n", "wt", "<C-w>j", opts)  -- move to split below
map("n", "ws", "<C-w>k", opts)  -- move to split above
map("n", "wc", "<C-w>h", opts)  -- move to split left
map("n", "wr", "<C-w>l", opts)  -- move to split right

-- Window management
map("n", "wd", "<C-w>c", opts)  -- close window
map("n", "wo", "<C-w>s", opts)  -- split horizontally
map("n", "wp", "<C-w>o", opts)  -- close other windows

-- ==============================================================================
-- > General navigation and editing
-- ==============================================================================

-- > Navigation -----------------------------------------------------------------

-- Vertical navigation with display lines (BÉPO: s=up, t=down)
map({ "n", "v" }, "s", "gk", opts)
map({ "n", "v" }, "t", "gj", opts)

-- Fast vertical scrolling
map({ "n", "v" }, "<C-t>", "10j", opts)
map({ "n", "v" }, "<C-s>", "10k", opts)

-- Jump to mark using singlequote
map({ "n", "v" }, "'", "`", opts)

-- > Editing --------------------------------------------------------------------

-- Make Y behave like D and C (yank to end of line)
map("n", "Y", "y$", opts)

-- Toggle fold under cursor
map("n", "<Space>", "za", opts)

-- ==============================================================================
-- > Leader mappings (plugins and utilities)
-- ==============================================================================

-- FZF buffer list
map("n", "’", ":Buffers<CR>", opts)

-- Fern file explorer in current directory
map("n", "-", ":Fern %:h<CR>", opts)

-- Clear search highlighting
map("n", "<Leader><Space>", ":noh<CR>", opts)
map("n", "<Leader>n", ":noh<CR>", opts)

-- Switch to alternate buffer
map("n", "<Leader><Tab>", ":b#<CR>", opts)

-- Copy current file path to clipboard
map("n", "<Leader>a", ":!echo -n % | pbcopy<CR><CR>", opts)

-- Toggle line wrapping
map("n", "<Leader>b", ":setlocal wrap!<CR>:setlocal wrap?<CR>", opts)

-- Search in files with ripgrep
map("n", "<Leader>f", ":Rg ", { noremap = true })

-- Git blame
map("n", "<Leader>gb", ":Git blame<CR>", opts)

-- Smart tag navigation (uses custom function)
map("n", "<Leader>h", function() require("utils.functions").go_to_tag() end, opts)

-- Search word under cursor in files
map("n", "<Leader>j", ":Rg <C-R>=expand('<cword>')<CR><CR>", opts)

-- Toggle Fern drawer
map("n", "<Leader>k", ":Fern . -drawer -toggle<CR>", opts)

-- Toggle Fern drawer and reveal current file
map("n", "<Leader>l", ":Fern . -drawer -toggle -reveal=%<CR>", opts)

-- Search tags with FZF
map("n", "<Leader>r", ":Tags<CR>", opts)

-- Toggle spell checking
map("n", "<Leader>s", ":setlocal spell!<CR>", opts)

-- Search files with FZF
map("n", "<Leader>t", ":Files<CR>", opts)

-- Toggle Mundo (undo tree)
map("n", "<Leader>u", ":MundoToggle<CR>", opts)

-- Toggle folding
map("n", "<Leader>z", ":setlocal foldenable!<CR>:setlocal foldenable?<CR>", opts)

-- ==============================================================================
-- > LocalLeader mappings
-- ==============================================================================

-- Open wiki index
map("n", "<LocalLeader>w", ":e ~/kDrive/Documents/Wiki/index.md<CR>", opts)

-- Open quick notes
map("n", "<LocalLeader>n", ":e ~/kDrive/Documents/Wiki/quicknote.md<CR>", opts)

-- ==============================================================================
-- > vim-surround
-- ==============================================================================

-- Custom surround mappings (adapted for BÉPO: l=change, y=add)
vim.g.surround_no_mappings = 1

map("n", "ds", "<Plug>Dsurround", {})
map("n", "ls", "<Plug>Csurround", {})
map("n", "lS", "<Plug>CSurround", {})
map("n", "ys", "<Plug>Ysurround", {})
map("n", "yS", "<Plug>YSurround", {})
map("n", "yss", "<Plug>Yssurround", {})
map("n", "ySs", "<Plug>YSsurround", {})
map("n", "ySS", "<Plug>YSsurround", {})
map("x", "S", "<Plug>VSurround", {})
map("x", "gS", "<Plug>VgSurround", {})

-- Custom surroundings: French guillemets
vim.g.surround_171 = "« \\r »"
vim.g.surround_187 = "« \\r »"

-- ==============================================================================
-- > Command corrections (fix common typos)
-- ==============================================================================

-- Fix common typos when saving/quitting
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- ==============================================================================
-- > Debug utilities
-- ==============================================================================

-- Show syntax highlighting groups under cursor (for theme development)
map("n", "<Leader>m", function()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local id = vim.fn.synID(line, col, 1)
  local trans_id = vim.fn.synIDtrans(id)
  local name = vim.fn.synIDattr(id, "name")
  local trans_name = vim.fn.synIDattr(trans_id, "name")
  print(string.format("hi<%s> trans<%s>", name, trans_name))
end, opts)
