" let g:ale_open_list = 1
" let g:ale_cursor_detail = 1
let g:ale_sign_warning = '>'
let g:ale_sign_error = 'XX'

let g:ale_linters = {
  \   "elixir": ["credo"],
  \   "elm": ["make"],
  \   "haml": ["hamllint"],
  \   "ruby": ["rubocop"],
  \ }
