return {
	"phaazon/hop.nvim",
	keys = {
		{ "<leader>c", ":HopChar2<CR>", desc = "hop char" },
        { "<leader>l", ":HopLine<CR>", desc = "hop line" },
        { "<leader>w", ":HopWord<CR>", desc = "hop word" },
        { "<leader>s", ":HopPattern<CR>", desc = "hop pattern" },
	},
	config = function()
		require("hop").setup()
	end,
}
