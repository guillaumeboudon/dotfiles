-- ==============================================================================
-- > UI plugins
-- ==============================================================================

return {
  -- ===========================================================================
  -- > Lightline (statusline)
  -- ===========================================================================
  {
    "itchyny/lightline.vim",
    dependencies = {
      "maximbaz/lightline-ale",  -- ALE integration for lightline
    },
    config = function()
      vim.g.lightline = {
        colorscheme = "base16",
        active = {
          left = {
            { "mode", "paste" },
            { "readonly", "filename", "modified" },
            { "fileformat", "fileencoding", "filetype" },
          },
          right = {
            { "lineinfo" },
            { "percent" },
            { "linter_warnings", "linter_errors" },
          },
        },
        component_expand = {
          linter_warnings = "LightlineLinterWarnings",
          linter_errors = "LightlineLinterErrors",
        },
        component_type = {
          linter_warnings = "warning",
          linter_errors = "error",
        },
      }

      -- Show ALE warning count in lightline
      vim.cmd([[
        function! LightlineLinterWarnings() abort
          let l:counts = ale#statusline#Count(bufnr(''))
          let l:all_errors = l:counts.error + l:counts.style_error
          let l:all_non_errors = l:counts.total - l:all_errors
          return l:counts.total == 0 ? '' : printf('%d Δ', all_non_errors)
        endfunction
      ]])

      -- Show ALE error count in lightline
      vim.cmd([[
        function! LightlineLinterErrors() abort
          let l:counts = ale#statusline#Count(bufnr(''))
          let l:all_errors = l:counts.error + l:counts.style_error
          let l:all_non_errors = l:counts.total - l:all_errors
          return l:counts.total == 0 ? '' : printf('%d ✘', all_errors)
        endfunction
      ]])
    end,
  },

  -- ===========================================================================
  -- > GitGutter (git diff in sign column)
  -- ===========================================================================
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.g.gitgutter_sign_added = "▌"
      vim.g.gitgutter_sign_modified = "▌"
      vim.g.gitgutter_sign_removed = "▖"
      vim.g.gitgutter_sign_modified_removed = "▌"
    end,
  },

  -- ===========================================================================
  -- > Goyo (distraction-free writing)
  -- ===========================================================================
  {
    "junegunn/goyo.vim",
    cmd = "Goyo",  -- Load only when :Goyo is called
    config = function()
      vim.g.goyo_width = 100
    end,
  },

  -- ===========================================================================
  -- > Colorizer (highlight color codes)
  -- ===========================================================================
  {
    "chrisbra/Colorizer",
    cmd = { "ColorToggle", "ColorHighlight" },  -- Load on demand
  },
}
