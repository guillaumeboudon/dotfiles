-- =============================================================================
-- > Conform (Formatting)
-- =============================================================================

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo", "Format" },
  keys = {
    {
      "<Leader>fm",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    -- Define formatters by filetype
    formatters_by_ft = {
      lua = { "stylua" },
      ruby = { "standardrb" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      python = { "black" },
    },

    -- Format on save (disabled, only trim whitespace)
    format_on_save = function(bufnr)
      -- Only trim whitespace and final newlines
      return {
        timeout_ms = 500,
        lsp_fallback = false,
        formatters = { "trim_whitespace", "trim_newlines" },
      }
    end,

    -- Custom formatters
    formatters = {
      -- Trim trailing whitespace
      trim_whitespace = {
        command = "awk",
        args = { '{ sub(/[ \t]+$/, ""); print }' },
        stdin = true,
      },
      -- Trim final newlines (keep only one)
      trim_newlines = {
        command = "awk",
        args = { 'NR>1{print p}{p=$0}END{if(p!="")print p}' },
        stdin = true,
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    -- Create user command for manual formatting
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })
  end,
}
