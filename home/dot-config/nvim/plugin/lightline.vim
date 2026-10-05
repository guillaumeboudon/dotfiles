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

" Refresh the linter counts when ALE runs (component_expand is not re-evaluated otherwise)
augroup lightline_ale
  autocmd!
  autocmd User ALEJobStarted,ALELintPost,ALEFixPost call lightline#update()
augroup END

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:warnings = l:counts.total - l:counts.error - l:counts.style_error
  return l:counts.total == 0 ? '' : printf('%d Δ', l:warnings)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:errors = l:counts.error + l:counts.style_error
  return l:counts.total == 0 ? '' : printf('%d ✘', l:errors)
endfunction
