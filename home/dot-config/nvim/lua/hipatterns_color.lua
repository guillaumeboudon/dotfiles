-- Conversions de couleurs pour les highlighters mini.hipatterns.
-- Fonctions pures (testables sans Neovim de rendu) : transforment une chaîne
-- couleur en hex #rrggbb, que compute_hex_color_group() sait coloriser.
local M = {}

-- '#rgb' (hex court) → '#rrggbb' (chaque digit doublé, casse préservée).
function M.expand_shorthex(short)
  local r, g, b = short:sub(2, 2), short:sub(3, 3), short:sub(4, 4)
  return '#' .. r .. r .. g .. g .. b .. b
end

-- 'rgb(r, g, b)' / 'rgba(r, g, b, a)' → '#rrggbb' (alpha ignoré ; nil si illisible).
function M.rgb_to_hex(str)
  local r, g, b = str:match('(%d+)%D+(%d+)%D+(%d+)')
  if r == nil then return nil end
  return string.format('#%02x%02x%02x', tonumber(r), tonumber(g), tonumber(b))
end

return M
