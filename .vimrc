set number
highlight LineNr ctermfg=grey
set fenc=utf-8
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
"set mouse=a
"set cursorline
"set cursorcolumn
set virtualedit=onemore
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
set list listchars=tab:\▸\-
set clipboard=unnamed

nnoremap sc :<C-u>SyntasticCheck<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap nt :<C-u>NERDTree<CR>

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap <silent> jj <ESC>

let g:python_highlight_all = 1

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'valloric/youcompleteme'
Plugin 'davidhalter/jedi-vim'
Plugin 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
"let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_python_pylint_args = "--load-plugins pylint_django --disable=C0111"
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': ['python', 'html', 'javascript'] }
"let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep8', 'pycodestyle', 'pyflakes', 'python']

Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on
"syntax enable
syntax on
set background=dark
"colorscheme jellybeans
"let g:molokai_original = 1
"colorscheme molokai
colorscheme gruvbox
"colorscheme badwolf
"colorscheme monokai
"colorscheme rupza
"colorscheme solarized
"let g:badwolf_darkgutter = 1
"let g:rehash256 = 1
set t_Co=256

noremap ; :
noremap : ;

set smarttab
set expandtab
set tabstop=4
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set shiftwidth=4
set autoindent " 改行時に前の行のインデントを継続する
set smartindent

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

au FileType vim set tabstop=2|set shiftwidth=2|set expandtab
au FileType zsh set tabstop=2|set shiftwidth=2|set expandtab
au FileType css set tabstop=2|set shiftwidth=2|set expandtab
au FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
au FileType json set tabstop=2|set shiftwidth=2|set expandtab
au FileType html set tabstop=2|set shiftwidth=2|set expandtab
au FileType htmldjango set tabstop=2|set shiftwidth=2|set expandtab
au FileType sql set tabstop=2|set shiftwidth=2|set expandtab

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
