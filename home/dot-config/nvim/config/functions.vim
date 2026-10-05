" Trim spaces at EOL and retab. I run `:CLEAN` a lot to clean up files.
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL

" Close all buffers except this one
command! BufCloseOthers %bd|e#

" Jump to the tag under the cursor: direct jump if unique, fzf list if several,
" ripgrep search if none
function! GoToTag() abort
  let l:cword = expand('<cword>')
  let l:count = len(taglist('^' . escape(l:cword, '\.*$^~[]') . '$'))
  if l:count == 0
    exe "Rg" l:cword
  elseif l:count == 1
    exe "tag" l:cword
  else
    exe "Tags" l:cword
  endif
endfunction

" Pick a spelling suggestion for the word under the cursor with fzf
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
