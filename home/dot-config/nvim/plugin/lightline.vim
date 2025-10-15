" ==============================================================================
" > Lightline (statusline) configuration
" ==============================================================================

" > Appearance and layout ------------------------------------------------------

let g:lightline = {
\   'colorscheme': 'base16',
\   'active': {
\     'left': [['mode', 'paste'], ['readonly', 'filename', 'modified'], ['fileformat', 'fileencoding', 'filetype']],
\     'right': [['lineinfo'], ['percent'], ['linter_warnings', 'linter_errors']]
\   }, 'component_expand': {
\     'linter_warnings': 'LightlineLinterWarnings',
\     'linter_errors': 'LightlineLinterErrors',
\   }, 'component_type': {
\     'linter_warnings': 'warning',
\     'linter_errors': 'error'
\   }
\ }

" > ALE integration ------------------------------------------------------------

" Show ALE warning count in lightline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d Δ', all_non_errors)
endfunction

" Show ALE error count in lightline
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✘', all_errors)
endfunction
