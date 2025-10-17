-- =============================================================================
-- > Neovim Entry Point
-- =============================================================================

-- Load core configuration
require("core.options")
require("core.keymaps")
require("core.bepo")
require("core.autocmds")

-- Colorscheme
require("colors.base16").setup()

-- Clear search highlight on startup
vim.cmd("silent! nohlsearch")
