-- ==============================================================================
-- > Markdown configuration
-- ==============================================================================

-- > Indentation ----------------------------------------------------------------

vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

-- > Spell checking -------------------------------------------------------------

vim.opt_local.spelllang = { "fr", "en" }

-- > vim-markdown plugin options ------------------------------------------------

vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_strikethrough = 1

-- > Custom syntax highlighting -------------------------------------------------

-- Define highlight groups
vim.cmd([[
  highlight link MarkdownDate            Label
  highlight link MarkdownMention         Statement
  highlight link MarkdownTag             Keyword
  highlight link MarkdownProject         Constant
  highlight link MarkdownCheckBoxBracket Identifier
  highlight link MarkdownCheckBoxX       Special
  highlight link MarkdownTableDelimiter  Delimiter
  highlight link MarkdownTableAligner    Delimiter
  highlight link MarkdownTableBorder     Type
]])

-- Add custom patterns with matchadd
local patterns = {
  { group = "MarkdownDate", pattern = [[\d\{2,4\}-\d\{2\}-\d\{2\}]] },
  { group = "MarkdownMention", pattern = [[\%(^\|\s\)\@<=@[[:alnum:]-]\+]] },
  { group = "MarkdownTag", pattern = [[:[[:alnum:]_+-]\+:]] },
  { group = "MarkdownProject", pattern = [[\(^\|\s\)+[[:alnum:]_]\+]] },
  { group = "MarkdownCheckBoxBracket", pattern = "\\[[ x]\\]" }, -- Checkboxes
  { group = "MarkdownTableDelimiter", pattern = [[|]] }, -- Table delimiters
}

for _, p in ipairs(patterns) do
  vim.fn.matchadd(p.group, p.pattern)
end

-- Clear matches when leaving buffer
vim.api.nvim_create_autocmd("BufWinLeave", {
  buffer = 0,
  callback = function()
    vim.fn.clearmatches()
  end,
})
