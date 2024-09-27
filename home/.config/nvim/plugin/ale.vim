" let g:ale_open_list = 1
" let g:ale_cursor_detail = 1
let g:ale_sign_warning = ">"
let g:ale_sign_error = "XX"

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ale_virtualtext_cursor = "disabled"

let g:ale_linters = {
\   "elixir": ["credo"],
\   "elm": ["make"],
\   "eruby": ["erblint"],
\   "haml": ["hamllint"],
\   "javascript": ["standard"],
\   "ruby": ["rubocop"],
\ }

let g:ale_fixers = {
\   "*": ["remove_trailing_lines", "trim_whitespace"],
\   "javascript": ["standard"],
\ }
