-- ===========================================================================
-- > vim-fugitive (git wrapper)
-- ===========================================================================

return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
    },
  },
}
