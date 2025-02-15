return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"ruff",
				"eslint",
				"lua_ls",
				"pylsp",
			},
		})
		mason_lspconfig.setup_handlers({
			function(server_name, bufnr)
				require("lspconfig")[server_name].setup({})
			end,
		})
	end,
}
