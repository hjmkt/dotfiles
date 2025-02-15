return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "fb", ":Telescope file_browser<CR>", desc = "telescope file browser" },
		{ "fbc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "telescope file browser" },
	},
}
