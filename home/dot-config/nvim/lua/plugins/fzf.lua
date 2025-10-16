-- ===========================================================================
-- > FZF (fuzzy finder)
-- ===========================================================================

return {
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      vim.g.fzf_layout = { down = "30%" }
      vim.g.fzf_preview_window = { "right:40%:hidden", "ctrl-/" }

      -- FZF spell checking integration
      vim.cmd([[
        function! FzfSpellSink(word)
          exe 'normal! "_ciw'.a:word
        endfunction

        function! FzfSpell()
          let suggestions = spellsuggest(expand("<cword>"))
          return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
        endfunction
      ]])

      -- Use FZF for spell suggestions instead of default z= menu
      vim.keymap.set("n", "z=", ":call FzfSpell()<CR>", { noremap = true, silent = true })
    end,
  },
}
