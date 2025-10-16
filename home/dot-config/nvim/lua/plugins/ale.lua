-- ==============================================================================
-- > ALE
-- ==============================================================================


return {
  {
    "dense-analysis/ale",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Signs
      vim.g.ale_sign_warning = ">"
      vim.g.ale_sign_error = "XX"

      -- Behavior
      vim.g.ale_linters_explicit = 1
      vim.g.ale_fix_on_save = 1
      vim.g.ale_virtualtext_cursor = "disabled"

      -- Linters per filetype
      vim.g.ale_linters = {
        elixir = { "credo" },
        elm = { "make" },
        eruby = { "erblint" },
        haml = { "hamllint" },
        javascript = { "standard" },
        ruby = { "rubocop" },
      }

      -- Fixers per filetype
      vim.g.ale_fixers = {
        ["*"] = { "remove_trailing_lines", "trim_whitespace" },
        javascript = { "standard" },
      }
    end,
  },
}
