vim.cmd([[ filetype plugin indent on ]])
vim.cmd([[ syntax enable ]])
vim.cmd([[ source $VIMRUNTIME/macros/matchit.vim]])
vim.cmd([[ set mouse=v ]])

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.fenc = "utf-8"
vim.o.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileformats = "unix", "mac", "dos"
vim.o.nobackup = true
vim.o.noswapfile = true
vim.o.autoread = true
vim.o.hidden = true
vim.o.showcmd = true
vim.o.virtualedit = "onemore"
vim.o.visualbell = true
vim.o.showmatch = true
vim.o.laststatus = 2
vim.o.wildmode = "list:longest"
vim.o.wildmenu = true
vim.o.history = 5000
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true
--vim.o.list = true
--vim.o.listchars = {tab = '>-', trail = '*', nbsp = '+'}
vim.o.clipboard = "unnamedplus"
vim.o.nocompatible = true
vim.o.background = "dark"
vim.o.t_Co = 256
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.wrapscan = true
vim.o.hlsearch = true
vim.o.completeopt = "menu"
vim.g.indentLine_conceallevel = 0

vim.cmd([[ colorscheme gruvbox ]])
vim.cmd("autocmd ColorScheme * highlight LineNr ctermfg=grey")
vim.g.vim_json_conceal = 0

vim.cmd("source ~/.vim/scripts/atcoder.vim")
vim.g.mapleader = ","
