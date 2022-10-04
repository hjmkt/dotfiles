require('001_core')
require('002_keymap')
require('plugins')
vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])
