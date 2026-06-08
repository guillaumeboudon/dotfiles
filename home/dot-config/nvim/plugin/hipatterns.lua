-- mini.hipatterns : surcouche de coloration par motifs, par-dessus tree-sitter.
-- Modèle « moteur de base + vocabulaire surligné » (cf. tpope/vim-rails) : on ne
-- réimplémente pas la syntaxe, on met en avant des motifs transverses ou propres
-- à un usage. Les motifs GLOBAUX (FIXME, hex…) iront ici ; les motifs propres à
-- un filetype sont définis dans after/ftplugin/<ft>.lua via vim.b.minihipatterns_config.
require('mini.hipatterns').setup({
  highlighters = {},
})
