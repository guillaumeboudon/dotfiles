-- ==============================================================================
-- > Bootstrap lazy.nvim (plugin manager)
-- ==============================================================================

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
vim.opt.runtimepath:prepend(lazypath)

-- ==============================================================================
-- > Load configuration
-- ==============================================================================

require("config.options")    -- General Vim settings
require("config.keymaps")    -- Key bindings (including BÉPO)
require("config.autocmds")   -- Autocommands
require("config.lazy")       -- Plugin configuration

-- ==============================================================================
-- > Startup
-- ==============================================================================

-- Disable search highlight on startup
vim.cmd("silent! nohlsearch")
