let g:vimwiki_list = [{
  \   'path': '~/Dropbox/wiki',
  \   'syntax': 'markdown',
  \   'ext': 'md',
  \   'nested_syntaxes': {'mmd': 'mermaid', 'rb': 'ruby', 'shell': 'bash'},
  \ }]

let g:vimwiki_global_ext = 0
let g:vimwiki_conceallevel = 0

let g:vimwiki_key_mappings = {}
let g:vimwiki_key_mappings.table_mappings = 0

nmap <Leader>w<Space> <Plug>VimwikiToggleListItem
vmap <Leader>w<Space> <Plug>VimwikiToggleListItem
