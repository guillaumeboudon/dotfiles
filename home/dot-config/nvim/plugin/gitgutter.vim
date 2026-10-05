let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▖'
let g:gitgutter_sign_modified_removed = '▌'

" Gitgutter splits `git diff --name-status` output on whitespace, so renamed
" files with spaces in their path raise "unable to list renamed files" (e.g. when
" fugitive reblames at an older commit). Without rename detection it lists none.
let g:gitgutter_git_args = '-c diff.renames=false'
