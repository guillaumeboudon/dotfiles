" ==============================================================================
" > General Vim settings
" ==============================================================================

" > Essentials -----------------------------------------------------------------

set nocompatible
filetype plugin indent on
syntax on

" > General behavior -----------------------------------------------------------

set backspace=indent,eol,start       " Apply standard backspace behavior
set clipboard=unnamed                " Use system clipboard
set encoding=utf-8                   " Default encoding
set ttimeoutlen=0                    " Remove timeout when pressing Escape
set hidden                           " Enable modified buffers to be hidden
set nowrap                           " Don't wrap long lines by default
set linebreak                        " Wrap lines at word boundaries when wrap is enabled
set list                             " Show whitespace as special characters
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set mouse=a                          " Enable mouse support in all modes
set showmatch                        " Highlight matching brackets
set noshowmode                       " Hide mode indicator (lightline shows it)
set lazyredraw                       " Improve rendering performance
set shortmess=tI                     " Don't show intro message on startup
set laststatus=2                     " Always show status bar
set scrolloff=5                      " Keep cursor away from top/bottom edges
set sidescrolloff=10                 " Keep cursor away from left/right edges
set updatetime=100                   " Faster update time for plugins (default: 4000ms)

" > Cursor and line numbering --------------------------------------------------

set number                           " Show absolute line numbers
set norelativenumber                 " Disable relative line numbers

" > Window splitting -----------------------------------------------------------

set splitbelow                       " Open horizontal splits below
set splitright                       " Open vertical splits to the right

" > Indentation ----------------------------------------------------------------

set autoindent                       " Copy indent from current line when starting new line
set expandtab                        " Use spaces instead of tabs
set shiftround                       " Round indent to multiple of shiftwidth
set tabstop=2                        " Width of a tab character
set shiftwidth=2                     " Number of spaces for each indent level
set softtabstop=2                    " Number of spaces for tab in insert mode

" > Search ---------------------------------------------------------------------

set hlsearch                         " Highlight search results
set ignorecase                       " Ignore case in search patterns
set incsearch                        " Search incrementally as you type
set smartcase                        " Case-sensitive if pattern contains uppercase
set inccommand=nosplit               " Show live preview of substitute command

" > Alerts ---------------------------------------------------------------------

set noerrorbells                     " Disable error bells
set visualbell t_vb=                 " Disable visual bell

" > Backups and swap files -----------------------------------------------------

set backup                           " Enable backup of saved files
set writebackup                      " Enable backup during save
set noswapfile                       " Disable swap files
set undofile                         " Enable persistent undo
set backupdir=~/.cache/vim/backups   " Directory for backup files
set undodir=~/.cache/vim/undos       " Directory for undo files
set tags^=.tags;                     " Look for tags file in current directory and parents

" > Folding --------------------------------------------------------------------

set nofoldenable                     " Folding disabled by default
set foldmethod=marker                " Fold based on markers
set foldlevelstart=99                " Start with all folds open

" > Completion -----------------------------------------------------------------

set completeopt=longest,menuone,preview  " Completion behavior
set complete+=kspell                 " Include spell dictionary when spell checking is enabled
set wildmenu                         " Enable enhanced command-line completion
set wildmode=full                    " Command-line completion mode

" > Disable language providers -------------------------------------------------

let g:loaded_node_provider = 0      " Disable Node.js provider (speeds up startup)
let g:loaded_perl_provider = 0      " Disable Perl provider (speeds up startup)
