return {
  {
    "lambdalisue/fern.vim",
    -- on peut aussi lazy-load sur la commande
    cmd = { "Fern" },
    keys = {
      { "-", ":Fern %:h<CR>", desc = "Open Fern in current directory" },
      { "<Leader>k", ":Fern . -drawer -toggle<CR>", desc = "Toggle Fern drawer" },
      { "<Leader>l", ":Fern . -drawer -toggle -reveal=%<CR>", desc = "Reveal file in Fern" },
    },

    init = function()
      -- Options globales
      vim.g["fern#default_hidden"] = 1
      vim.g["fern#disable_default_mappings"] = 1
      vim.g["fern#keepalt_on_edit"] = 1

      vim.g["fern#mark_symbol"]                        = "●"
      vim.g["fern#renderer#default#collapsed_symbol"]  = "▷ "
      vim.g["fern#renderer#default#expanded_symbol"]   = "▼ "
      vim.g["fern#renderer#default#leading"]           = "  "
      vim.g["fern#renderer#default#leaf_symbol"]       = ""
      vim.g["fern#renderer#default#root_symbol"]       = "~ "
    end,

    config = function()
      -- === Mappings buffer-locaux dans Fern ===
      local aug = vim.api.nvim_create_augroup("fern_autocmds", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = aug,
        pattern = "fern",
        callback = function(ev)
          local buf = ev.buf
          local map = function(lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = buf
            opts.silent = opts.silent ~= false
            vim.keymap.set("n", lhs, rhs, opts)
          end

          -- <CR> : open / expand / collapse (expr)
          map("<CR>", function()
            return vim.fn["fern#smart#leaf"](
              "<Plug>(fern-action-open)",
              "<Plug>(fern-action-expand)",
              "<Plug>(fern-action-collapse)"
            )
          end, { expr = true, nowait = true })

          -- Raccourcis vers actions <Plug>
          local remap = { remap = true }
          map(".",  "<Plug>(fern-action-hidden:toggle)", remap)
          map("c",  "<Plug>(fern-action-collapse)",      remap)
          map("D",  "<Plug>(fern-action-remove)",        remap)
          map("d",  "<Plug>(fern-action-trash)",         remap)
          map("m",  "<Plug>(fern-action-move)",          remap)
          map("n",  "<Plug>(fern-action-new-path)",      remap)
          map("r",  "<Plug>(fern-action-expand)",        remap)
          map("u",  "<Plug>(fern-action-leave)",         remap)
          map("y",  "<Plug>(fern-action-copy)",          remap)
        end,
      })
    end,
  },
  -- Optionnel : renderer Nerd Font
  -- { "lambdalisue/fern-renderer-nerdfont.vim", dependencies = { "lambdalisue/fern.vim" } },
}
