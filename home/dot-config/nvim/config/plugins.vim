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
Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'

" > Syntax
" ------------------------------------------------------------------------------
Plug 'ledger/vim-ledger'
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'main', 'do': ':TSUpdate' }
Plug 'nvim-mini/mini.hipatterns'

call plug#end()

packadd nvim.undotree
