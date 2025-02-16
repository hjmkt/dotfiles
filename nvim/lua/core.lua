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
vim.o.backup = false
vim.o.swapfile = false
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
vim.o.compatible = false
vim.o.background = "dark"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.wrapscan = true
vim.o.hlsearch = true
vim.o.completeopt = "menu"
vim.g.indentLine_conceallevel = 0

vim.cmd([[ colorscheme gruvbox ]])
vim.cmd("autocmd ColorScheme * highlight LineNr ctermfg=grey")
--vim.cmd("autocmd ColorScheme * highlight LineNr ctermfg=#0e1011")
vim.cmd("highlight Normal guibg=#0f1010")
vim.g.vim_json_conceal = 0

vim.cmd("source ~/.vim/scripts/atcoder.vim")
vim.g.mapleader = ","
--vim.cmd([[ set formatoptions-=ro ]])
vim.cmd([[ autocmd FileType * setlocal formatoptions-=cro ]])
--vim.cmd("hi Visual guibg=#3c3836")
--vim.cmd("hi Visual guifg=#8080e0")
vim.cmd("highlight SignColumn guibg=#0f1010")
vim.cmd("highlight CursorLine guibg=#203040")
vim.cmd("highlight CursorLineNr guibg=#203040")
--vim.cmd("highlight NormalFloat guibg=#202040")
--vim.cmd("highlight FloatBorder guibg=#202040")
vim.cmd("highlight RenderMarkdownCode guibg=#102028")
vim.cmd("highlight StatusLine guibg=#203040")
