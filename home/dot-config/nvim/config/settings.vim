" > Miscelaneous
" ------------------------------------------------------------------------------
set clipboard=unnamed          " Use OSX clipboard
set ttimeoutlen=0              " Avoid delay on escape
set nowrap                     " Don't wrap long lines
set linebreak                  " Casse les longues lignes par mot, pas par caractère
set list                       " Show whitespace as special chars - see listchars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things
set mouse=a                    " Enable mouse for all modes
set showmatch                  " Highlight corresponding bracket
set noshowmode                 " Hide current mode at the bottom of the window
set lazyredraw                 " Améliore les performences de Vim
set shortmess=tI               " Pas de message d'ouverture de Vim
set scrolloff=5                " Keep cursor away from this many chars top/bot
set sidescrolloff=10           " Keep cursor away from this many chars left/right
set updatetime=100             " 4000ms par défaut

" > Cursor and lines numbering
" ------------------------------------------------------------------------------
set number
set splitbelow
set splitright

" > Indentation
" ------------------------------------------------------------------------------
set expandtab                  " Indente avec des espaces
set shiftround                 " Indentation intelligente
set tabstop=2                  " Largeur d'une <Tab>
set shiftwidth=2               " Définit le nombre d'espaces à compter lors d'un <Tab> ou <BS>
set softtabstop=2              " Largeur d'une indentation en mode 'normal'

" > Recherche
" ------------------------------------------------------------------------------
set ignorecase                 " ignore la casse lors de la recherche
set smartcase                  " casse intelligente lors de la recherche

" > Backups et Swaps
" ------------------------------------------------------------------------------
set backup                     " Active le backup des fichiers sauvegardés
set noswapfile                 " Désactive les fichiers swap
set undofile                   " Active les fichers undo
set backupdir=~/.cache/vim/backups " Dossier pour les backups
set undodir=~/.cache/vim/undos " Dossier pour les undos
set tags^=.tags;               " Set tags file

" > Folding
" ------------------------------------------------------------------------------
set nofoldenable               " Folding désactivé par défaut
set foldmethod=marker          " Folding selon les marqueurs {{{ / }}}
set foldlevelstart=99          " Démarrer sans indentation

" > Completion
" ------------------------------------------------------------------------------
set completeopt=longest,menuone,preview " Paramètres de la complétion
set complete+=kspell           " Ajoute le dictionnaire à la complétion lorsque spell est activé

" > Disable some language providers
" ------------------------------------------------------------------------------
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
