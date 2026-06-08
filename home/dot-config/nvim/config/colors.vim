colorscheme base16
hi Visual cterm=reverse
call Base16hi("SpellBad", g:base16_gui00, g:base16_gui08, g:base16_cterm00, g:base16_cterm08, "", "")

call Base16hi("htmlH1", g:base16_gui08, "", g:base16_cterm08, "", "", "")
call Base16hi("htmlH2", g:base16_gui09, "", g:base16_cterm09, "", "", "")
call Base16hi("htmlH3", g:base16_gui0A, "", g:base16_cterm0A, "", "", "")
call Base16hi("htmlH4", g:base16_gui0B, "", g:base16_cterm0B, "", "", "")
call Base16hi("htmlH5", g:base16_gui0C, "", g:base16_cterm0C, "", "", "")
call Base16hi("htmlH6", g:base16_gui0D, "", g:base16_cterm0D, "", "", "")

hi link HtmlStrike Comment

" Markdown (tree-sitter captures → legacy groups defined above)
hi link @markup.heading.1.markdown htmlH1
hi link @markup.heading.2.markdown htmlH2
hi link @markup.heading.3.markdown htmlH3
hi link @markup.heading.4.markdown htmlH4
hi link @markup.heading.5.markdown htmlH5
hi link @markup.heading.6.markdown htmlH6
hi link @markup.strikethrough HtmlStrike
call Base16hi("@markup.strong", g:base16_gui0A, "", g:base16_cterm0A, "", "bold", "")
call Base16hi("@markup.italic", g:base16_gui0E, "", g:base16_cterm0E, "", "italic", "")
" Liens en rouge (remplace la coloration de l'ancien vim-markdown)
call Base16hi("@markup.link", g:base16_gui08, "", g:base16_cterm08, "", "", "")
call Base16hi("@markup.link.label", g:base16_gui08, "", g:base16_cterm08, "", "", "")
call Base16hi("@markup.link.url", g:base16_gui08, "", g:base16_cterm08, "", "", "")

" mini.hipatterns : mots-clés de suivi en badge (fond base16, texte sombre)
call Base16hi("MiniHipatternsFixme", g:base16_gui00, g:base16_gui08, g:base16_cterm00, g:base16_cterm08, "bold", "")
call Base16hi("MiniHipatternsHack",  g:base16_gui00, g:base16_gui09, g:base16_cterm00, g:base16_cterm09, "bold", "")
call Base16hi("MiniHipatternsTodo",  g:base16_gui00, g:base16_gui0A, g:base16_cterm00, g:base16_cterm0A, "bold", "")
call Base16hi("MiniHipatternsNote",  g:base16_gui00, g:base16_gui0C, g:base16_cterm00, g:base16_cterm0C, "bold", "")

" Gruvbox
" set background=dark
set termguicolors
" " let g:gruvbox_contrast_dark='hard'
" " let g:gruvbox_sign_column='bg0'
" let g:gruvbox_number_column='bg1'
" " let g:gruvbox_italic=1
" let g:gruvbox_invert_selection=0
" colorscheme gruvbox

" Make trailing spaces very visible
highlight ExtraWhitespace ctermfg=235 ctermbg=172 guifg=#282828 guibg=#d79921
let extraWhiteSpaceBlacklist = ['Mundo', '']
match ExtraWhiteSpace /\s\+$/
autocmd BufWinEnter * if index(extraWhiteSpaceBlacklist, &ft) < 0 | match ExtraWhiteSpace /\s\+$/
autocmd InsertEnter * if index(extraWhiteSpaceBlacklist, &ft) < 0 | match ExtraWhiteSpace /\s\+\%#\@<!$/
autocmd InsertLeave * if index(extraWhiteSpaceBlacklist, &ft) < 0 | match ExtraWhiteSpace /\s\+$/
autocmd BufWinLeave * call clearmatches()
