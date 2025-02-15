return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			python = { "ruff", "mypy" },
			lua = { "luacheck" },
			go = { "golangci-lint" },
			rust = { "cargo" },
			typescript = { "eslint" },
			javascript = { "eslint" },
			typescriptreact = { "eslint" },
			javascriptreact = { "eslint" },
			vue = { "eslint" },
			svelte = { "eslint" },
			json = { "jsonlint" },
			jsonc = { "jsonlint" },
			yaml = { "yamllint" },
			html = { "tidy" },
			css = { "stylelint" },
			scss = { "stylelint" },
			less = { "stylelint" },
			markdown = { "markdownlint" },
			sh = { "shellcheck" },
			bash = { "shellcheck" },
			["*"] = { "vale" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()

				-- You can call `try_lint` with a linter name or a list of names to always
				-- run specific linters, independent of the `linters_by_ft` configuration
				--require("lint").try_lint("cspell")
			end,
		})
	end,
}
