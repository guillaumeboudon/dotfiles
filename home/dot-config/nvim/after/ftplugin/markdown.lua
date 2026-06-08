-- Surcouches mini.hipatterns spécifiques au markdown.
-- raw_url : colorise les URL brutes (non balisées) que la grammaire CommonMark
-- ne capture pas en tree-sitter. On réutilise le group @markup.link.url pour que
-- les URL brutes aient le même rouge que les liens markdown.
vim.b.minihipatterns_config = {
  highlighters = {
    raw_url = {
      pattern = "%f[%w]()https?://[%w._~:/?#@!$&*+=%%-]*[%w/]()",
      group = "@markup.link.url",
    },
  },
}
