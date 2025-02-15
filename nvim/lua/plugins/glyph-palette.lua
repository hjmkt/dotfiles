return {
	"lambdalisue/glyph-palette.vim",
    config = function()
	vim.cmd("augroup my-glyph-palette")
	vim.cmd("autocmd! *")
	vim.cmd("autocmd FileType fern call glyph_palette#apply()")
	vim.cmd("autocmd FileType nerdtree,startify call glyph_palette#apply()")
	vim.cmd("augroup END")
    end,
}
