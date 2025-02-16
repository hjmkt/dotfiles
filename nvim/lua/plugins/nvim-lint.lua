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
		local linters = require("lint").linters
		linters.luacheck.args = {
			"--formatter",
			"plain",
			"--codes",
			"--ranges",
			"--config=" .. vim.env.HOME .. "/.config/.luacheckrc",
			"-",
		}
		--vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
		--callback = function()
		--require("lint").try_lint()
		--end,
		--})
		--vim.api.nvim_create_autocmd({ "BufEnter" }, {
		--callback = function()
		--require("lint").try_lint()
		--end,
		--})
	end,
}
