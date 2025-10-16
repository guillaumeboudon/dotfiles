-- ==============================================================================
-- > Base16 (Colorscheme)
-- ==============================================================================

return {
  -- Base16 colorscheme (custom from colors/base16.vim)
  -- This uses your existing base16.vim from ~/.config/nvim/colors/
  -- No plugin needed, just load it with a config function
  {
    "base16",
    dir = vim.fn.stdpath("config"),  -- Use local config
    priority = 1000,  -- Load before other plugins
    config = function()
      -- Load the colorscheme
      vim.cmd("colorscheme base16")

      -- Visual mode highlighting
      vim.cmd("hi Visual cterm=reverse")

      -- Spell checking highlighting
      vim.fn["Base16hi"](
        "SpellBad",
        vim.g.base16_gui00,
        vim.g.base16_gui08,
        vim.g.base16_cterm00,
        vim.g.base16_cterm08,
        "",
        ""
      )

      -- HTML heading colors
      vim.fn["Base16hi"]("htmlH1", vim.g.base16_gui08, "", vim.g.base16_cterm08, "", "", "")
      vim.fn["Base16hi"]("htmlH2", vim.g.base16_gui09, "", vim.g.base16_cterm09, "", "", "")
      vim.fn["Base16hi"]("htmlH3", vim.g.base16_gui0A, "", vim.g.base16_cterm0A, "", "", "")
      vim.fn["Base16hi"]("htmlH4", vim.g.base16_gui0B, "", vim.g.base16_cterm0B, "", "", "")
      vim.fn["Base16hi"]("htmlH5", vim.g.base16_gui0C, "", vim.g.base16_cterm0C, "", "", "")
      vim.fn["Base16hi"]("htmlH6", vim.g.base16_gui0D, "", vim.g.base16_cterm0D, "", "", "")

      -- HTML strikethrough
      vim.cmd("hi link HtmlStrike Comment")

      -- Trailing whitespace highlighting
      vim.cmd("highlight ExtraWhitespace ctermfg=235 ctermbg=172 guifg=#282828 guibg=#d79921")
    end,
  },
}
