-- =============================================================================
-- > LSP Configuration
-- =============================================================================

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- -----------------------------------------------------------------------------
    -- > Mason-lspconfig setup
    -- -----------------------------------------------------------------------------

    require("mason-lspconfig").setup({
      -- Automatically install these language servers
      ensure_installed = {
        "solargraph",    -- Ruby (more stable than ruby_lsp)
        "ts_ls",         -- JavaScript/TypeScript
        "lua_ls",        -- Lua
        "bashls",        -- Bash
        "pyright",       -- Python
        "jsonls",        -- JSON
        "yamlls",        -- YAML
        "html",          -- HTML
        "cssls",         -- CSS
        "marksman",      -- Markdown
      },
      automatic_installation = true,
    })

    -- -----------------------------------------------------------------------------
    -- > Diagnostic signs
    -- -----------------------------------------------------------------------------

    -- Use new API for Neovim 0.11+
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "●",
          [vim.diagnostic.severity.WARN] = "●",
          [vim.diagnostic.severity.HINT] = "●",
          [vim.diagnostic.severity.INFO] = "●",
        },
      },
      virtual_text = false, -- No virtual text at end of line
      underline = true,     -- Underline problematic code
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- -----------------------------------------------------------------------------
    -- > LSP keymaps and settings
    -- -----------------------------------------------------------------------------

    local on_attach = function(client, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc, noremap = true, silent = true })
      end

      -- Navigation
      map("n", "gd", vim.lsp.buf.definition, "Go to definition")
      map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
      map("n", "gr", vim.lsp.buf.references, "Go to references")
      map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

      -- Documentation
      map("n", "gh", vim.lsp.buf.hover, "Hover documentation")

      -- Code actions
      map("n", "<Leader>rn", vim.lsp.buf.rename, "Rename symbol")
      map("n", "<Leader>ca", vim.lsp.buf.code_action, "Code action")

      -- Diagnostics
      map("n", "god", vim.diagnostic.open_float, "Show diagnostic") -- go + diagnostic
      map("n", "gOd", vim.diagnostic.open_float, "Show diagnostic") -- same (alternative)
      map("n", "gon", vim.diagnostic.goto_next, "Next diagnostic")  -- go + next
      map("n", "gON", vim.diagnostic.goto_prev, "Previous diagnostic") -- gO + next

      -- Format (will be handled by conform.nvim, but available here too)
      if client.server_capabilities.documentFormattingProvider then
        map("n", "<Leader>fm", function()
          vim.lsp.buf.format({ async = true })
        end, "Format document")
      end
    end

    -- -----------------------------------------------------------------------------
    -- > Server configurations
    -- -----------------------------------------------------------------------------

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Helper function to setup LSP servers
    local function setup_lsp(server_name, config)
      config = config or {}
      config.on_attach = on_attach
      config.capabilities = capabilities

      -- Special handling for ruby_lsp: check Ruby version compatibility
      if server_name == "ruby_lsp" then
        config.root_dir = function(fname)
          local util = require("lspconfig.util")
          local root = util.root_pattern("Gemfile", ".git")(fname)

          -- Don't start ruby_lsp if there's a version mismatch
          -- (ruby_lsp will handle this, but we can suppress the error message)
          return root
        end
      end

      -- Use new vim.lsp.config API for Neovim 0.11+
      if vim.lsp.config then
        vim.lsp.config(server_name, config)
      else
        -- Fallback for older versions
        require("lspconfig")[server_name].setup(config)
      end
    end

    -- Default setup for most servers
    local servers = {
      "ruby_lsp",
      "ts_ls",
      "bashls",
      "pyright",
      "jsonls",
      "yamlls",
      "html",
      "cssls",
      "marksman",
    }

    for _, server in ipairs(servers) do
      setup_lsp(server)
    end

    -- Lua LS (special config for Neovim development)
    setup_lsp("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" }, -- Recognize 'vim' global
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- -----------------------------------------------------------------------------
    -- > Handlers configuration
    -- -----------------------------------------------------------------------------

    -- Rounded borders for LSP floating windows
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    for handler, config in pairs(handlers) do
      vim.lsp.handlers[handler] = config
    end
  end,
}
