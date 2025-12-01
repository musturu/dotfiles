return {
  'stevearc/aerial.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('aerial').setup {
      -- backends preference: LSP first, then treesitter
      backends = { 'lsp', 'treesitter' },

      -- layout settings: left sidebar
      layout = {
        default_direction = 'right',
        max_width = 40,
        min_width = 20,
      },

      -- show guides (indent-like lines)
      show_guides = true,

      -- optionally open the outline automatically (false by default)
      -- open_automatic = true,
    }

    -- toggle keymap (change to your preferred key)
    vim.keymap.set('n', '<Leader>o', '<cmd>AerialToggle!<CR>', { silent = true })
  end,
}
