" ==============================================================================
" > ALE (Asynchronous Lint Engine) configuration
" ==============================================================================

" > Signs ----------------------------------------------------------------------

" let g:ale_open_list = 1
" let g:ale_cursor_detail = 1
let g:ale_sign_warning = ">"
let g:ale_sign_error = "XX"

" > Behavior -------------------------------------------------------------------

" Only run linters explicitly configured (don't run all available linters)
let g:ale_linters_explicit = 1

" Automatically fix files on save
let g:ale_fix_on_save = 1

" Disable virtual text cursor (inline error messages)
let g:ale_virtualtext_cursor = "disabled"

" > Linters per filetype -------------------------------------------------------

let g:ale_linters = {
\   "elixir": ["credo"],
\   "elm": ["make"],
\   "eruby": ["erblint"],
\   "haml": ["hamllint"],
\   "javascript": ["standard"],
\   "ruby": ["rubocop"],
\ }

" > Fixers per filetype --------------------------------------------------------

let g:ale_fixers = {
\   "*": ["remove_trailing_lines", "trim_whitespace"],
\   "javascript": ["standard"],
\ }
