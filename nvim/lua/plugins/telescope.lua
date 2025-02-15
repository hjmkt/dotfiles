return {
	"nvim-telescope/telescope.nvim",
	--version = "0.1.4",
    keys = {
        {"ff", function() require("telescope.builtin").find_files() end, desc = "find files"},
        {"fg", function() require("telescope.builtin").live_grep() end, desc = "live grep"},
        {"fb", function() require("telescope.builtin").buffers() end, desc = "buffers"},
        {"fh", function() require("telescope.builtin").help_tags() end, desc = "help tags"},
    },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
