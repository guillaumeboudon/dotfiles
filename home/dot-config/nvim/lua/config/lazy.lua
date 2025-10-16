-- ==============================================================================
-- > Plugin configuration with lazy.nvim
-- ==============================================================================

-- Disable Elm support in polyglot (using dedicated elm-vim plugin instead)
-- Disable languages handled by Treesitter to avoid conflicts
vim.g.polyglot_disabled = {
  "elm",
  "markdown",  -- Treesitter handles it better
}

-- Setup lazy.nvim
require("lazy").setup({
  -- Import plugin specifications from lua/plugins/
  { import = "plugins" },
}, {
  ui = {
    -- To use Lazy without NerdFont
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      keys = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      lazy = "",
    },
  },

  -- lazy.nvim configuration options
  checker = {
    enabled = true,    -- Automatically check for plugin updates
    notify = false,    -- Don't notify when updates are available
  },
  change_detection = {
    notify = false,    -- Don't notify when config files change
  },
})
