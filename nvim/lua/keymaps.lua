-- ~/.config/nvim/lua/config/keymaps.lua

local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "

-- General keymaps
keymap.set("i", "jk", "<ESC>") -- Exit insert mode with 'jk'
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights"}) -- Clear search highlights
keymap.set("n", "x", '"_x') -- Delete single character without copying into register

-- Window management
vim.keymap.set('n', '<leader>s', '<nop>', { desc = "Window Management" })
keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Split Vertical"}) -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Split Horizontal"}) -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", {desc = "Equalize widht & height"}) -- Split window vertically
keymap.set("n", "<leader>sx", ":close<CR>", {desc = "Close current window"}) -- Split window horizontally


-- Tab management
vim.keymap.set('n', '<leader>t', '<nop>', { desc = "Tab management" })
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = "Open new tab" })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = "Close new tab" })
keymap.set("n", "<leader>t<Tab>", ":tabn<CR>", { desc = "Go to next tavb"}) --  Go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to prev tab"}) --  Go to previous tab

-- Plugin-specific keymaps (you can add these later as you install plugins)
-- Example for nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "TreeExplore"})
keymap.set("n", "<leader>p", ":Lazy<CR>", { desc = "PackageManager"})

-- Example for telescope
-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
-- keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
