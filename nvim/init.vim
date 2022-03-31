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
