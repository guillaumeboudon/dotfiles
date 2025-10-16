-- ===========================================================================
-- > UltiSnips (snippet engine)
-- ===========================================================================

return {
  {
    "sirver/UltiSnips",
    event = "InsertEnter",
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
    end,
  },
}
