return {
	"stevearc/conform.nvim",

	config = function()
		local web_formatter = { "biome", "prettierd", stop_after_first = true }
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				rust = { "rustfmt", lsp_format = "fallback" },
				cpp = { "clang-format" },
				cmake = { "cmake_format" },
				python = function(bufnr)
					--if require("conform").get_formatter_info("ruff_format", bufnr).available then
					--return { "ruff_format" }
					--else
					return { "isort", "black" }
					--end
				end,
				sh = { "shfmt" },
				bash = { "shfmt" },
				-- Web
				typescript = web_formatter,
				javascript = web_formatter,
				typescriptreact = web_formatter,
				javascriptreact = web_formatter,
				vue = web_formatter,
				svelte = web_formatter,
				json = web_formatter,
				jsonc = web_formatter,
				yaml = web_formatter,
				html = web_formatter,
				css = web_formatter,
				scss = web_formatter,
				less = web_formatter,

				["*"] = { "codespell" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			format = {
				async = true,
			},
		})
	end,
}
