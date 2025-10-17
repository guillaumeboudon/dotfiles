call plug#begin('~/.local/share/nvim/plugged')

" > Interface
" ------------------------------------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" > General enhancements
" ------------------------------------------------------------------------------
Plug 'fcpg/vim-waikiki'
Plug 'godlygeek/tabular'
Plug 'google/vim-searchindex'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-bufkill'
" Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/fern.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'sirver/UltiSnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'

" > Syntax
" ------------------------------------------------------------------------------
" Plug 'lmeijvogel/vim-yaml-helper', { 'for': 'yaml' }
Plug 'elmcast/elm-vim'
Plug 'ledger/vim-ledger'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'xuhdev/vim-latex-live-preview', { 'for': ['tex', 'plaintex'] }
Plug 'chrisbra/Colorizer'

call plug#end()

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
