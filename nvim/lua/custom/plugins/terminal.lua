return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
      { '<C-\\>', desc = 'Toggle terminal' },
      { '<Tab>t', desc = 'Switch focus to terminal' },
      { '<Tab>t', desc = 'Cycle terminals' },
      { '<leader>t', desc = 'Open terminal' },
      { 'gt', mode = 'v', desc = 'Send lines to terminal' },
    },
    config = function()
      require('toggleterm').setup {
        size = 7,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        autochdir = false,
        shade_terminals = true,
        start_in_insert = true,
        shell = 'bash',
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = 'horizontal',
        close_on_exit = true,
        auto_scroll = true,
        float_opts = {
          winblend = 3,
        },
      }

      vim.keymap.set('n', '<leader>t', function()
        vim.cmd 'ToggleTerm'
      end, { desc = 'Open terminal' })

      vim.keymap.set('v', 'gt', function()
        vim.cmd 'ToggleTermSendVisualSelection'
      end, { desc = 'Send lines to terminal' })
    end,
  },
}
