" ==============================================================================
" > VimWiki configuration
" ==============================================================================

" > Wiki definition ------------------------------------------------------------

let g:vimwiki_list = [{
  \   'path': '~/kDrive/Documents/Wiki',
  \   'syntax': 'markdown',
  \   'ext': 'md',
  \   'nested_syntaxes': {'mmd': 'mermaid', 'rb': 'ruby', 'shell': 'bash'},
  \ }]

" > General options ------------------------------------------------------------

" Don't treat all .md files as vimwiki files (only files in wiki path)
let g:vimwiki_global_ext = 0

" Disable markdown concealment (show raw syntax)
let g:vimwiki_conceallevel = 0

" > Key mappings ---------------------------------------------------------------

" Disable default table mappings (we'll define our own if needed)
let g:vimwiki_key_mappings = {}
let g:vimwiki_key_mappings.table_mappings = 0

" Toggle checklist items with <Leader>w<Space>
nmap <Leader>w<Space> <Plug>VimwikiToggleListItem
vmap <Leader>w<Space> <Plug>VimwikiToggleListItem
