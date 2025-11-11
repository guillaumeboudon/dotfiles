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

-- Automatically load all plugin files from lua/plugins/
local plugins = {}

local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", false, true)
for _, file in ipairs(plugin_files) do
  local plugin_name = vim.fn.fnamemodify(file, ":t:r")

  -- Skip init.lua (this file)
  if plugin_name ~= "init" then
    local ok, plugin_config = pcall(require, "plugins." .. plugin_name)
    if ok then
      table.insert(plugins, plugin_config)
    else
      vim.notify("Failed to load plugin: " .. plugin_name, vim.log.levels.ERROR)
    end
  end
end

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
