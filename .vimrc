set number
set relativenumber
highlight LineNr ctermfg=grey
set fenc=utf-8
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
set ambiwidth=double " □や○文字が崩れる問題を解決
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
nnoremap j gj
nnoremap k gk
nnoremap <down> gj

let mapleader = ","

nnoremap <up> gk
set list listchars=tab:\▸\-
set clipboard+=unnamed

nnoremap sc :<C-u>SyntasticCheck<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap nt :<C-u>NERDTree<CR>

"inoremap { {}<Left>
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap ( ()<ESC>i
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
"inoremap [ []<ESC>i
"inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap <silent> jj <ESC>
inoremap <C-f> <Right>
inoremap <C-f><C-f> <ESC><S-a>

let g:python_highlight_all = 1

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

source $VIMRUNTIME/macros/matchit.vim
source ~/.vim/scripts/atcoder.vim

nnoremap tst :<C-u>TestSample<CR>

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
Plugin 'airblade/vim-gitgutter'
"Plugin 'valloric/youcompleteme'
Plugin 'Shougo/deoplete.nvim'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
let g:deoplete#min_pattern_length = 3
let g:deoplete#auto_completion_start_length = 1
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
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
                            \ 'passive_filetypes': ['python', 'html', 'javascript', 'cpp'] }
"let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep8', 'pycodestyle', 'pyflakes', 'python']
let g:syntastic_htmldjango_checkers = ['python/pylint']
let g:syntastic_html_checkers = ['jslint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++1z -stdlib=libc++ -I/usr/include/x86_64-linux-gnu/c++/7 -I/usr/include/c++/7'
let g:syntastic_cpp_checkers = ['gcc', 'clang_check']
let g:syntastic_javascript_checkers = ['eslint']

Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/context_filetype.vim'
Plugin 'osyo-manga/vim-precious'
Plugin 'honza/vim-snippets'
let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'

Plugin 'justmao945/vim-clang'
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ -I/usr/include/x86_64-linux-gnu/c++/7 -I/usr/include/c++/7'

Plugin 'cohama/lexima.vim'
Plugin 'skwp/greplace.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


call vundle#end()
filetype plugin indent on
syntax on
set background=dark
colorscheme gruvbox
set t_Co=256

noremap ; :
noremap : ;

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

au FileType vim set tabstop=2|set shiftwidth=2|set expandtab
au FileType zsh set tabstop=2|set shiftwidth=2|set expandtab
au FileType html set tabstop=2|set shiftwidth=2|set expandtab
au FileType htmldjango set tabstop=2|set shiftwidth=2|set expandtab
au FileType sql set tabstop=2|set shiftwidth=2|set expandtab
au FileType javascript set tabstop=4|set shiftwidth=4|set expandtab
au FileType css set tabstop=4|set shiftwidth=4|set expandtab

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



" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

au BufNewFile,BufRead *.html set filetype=html

autocmd QuickFixCmdPost *grep* cwindow

let g:neosnippet#snippets_directory = "~/.vim/snippets/"

