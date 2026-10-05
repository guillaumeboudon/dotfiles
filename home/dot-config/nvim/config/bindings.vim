" Mappe <Leader> et <LocalLeader>
let mapleader = ","
let maplocalleader = "é"

" Mouvements de pages
noremap s gk
noremap t gj
noremap <C-t> 10j
noremap <C-s> 10k
noremap ' `

" Make Y behave like D or C
nnoremap Y y$

" Bindings
nmap ’ :Buffers<CR>
nmap - :Fern %:h<CR>
nmap <Space> za
nmap <Leader><Space> :noh<CR>
nmap <Leader><Tab> :b#<CR>
nmap <Leader>a :!echo -n % \| pbcopy<CR><CR>
nmap <Leader>b :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap <Leader>f :Rg<Space>
nmap <Leader>gb :Git blame<CR>
nmap <Leader>gh :GHBrowse<CR>
xmap <Leader>gh :GHBrowse<CR>
nmap <Leader>gc :GHBrowseCommit<CR>
nmap <Leader>h :call GoToTag()<CR>
nmap <Leader>j :Rg <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>k :Fern . -drawer -toggle<CR>
nmap <Leader>l :Fern . -drawer -toggle -reveal=%<CR>
nmap <Leader>m :Inspect<CR>
nmap <Leader>n :noh<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>s :setlocal spell!<CR>
nnoremap z= :call FzfSpell()<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>u :Undotree<CR>
nmap <Leader>z :setlocal foldenable!<CR>:setlocal foldenable?<CR>

nmap <LocalLeader>w :e ~/kDrive/Documents/Wiki/index.md<CR>
nmap <LocalLeader>n :e ~/kDrive/Documents/Wiki/quicknote.md<CR>

" vim-surround
let g:surround_no_mappings=1
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

" Add «» surroundings
let g:surround_171 = "« \r »"
let g:surround_187 = "« \r »"

" Fix my common mistakes
command! Q q
command! W w
command! Wq wq

" Open the current line (or selected lines) on GitHub, at the last commit
command! -range GHBrowse execute 'silent !gh browse -c ' . shellescape(expand('%:.') . ':' . <line1> . (<line2> != <line1> ? '-' . <line2> : ''), 1)

" Open on GitHub the commit that last changed the current line
function! s:BrowseLineCommit() abort
  let l:dir = shellescape(expand('%:p:h'))
  let l:blame = system('git -C ' . l:dir . ' blame --porcelain -L ' . line('.') . ',+1 -- ' . shellescape(expand('%:p')))
  let l:sha = matchstr(l:blame, '^\x\{40}')
  if empty(l:sha) || l:sha =~# '^0\+$'
    echo 'No commit for this line (not committed yet, or not in a git repository)'
    return
  endif
  call system('cd ' . l:dir . ' && gh browse ' . l:sha)
endfunction
command! GHBrowseCommit call s:BrowseLineCommit()
