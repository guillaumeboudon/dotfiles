" ==============================================================================
" > Ledger configuration
" ==============================================================================

" > Plugin otions --------------------------------------------------------------

let g:ledger_extra_options = "--pedantic --explicit --check_payees"
let g:ledger_default_commodity = "€"
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = " "
let g:ledger_date_format = "%Y-%m-%d"
" let g:ledger_align_at = 78
" let g:ledger_align_commodity = 1
" let g:ledger_maxwidth = 120
" let g:ledger_fold_blanks = 1

" > Navigation -----------------------------------------------------------------

" Jump to previous transaction (line starting with a date)
noremap <buffer> { ?^\d<CR>

" > Auto-formatting ------------------------------------------------------------

" Align all transactions in the buffer
function! LedgerAlignAll()
  let save_pos = getpos(".")
  :%LedgerAlign
  call setpos(".", save_pos)
endfunction

" Automatically align transactions on save
autocmd BufWritePre <buffer> call LedgerAlignAll()

" > Sorting --------------------------------------------------------------------

" Sort all transactions by date and amount, then align
function! LedgerSort()
  let save_pos = getpos(".")
  :%! ledger -f - print --sort 'date, amount' --prepend-width 2
  normal gg=G
  :%LedgerAlign
  call setpos(".", save_pos)
endfunction

command! -buffer LedgerSort call LedgerSort()
