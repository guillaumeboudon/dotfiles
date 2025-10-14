" ==============================================================================
" > Spell checking with FZF
" ==============================================================================

" > FZF spell suggestion function ---------------------------------------------

" Replace the word under cursor with selected suggestion from FZF
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

" Open FZF with spell suggestions for word under cursor
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction

" > Mapping --------------------------------------------------------------------

" Use FZF for spell suggestions instead of default z= menu
nnoremap z= :call FzfSpell()<CR>
