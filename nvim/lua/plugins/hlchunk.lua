return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			indent = {
				enable = true,
				priority = 10,
				style = { "#666666", "#663333", "#333366", "#336633" },
				use_treesitter = false,
				chars = { "│" },
				ahead_lines = 20,
				delay = 50,
			},
			chunk = {
				enable = true,
				priority = 15,
				style = {
					{ fg = "#00FFFF" },
					{ fg = "#C21F30" },
				},
				use_treesitter = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				textobject = "",
				max_file_size = 2048 * 2048,
				error_sign = true,
				-- animation related
				duration = 150,
				delay = 100,
			},
			line_num = {
				enable = true,
			},
			blank = {
				enable = false,
			},
		})
	end,
}
