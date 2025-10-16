-- ===========================================================================
-- > vim-waikiki (wiki navigation)
-- ===========================================================================

return {
  {
    "fcpg/vim-waikiki",
    dependencies = { "vimwiki/vimwiki" },
    ft = { "markdown", "vimwiki" },
    init = function()
      vim.g.waikiki_roots = { "~/kDrive/Documents/Wiki" }
      vim.g.waikiki_default_maps = 1
    end,
  },
}
