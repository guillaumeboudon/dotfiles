-- ===========================================================================
-- > Goyo (distraction-free writing)
-- ===========================================================================

return {
  {
    "junegunn/goyo.vim",
    cmd = "Goyo",  -- Load only when :Goyo is called
    config = function()
      vim.g.goyo_width = 100
    end,
  },
}
