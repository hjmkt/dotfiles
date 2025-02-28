return {
	"lambdalisue/fern.vim",
	keys = {
		{ "fern", ":Fern . -reveal=% -drawer -toggle -width=40<CR>", desc = "toggle fern" },
	},
	dependencies = {
		{ "lambdalisue/nerdfont.vim" },
		{
			"lambdalisue/fern-renderer-nerdfont.vim",
			config = function()
				vim.g["fern#renderer"] = "nerdfont"
				vim.g["fern#default_hidden"] = 1
			end,
		},
	},
}
