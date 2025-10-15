-- ==============================================================================
-- > Custom utility functions
-- ==============================================================================

local M = {}

-- ==============================================================================
-- > Tag navigation
-- ==============================================================================

-- Smart tag navigation: jump to tag if unique, search if multiple, or Rg if none
function M.go_to_tag()
  local cword = vim.fn.expand("<cword>")
  local matches = vim.fn.system("cat .tags | rg -w '^" .. cword .. "'\t' | wc -l | awk '{print $1}'")
  matches = vim.trim(matches)

  if matches == "0" then
    -- No tags found, use Rg to search in files
    vim.cmd("Rg " .. cword)
  elseif matches == "1" then
    -- Exactly one tag found, jump to it directly
    vim.cmd("tag " .. cword)
  else
    -- Multiple tags found, show FZF selector
    vim.cmd("Tags '" .. cword)
  end
end

-- ==============================================================================
-- > File cleaning
-- ==============================================================================

-- Trim trailing spaces at end of lines
function M.trim_trailing_spaces()
  vim.cmd([[%s/\s\+$//]])
end

-- Retab and trim trailing spaces (complete file cleanup)
function M.clean_file()
  vim.cmd("retab")
  M.trim_trailing_spaces()
end

-- ==============================================================================
-- > Buffer management
-- ==============================================================================

-- Close all buffers except the current one
function M.close_other_buffers()
  vim.cmd("%bd|e#")
end

-- ==============================================================================
-- > Commands
-- ==============================================================================

-- Create user commands
vim.api.nvim_create_user_command("TEOL", M.trim_trailing_spaces, {})
vim.api.nvim_create_user_command("CLEAN", M.clean_file, {})
vim.api.nvim_create_user_command("BufCloseOthers", M.close_other_buffers, {})

return M
