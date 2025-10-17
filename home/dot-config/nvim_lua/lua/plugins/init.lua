-- =============================================================================
-- > Plugin Manager (lazy.nvim)
-- =============================================================================

-- Bootstrap lazy.nvim
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
vim.opt.rtp:prepend(lazypath)

-- -----------------------------------------------------------------------------
-- > Plugin Specifications
-- -----------------------------------------------------------------------------

local plugins = {
  -- Empty for now - plugins will be added progressively
}

-- -----------------------------------------------------------------------------
-- > Lazy.nvim Setup
-- -----------------------------------------------------------------------------

require("lazy").setup(plugins, {
  -- Performance
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },

  -- Install missing plugins on startup
  install = {
    missing = true,
  },

  -- Check for updates
  checker = {
    enabled = false,
    notify = false,
  },

  -- Change detection
  change_detection = {
    enabled = true,
    notify = false,
  },
})

-- -----------------------------------------------------------------------------
-- > Keymaps for lazy.nvim
-- -----------------------------------------------------------------------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Open lazy.nvim UI
map("n", "<Leader>p", "<cmd>Lazy<CR>", opts)
