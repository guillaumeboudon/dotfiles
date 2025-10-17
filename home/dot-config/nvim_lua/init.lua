-- =============================================================================
-- > Neovim Entry Point
-- =============================================================================

-- Load core configuration
require("core.options")
require("core.keymaps")
require("core.bepo")
require("core.autocmds")

-- Colorscheme (will be added later)
-- vim.cmd.colorscheme("base16")

-- Clear search highlight on startup
vim.cmd("silent! nohlsearch")
