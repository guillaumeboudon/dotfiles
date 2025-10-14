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
noremap c h  " left
noremap r l  " right

" Vertical movement (BÉPO home row)
noremap t j  " down
noremap s k  " up

" Jump to top/bottom of screen
noremap C H  " top of screen
noremap R L  " bottom of screen

" Join lines / Help
noremap T J  " join lines
noremap S K  " help keyword

" Fold navigation
noremap zs zj  " next fold
noremap zt zk  " previous fold

" > Remapped commands: {HJKL} ← [CTSR] ----------------------------------------

" {J} = "Jusqu'à" (until character, like 't' in QWERTY)
noremap j t  " until character forward
noremap J T  " until character backward

" {L} = "Change" (like 'c' in QWERTY)
noremap l c  " change motion
noremap L C  " change to end of line

" {H} = "Replace" (like 'r' in QWERTY)
noremap h r  " replace single character
noremap H R  " replace mode

" {K} = "Substitute" (like 's' in QWERTY)
noremap k s  " substitute character
noremap K S  " substitute line

" Spell checking navigation
noremap ]k ]s  " next spelling error
noremap [k [s  " previous spelling error

" > Display line navigation ----------------------------------------------------

" Navigate display lines within wrapped text (with 'g' prefix)
noremap gs gk  " up one display line
noremap gt gj  " down one display line

" > Tab navigation -------------------------------------------------------------

" Previous/next tab
noremap gb gT  " previous tab
noremap gé gt  " next tab

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
noremap wt <C-w>j  " move to split below
noremap ws <C-w>k  " move to split above
noremap wc <C-w>h  " move to split left
noremap wr <C-w>l  " move to split right

" Window management
noremap wd <C-w>c  " close window
noremap wo <C-w>s  " split horizontally
noremap wp <C-w>o  " close other windows
