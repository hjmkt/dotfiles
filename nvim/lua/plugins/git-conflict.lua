return {
	"akinsho/git-conflict.nvim",
	keys = {
		{ "<leader>gco", ":GitConflictChooseOurs<CR>", desc = "git conflict choose ours" },
        { "<leader>gct", ":GitConflictChooseTheirs<CR>", desc = "git conflict choose theirs" },
        { "<leader>gcb", ":GitConflictChooseBoth<CR>", desc = "git conflict choose both" },
        { "<leader>gcl", ":GitConflictListQf<CR>", desc = "git conflict list" },
        { "<leader>gcn", ":GitConflictNext<CR>", desc = "git conflict next" },
        { "<leader>gcp", ":GitConflictPrev<CR>", desc = "git conflict prev" },
	},
	config = function()
		require("git-conflict").setup({
			default_mappings = true,
			default_commands = true,
			disable_diagnostics = false,
			list_opener = "copen",
			highlights = {
				incoming = "DiffAdd",
				current = "DiffText",
			},
		})
	end,
}
