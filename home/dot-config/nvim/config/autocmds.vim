augroup my_autocommands
" Reset all autocommands
autocmd!

" Highlighting selection on yank
autocmd TextYankPost * silent! lua vim.hl.on_yank()

" Resize panes when window/terminal gets resized
autocmd VimResized * wincmd =

" Avoid the W16 warning on :w on kDrive-synced Wiki files
autocmd BufWritePost ~/kDrive/Documents/Wiki/* call timer_start(2500, {-> execute('silent! checktime')})
autocmd FocusGained,BufEnter ~/kDrive/Documents/Wiki/* silent! checktime

augroup END
