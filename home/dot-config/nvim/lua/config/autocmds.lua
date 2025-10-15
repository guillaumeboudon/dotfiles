-- ==============================================================================
-- > Autocommands
-- ==============================================================================

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ==============================================================================
-- > General autocommands
-- ==============================================================================

local general = augroup("general_autocommands", { clear = true })

-- Highlight yanked text briefly for visual feedback
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Automatically resize splits when window is resized
autocmd("VimResized", {
  group = general,
  command = "wincmd =",
})

-- ==============================================================================
-- > Trailing whitespace highlighting
-- ==============================================================================

local whitespace = augroup("trailing_whitespace", { clear = true })

-- Highlight trailing whitespace (except in specific filetypes)
autocmd({ "BufWinEnter", "InsertLeave" }, {
  group = whitespace,
  callback = function()
    local excluded_ft = { "Mundo", "" }
    if not vim.tbl_contains(excluded_ft, vim.bo.filetype) then
      vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
    end
  end,
})

-- Don't highlight whitespace at cursor position in insert mode
autocmd("InsertEnter", {
  group = whitespace,
  callback = function()
    local excluded_ft = { "Mundo", "" }
    if not vim.tbl_contains(excluded_ft, vim.bo.filetype) then
      vim.fn.matchadd("ExtraWhitespace", [[\s\+\%#\@<!$]])
    end
  end,
})

-- Clear matches when leaving buffer
autocmd("BufWinLeave", {
  group = whitespace,
  callback = function()
    vim.fn.clearmatches()
  end,
})
