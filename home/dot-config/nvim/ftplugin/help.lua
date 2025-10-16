-- ==============================================================================
-- > Help file configuration
-- ==============================================================================

-- > Navigation -----------------------------------------------------------------

-- Jump to tag under cursor (follow link)
vim.keymap.set("n", "<CR>", "<C-]>", { buffer = true, silent = true })

-- Go back to previous location
vim.keymap.set("n", "<BS>", "<C-T>", { buffer = true, silent = true })
