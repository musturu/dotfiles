-- ~/.config/nvim/colors/musthemer.lua


local M = {}

vim.o.background = 'dark'
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end
vim.g.colors_name = 'musthemer'

-- Color palette
local colors = {

	bg = "#0a0b00",
	lbg = "#1a0503",
	red = "#860210",
	mutered = "#7f3a28",
	bred = "#a54e14",
	mud = "#4a3f0c",
	lmud = "#6c5f17",
	mmud = "#debb21",
	lgray = "#8a8e55",
	gray = "#8b805d",
	fg = "#bb9e7f",
	bright ="#ebeab2",
	blue = "#7dabdb",
	lgreen = "#c3cc52",
	dgreen = "#28a639",
	lpurple = "#9c49f7",
	dpurple = "#440787",
    brighter  = "#ffecd6"
}

local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
    -- Base colors
    set_hl('Normal', { fg = colors.fg, bg = colors.bg })
    
    -- Line numbers
    set_hl('LineNr', { fg = colors.gray, bg = colors.bg })
    set_hl('CursorLineNr', { fg = colors.bright, bg = colors.bg })
    
    -- Cursor line
    set_hl('CursorLine', { bg = colors.lbg })
    
    -- Status line`
    set_hl('StatusLine', { fg = colors.fg, bg = colors.lbg })
    set_hl('StatusLineNC', { fg = colors.fg, bg = colors.bred })
    
    -- Search
    set_hl('Search', { fg = colors.bright, bg = colors.red })
    set_hl('IncSearch', { fg = colors.bright, bg = colors.bred })
    
    -- Visual selection
    set_hl('Visual', { bg = colors.gray })
    
    
    -- Syntax highlighting
    set_hl('Comment', { fg = colors.dgreen, italic = true })
    set_hl('Constant', { fg = colors.lpurple, italic = true })
    set_hl('String', { fg = colors.lgreen })
    set_hl('Identifier', { fg = colors.gray })
    set_hl('Function', { fg = colors.mmud })
    set_hl('Statement', { fg = colors.blue })
    set_hl('PreProc', { fg = colors.gray })
    set_hl('Type', { fg = colors.gray })
    set_hl('Special', { fg = colors.dgreen })
    set_hl('Underlined', { fg = colors.brighter, underline = true })
    set_hl('Error', { fg = colors.bright, bg = colors.red })
    set_hl('Operator', { fg = colors.bright  })
    set_hl('Todo', { fg = colors.bg, bg = colors.bright })
	set_hl('Delimiter' , {fg = colors.bright })
	-- Variables
    set_hl('Identifier', { fg = colors.lgray })
    set_hl('@variable', { fg = colors.fg })
    set_hl('@variable.builtin', { fg = colors.lpurple })
    set_hl('@variable.parameter', { fg = colors.brighter })   
end

M.setup()

return M
