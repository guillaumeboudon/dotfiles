" ==============================================================================
" > Fern (file explorer) configuration
" ==============================================================================

" > General options ------------------------------------------------------------

" Show hidden files by default
let g:fern#default_hidden = 1

" Disable default mappings (we define custom ones below)
let g:fern#disable_default_mappings = 1

" Keep alternate file when opening files from Fern
let g:fern#keepalt_on_edit = 1

" > Visual symbols -------------------------------------------------------------

let g:fern#mark_symbol                       = "◉"
let g:fern#renderer#default#collapsed_symbol = "▷ "
let g:fern#renderer#default#expanded_symbol  = "▼ "
let g:fern#renderer#default#leading          = "  "
let g:fern#renderer#default#leaf_symbol      = ""
let g:fern#renderer#default#root_symbol      = "~ "

" > Key mappings ---------------------------------------------------------------

function! s:init_fern() abort
  " Smart open/expand/collapse: open files, expand/collapse directories
  nmap <buffer><expr>
      \ <Plug>(fern-my-open-or-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  " Smart expand/open: expand directories, open files
  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-open)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open)",
      \   "\<Plug>(fern-action-expand)"
      \ )

  " Enter: smart open/expand/collapse
  nmap <buffer><nowait> <Return> <Plug>(fern-my-open-or-expand-or-collapse)

  " Toggle hidden files
  nmap <buffer> . <Plug>(fern-action-hidden:toggle)

  " Collapse directory
  nmap <buffer> c <Plug>(fern-action-collapse)

  " Delete (permanent)
  nmap <buffer> D <Plug>(fern-action-remove)

  " Delete (to trash)
  nmap <buffer> d <Plug>(fern-action-trash)

  " Move/rename
  nmap <buffer> m <Plug>(fern-action-move)

  " Create new file/directory
  nmap <buffer> n <Plug>(fern-action-new-path)

  " Expand or open (BÉPO: r = right/expand)
  nmap <buffer> r <Plug>(fern-my-expand-or-open)

  " Go up to parent directory
  nmap <buffer> u <Plug>(fern-action-leave)

  " Copy
  nmap <buffer> y <Plug>(fern-action-copy)
endfunction

augroup fern_autocmds
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END
