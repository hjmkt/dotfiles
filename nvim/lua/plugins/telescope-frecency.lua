return {
	"nvim-telescope/telescope-frecency.nvim",
	-- install the latest stable version
	version = "*",
	keys = {
		{ "tfa", ":Telescope frecency<CR>", desc = "telescope frecency" },
		{ "tfc", ":Telescope frecency workspace=CWD<CR>", desc = "telescope frecency" },
	},
	config = function()
		require("telescope").load_extension("frecency")
	end,
}
