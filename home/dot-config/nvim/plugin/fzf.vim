" ==============================================================================
" > FZF (Fuzzy Finder) configuration
" ==============================================================================

" > Layout ---------------------------------------------------------------------

" Show FZF at the bottom of the screen, 30% height
let g:fzf_layout = { 'down': '30%' }

" Preview window: right side, 40% width, hidden by default (toggle with Ctrl-/)
let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-/']

" > Colors ---------------------------------------------------------------------

" Custom color scheme (currently commented out)
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Question'],
"   \ 'fg+':     ['fg', 'CursorLine', 'Question', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'NonText'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
