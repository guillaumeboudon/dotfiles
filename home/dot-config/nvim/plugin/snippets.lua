-- Snippets minimalistes : <Tab> remplace le déclencheur placé avant le curseur
-- par le texte du snippet, sinon insère une tabulation normale.
local snippets = {
  { trigger = '^date$', body = function() return os.date('%Y-%m-%d') end },
  { trigger = '^pr(%d+)$', body = function(n) return vim.trim(vim.fn.system({ 'pr_summary', n })) end },
  { trigger = '^#!$', filetype = 'ruby', bol = true, body = function() return '#!/usr/bin/env ruby\n' end },
}

vim.keymap.set('i', '<Tab>', function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local before = vim.api.nvim_get_current_line():sub(1, col)
  local word = before:match('[%w#!]+$') or ''

  for _, snippet in ipairs(snippets) do
    local captures = { word:match(snippet.trigger) }
    if #captures > 0
      and (not snippet.filetype or snippet.filetype == vim.bo.filetype)
      and (not snippet.bol or before == word) then
      local lines = vim.split(snippet.body(unpack(captures)), '\n')
      local start = col - #word
      vim.api.nvim_buf_set_text(0, row - 1, start, row - 1, col, lines)
      local last_col = #lines == 1 and start + #lines[1] or #lines[#lines]
      vim.api.nvim_win_set_cursor(0, { row + #lines - 1, last_col })
      return
    end
  end

  vim.api.nvim_feedkeys(vim.keycode('<Tab>'), 'ni', false)
end, { desc = 'Expand snippet or insert <Tab>' })
