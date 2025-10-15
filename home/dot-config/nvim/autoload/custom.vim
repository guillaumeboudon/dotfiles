" ==============================================================================
" > Custom autoload functions
" ==============================================================================

" > Tag navigation -------------------------------------------------------------

" Smart tag navigation: jump to tag if unique, search if multiple, or Rg if none
function! custom#GoToTag() abort
  let l:cword = expand('<cword>')
  let l:matches = system("cat .tags | rg -w '^'" . l:cword . "'\t' | wc -l | awk '{print $1}'")

  if l:matches =~ "0"
    " No tags found, use Rg to search in files
    exe "Rg" l:cword
  elseif l:matches =~ "1"
    " Exactly one tag found, jump to it directly
    exe "tag" l:cword
  else
    " Multiple tags found, show FZF selector
    exe "Tags" "'" . l:cword
  endif
endfunction
