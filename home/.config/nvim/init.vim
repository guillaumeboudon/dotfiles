"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
"
"
" > Guillaume Boudon
" > https://github.com/guillaumeboudon/dotfiles


" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
" > Plugins
" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

" > Installed plugins
" ==============================================================================

call plug#begin('~/.local/share/nvim/plugged')

" > Interface
" ------------------------------------------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" > General enhancements
" ------------------------------------------------------------------------------
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-bufkill'
" Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/fern.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'

" > Syntax
" ------------------------------------------------------------------------------
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'ledger/vim-ledger', { 'for': 'ledger' }
Plug 'lmeijvogel/vim-yaml-helper'
" Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'xuhdev/vim-latex-live-preview', { 'for': ['tex', 'plaintex'] }
Plug 'chrisbra/Colorizer'

call plug#end()

" > Plugins settings
" ==============================================================================

" vim-gitgutter
" ------------------------------------------------------------------------------
set updatetime=100 " 4000ms par défaut

" vim-polyglot
" ------------------------------------------------------------------------------
" let g:polyglot_disabled = ['elm', 'ruby']
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▖'
let g:gitgutter_sign_modified_removed = '▌'

" SuperTab
" ------------------------------------------------------------------------------
" let g:SuperTabDefaultCompletionType = "<C-n>"
" let g:SuperTabLongestEnhanced = 1
" let g:SuperTabLongestHighlight = 1

" Mundo
" ------------------------------------------------------------------------------
let g:mundo_width = 80
let g:mundo_preview_height = 25
" let g:mundo_preview_bottom = 1
" let g:mundo_verbose_graph = 0
let g:mundo_mappings = {
  \ '<CR>': 'preview',
  \ 'o': 'preview',
  \ 't': 'move_older',
  \ 's': 'move_newer',
  \ '<down>': 'move_older',
  \ '<up>': 'move_newer',
  \ 'T': 'move_older_write',
  \ 'S': 'move_newer_write',
  \ 'gg': 'move_top',
  \ 'G': 'move_bottom',
  \ 'P': 'play_to',
  \ 'i': 'toggle_inline',
  \ '/': 'search',
  \ 'n': 'next_match',
  \ 'N': 'previous_match',
  \ 'p': 'diff_current_buffer',
  \ 'd': 'diff',
  \ '?': 'toggle_help',
  \ 'q': 'quit',
  \ '<2-LeftMouse>': 'mouse_click' }

" ALE
" ------------------------------------------------------------------------------
" let g:ale_open_list = 1
" let g:ale_cursor_detail = 1
let g:ale_sign_warning = 'Δ'
let g:ale_sign_error = ''

" vim-devicons
" ------------------------------------------------------------------------------
" let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" let g:DevIconsEnableFoldersOpenClose = 1

" Goyo
" ------------------------------------------------------------------------------
let g:goyo_width = 100

" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
" > Settings
" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

" > Essentials
" ------------------------------------------------------------------------------
set nocompatible
filetype plugin indent on
syntax on

" > Miscelaneous
" ------------------------------------------------------------------------------
set backspace=indent,eol,start " Apply standard <BS>
set clipboard=unnamed          " Use OSX clipboard
set encoding=utf-8             " UTF-8 by default
set ttimeoutlen=0              " Avoid delay on escape
" set formatoptions-=ro        " Ne pas auto-commenter au passage de ligne
set hidden                     " Enable modified buffers to be hidden
set nowrap                     " Don't wrap long lines
set linebreak                  " Casse les longues lignes par mot, pas par caractère
set list                       " Show whitespace as special chars - see listchars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things
set mouse=a                    " Enable mouse for all modes
set showmatch                  " Highlight corresponding bracket
set noshowmode                 " Hide current mode at the bottom of the window
set lazyredraw                 " Améliore les performences de Vim
set shortmess=tI               " Pas de message d'ouverture de Vim
set laststatus=2               " Always show the status bar
set scrolloff=5                " Keep cursor away from this many chars top/bot
set sidescrolloff=10           " Keep cursor away from this many chars left/right

" > Cursor and lines numbering
" ------------------------------------------------------------------------------
set number
set norelativenumber
set splitbelow
set splitright

" > Indentation
" ------------------------------------------------------------------------------
set autoindent                 " Indentation automatique
set expandtab                  " Indente avec des espaces
set shiftround                 " Indentation intelligente
set tabstop=2                  " Largeur d'une <Tab>
set shiftwidth=2               " Définit le nombre d'espaces à compter lors d'un <Tab> ou <BS>
set softtabstop=2              " Largeur d'une indentation en mode 'normal'

" > Recherche
" ------------------------------------------------------------------------------
set hlsearch                   " met la recherche en surbrillance
set ignorecase                 " ignore la casse lors de la recherche
set incsearch                  " cherche au fur et à mesure de la frappe
set smartcase                  " casse intelligente lors de la recherche
set inccommand=nosplit         " ajoute la preview sur :substitute

" > Alertes
" ------------------------------------------------------------------------------
set noerrorbells               " Pas d'alerte en cas d'erreur
set visualbell t_vb=           " Pas de flash ni de bip du tout

" > Backups et Swaps
" ------------------------------------------------------------------------------
set backup                     " Active le backup des fichiers sauvegardés
set writebackup                " Active le backup pendant la sauvegarde
set noswapfile                 " Désactive les fichiers swap
set undofile                   " Active les fichers undo
set backupdir=~/.cache/vim/backups " Dossier pour les backups
"set directory=~/.cache/vim/swaps " Dossier pour les fichiers swap
set undodir=~/.cache/vim/undos " Dossier pour les undos
set tags^=.tags;               " Set tags file

