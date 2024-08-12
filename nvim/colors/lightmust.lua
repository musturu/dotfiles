-- ~/.config/nvim/colors/lightmust.lua


local M = {}

vim.o.background = 'light'
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
	vim.cmd('syntax reset')
end
vim.g.colors_name = 'lightmust'

-- Color palette
local colors = {

	bg       = "#eeeff5",
	lbg      = "#aeafb5",
	accent = "#faf743",
	red      = "#9b0406",
	purple     = "#6c0248",
	brown   = "#6e4e2b",
	blue     = "#12647b",
	green   = "#089c26",
	darker = "#000406"
}

local function set_hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
	-- Base colors
	set_hl('Normal', { fg = colors.darker, bg = colors.bg })
	set_hl('LuaParen', { fg = colors.darker, bg = colors.bg })

	-- Line numbers
	set_hl('LineNr', { fg = colors.blue, bg = colors.bg })
	set_hl('CursorLineNr', { fg = colors.darker, bg = colors.bg })

	-- Cursor line
	set_hl('CursorLine', { bg = colors.lbg })

	-- Status line`
	set_hl('StatusLine', { fg = colors.darker, bg = colors.lbg })
	set_hl('StatusLineNC', { fg = colors.darker, bg = colors.accent })

	-- Search
	set_hl('Search', { fg = colors.darker, bg = colors.accent })
	set_hl('IncSearch', { fg = colors.darker, bg = colors.accent })

	-- Visual selection
	set_hl('Visual', { bg = colors.accent })


	-- Syntax highlighting
	set_hl('Comment', { fg = colors.brown, italic = true })
	set_hl('Constant', { fg = colors.purple, italic = true })
	set_hl('String', { fg = colors.green })
	set_hl('Function', { fg = colors.purple })
	set_hl('Statement', { fg = colors.red })
	set_hl('PreProc', { fg = colors.purple })
	set_hl('Type', { fg = colors.brown })
	set_hl('Special', { fg = colors.brown })
	set_hl('Underlined', { fg = colors.darker, underline = true })
	set_hl('Error', { fg = colors.darker, bg = colors.accent })
	set_hl('Operator', { fg = colors.darker })
	set_hl('Todo', { fg = colors.bg, bg = colors.darker })
	set_hl('Delimiter', { fg = colors.darker })
	-- Variables
	set_hl('Identifier', { fg = colors.brown })
	set_hl('@variable', { fg = colors.blue })
	set_hl('@variable.builtin', { fg = colors.red })
	set_hl('@variable.parameter', { fg = colors.red })
	-- Plugins
	-- NVIMTREE
	set_hl('NvimTreeFolderIcon', { fg = colors.accent })
	set_hl('Directory', { fg = colors.darker })
	--MINI.CLUE
	set_hl('MiniClueBorder', { fg = colors.darker, bg = colors.bg })           -- window border.
	set_hl('MiniClueDescGroup', { fg = colors.darker, bg = colors.bg })          -- group description in clue window.
	set_hl('MiniClueDescSingle', { fg = colors.green, bg = colors.bg })             -- single target description in clue window.
	set_hl('MiniClueNextKey', { fg = colors.purple, bg = colors.bg })           -- next key label in clue window.
	set_hl('MiniClueNextKeyWithPostkeys', { fg = colors.accent, bg = colors.bg }) -- next key label with postkeys in clue window.
	set_hl('MiniClueSeparator', { fg = colors.accent, bg = colors.bg })        -- separator in clue window.
	set_hl('MiniClueTitle', { fg = colors.red, bg = colors.bg })                -- window title.


	set_hl("Pmenu", { fg = colors.green, bg = colors.lbg })
	set_hl("PmenuKind", { bg = colors.blue, fg = colors.darker })
	set_hl("PmenuSBar", { bg = colors.bg, fg = colors.darker })
	set_hl("PmenuSel", { bg = colors.bg, fg = colors.darker })
	set_hl("PmenuThumb", { bg = colors.purple, fg = colors.darker })
	set_hl("CmpItemAbbr", { fg = colors.green, bg = colors.bg })
	set_hl("NormalFloat", { fg = colors.green, bg = colors.bg })
	set_hl("FloatBorder", { fg = colors.darker, bg = colors.bg })
end

M.setup()

return M
