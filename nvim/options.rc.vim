set number
set relativenumber
highlight LineNr ctermfg=grey
set termguicolors
set fenc=utf-8
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
"set ambiwidth=double " □や○文字が崩れる問題を解決
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set virtualedit=onemore
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
set wildmenu
set history=5000

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

set list listchars=tab:\▸\-
set clipboard+=unnamedplus

set nocompatible
set background=dark
set t_Co=256

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nnoremap <Esc> :nohlsearch<CR><Esc>
set completeopt=menu
let g:indentLine_conceallevel = 0
