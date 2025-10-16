-- ===========================================================================
-- > GitGutter (git diff in sign column)
-- ===========================================================================

return {
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.g.gitgutter_sign_added = "▌"
      vim.g.gitgutter_sign_modified = "▌"
      vim.g.gitgutter_sign_removed = "▖"
      vim.g.gitgutter_sign_modified_removed = "▌"
    end,
  },
}
