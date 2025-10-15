" ==============================================================================
" > Key bindings
" ==============================================================================

" > Leader keys ----------------------------------------------------------------

let mapleader = ","
let maplocalleader = "é"

" > Navigation -----------------------------------------------------------------

" Vertical navigation with display lines (BÉPO: s=up, t=down)
noremap s gk
noremap t gj

" Fast vertical scrolling
noremap <C-t> 10j
noremap <C-s> 10k

" Backtick jumps to exact position (more useful than single quote)
noremap ' `

" > Editing --------------------------------------------------------------------

" Make Y behave like D and C (yank to end of line)
nnoremap Y y$

" > Plugin bindings ------------------------------------------------------------

" FZF buffer list
nmap ’ :Buffers<CR>

" Fern file explorer in current directory
nmap - :Fern %:h<CR>

" Toggle fold under cursor
nmap <Space> za

" Clear search highlighting
nmap <Leader><Space> :noh<CR>

" Switch to alternate buffer
nmap <Leader><Tab> :b#<CR>

" Copy current file path to clipboard
nmap <Leader>a :!echo -n % \| pbcopy<CR><CR>

" Toggle line wrapping
nmap <Leader>b :setlocal wrap!<CR>:setlocal wrap?<CR>

" Search in files with ripgrep
nmap <Leader>f :Rg<Space>

" Git blame
nmap <Leader>gb :Git blame<CR>

" Smart tag navigation (uses custom#GoToTag function)
nmap <Leader>h :call custom#GoToTag()<CR>

" Search word under cursor in files
nmap <Leader>j :Rg <C-R>=expand("<cword>")<CR><CR>

" Toggle Fern drawer
nmap <Leader>k :Fern . -drawer -toggle<CR>

" Toggle Fern drawer and reveal current file
nmap <Leader>l :Fern . -drawer -toggle -reveal=%<CR>

" Clear search highlighting (alternative)
nmap <Leader>n :noh<CR>

" Search tags with FZF
nmap <Leader>r :Tags<CR>

" Toggle spell checking
nmap <Leader>s :setlocal spell!<CR>

" Search files with FZF
nmap <Leader>t :Files<CR>

" Toggle Mundo (undo tree)
nmap <Leader>u :MundoToggle<CR>

" Toggle folding
nmap <Leader>z :setlocal foldenable!<CR>:setlocal foldenable?<CR>

" > LocalLeader bindings -------------------------------------------------------

" Open wiki index
nmap <LocalLeader>w :e ~/kDrive/Documents/Wiki/index.md<CR>

" Open quick notes
nmap <LocalLeader>n :e ~/kDrive/Documents/Wiki/quicknote.md<CR>

" > vim-surround ---------------------------------------------------------------

" Disable default mappings
let g:surround_no_mappings=1

" Custom surround mappings (adapted for BÉPO: l=change, y=add)
nmap ds  <Plug>Dsurround
nmap ls  <Plug>Csurround
nmap lS  <Plug>CSurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround

" Custom surroundings: French guillemets
let g:surround_171 = "« \r »"
let g:surround_187 = "« \r »"

" > Command corrections --------------------------------------------------------

" Fix common typos when saving/quitting
command! Q q
command! W w
command! Wq wq

" > Debug utilities ------------------------------------------------------------

" Show syntax highlighting groups under cursor (for theme development)
map <Leader>m :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
