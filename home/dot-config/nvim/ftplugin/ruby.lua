-- ==============================================================================
-- > Ruby configuration
-- ==============================================================================

-- > Keyword characters ---------------------------------------------------------

-- Include @ and ? as part of Ruby keywords (for @variables and predicates?)
vim.opt_local.iskeyword:append("@-@")
vim.opt_local.iskeyword:append("?")

-- > Visual guides --------------------------------------------------------------

-- Show visual column guides at 80 and 120 characters
vim.opt_local.colorcolumn = "80,120"
