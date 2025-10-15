-- ==============================================================================
-- > Editor enhancement plugins
-- ==============================================================================

return {
  -- ===========================================================================
  -- > FZF (fuzzy finder)
  -- ===========================================================================
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
    end,
  },

  -- ===========================================================================
  -- > Fern (file explorer)
  -- ===========================================================================
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

  -- ===========================================================================
  -- > Mundo (undo tree visualizer)
  -- ===========================================================================
  {
    "simnalamburt/vim-mundo",
    cmd = { "MundoToggle", "MundoShow" },
    keys = {
      { "<leader>u", "<cmd>MundoToggle<cr>", desc = "Toggle Mundo (undo tree)" },
    },
    config = function()
      vim.g.mundo_width = 80
      vim.g.mundo_preview_height = 25

      -- Custom mappings adapted for BÉPO layout
      vim.g.mundo_mappings = {
        ["<CR>"] = "preview",
        o = "preview",
        t = "move_older",
        s = "move_newer",
        ["<down>"] = "move_older",
        ["<up>"] = "move_newer",
        T = "move_older_write",
        S = "move_newer_write",
        gg = "move_top",
        G = "move_bottom",
        P = "play_to",
        i = "toggle_inline",
        ["/"] = "search",
        n = "next_match",
        N = "previous_match",
        p = "diff_current_buffer",
        d = "diff",
        ["?"] = "toggle_help",
        q = "quit",
        ["<2-LeftMouse>"] = "mouse_click",
      }
    end,
  },

  -- ===========================================================================
  -- > UltiSnips (snippet engine)
  -- ===========================================================================
  {
    "sirver/UltiSnips",
    event = "InsertEnter",
    config = function()
      vim.g.UltiSnipsExpandTrigger       = "<tab>"
      -- vim.g.UltiSnipsListSnippets        = "<c-tab>"
      -- vim.g.UltiSnipsJumpForwardTrigger  = "<c-j>"
      -- vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
    end,
  },

  -- ===========================================================================
  -- > Vim Surround (surround text with quotes, brackets, etc.)
  -- ===========================================================================
  {
    "tpope/vim-surround",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "tpope/vim-repeat" },
  },

  -- ===========================================================================
  -- > Vim Commentary (comment/uncomment)
  -- ===========================================================================
  {
    "tpope/vim-commentary",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Toggle comment" },
    },
  },

  -- ===========================================================================
  -- > Other editor utilities
  -- ===========================================================================
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "qpkorr/vim-bufkill", cmd = { "BD", "BW" } },
  { "godlygeek/tabular", cmd = "Tabularize" },
  { "google/vim-searchindex", event = { "BufReadPre", "BufNewFile" } },
}
