-- mini.hipatterns : surcouche de coloration par motifs, par-dessus tree-sitter.
-- Modèle « moteur de base + vocabulaire surligné » (cf. tpope/vim-rails) : on ne
-- réimplémente pas la syntaxe, on met en avant des motifs transverses ou propres
-- à un usage. Les motifs GLOBAUX (FIXME, hex…) iront ici ; les motifs propres à
-- un filetype sont définis dans after/ftplugin/<ft>.lua via vim.b.minihipatterns_config.
require('mini.hipatterns').setup({
  highlighters = {
    -- Mots-clés de suivi (tous filetypes). Les groups MiniHipatterns* sont
    -- colorisés en badge base16 dans config/colors.vim.
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
  },
})
