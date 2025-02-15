return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "tt", ":ToggleTerm<CR>", desc = "toggle term" },
	},
	config = function()
		require("toggleterm").setup()
	end,
}
