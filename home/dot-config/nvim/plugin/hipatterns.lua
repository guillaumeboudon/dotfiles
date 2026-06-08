-- mini.hipatterns : surcouche de coloration par motifs, par-dessus tree-sitter.
-- Modèle « moteur de base + vocabulaire surligné » (cf. tpope/vim-rails) : on ne
-- réimplémente pas la syntaxe, on met en avant des motifs transverses ou propres
-- à un usage. Les motifs GLOBAUX (FIXME, couleurs…) sont ici ; les motifs propres
-- à un filetype vont dans after/ftplugin/<ft>.lua via vim.b.minihipatterns_config.
local hipatterns = require('mini.hipatterns')
local color = require('hipatterns_color')

-- #rgb (hex court) → couleur de fond via le hex étendu.
local function shorthex_group(_, match)
  return hipatterns.compute_hex_color_group(color.expand_shorthex(match), 'bg')
end

-- rgb()/rgba() → couleur de fond via le hex converti.
local function rgb_group(_, match)
  local hex = color.rgb_to_hex(match)
  return hex and hipatterns.compute_hex_color_group(hex, 'bg') or nil
end

hipatterns.setup({
  highlighters = {
    -- Mots-clés de suivi (tous filetypes). Les groups MiniHipatterns* sont
    -- colorisés en badge base16 dans config/colors.vim.
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

    -- Couleurs : fond = la couleur elle-même. Couvre #rrggbb, #rgb et rgb()/rgba()
    hex_color = hipatterns.gen_highlighter.hex_color(),
    shorthex = { pattern = '()#%x%x%x()%f[%X]', group = shorthex_group },
    rgb_color = { pattern = 'rgba?%b()', group = rgb_group },
  },
})
