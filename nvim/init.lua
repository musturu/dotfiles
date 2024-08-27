-- init.lua 

require('keymaps')
require('options')
require('lazy-config')
require('misc')
require('indentscope').setup()
require('treesitter-config')
require('miniclue')
require('alpha-config')
require('lsp-config2')
require('mason-lsp-config')
require('telescope-config')
require('lualine-config')
require('hop-config')
require('bufferline-config')
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 25,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
require("flowconfig")
vim.cmd "colorscheme flow"
