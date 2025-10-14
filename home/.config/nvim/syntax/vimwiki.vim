" ==============================================================================
" > VimWiki syntax extensions
" ==============================================================================

" > Custom patterns ------------------------------------------------------------

" Dates in YYYY-MM-DD or YY-MM-DD format
syntax match TodoDate    '\d\{2,4\}-\d\{2\}-\d\{2\}'     contains=VimwikiTodo

" Due dates with "due:" prefix
syntax match TodoDueDate 'due:\d\{2,4\}-\d\{2\}-\d\{2\}' contains=VimwikiTodo

" Projects starting with +
syntax match TodoProject '\(^\|\s\)+[[:alnum:]_]\+'      contains=VimwikiTodo

" Contexts starting with @
syntax match TodoContext '\(^\|\s\)@[[:alnum:]_]\+'      contains=VimwikiTodo

" > Highlighting ---------------------------------------------------------------

hi def link TodoDate    PreProc
hi def link TodoDueDate VimWikiBold
hi def link TodoProject Constant
hi def link TodoContext Statement
