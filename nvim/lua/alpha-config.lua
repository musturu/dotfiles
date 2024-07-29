local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {

"         ,MMM8&&&. ",
"    _...MMMMM88&&&&..._",
" .::'''MMMMM88&&&&&&'''::.",
"::     MMMMM88&&&&&&     ::",
"'::....MMMMM88&&&&&&....::'",
"   `''''MMMMM88&&&&''''`",
"         'MMM8&&&'",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  > Find file", ":cd $HOME/Desktop | Telescope find_files<CR>"),
    dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("l", "  > Lazy", ":Lazy<CR>"),
    dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button("q", "  > Quit", ":qa<CR>"),
}

-- Set footer
dashboard.section.footer.val = "Ballin'"

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
