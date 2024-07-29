-- ~/.config/nvim/lua/config/keymaps.lua

local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "

-- General keymaps
keymap.set("i", "jk", "<ESC>") -- Exit insert mode with 'jk'
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights"}) -- Clear search highlights
keymap.set("n", "x", '"_x') -- Delete single character without copying into register

-- Window management
keymap.set('n', '<leader>w', '<nop>', { desc = "Window Management" })
keymap.set("n", "<leader>wv", "<C-w>v", {desc = "Split Vertical"}) -- Split window vertically
keymap.set("n", "<leader>ww", "<C-w>w", {desc = "Next Window"}) -- Split window vertically
keymap.set("n", "<leader>w<Tab>", "<C-w>w", {desc = "Next Window"}) -- Split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", {desc = "Split Horizontal"}) -- Split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", {desc = "Equalize widht & height"}) -- Split window vertically
keymap.set("n", "<leader>wx", ":close<CR>", {desc = "Close current window"}) -- Split window horizontally


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
keymap.set("n", "<leader>a", ":Alpha<CR>", { desc = "Main Menu"})

-- Mason
keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Mason UI for Lsp" })

-- Reformat Code
keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", { desc = "Reformat Code" })

-- LSP actions
keymap.set("n", "<leader>l", "<nop>", { desc = "LSP actions" })
keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
keymap.set("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })

-- File Search
keymap.set("n", "<leader>f", "<nop>", { desc = "File Search" })
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" })
keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find files" })
keymap.set("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", { desc = "Find Text Pattern In All Files" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Open Recent File" })

-- Search
keymap.set("n", "<leader>s", "<nop>", { desc = "Search" })
keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
keymap.set("n", "<leader>sm", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
keymap.set("n", "<leader>sr", "<cmd>Telescope registers<cr>", { desc = "Registers" })
keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
keymap.set("n", "<leader>sc", "<cmd>Telescope commands<cr>", { desc = "Commands" })

