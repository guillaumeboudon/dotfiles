-- =============================================================================
-- > Treesitter (Syntax Highlighting & Code Parsing)
-- =============================================================================

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- Additional textobjects for Treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    -- -----------------------------------------------------------------------------
    -- > Language Parsers
    -- -----------------------------------------------------------------------------

    -- Install parsers for your main filetypes
    ensure_installed = {
      "bash",
      "css",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "ruby",
      "sql",
      "vim",
      "vimdoc",
      "yaml",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- -----------------------------------------------------------------------------
    -- > Highlighting
    -- -----------------------------------------------------------------------------

    highlight = {
      enable = true,

      -- Disable for files larger than 1 MB
      disable = function(lang, bufnr)
        local max_filesize = 1024 * 1024 -- 1 MB
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        return ok and stats and stats.size > max_filesize
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },

    -- -----------------------------------------------------------------------------
    -- > Indentation
    -- -----------------------------------------------------------------------------

    indent = {
      enable = true,
      -- Disable for specific languages if needed
      disable = { "ruby" }, -- Ruby indentation can be tricky with Treesitter
    },

    -- -----------------------------------------------------------------------------
    -- > Text Objects
    -- -----------------------------------------------------------------------------

    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },

      move = {
        enable = true,
        set_jumps = true, -- Add jumps to jumplist

        goto_next_start = {
          ["gom"] = "@function.outer",   -- go + method
          ["gol"] = "@class.outer",      -- go + cLass
          ["gob"] = "@block.outer",      -- go + block
        },
        goto_next_end = {
          ["goM"] = "@function.outer",
          ["goL"] = "@class.outer",
          ["goB"] = "@block.outer",
        },
        goto_previous_start = {
          ["gOm"] = "@function.outer",   -- gO + method (previous)
          ["gOl"] = "@class.outer",      -- gO + cLass
          ["gOb"] = "@block.outer",      -- gO + block
        },
        goto_previous_end = {
          ["gOM"] = "@function.outer",
          ["gOL"] = "@class.outer",
          ["gOB"] = "@block.outer",
        },
      },

      swap = {
        enable = true,
        swap_next = {
          ["<leader>sn"] = "@parameter.inner", -- Swap with next parameter
        },
        swap_previous = {
          ["<leader>sp"] = "@parameter.inner", -- Swap with previous parameter
        },
      },
    },
  },

  -- -----------------------------------------------------------------------------
  -- > Configuration
  -- -----------------------------------------------------------------------------

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- Folding with Treesitter (optional, uncomment if you want it)
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- vim.opt.foldenable = false -- Disable folding by default
  end,
}
