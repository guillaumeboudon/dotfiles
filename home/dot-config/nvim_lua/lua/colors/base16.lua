-- =============================================================================
-- > Base16 Colorscheme
-- =============================================================================
-- Based on base16-vim by Chris Kempson (http://chriskempson.com)
-- Converted to Lua for Neovim

local M = {}

-- -----------------------------------------------------------------------------
-- > Color Definitions from Environment
-- -----------------------------------------------------------------------------

-- GUI colors from environment variables
local gui = {
  base00 = vim.env.BASE16_000 or "282c34",
  base01 = vim.env.BASE16_001 or "353b45",
  base02 = vim.env.BASE16_002 or "3e4451",
  base03 = vim.env.BASE16_003 or "545862",
  base04 = vim.env.BASE16_004 or "565c64",
  base05 = vim.env.BASE16_005 or "abb2bf",
  base06 = vim.env.BASE16_006 or "b6bdca",
  base07 = vim.env.BASE16_007 or "c8ccd4",
  base08 = vim.env.BASE16_008 or "e06c75",
  base09 = vim.env.BASE16_009 or "d19a66",
  base0A = vim.env.BASE16_00A or "e5c07b",
  base0B = vim.env.BASE16_00B or "98c379",
  base0C = vim.env.BASE16_00C or "56b6c2",
  base0D = vim.env.BASE16_00D or "61afef",
  base0E = vim.env.BASE16_00E or "c678dd",
  base0F = vim.env.BASE16_00F or "be5046",
}

-- Terminal colors
local cterm = {
  base00 = "00",
  base03 = "08",
  base05 = "07",
  base07 = "15",
  base08 = "01",
  base0A = "03",
  base0B = "02",
  base0C = "06",
  base0D = "04",
  base0E = "05",
}

-- Extended terminal colors (256 color support)
local base16colorspace = vim.g.base16colorspace or ""
if base16colorspace == "256" then
  cterm.base01 = "18"
  cterm.base02 = "19"
  cterm.base04 = "20"
  cterm.base06 = "21"
  cterm.base09 = "16"
  cterm.base0F = "17"
else
  cterm.base01 = "10"
  cterm.base02 = "11"
  cterm.base04 = "12"
  cterm.base06 = "13"
  cterm.base09 = "09"
  cterm.base0F = "14"
end

-- -----------------------------------------------------------------------------
-- > Terminal Colors (Neovim)
-- -----------------------------------------------------------------------------

vim.g.terminal_color_0 = "#" .. gui.base00
vim.g.terminal_color_1 = "#" .. gui.base08
vim.g.terminal_color_2 = "#" .. gui.base0B
vim.g.terminal_color_3 = "#" .. gui.base0A
vim.g.terminal_color_4 = "#" .. gui.base0D
vim.g.terminal_color_5 = "#" .. gui.base0E
vim.g.terminal_color_6 = "#" .. gui.base0C
vim.g.terminal_color_7 = "#" .. gui.base05
vim.g.terminal_color_8 = "#" .. gui.base03
vim.g.terminal_color_9 = "#" .. gui.base08
vim.g.terminal_color_10 = "#" .. gui.base0B
vim.g.terminal_color_11 = "#" .. gui.base0A
vim.g.terminal_color_12 = "#" .. gui.base0D
vim.g.terminal_color_13 = "#" .. gui.base0E
vim.g.terminal_color_14 = "#" .. gui.base0C
vim.g.terminal_color_15 = "#" .. gui.base07

if vim.o.background == "light" then
  vim.g.terminal_color_background = vim.g.terminal_color_7
  vim.g.terminal_color_foreground = vim.g.terminal_color_2
else
  vim.g.terminal_color_background = vim.g.terminal_color_0
  vim.g.terminal_color_foreground = vim.g.terminal_color_5
end

-- -----------------------------------------------------------------------------
-- > Helper Function
-- -----------------------------------------------------------------------------

local function hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  local parts = { "hi", group }

  if guifg and guifg ~= "" then
    table.insert(parts, "guifg=#" .. guifg)
  end

  if guibg and guibg ~= "" then
    table.insert(parts, "guibg=#" .. guibg)
  end

  if ctermfg and ctermfg ~= "" then
    table.insert(parts, "ctermfg=" .. ctermfg)
  end

  if ctermbg and ctermbg ~= "" then
    table.insert(parts, "ctermbg=" .. ctermbg)
  end

  if attr and attr ~= "" then
    table.insert(parts, "gui=" .. attr)
    table.insert(parts, "cterm=" .. attr)
  end

  if guisp and guisp ~= "" then
    table.insert(parts, "guisp=#" .. guisp)
  end

  vim.cmd(table.concat(parts, " "))
end

-- -----------------------------------------------------------------------------
-- > Apply Colorscheme
-- -----------------------------------------------------------------------------

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "base16"

  -- Vim editor colors
  hi("Normal", gui.base05, "none", cterm.base05, "none", "", "")
  hi("Bold", "", "", "", "", "bold", "")
  hi("Debug", gui.base08, "", cterm.base08, "", "", "")
  hi("Directory", gui.base0D, "", cterm.base0D, "", "", "")
  hi("Error", gui.base00, gui.base08, cterm.base00, cterm.base08, "", "")
  hi("ErrorMsg", gui.base08, "none", cterm.base08, "none", "", "")
  hi("Exception", gui.base08, "", cterm.base08, "", "", "")
  hi("FoldColumn", gui.base0C, gui.base01, cterm.base0C, cterm.base01, "", "")
  hi("Folded", gui.base03, gui.base01, cterm.base03, cterm.base01, "", "")
  hi("IncSearch", gui.base01, gui.base09, cterm.base01, cterm.base09, "none", "")
  hi("Italic", "", "", "", "", "none", "")
  hi("Macro", gui.base08, "", cterm.base08, "", "", "")
  hi("MatchParen", "", gui.base03, "", cterm.base03, "", "")
  hi("ModeMsg", gui.base0B, "", cterm.base0B, "", "", "")
  hi("MoreMsg", gui.base0B, "", cterm.base0B, "", "", "")
  hi("Question", gui.base0D, "", cterm.base0D, "", "", "")
  hi("Search", gui.base01, gui.base0A, cterm.base01, cterm.base0A, "", "")
  hi("Substitute", gui.base01, gui.base0A, cterm.base01, cterm.base0A, "none", "")
  hi("SpecialKey", gui.base03, "", cterm.base03, "", "", "")
  hi("TooLong", gui.base08, "", cterm.base08, "", "", "")
  hi("Underlined", gui.base08, "", cterm.base08, "", "", "")
  hi("Visual", "", gui.base02, "", cterm.base02, "", "")
  hi("VisualNOS", gui.base08, "", cterm.base08, "", "", "")
  hi("WarningMsg", gui.base08, "", cterm.base08, "", "", "")
  hi("WildMenu", gui.base08, gui.base0A, cterm.base08, "", "", "")
  hi("Title", gui.base0D, "", cterm.base0D, "", "none", "")
  hi("Conceal", gui.base0D, "none", cterm.base0D, "none", "", "")
  hi("Cursor", gui.base00, gui.base05, cterm.base00, cterm.base05, "", "")
  hi("NonText", gui.base03, "", cterm.base03, "", "", "")
  hi("LineNr", gui.base03, gui.base01, cterm.base03, cterm.base01, "", "")
  hi("SignColumn", gui.base03, gui.base01, cterm.base03, cterm.base01, "", "")
  hi("StatusLine", gui.base04, gui.base02, cterm.base04, cterm.base02, "none", "")
  hi("StatusLineNC", gui.base03, gui.base01, cterm.base03, cterm.base01, "none", "")
  hi("VertSplit", gui.base02, gui.base02, cterm.base02, cterm.base02, "none", "")
  hi("ColorColumn", "", gui.base01, "", cterm.base01, "none", "")
  hi("CursorColumn", "", gui.base01, "", cterm.base01, "none", "")
  hi("CursorLine", "", gui.base01, "", cterm.base01, "none", "")
  hi("CursorLineNr", gui.base04, gui.base01, cterm.base04, cterm.base01, "", "")
  hi("QuickFixLine", "", gui.base01, "", cterm.base01, "none", "")
  hi("PMenu", gui.base05, gui.base01, cterm.base05, cterm.base01, "none", "")
  hi("PMenuSel", gui.base01, gui.base05, cterm.base01, cterm.base05, "", "")
  hi("TabLine", gui.base03, gui.base01, cterm.base03, cterm.base01, "none", "")
  hi("TabLineFill", gui.base03, gui.base01, cterm.base03, cterm.base01, "none", "")
  hi("TabLineSel", gui.base0B, gui.base01, cterm.base0B, cterm.base01, "none", "")

  -- Standard syntax highlighting
  hi("Boolean", gui.base09, "", cterm.base09, "", "", "")
  hi("Character", gui.base08, "", cterm.base08, "", "", "")
  hi("Comment", gui.base03, "", cterm.base03, "", "", "")
  hi("Conditional", gui.base0E, "", cterm.base0E, "", "", "")
  hi("Constant", gui.base09, "", cterm.base09, "", "", "")
  hi("Define", gui.base0E, "", cterm.base0E, "", "none", "")
  hi("Delimiter", gui.base0F, "", cterm.base0F, "", "", "")
  hi("Float", gui.base09, "", cterm.base09, "", "", "")
  hi("Function", gui.base0D, "", cterm.base0D, "", "", "")
  hi("Identifier", gui.base08, "", cterm.base08, "", "none", "")
  hi("Include", gui.base0D, "", cterm.base0D, "", "", "")
  hi("Keyword", gui.base0E, "", cterm.base0E, "", "", "")
  hi("Label", gui.base0A, "", cterm.base0A, "", "", "")
  hi("Number", gui.base09, "", cterm.base09, "", "", "")
  hi("Operator", gui.base05, "", cterm.base05, "", "none", "")
  hi("PreProc", gui.base0A, "", cterm.base0A, "", "", "")
  hi("Repeat", gui.base0A, "", cterm.base0A, "", "", "")
  hi("Special", gui.base0C, "", cterm.base0C, "", "", "")
  hi("SpecialChar", gui.base0F, "", cterm.base0F, "", "", "")
  hi("Statement", gui.base08, "", cterm.base08, "", "", "")
  hi("StorageClass", gui.base0A, "", cterm.base0A, "", "", "")
  hi("String", gui.base0B, "", cterm.base0B, "", "", "")
  hi("Structure", gui.base0E, "", cterm.base0E, "", "", "")
  hi("Tag", gui.base0A, "", cterm.base0A, "", "", "")
  hi("Todo", gui.base0A, gui.base01, cterm.base0A, cterm.base01, "", "")
  hi("Type", gui.base0A, "", cterm.base0A, "", "none", "")
  hi("Typedef", gui.base0A, "", cterm.base0A, "", "", "")

  -- C highlighting
  hi("cOperator", gui.base0C, "", cterm.base0C, "", "", "")
  hi("cPreCondit", gui.base0E, "", cterm.base0E, "", "", "")

  -- C# highlighting
  hi("csClass", gui.base0A, "", cterm.base0A, "", "", "")
  hi("csAttribute", gui.base0A, "", cterm.base0A, "", "", "")
  hi("csModifier", gui.base0E, "", cterm.base0E, "", "", "")
  hi("csType", gui.base08, "", cterm.base08, "", "", "")
  hi("csUnspecifiedStatement", gui.base0D, "", cterm.base0D, "", "", "")
  hi("csContextualStatement", gui.base0E, "", cterm.base0E, "", "", "")
  hi("csNewDecleration", gui.base08, "", cterm.base08, "", "", "")

  -- CSS highlighting
  hi("cssBraces", gui.base05, "", cterm.base05, "", "", "")
  hi("cssClassName", gui.base0E, "", cterm.base0E, "", "", "")
  hi("cssColor", gui.base0C, "", cterm.base0C, "", "", "")

  -- Diff highlighting
  hi("DiffAdd", gui.base0B, gui.base01, cterm.base0B, cterm.base01, "", "")
  hi("DiffChange", gui.base03, gui.base01, cterm.base03, cterm.base01, "", "")
  hi("DiffDelete", gui.base08, gui.base01, cterm.base08, cterm.base01, "", "")
  hi("DiffText", gui.base0D, gui.base01, cterm.base0D, cterm.base01, "", "")
  hi("DiffAdded", gui.base0B, "none", cterm.base0B, "none", "", "")
  hi("DiffFile", gui.base08, "none", cterm.base08, "none", "", "")
  hi("DiffNewFile", gui.base0B, "none", cterm.base0B, "none", "", "")
  hi("DiffLine", gui.base0D, "none", cterm.base0D, "none", "", "")
  hi("DiffRemoved", gui.base08, "none", cterm.base08, "none", "", "")

  -- Git highlighting
  hi("gitcommitOverflow", gui.base08, "", cterm.base08, "", "", "")
  hi("gitcommitSummary", gui.base0B, "", cterm.base0B, "", "", "")
  hi("gitcommitComment", gui.base03, "", cterm.base03, "", "", "")
  hi("gitcommitUntracked", gui.base03, "", cterm.base03, "", "", "")
  hi("gitcommitDiscarded", gui.base03, "", cterm.base03, "", "", "")
  hi("gitcommitSelected", gui.base03, "", cterm.base03, "", "", "")
  hi("gitcommitHeader", gui.base0E, "", cterm.base0E, "", "", "")
  hi("gitcommitSelectedType", gui.base0D, "", cterm.base0D, "", "", "")
  hi("gitcommitUnmergedType", gui.base0D, "", cterm.base0D, "", "", "")
  hi("gitcommitDiscardedType", gui.base0D, "", cterm.base0D, "", "", "")
  hi("gitcommitBranch", gui.base09, "", cterm.base09, "", "bold", "")
  hi("gitcommitUntrackedFile", gui.base0A, "", cterm.base0A, "", "", "")
  hi("gitcommitUnmergedFile", gui.base08, "", cterm.base08, "", "bold", "")
  hi("gitcommitDiscardedFile", gui.base08, "", cterm.base08, "", "bold", "")
  hi("gitcommitSelectedFile", gui.base0B, "", cterm.base0B, "", "bold", "")

  -- GitGutter highlighting (will be updated when gitsigns is added)
  hi("GitGutterAdd", gui.base0B, gui.base01, cterm.base0B, cterm.base01, "", "")
  hi("GitGutterChange", gui.base0D, gui.base01, cterm.base0D, cterm.base01, "", "")
  hi("GitGutterDelete", gui.base08, gui.base01, cterm.base08, cterm.base01, "", "")
  hi("GitGutterChangeDelete", gui.base0E, gui.base01, cterm.base0E, cterm.base01, "", "")

  -- HTML highlighting
  hi("htmlBold", gui.base0A, "", cterm.base0A, "", "", "")
  hi("htmlItalic", gui.base0E, "", cterm.base0E, "", "", "")
  hi("htmlEndTag", gui.base05, "", cterm.base05, "", "", "")
  hi("htmlTag", gui.base05, "", cterm.base05, "", "", "")

  -- JavaScript highlighting
  hi("javaScript", gui.base05, "", cterm.base05, "", "", "")
  hi("javaScriptBraces", gui.base05, "", cterm.base05, "", "", "")
  hi("javaScriptNumber", gui.base09, "", cterm.base09, "", "", "")
  hi("jsOperator", gui.base0D, "", cterm.base0D, "", "", "")
  hi("jsStatement", gui.base0E, "", cterm.base0E, "", "", "")
  hi("jsReturn", gui.base0E, "", cterm.base0E, "", "", "")
  hi("jsThis", gui.base08, "", cterm.base08, "", "", "")
  hi("jsClassDefinition", gui.base0A, "", cterm.base0A, "", "", "")
  hi("jsFunction", gui.base0E, "", cterm.base0E, "", "", "")
  hi("jsFuncName", gui.base0D, "", cterm.base0D, "", "", "")
  hi("jsFuncCall", gui.base0D, "", cterm.base0D, "", "", "")
  hi("jsClassFuncName", gui.base0D, "", cterm.base0D, "", "", "")
  hi("jsClassMethodType", gui.base0E, "", cterm.base0E, "", "", "")
  hi("jsRegexpString", gui.base0C, "", cterm.base0C, "", "", "")
  hi("jsGlobalObjects", gui.base0A, "", cterm.base0A, "", "", "")
  hi("jsGlobalNodeObjects", gui.base0A, "", cterm.base0A, "", "", "")
  hi("jsExceptions", gui.base0A, "", cterm.base0A, "", "", "")
  hi("jsBuiltins", gui.base0A, "", cterm.base0A, "", "", "")

  -- Mail highlighting
  hi("mailQuoted1", gui.base0A, "", cterm.base0A, "", "", "")
  hi("mailQuoted2", gui.base0B, "", cterm.base0B, "", "", "")
  hi("mailQuoted3", gui.base0E, "", cterm.base0E, "", "", "")
  hi("mailQuoted4", gui.base0C, "", cterm.base0C, "", "", "")
  hi("mailQuoted5", gui.base0D, "", cterm.base0D, "", "", "")
  hi("mailQuoted6", gui.base0A, "", cterm.base0A, "", "", "")
  hi("mailURL", gui.base0D, "", cterm.base0D, "", "", "")
  hi("mailEmail", gui.base0D, "", cterm.base0D, "", "", "")

  -- Markdown highlighting
  hi("markdownCode", gui.base0B, "", cterm.base0B, "", "", "")
  hi("markdownError", gui.base05, "none", cterm.base05, "none", "", "")
  hi("markdownCodeBlock", gui.base0B, "", cterm.base0B, "", "", "")
  hi("markdownHeadingDelimiter", gui.base0D, "", cterm.base0D, "", "", "")

  -- NERDTree highlighting
  hi("NERDTreeDirSlash", gui.base0D, "", cterm.base0D, "", "", "")
  hi("NERDTreeExecFile", gui.base05, "", cterm.base05, "", "", "")

  -- PHP highlighting
  hi("phpMemberSelector", gui.base05, "", cterm.base05, "", "", "")
  hi("phpComparison", gui.base05, "", cterm.base05, "", "", "")
  hi("phpParent", gui.base05, "", cterm.base05, "", "", "")
  hi("phpMethodsVar", gui.base0C, "", cterm.base0C, "", "", "")

  -- Python highlighting
  hi("pythonOperator", gui.base0E, "", cterm.base0E, "", "", "")
  hi("pythonRepeat", gui.base0E, "", cterm.base0E, "", "", "")
  hi("pythonInclude", gui.base0E, "", cterm.base0E, "", "", "")
  hi("pythonStatement", gui.base0E, "", cterm.base0E, "", "", "")

  -- Ruby highlighting
  hi("rubyAttribute", gui.base0D, "", cterm.base0D, "", "", "")
  hi("rubyConstant", gui.base0A, "", cterm.base0A, "", "", "")
  hi("rubyCapitalizedMethod", gui.base0A, "", cterm.base0A, "", "", "")
  hi("rubyInterpolationDelimiter", gui.base0F, "", cterm.base0F, "", "", "")
  hi("rubyRegexp", gui.base0C, "", cterm.base0C, "", "", "")
  hi("rubySymbol", gui.base0B, "", cterm.base0B, "", "", "")
  hi("rubyStringDelimiter", gui.base0B, "", cterm.base0B, "", "", "")

  -- SASS highlighting
  hi("sassidChar", gui.base08, "", cterm.base08, "", "", "")
  hi("sassClassChar", gui.base09, "", cterm.base09, "", "", "")
  hi("sassInclude", gui.base0E, "", cterm.base0E, "", "", "")
  hi("sassMixing", gui.base0E, "", cterm.base0E, "", "", "")
  hi("sassMixinName", gui.base0D, "", cterm.base0D, "", "", "")

  -- Signify highlighting (will be updated when gitsigns is added)
  hi("SignifySignAdd", gui.base0B, gui.base01, cterm.base0B, cterm.base01, "", "")
  hi("SignifySignChange", gui.base0D, gui.base01, cterm.base0D, cterm.base01, "", "")
  hi("SignifySignDelete", gui.base08, gui.base01, cterm.base08, cterm.base01, "", "")

  -- Spelling highlighting
  hi("SpellBad", "", "", "", "", "undercurl", gui.base08)
  hi("SpellLocal", "", "", "", "", "undercurl", gui.base0C)
  hi("SpellCap", "", "", "", "", "undercurl", gui.base0D)
  hi("SpellRare", "", "", "", "", "undercurl", gui.base0E)

  -- Startify highlighting
  hi("StartifyBracket", gui.base03, "", cterm.base03, "", "", "")
  hi("StartifyFile", gui.base07, "", cterm.base07, "", "", "")
  hi("StartifyFooter", gui.base03, "", cterm.base03, "", "", "")
  hi("StartifyHeader", gui.base0B, "", cterm.base0B, "", "", "")
  hi("StartifyNumber", gui.base09, "", cterm.base09, "", "", "")
  hi("StartifyPath", gui.base03, "", cterm.base03, "", "", "")
  hi("StartifySection", gui.base0E, "", cterm.base0E, "", "", "")
  hi("StartifySelect", gui.base0C, "", cterm.base0C, "", "", "")
  hi("StartifySlash", gui.base03, "", cterm.base03, "", "", "")
  hi("StartifySpecial", gui.base03, "", cterm.base03, "", "", "")

  -- Java highlighting
  hi("javaOperator", gui.base0D, "", cterm.base0D, "", "", "")

  -- -----------------------------------------------------------------------------
  -- > Custom Overrides (from colors.vim)
  -- -----------------------------------------------------------------------------

  -- Visual mode: reverse video
  vim.cmd("hi Visual cterm=reverse")

  -- SpellBad: custom colors
  hi("SpellBad", gui.base00, gui.base08, cterm.base00, cterm.base08, "", "")

  -- HTML heading colors
  hi("htmlH1", gui.base08, "", cterm.base08, "", "", "")
  hi("htmlH2", gui.base09, "", cterm.base09, "", "", "")
  hi("htmlH3", gui.base0A, "", cterm.base0A, "", "", "")
  hi("htmlH4", gui.base0B, "", cterm.base0B, "", "", "")
  hi("htmlH5", gui.base0C, "", cterm.base0C, "", "", "")
  hi("htmlH6", gui.base0D, "", cterm.base0D, "", "", "")

  -- HTML strike-through as comment
  vim.cmd("hi link HtmlStrike Comment")
end

return M
