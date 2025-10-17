-- =============================================================================
-- > BÉPO Keyboard Mappings
-- =============================================================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- -----------------------------------------------------------------------------
-- > {W} -> [É]
-- -----------------------------------------------------------------------------

-- Use {W} as Ctrl+W for window manipulation
map("n", "w", "<C-w>", opts)
map("n", "W", "<C-w><C-w>", opts)

-- -----------------------------------------------------------------------------
-- > [HJKL] -> {CTSR}
-- -----------------------------------------------------------------------------

-- {cr} = left / right
map({ "n", "v", "o" }, "c", "h", opts)
map({ "n", "v", "o" }, "r", "l", opts)

-- {ts} = up / down (screen lines)
map({ "n", "v", "o" }, "s", "gk", opts)
map({ "n", "v", "o" }, "t", "gj", opts)

-- {CR} = top / bottom of screen
map({ "n", "v", "o" }, "C", "H", opts)
map({ "n", "v", "o" }, "R", "L", opts)

-- {TS} = join / help
map({ "n", "v" }, "T", "J", opts)
map({ "n", "v" }, "S", "K", opts)

-- Corollary: next / previous fold
map("n", "zs", "zj", opts)
map("n", "zt", "zk", opts)

-- -----------------------------------------------------------------------------
-- > {HJKL} <- [CTSR]
-- -----------------------------------------------------------------------------

-- {J} = "until" (j = next, J = previous)
map({ "n", "v", "o" }, "j", "t", opts)
map({ "n", "v", "o" }, "J", "T", opts)

-- {L} = "change" (l = wait for motion, L = to end of line)
map({ "n", "v" }, "l", "c", opts)
map({ "n", "v" }, "L", "C", opts)

-- {H} = "replace" (h = one char, H = stay in replace mode)
map({ "n", "v" }, "h", "r", opts)
map({ "n", "v" }, "H", "R", opts)

-- {K} = "substitute" (k = char, K = line)
map({ "n", "v" }, "k", "s", opts)
map({ "n", "v" }, "K", "S", opts)

-- Corollary: spell check navigation
map("n", "]k", "]s", opts)
map("n", "[k", "[s", opts)

-- -----------------------------------------------------------------------------
-- > {g} Disambiguation
-- -----------------------------------------------------------------------------

-- Previous / next screen line
map({ "n", "v" }, "gs", "gk", opts)
map({ "n", "v" }, "gt", "gj", opts)

-- Previous / next tab
map("n", "gb", "gT", opts)
map("n", "gé", "gt", opts)

-- First / last tab
map("n", "gB", ":tabfirst<CR>", opts)
map("n", "gÉ", ":tablast<CR>", opts)

-- Beginning of screen line
map("n", 'g"', "g0", opts)

-- -----------------------------------------------------------------------------
-- > Direct <> Access
-- -----------------------------------------------------------------------------

map({ "n", "v" }, "«", "<", opts)
map({ "n", "v" }, "»", ">", opts)

-- -----------------------------------------------------------------------------
-- > Window Management Remapping
-- -----------------------------------------------------------------------------

map("n", "wt", "<C-w>j", opts)
map("n", "ws", "<C-w>k", opts)
map("n", "wc", "<C-w>h", opts)
map("n", "wr", "<C-w>l", opts)
map("n", "wd", "<C-w>c", opts)
map("n", "wo", "<C-w>s", opts)
map("n", "wp", "<C-w>o", opts)
-- map("n", "w<Space>", ":split<CR>", opts)
-- map("n", "w<CR>", ":vsplit<CR>", opts)
