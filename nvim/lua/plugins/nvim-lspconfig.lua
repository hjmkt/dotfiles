return {
	"neovim/nvim-lspconfig",
	config = function()
		local on_attach = function(client, bufnr)
			client.server_capabilities.diagnostic = false -- diagnostics を無効化
		end
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
			on_attach = on_attach,
		})
		vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
	end,
}
