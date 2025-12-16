return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = 'screen'
  end,
  opts = {
    left = {
      {
        title = 'Neo-Tree',
        ft = 'neo-tree',
        filter = function(buf)
          return vim.b[buf].neo_tree_source == 'filesystem'
        end,
        size = { height = 0.5 },
      },
      {
        ft = 'toggleterm',
        title = 'Terminal',
        size = { height = 0.5 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ''
        end,
      },
    },
    right = {
      {
        title = 'Aerial',
        ft = 'aerial',
        size = { height = 0.5 },
      },
      -- catchall: matches any buffer not otherwise handled earlier
      {
        title = 'Other',
        ft = '*',
        size = { height = 0.5 },
        -- You can filter out buffers you *don't* want here
        filter = function(buf)
          local exclude_fts = { 'neo-tree', 'toggleterm', 'aerial' }
          local ft = vim.bo[buf].filetype
          for _, v in ipairs(exclude_fts) do
            if ft == v then
              return false
            end
          end
          return true
        end,
      },
    },
    bottom = {},
  },
}
