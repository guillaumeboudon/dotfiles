" ==============================================================================
" > Color scheme and highlighting
" ==============================================================================

" > Base colorscheme -----------------------------------------------------------

colorscheme base16

" Enable true color support
set termguicolors

" > Visual mode highlighting ---------------------------------------------------

" Use reverse video for visual selection
hi Visual cterm=reverse

" > Spell checking highlighting ------------------------------------------------

" Customize spell error highlighting
call Base16hi("SpellBad", g:base16_gui00, g:base16_gui08, g:base16_cterm00, g:base16_cterm08, "", "")

" > HTML heading colors --------------------------------------------------------

" Color each heading level differently
call Base16hi("htmlH1", g:base16_gui08, "", g:base16_cterm08, "", "", "")
call Base16hi("htmlH2", g:base16_gui09, "", g:base16_cterm09, "", "", "")
call Base16hi("htmlH3", g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call Base16hi("htmlH4", g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call Base16hi("htmlH5", g:base16_gui0C, "", g:base16_cterm0C, "", "", "")
call Base16hi("htmlH6", g:base16_gui0D, "", g:base16_cterm0D, "", "", "")

" > HTML strikethrough ---------------------------------------------------------

" Show strikethrough text as comments
hi link HtmlStrike Comment

" > Trailing whitespace highlighting -------------------------------------------

" Make trailing spaces very visible
highlight ExtraWhitespace ctermfg=235 ctermbg=172 guifg=#282828 guibg=#d79921

augroup trailing_whitespace
  autocmd!
  " Highlight trailing whitespace, except in insert mode at cursor position
  autocmd BufWinEnter * if index(['Mundo', ''], &ft) < 0 | match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * if index(['Mundo', ''], &ft) < 0 | match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * if index(['Mundo', ''], &ft) < 0 | match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup END
