" ==============================================================================
" > Custom functions and commands
" ==============================================================================

" > File cleaning --------------------------------------------------------------

" Trim trailing spaces at end of lines
command! TEOL %s/\s\+$//

" Retab and trim trailing spaces (complete file cleanup)
command! CLEAN retab | TEOL

" > Buffer management ----------------------------------------------------------

" Close all buffers except the current one
command! BufCloseOthers %bd|e#
