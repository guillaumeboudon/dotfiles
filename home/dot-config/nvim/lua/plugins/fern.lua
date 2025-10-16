-- ===========================================================================
-- > Fern (file explorer)
-- ===========================================================================

return {
  {
    "lambdalisue/fern.vim",
    keys = {
      { "-", "<cmd>Fern %:h<cr>", desc = "Open Fern in current directory" },
      { "<leader>k", "<cmd>Fern . -drawer -toggle<cr>", desc = "Toggle Fern drawer" },
      { "<leader>l", "<cmd>Fern . -drawer -toggle -reveal=%<cr>", desc = "Toggle Fern and reveal file" },
    },
    config = function()
      vim.g["fern#default_hidden"] = 1
      vim.g["fern#disable_default_mappings"] = 1
      vim.g["fern#keepalt_on_edit"] = 1

      -- Visual symbols
      vim.g["fern#mark_symbol"] = "◉"
      vim.g["fern#renderer#default#collapsed_symbol"] = "▷ "
      vim.g["fern#renderer#default#expanded_symbol"] = "▼ "
      vim.g["fern#renderer#default#leading"] = "  "
      vim.g["fern#renderer#default#leaf_symbol"] = ""
      vim.g["fern#renderer#default#root_symbol"] = "~ "

      -- Custom key mappings for Fern
      vim.cmd([[
        function! s:init_fern() abort
          nmap <buffer><expr>
              \ <Plug>(fern-my-open-or-expand-or-collapse)
              \ fern#smart#leaf(
              \   "\<Plug>(fern-action-open)",
              \   "\<Plug>(fern-action-expand)",
              \   "\<Plug>(fern-action-collapse)",
              \ )

          nmap <buffer><expr>
              \ <Plug>(fern-my-expand-or-open)
              \ fern#smart#leaf(
              \   "\<Plug>(fern-action-open)",
              \   "\<Plug>(fern-action-expand)"
              \ )

          nmap <buffer><nowait> <Return> <Plug>(fern-my-open-or-expand-or-collapse)
          nmap <buffer> . <Plug>(fern-action-hidden:toggle)
          nmap <buffer> c <Plug>(fern-action-collapse)
          nmap <buffer> D <Plug>(fern-action-remove)
          nmap <buffer> d <Plug>(fern-action-trash)
          nmap <buffer> m <Plug>(fern-action-move)
          nmap <buffer> n <Plug>(fern-action-new-path)
          nmap <buffer> r <Plug>(fern-my-expand-or-open)
          nmap <buffer> u <Plug>(fern-action-leave)
          nmap <buffer> y <Plug>(fern-action-copy)
        endfunction

        augroup fern_autocmds
          autocmd! *
          autocmd FileType fern call s:init_fern()
        augroup END
      ]])
    end,
  },
}
