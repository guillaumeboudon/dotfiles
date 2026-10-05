call plug#begin('~/.local/share/nvim/plugged')

" > Interface
" ------------------------------------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" > General enhancements
" ------------------------------------------------------------------------------
Plug 'fcpg/vim-waikiki'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'

" > Syntax
" ------------------------------------------------------------------------------
Plug 'ledger/vim-ledger'
Plug 'xuhdev/vim-latex-live-preview', { 'for': ['tex', 'plaintex'] }
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main', 'do': ':TSUpdate' }
Plug 'nvim-mini/mini.hipatterns'

call plug#end()

packadd nvim.undotree

" > Lightline
" ------------------------------------------------------------------------------
let g:lightline = {
\   'colorscheme': 'base16',
\   'active': {
\     'left': [['mode', 'paste'], ['readonly', 'filename', 'modified'], ['fileformat', 'fileencoding', 'filetype']],
\     'right': [['lineinfo'], ['percent'], ['linter_warnings', 'linter_errors']]
\   }, 'component_expand': {
\     'linter_warnings': 'LightlineLinterWarnings',
\     'linter_errors': 'LightlineLinterErrors',
\   }, 'component_type': {
\     'linter_warnings': 'warning',
\     'linter_errors': 'error'
\   }
\ }

" Refresh the linter counts when ALE runs (component_expand is not re-evaluated otherwise)
augroup lightline_ale
  autocmd!
  autocmd User ALEJobStarted,ALELintPost,ALEFixPost call lightline#update()
augroup END

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d Δ', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✘', all_errors)
endfunction