" > Folding
" ------------------------------------------------------------------------------
set nofoldenable               " Folding désactivé par défaut
set foldmethod=marker          " Folding selon l'indentation
set foldlevelstart=99          " Démarrer sans indentation

" > Completion
" ------------------------------------------------------------------------------
set completeopt=longest,menuone,preview " Paramètres de la complétion
set complete+=kspell           " Ajoute le dictionnaire à la complétion lorsque spell est activé
set wildmenu                   " Enable command-line completion enhanced mode
set wildmode=full              " Command-line completion settings


" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
" > Colors
" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

colorscheme base16
hi Visual cterm=reverse
call Base16hi("SpellBad", g:base16_gui00, g:base16_gui08, g:base16_cterm00, g:base16_cterm08, "", "")

let g:lightline = { 'colorscheme': 'base16' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Question'],
  \ 'fg+':     ['fg', 'CursorLine', 'Question', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'NonText'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Gruvbox
" set background=dark
set termguicolors
" " let g:gruvbox_contrast_dark='hard'
" " let g:gruvbox_sign_column='bg0'
" let g:gruvbox_number_column='bg1'
" " let g:gruvbox_italic=1
" let g:gruvbox_invert_selection=0
" colorscheme gruvbox

" Make trailing spaces very visible
highlight ExtraWhitespace ctermfg=235 ctermbg=172 guifg=#282828 guibg=#d79921
let extraWhiteSpaceBlacklist = ['Mundo']
match ExtraWhiteSpace /\s\+$/
autocmd BufWinEnter * if index(extraWhiteSpaceBlacklist, &ft) < 0 | match ExtraWhiteSpace /\s\+$/
autocmd InsertEnter * if index(extraWhiteSpaceBlacklist, &ft) < 0 | match ExtraWhiteSpace /\s\+\%#\@<!$/
autocmd InsertLeave * if index(extraWhiteSpaceBlacklist, &ft) < 0 | match ExtraWhiteSpace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
" > Functions
" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

" Trim spaces at EOL and retab. I run `:CLEAN` a lot to clean up files.
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL

" Close all buffers except this one
command! BufCloseOthers %bd|e#


" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
" > Bindings
" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

source ~/.config/nvim/config/bepo.vim
source ~/.config/nvim/config/bindings.vim


" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
" > Syntax
" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

" Ledger
let g:ledger_extra_options = "--pedantic --explicit --check_payees"
let g:ledger_default_commodity = "€"
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = " "
let g:ledger_date_format = "%Y-%m-%d"
" au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
autocmd FileType ledger noremap { ?^\d<CR>

" noremap blah1 :silent make | redraw! | cwindow
" noremap blah2 :call ledger#transaction_date_set(".", "primary")
" noremap blah3 :call ledger#transaction_state_toggle(line("."), " *?!")
" noremap blah4 :LedgerAlign

" let g:ledger_maxwidth = 120
" let g:ledger_fold_blanks = 1

function! LedgerAlignAll()
  let save_pos = getpos(".")
  :%LedgerAlign
  call setpos(".", save_pos)
endfunction
autocmd BufWritePre *.ledger call LedgerAlignAll()

function! LedgerSort()
  let save_pos = getpos(".")
  :%! ledger -f - print --sort 'date, amount' --prepend-width 2
  normal gg=G
  :%LedgerAlign
  call setpos(".", save_pos)
endfunction
command! LedgerSort call LedgerSort()

" CSS
" autocmd BufWritePre,FileWritePre *.css,*.scss :%!csscomb

augroup my_autocommands
" Reset all autocommands
autocmd!

autocmd BufNewFile,BufRead .gemrc    set ft=yaml

autocmd Filetype elm      setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype todo     setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype ruby     setlocal colorcolumn=80,100

augroup END

" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
" > Snippets
" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

" Navigation avec le guide <++> (cf. LukeSmithXYZ dotfiles)
inoremap <Leader><Leader> <Esc>/<++><CR>:noh<CR>"_c4l
vnoremap <Leader><Leader> <Esc>/<++><CR>:noh<CR>"_c4l
noremap  <Leader><Leader> <Esc>/<++><CR>:noh<CR>"_c4l

" Ledger
autocmd Filetype ledger inoremap ,e <C-R>=strftime("%Y-%m-%d")<CR><Space>*<Space><CR>Dépenses:<++><Space><Space><++><Space>€<CR>Comptes:BP-J-CC<CR><CR><++><Esc>4kA

" Markdown
autocmd Filetype markdown inoremap ,1 #<Space><CR><CR><++><Esc>2kA
autocmd Filetype markdown inoremap ,2 ##<Space><CR><CR><++><Esc>2kA
autocmd Filetype markdown inoremap ,3 ###<Space><CR><CR><++><Esc>2kA
autocmd Filetype markdown inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap ,c ```<CR>```<Esc>2kO


" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡
" > Grrrrrrrr, À classer !
" ≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡

let g:tex_flavor = "latex"

function! GoToTag ()
  let l:cword = expand('<cword>')
  let l:matches = system("cat .git/tags | rg -w '^'" . l:cword . "'\t' | wc -l | awk '{print $1}'")
  if l:matches =~ "0"
    exe "Rg" l:cword
  elseif l:matches =~ "1"
    exe "tag" l:cword
  else
    exe "Tags" "'" . l:cword
  endif
endfunction

" Resize panes when window/terminal gets resize
autocmd VimResized * :wincmd =

" autocmd FileType qf setlocal wrap
" autocmd FileType qf wincmd J
" autocmd FileType qf nmap <buffer> q :q<cr>
" autocmd FileType qf setlocal number nolist

" autocmd FileType markdown setlocal spell spelllang=fr
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>


map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

silent! nohlsearch
