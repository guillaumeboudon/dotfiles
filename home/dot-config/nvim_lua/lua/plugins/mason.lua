-- =============================================================================
-- > Mason (LSP/DAP/Linter installer)
-- =============================================================================

return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = {
    { "<Leader>pm", "<cmd>Mason<CR>", desc = "Mason" },
  },
  build = ":MasonUpdate",
  opts = {
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
