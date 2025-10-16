-- ==============================================================================
-- > Ledger configuration
-- ==============================================================================

-- > Plugin options --------------------------------------------------------------

vim.g.ledger_extra_options = "--pedantic --explicit --check_payees"
vim.g.ledger_default_commodity = "€"
vim.g.ledger_commodity_before = 0
vim.g.ledger_commodity_sep = " "
vim.g.ledger_date_format = "%Y-%m-%d"

-- Commented options (kept for reference):
-- vim.g.ledger_align_at = 78
-- vim.g.ledger_align_commodity = 1
-- vim.g.ledger_maxwidth = 120
-- vim.g.ledger_fold_blanks = 1

-- > Navigation -----------------------------------------------------------------

-- Jump to previous transaction (line starting with a date)
vim.keymap.set("n", "{", "?^\\d<CR>", { buffer = true, silent = true })

-- > Auto-formatting ------------------------------------------------------------

-- Align all transactions in the buffer
local function ledger_align_all()
  local save_pos = vim.fn.getpos(".")
  vim.cmd("%LedgerAlign")
  vim.fn.setpos(".", save_pos)
end

-- Automatically align transactions on save
vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = 0,
  callback = ledger_align_all,
})

-- > Sorting --------------------------------------------------------------------

-- Sort all transactions by date and amount, then align
local function ledger_sort()
  local save_pos = vim.fn.getpos(".")
  vim.cmd("%! ledger -f - print --sort 'date, amount' --prepend-width 2")
  vim.cmd("normal! gg=G")
  vim.cmd("%LedgerAlign")
  vim.fn.setpos(".", save_pos)
end

-- Create buffer-local command
vim.api.nvim_buf_create_user_command(0, "LedgerSort", ledger_sort, {})
