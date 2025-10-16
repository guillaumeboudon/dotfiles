-- ===========================================================================
-- > vim-surround (surround text with quotes, brackets, etc.)
-- ===========================================================================

return {
  {
    "tpope/vim-surround",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "tpope/vim-repeat" },
  },
}
