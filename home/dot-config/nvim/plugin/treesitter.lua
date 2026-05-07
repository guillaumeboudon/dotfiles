require('nvim-treesitter').install({
  'markdown',
  'markdown_inline',
  'yaml',
  'ruby',
  'json',
  'bash',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'yaml', 'ruby', 'json', 'bash' },
  callback = function()
    vim.treesitter.start()
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
