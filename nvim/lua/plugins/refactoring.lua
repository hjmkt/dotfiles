return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	keys = {
		{
			"<leader>re",
			function()
				require("refactoring").refactor("Extract Function")
			end,
			mode = "x",
			desc = "toggle fern",
		},
		{
			"<leader>rf",
			function()
				require("refactoring").refactor("Extract Function To File")
			end,
			mode = "x",
			desc = "toggle fern",
		},
		{
			"<leader>rv",
			function()
				require("refactoring").refactor("Extract Variable")
			end,
			mode = "x",
			desc = "toggle fern",
		},
		{
			"<leader>rI",
			function()
				require("refactoring").refactor("Inline Function")
			end,
			mode = "n",
			desc = "toggle fern",
		},
		{
			"<leader>ri",
			function()
				require("refactoring").refactor("Inline Variable")
			end,
			mode = { "n", "x" },
			desc = "toggle fern",
		},
		{
			"<leader>rb",
			function()
				require("refactoring").refactor("Extract Block")
			end,
			mode = "n",
			desc = "toggle fern",
		},
		{
			"<leader>rbf",
			function()
				require("refactoring").refactor("Extract Block To File")
			end,
			mode = "n",
			desc = "toggle fern",
		},
		{
			"<leader>rr",
			function()
				require("telescope").extensions.refactoring.refactors()
			end,
			mode = { "n", "x" },
			desc = "toggle fern",
		},
		{
			"<leader>rbf",
			function()
				require("refactoring").refactor("Extract Block To File")
			end,
			mode = "n",
			desc = "toggle fern",
		},
		{
			"<leader>rp",
			function()
				require("refactoring").debug.printf({ below = false })
			end,
			mode = "n",
			desc = "toggle fern",
		},
		{
			"<leader>rpv",
			function()
				require("refactoring").debug.print_var()
			end,
			mode = "n",
			desc = "toggle fern",
		},
		{
			"<leader>rc",
			function()
				require("refactoring").debug.cleanup({})
			end,
			mode = "n",
			desc = "toggle fern",
		},
	},
	config = function()
		require("refactoring").setup({
			prompt_func_return_type = {
				go = false,
				java = false,

				cpp = false,
				c = false,
				h = false,
				hpp = false,
				cxx = false,
			},
			prompt_func_param_type = {
				go = false,
				java = false,

				cpp = false,
				c = false,
				h = false,
				hpp = false,
				cxx = false,
			},
			printf_statements = {
				cpp = {
					'std::cout << "%s" << std::endl;',
				},
				python = {
					"print(%s)",
				},
			},
			print_var_statements = {
				cpp = {
					'std::cout << "%s" << std::endl;',
				},
				python = {
					"print(%s)",
				},
			},
			show_success_message = false, -- shows a message with information about the refactor on success
			-- i.e. [Refactor] Inlined 3 variable occurrences
		})
	end,
}
