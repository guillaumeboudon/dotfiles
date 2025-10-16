-- ===========================================================================
-- > VimWiki (personal wiki)
-- ===========================================================================

return {
  {
    "vimwiki/vimwiki",
    keys = {
      { "<leader>w<space>", mode = { "n", "v" }, desc = "Toggle checklist item" },
      { "<localleader>w", desc = "Open wiki index" },
      { "<localleader>n", desc = "Open quick notes" },
    },
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/kDrive/Documents/Wiki",
          syntax = "markdown",
          ext = "md",
          nested_syntaxes = { mmd = "mermaid", rb = "ruby", shell = "bash" },
        },
      }

      -- Don't treat all .md files as vimwiki files
      vim.g.vimwiki_global_ext = 0

      -- Disable markdown concealment
      vim.g.vimwiki_conceallevel = 0

      -- Disable default table mappings
      vim.g.vimwiki_key_mappings = {
        table_mappings = 0,
      }
    end,
    config = function()
      -- Toggle checklist items
      vim.keymap.set("n", "<leader>w<space>", "<Plug>VimwikiToggleListItem", {})
      vim.keymap.set("v", "<leader>w<space>", "<Plug>VimwikiToggleListItem", {})
    end,
  },
}
