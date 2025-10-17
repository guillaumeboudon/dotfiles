-- =============================================================================
-- > Autocommands
-- =============================================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- -----------------------------------------------------------------------------
-- > Highlight Trailing Whitespace
-- -----------------------------------------------------------------------------

-- Define highlight group for trailing spaces
vim.api.nvim_set_hl(0, "ExtraWhitespace", {
  ctermfg = 235,
  ctermbg = 172,
  fg = "#282828",
  bg = "#d79921"
})

-- Filetypes to ignore
local whitespace_blacklist = { "Mundo", "" }

local function should_match_whitespace()
  return not vim.tbl_contains(whitespace_blacklist, vim.bo.filetype)
end

local whitespace_group = augroup("TrailingWhitespace", { clear = true })

autocmd({ "BufWinEnter", "InsertLeave" }, {
  group = whitespace_group,
  callback = function()
    if should_match_whitespace() then
      vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
    end
  end,
})

autocmd("InsertEnter", {
  group = whitespace_group,
  callback = function()
    if should_match_whitespace() then
      vim.fn.matchadd("ExtraWhitespace", [[\s\+\%#\@<!$]])
    end
  end,
})

autocmd("BufWinLeave", {
  group = whitespace_group,
  callback = function()
    vim.fn.clearmatches()
  end,
})

-- -----------------------------------------------------------------------------
-- > Filetype Detection
-- -----------------------------------------------------------------------------

local filetype_group = augroup("FiletypeDetection", { clear = true })

autocmd({ "BufNewFile", "BufRead" }, {
  group = filetype_group,
  pattern = ".gemrc",
  command = "set filetype=yaml",
})

-- -----------------------------------------------------------------------------
-- > Filetype Indentation
-- -----------------------------------------------------------------------------

local indent_group = augroup("FiletypeIndentation", { clear = true })

autocmd("FileType", {
  group = indent_group,
  pattern = { "elm", "todo", "markdown" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

-- -----------------------------------------------------------------------------
-- > Highlight on Yank
-- -----------------------------------------------------------------------------

local yank_group = augroup("HighlightYank", { clear = true })

autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- -----------------------------------------------------------------------------
-- > Resize Panes on Window Resize
-- -----------------------------------------------------------------------------

local resize_group = augroup("ResizePanes", { clear = true })

autocmd("VimResized", {
  group = resize_group,
  command = "wincmd =",
})

-- -----------------------------------------------------------------------------
-- > Markdown Spell Languages
-- -----------------------------------------------------------------------------

local markdown_group = augroup("MarkdownSettings", { clear = true })

autocmd("FileType", {
  group = markdown_group,
  pattern = "markdown",
  callback = function()
    vim.opt_local.spelllang = "fr,en"
  end,
})

-- Note: Additional autocommands available for later configuration:
-- - Restore cursor position on file open
-- - Quickfix window specific settings
