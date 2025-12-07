return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function get_git_status()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        local ahead = gitsigns.ahead or 0
        local behind = gitsigns.behind or 0
        local branch = gitsigns.head or ''
        local status = branch
        if ahead > 0 then
          status = status .. ' ↑' .. ahead
        end
        if behind > 0 then
          status = status .. ' ↓' .. behind
        end
        return status
      end
      return 'No Branch'
    end

    local function get_diagnostics_count()
      local diagnostics = vim.diagnostic
      local error_count = #diagnostics.get(0, { severity = diagnostics.severity.ERROR })
      local warn_count = #diagnostics.get(0, { severity = diagnostics.severity.WARN })
      local info = {}
      if error_count > 0 then
        table.insert(info, ' ' .. error_count)
      end
      if warn_count > 0 then
        table.insert(info, ' ' .. warn_count)
      end
      return table.concat(info, ' ')
    end

    require('lualine').setup {
      options = {
        theme = 'auto', -- auto picks colors from current colorscheme
        section_separators = '|', -- minimal separators
        component_separators = '|',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { get_git_status },
        lualine_c = { 'filename' },
        lualine_x = { get_diagnostics_count, 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'aerial' },
    }
  end,
}
