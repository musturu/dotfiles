-- init.lua

vim.cmd('colorscheme musthemer')

require('keymaps')
require('whichkey')
require('options')
require('lazy-config')
require('misc')
require('indentscope').setup()
require('treesitter-config')
require('miniclue')
require('alpha-config')

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

