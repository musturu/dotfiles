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

-- Buffers
keymap.set("n", "<leader><Tab>", "<nop>", { desc = "Buffers" })

-- Switch to next buffer
keymap.set("n", "<leader><Tab><Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

-- Switch to previous buffer
keymap.set("n", "<leader><Tab>p", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })

-- Go to buffer in position...
keymap.set("n", "<leader><Tab>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" })
keymap.set("n", "<leader><Tab>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" })
keymap.set("n", "<leader><Tab>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" })
keymap.set("n", "<leader><Tab>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" })
keymap.set("n", "<leader><Tab>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" })
keymap.set("n", "<leader><Tab>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" })
keymap.set("n", "<leader><Tab>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" })
keymap.set("n", "<leader><Tab>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" })
keymap.set("n", "<leader><Tab>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" })
keymap.set("n", "<leader><Tab>$", "<cmd>BufferLineGoToBuffer -1<cr>", { desc = "Last Buffer" })

-- Move buffer to position
keymap.set("n", "<leader><Tab>m", "<nop>", { desc = "Move Buffer" })
keymap.set("n", "<leader><Tab>m1", "<cmd>BufferLineMoveTo 1<cr>", { desc = "Move to Position 1" })
keymap.set("n", "<leader><Tab>m2", "<cmd>BufferLineMoveTo 2<cr>", { desc = "Move to Position 2" })
keymap.set("n", "<leader><Tab>m3", "<cmd>BufferLineMoveTo 3<cr>", { desc = "Move to Position 3" })
keymap.set("n", "<leader><Tab>m4", "<cmd>BufferLineMoveTo 4<cr>", { desc = "Move to Position 4" })
keymap.set("n", "<leader><Tab>m5", "<cmd>BufferLineMoveTo 5<cr>", { desc = "Move to Position 5" })

-- Custom function to change buffer
local function change_buffer()
    local buffer_number = tonumber(vim.fn.input("Buffer number: "))
    if buffer_number then
        vim.cmd('BufferLineGoToBuffer ' .. buffer_number)
    end
end

keymap.set("n", "<leader><Tab>g", change_buffer, { desc = "Go to Buffer" })

-- Function to save all modified buffers
local function save_all_modified_buffers()
    for i = 1, vim.fn.bufnr('$') do
        if vim.bo[i].modified then
            vim.api.nvim_buf_call(i, function()
                vim.cmd('write')
            end)
        end
    end
    vim.notify("All modified buffers saved", vim.log.levels.INFO)
end

-- Keymap to trigger the function
keymap.set("n", "<leader><Tab>w", save_all_modified_buffers, { desc = "Save all modified buffers" })
