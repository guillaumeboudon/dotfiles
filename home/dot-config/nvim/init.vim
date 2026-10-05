"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
"
" > Guillaume Boudon
" > https://github.com/guillaumeboudon/dotfiles


source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/settings.vim
source ~/.config/nvim/config/colors.vim
source ~/.config/nvim/config/functions.vim
source ~/.config/nvim/config/bepo.vim
source ~/.config/nvim/config/bindings.vim


" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
" > Autocommands
" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

augroup my_autocommands
" Reset all autocommands
autocmd!

autocmd BufNewFile,BufRead .gemrc set filetype=yaml

autocmd Filetype elm      setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype todo     setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType markdown setlocal spelllang=fr,en

" Highlighting selection on yank
autocmd TextYankPost * silent! lua vim.hl.on_yank()

" Resize panes when window/terminal gets resized
autocmd VimResized * wincmd =

" Avoid the W16 warning on :w on kDrive-synced Wiki files
autocmd BufWritePost ~/kDrive/Documents/Wiki/* call timer_start(2500, {-> execute('silent! checktime')})
autocmd FocusGained,BufEnter ~/kDrive/Documents/Wiki/* silent! checktime

augroup END
