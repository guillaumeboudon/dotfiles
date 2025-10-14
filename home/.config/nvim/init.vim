"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
"
" > Guillaume Boudon
" > https://github.com/guillaumeboudon/dotfiles

" > Configuration files ========================================================

source ~/.config/nvim/before/*.vim
source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/settings.vim
source ~/.config/nvim/config/colors.vim
source ~/.config/nvim/config/functions.vim
source ~/.config/nvim/config/bepo.vim
source ~/.config/nvim/config/bindings.vim

" > General autocommands =======================================================

augroup general_autocommands
  " Reset all autocommands
  autocmd!

  " Highlight yanked text briefly for visual feedback
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()

  " Resize panes when window/terminal gets resize
  autocmd VimResized * :wincmd =
augroup END

" > Startup ====================================================================

" Disable search highlight on startup
silent! nohlsearch
