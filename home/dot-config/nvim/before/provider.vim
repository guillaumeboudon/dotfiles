" Python provider
" Pin neovim's python3 host to pyenv 3.10.5, independently of the current
" project's .python-version. UltiSnips requires Python >= 3.10 since it uses
" zip(..., strict=True), which raises a TypeError on 3.9.
let g:python3_host_prog = expand('~/.pyenv/versions/3.10.5/bin/python3')
