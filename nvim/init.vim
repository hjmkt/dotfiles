let g:python_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python'
let s:dein_cache_path = expand('~/.cache/nvim/dein')
let s:dein_dir = s:dein_cache_path
  \ .'/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  if exists('g:vscode')
    call dein#load_toml('~/.config/nvim/deinvs.toml', {'lazy' : 0})
  else
    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
    call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})
    call dein#load_toml('~/.config/nvim/deinft.toml')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

runtime! ./options.rc.vim
runtime! ./keymap.rc.vim
runtime! ./functions.rc.vim

source $VIMRUNTIME/macros/matchit.vim

source ~/.vim/scripts/atcoder.vim
nnoremap tst :<C-u>TestSample<CR>

colorscheme gruvbox
let g:vim_json_conceal = 0

"let g:syntastic_cpp_compiler_options = '-std=c++17 -stdlib=libc++ -I/usr/include/x86_64-linux-gnu/c++/7 -I/usr/include/c++/7'
"let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ -I/usr/include/x86_64-linux-gnu/c++/7 -I/usr/include/c++/7'

"Plugin 'skwp/greplace.vim'

"augroup fileTypeIndent
    "autocmd!
    "autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
"augroup END

"au FileType vim set tabstop=2|set shiftwidth=2|set expandtab
"au FileType zsh set tabstop=2|set shiftwidth=2|set expandtab
"au FileType html set tabstop=2|set shiftwidth=2|set expandtab
"au FileType htmldjango set tabstop=2|set shiftwidth=2|set expandtab
"au FileType sql set tabstop=2|set shiftwidth=2|set expandtab
"au FileType javascript set tabstop=4|set shiftwidth=4|set expandtab
"au FileType css set tabstop=4|set shiftwidth=4|set expandtab

"if &term =~ "xterm"
    "let &t_SI .= "\e[?2004h"
    "let &t_EI .= "\e[?2004l"
    "let &pastetoggle = "\e[201~"

    "function XTermPasteBegin(ret)
        "set paste
        "return a:ret
    "endfunction

    "inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
"endif

"if has('conceal')
  "set conceallevel=2 concealcursor=niv
"endif

"au BufNewFile,BufRead *.html set filetype=html
"autocmd QuickFixCmdPost *grep* cwindow

