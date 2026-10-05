let g:fern#default_hidden = 1
let g:fern#disable_default_mappings = 1
let g:fern#keepalt_on_edit = 1

let g:fern#mark_symbol                       = "●"
let g:fern#renderer#default#collapsed_symbol = "▷ "
let g:fern#renderer#default#expanded_symbol  = "▼ "
let g:fern#renderer#default#leading          = "  "
let g:fern#renderer#default#leaf_symbol      = ""
let g:fern#renderer#default#root_symbol      = "~ "

function! s:init_fern() abort
  nmap <buffer><expr>
      \ <Plug>(fern-my-open-or-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-open)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open)",
      \   "\<Plug>(fern-action-expand)"
      \ )

  nmap <buffer><nowait> <Return> <Plug>(fern-my-open-or-expand-or-collapse)
  nmap <buffer><nowait> . <Plug>(fern-action-hidden:toggle)
  nmap <buffer><nowait> c <Plug>(fern-action-collapse)
  nmap <buffer><nowait> D <Plug>(fern-action-remove)
  nmap <buffer><nowait> d <Plug>(fern-action-trash)
  nmap <buffer><nowait> m <Plug>(fern-action-move)
  nmap <buffer><nowait> n <Plug>(fern-action-new-path)
  nmap <buffer><nowait> r <Plug>(fern-my-expand-or-open)
  nmap <buffer><nowait> u <Plug>(fern-action-leave)
  nmap <buffer><nowait> y <Plug>(fern-action-copy)
endfunction

augroup fern_autocmds
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
