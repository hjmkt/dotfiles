nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

inoremap <silent> jj <ESC>
inoremap <C-f> <Right>
inoremap <C-f><C-f> <ESC><S-a>

noremap ; :
noremap : ;

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap sdf :<Cmd>lua vim.diagnostic.open_float()<CR>
nnoremap sds :<Cmd>lua vim.diagnostic.setqflist()<CR>
