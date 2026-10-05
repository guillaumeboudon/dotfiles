-- Indentation à 4 et correction orthographique en français et en anglais
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.spelllang = 'fr,en'

-- Surcouches mini.hipatterns spécifiques au markdown : motifs hors CommonMark
-- (donc non capturés par tree-sitter). Conventions perso façon todo.txt + URL brutes.
-- Les groups réutilisés (Statement/Keyword/Constant/Label) sont colorisés par le
-- colorscheme base16 — apparence identique à l'ancienne syntaxe after/syntax.
vim.b.minihipatterns_config = {
  highlighters = {
    -- URL brutes (non balisées) → même rouge que les liens markdown.
    raw_url = {
      pattern = "%f[%w]()https?://[%w._~:/?#@!$&*+=%%-]*[%w/]()",
      group = "@markup.link.url",
    },
    -- @mention : @ en début de ligne ou après un non-mot (exclut les emails).
    mention = { pattern = "%f[%w@%-]()@[%w%-]+()", group = "Statement" },
    -- :tag:
    tag = { pattern = "():[%w_%+%-]+:()", group = "Keyword" },
    -- +projet : + en début de ligne ou après un non-mot (exclut a+b).
    project = { pattern = "%f[%w%+_%-]()%+[%w_]+()", group = "Constant" },
    -- date ISO (YY ou YYYY)-MM-DD
    date = { pattern = "()%d%d%d?%d?%-%d%d%-%d%d()", group = "Label" },
  },
}
