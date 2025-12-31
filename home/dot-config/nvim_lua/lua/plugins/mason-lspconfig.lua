-- =============================================================================
-- > Mason LSP Config (Bridge between Mason and LSPConfig)
-- =============================================================================

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    -- Automatically install these language servers
    ensure_installed = {
      "solargraph",    -- Ruby (more stable than ruby_lsp)
      "ts_ls",         -- JavaScript/TypeScript
      "lua_ls",        -- Lua
      "bashls",        -- Bash
      "pyright",       -- Python
      "jsonls",        -- JSON
      "yamlls",        -- YAML
      "html",          -- HTML
      "cssls",         -- CSS
      "marksman",      -- Markdown
    },
    automatic_installation = true,
  },
  lazy = true, -- Loaded by lspconfig
}
