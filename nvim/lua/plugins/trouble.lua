return {
	"folke/trouble.nvim",
	depends = "kyazdani42/nvim-web-devicons",
	keys = {
		{ "<leader>xx", ":Trouble diagnostics toggle<CR>", desc = "trouble toggle" },
		{ "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>", desc = "trouble toggle" },
		{ "<leader>xl", ":Trouble loclist toggle<CR>", desc = "trouble toggle loclist" },
		{ "<leader>xq", ":Trouble qflist toggle<CR>", desc = "trouble toggle quickfix" },
		{ "<leader>xs", ":Trouble symbols toggle focus=false<CR>", desc = "trouble toggle symbols" },
		{
			"<leader>rn",
			":Trouble lsp toggle focus=false win.position=right<CR>",
			desc = "trouble toggle lsp definitions,etc.",
		},
	},
	config = function()
		require("trouble").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
	end,
}
