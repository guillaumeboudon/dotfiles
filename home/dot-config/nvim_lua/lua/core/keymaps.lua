-- =============================================================================
-- > General Keymaps
-- =============================================================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local g = vim.g

-- -----------------------------------------------------------------------------
-- > Leaders
-- -----------------------------------------------------------------------------

g.mapleader = ","
g.maplocalleader = "é"

-- -----------------------------------------------------------------------------
-- > General Improvements
-- -----------------------------------------------------------------------------

-- Use single quote to move to mark (more precise than ')
map("n", "'", "`", opts)

-- Make Y behave like D or C
map("n", "Y", "y$", opts)

-- Space to toggle fold
map("n", "<Space>", "za", opts)

-- -----------------------------------------------------------------------------
-- > Leader Mappings
-- -----------------------------------------------------------------------------

-- Clear highlight
map("n", "<Leader><Space>", ":nohlsearch<CR>", opts)
map("n", "<Leader>n", ":nohlsearch<CR>", opts)

-- Alternate buffer
map("n", "<Leader><Tab>", ":buffer#<CR>", opts)

-- Toggle wrap
map("n", "<Leader>b", function()
  vim.wo.wrap = not vim.wo.wrap
  print("wrap: " .. tostring(vim.wo.wrap))
end, { noremap = true, silent = false })

-- Toggle spell
map("n", "<Leader>s", function()
  vim.wo.spell = not vim.wo.spell
  print("spell: " .. tostring(vim.wo.spell))
end, { noremap = true, silent = false })

-- Toggle folding
map("n", "<Leader>z", function()
  vim.wo.foldenable = not vim.wo.foldenable
  print("foldenable: " .. tostring(vim.wo.foldenable))
end, { noremap = true, silent = false })

-- Copy current file path to clipboard
map("n", "<Leader>a", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, { noremap = true, silent = false })

-- -----------------------------------------------------------------------------
-- > LocalLeader Mappings
-- -----------------------------------------------------------------------------

-- Wiki mappings (will be added when plugins are configured)
-- map("n", "<LocalLeader>w", ":edit ~/kDrive/Documents/Wiki/index.md<CR>", opts)
-- map("n", "<LocalLeader>n", ":edit ~/kDrive/Documents/Wiki/quicknote.md<CR>", opts)

-- -----------------------------------------------------------------------------
-- > Custom Commands
-- -----------------------------------------------------------------------------

-- Fix common mistakes
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- Trim trailing spaces
vim.api.nvim_create_user_command("TEOL", [[%s/\s\+$//]], {})

-- Retab and trim
vim.api.nvim_create_user_command("CLEAN", function()
  vim.cmd("retab")
  vim.cmd("TEOL")
end, {})

-- Close all buffers except current
vim.api.nvim_create_user_command("BufCloseOthers", function()
  vim.cmd("%bdelete|edit#")
end, {})

-- -----------------------------------------------------------------------------
-- > Custom Functions
-- -----------------------------------------------------------------------------

-- GoToTag: Smart tag navigation (will use Telescope when configured)
function _G.go_to_tag()
  local cword = vim.fn.expand("<cword>")
  local tags_file = ".tags"

  -- Check if .tags file exists
  if vim.fn.filereadable(tags_file) == 0 then
    print("No .tags file found")
    return
  end

  -- Count matches in tags file
  local cmd = string.format("cat %s | grep -w '^%s\t' | wc -l", tags_file, cword)
  local matches = tonumber(vim.fn.system(cmd):match("%d+"))

  if matches == 0 then
    -- No tag found, search with Rg (will be configured with Telescope later)
    print("No tag found for: " .. cword)
    -- vim.cmd("Rg " .. cword)
  elseif matches == 1 then
    -- Single match, go directly
    vim.cmd("tag " .. cword)
  else
    -- Multiple matches, show list (will use Telescope later)
    vim.cmd("tselect " .. cword)
    -- vim.cmd("Tags '" .. cword)
  end
end

map("n", "<Leader>h", "<cmd>lua go_to_tag()<CR>", opts)

-- Show syntax highlight group under cursor
map("n", "<Leader>m", function()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local id = vim.fn.synID(line, col, 1)
  local trans_id = vim.fn.synIDtrans(id)

  local hi = vim.fn.synIDattr(id, "name")
  local trans = vim.fn.synIDattr(vim.fn.synID(line, col, 0), "name")
  local lo = vim.fn.synIDattr(trans_id, "name")

  print(string.format("hi<%s> trans<%s> lo<%s>", hi, trans, lo))
end, { noremap = true, silent = false })

-- -----------------------------------------------------------------------------
-- > Plugin-specific Keymaps (to be added when plugins are configured)
-- -----------------------------------------------------------------------------

-- FZF/Telescope spell suggestions (will be configured with Telescope later)
-- map("n", "z=", function() ... end, opts)

-- Note: The following keymaps will be added when plugins are configured:
-- - ' (quote) for buffer list
-- - <Leader>t for file search
-- - <Leader>r for tag search
-- - <Leader>f for text search (Rg)
-- - <Leader>j for search word under cursor
-- - - (dash) for file explorer
-- - <Leader>k for toggle file explorer drawer
-- - <Leader>l for reveal file in explorer
-- - <Leader>gb for Git blame
-- - <Leader>u for Mundo toggle
