" ==============================================================================
" > BÉPO keyboard layout mappings
" ==============================================================================

" > Window management ----------------------------------------------------------

" Use {W} as Ctrl+W for window commands
noremap w <C-w>

" Use {W}{W} to cycle through windows
noremap W <C-w><C-w>

" > Directional navigation: [HJKL] → {CTSR} -----------------------------------

" Horizontal movement (BÉPO home row)
noremap c h
noremap r l

" Vertical movement (BÉPO home row)
noremap t j
noremap s k

" Jump to top/bottom of screen
noremap C H
noremap R L

" Join lines / Help
noremap T J
noremap S K

" Fold navigation
noremap zs zj
noremap zt zk

" > Remapped commands: {HJKL} ← [CTSR] ----------------------------------------

" {J} = Jusqu'à (until character, like 't' in QWERTY)
noremap j t
noremap J T

" {L} = Change (like 'c' in QWERTY)
noremap l c
noremap L C

" {H} = Replace (like 'r' in QWERTY)
noremap h r
noremap H R

" {K} = "Substitute" (like 's' in QWERTY)
noremap k s
noremap K S

" Spell checking navigation
noremap ]k ]s
noremap [k [s

" > Display line navigation ----------------------------------------------------

" Navigate display lines within wrapped text (with 'g' prefix)
noremap gs gk
noremap gt gj

" > Tab navigation -------------------------------------------------------------

" Previous/next tab
noremap gb gT
noremap gé gt

" First/last tab
noremap gB :exe "silent! tabfirst"<CR>
noremap gÉ :exe "silent! tablast"<CR>

" Beginning of display line
noremap g" g0

" > Angle brackets -------------------------------------------------------------

" Direct access to < and > (useful for indenting)
noremap « <
noremap » >

" > Window navigation (BÉPO-adapted) -------------------------------------------

" Navigate between splits using BÉPO directional keys
noremap wt <C-w>j
noremap ws <C-w>k
noremap wc <C-w>h
noremap wr <C-w>l

" Window management
noremap wd <C-w>c
noremap wo <C-w>s
noremap wp <C-w>o
