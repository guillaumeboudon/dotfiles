let g:ledger_extra_options = "--strict"
let g:ledger_default_commodity = "€"
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = " "
let g:ledger_date_format = "%Y-%m-%d"

function! LedgerAlignAll()
  let save_pos = getpos(".")
  :%LedgerAlign
  call setpos(".", save_pos)
endfunction

augroup ledger
  autocmd!
  autocmd FileType ledger noremap <buffer> { ?^\d<CR>
  autocmd BufWritePre *.ledger call LedgerAlignAll()
augroup END
