-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Appearance
-- Function to get the GTK theme mode
-- local function get_gtk_theme_mode()
--     local gtk_theme = os.getenv("GTK_THEME")
--     if gtk_theme then
--         -- Check if the theme contains ":dark" or ":light"
--         if string.match(gtk_theme, ":dark") then
--             return "dark"
--         elseif string.match(gtk_theme, ":light") then
--             return "light"
--         end
--     end
--     -- Default to dark if GTK_THEME is not set or doesn't specify mode
--     return "dark"
-- end
--
-- -- Set the colorscheme based on the GTK theme mode
-- local function set_colorscheme()
--     local mode = get_gtk_theme_mode()
--     if mode == "dark" then
--         vim.cmd("colorscheme musthemer") -- Replace with your preferred dark theme
--     else
--         vim.cmd("colorscheme lightmust") -- Replace with your preferred light theme
--     end
-- end
--
-- -- Call the function to set the colorscheme
-- set_colorscheme()
-- opt.termguicolors = true
-- opt.background = get_gtk_theme_mode()
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Consider string-string as whole word
opt.iskeyword:append("-")

-- Disable swapfile
opt.swapfile = false
