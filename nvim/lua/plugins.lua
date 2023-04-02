-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- parenthesis completion
	use("cohama/lexima.vim")

	use("mbbill/undotree")
	vim.api.nvim_set_keymap("n", "<Leader>u", ":<C-u>UndotreeToggle<CR>", { noremap = true, silent = true })

	use({ "andymass/vim-matchup", event = "VimEnter" })

	use({
		"w0rp/ale",
		ft = { "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex" },
		cmd = "ALEEnable",
		config = "vim.cmd[[ALEEnable]]",
	})

	use({
		"haorenW1025/completion-nvim",
		opt = true,
		requires = { { "hrsh7th/vim-vsnip", opt = true }, { "hrsh7th/vim-vsnip-integ", opt = true } },
	})

	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			require("null-ls").builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier.with({
				prefer_local = "node_modules/.bin",
			}),
			require("null-ls").builtins.diagnostics.eslint,
			require("null-ls").builtins.diagnostics.luacheck.with({
				extra_args = { "--globals", "vim", "--globals", "awesome" },
			}),
			require("null-ls").builtins.diagnostics.yamllint,
			require("null-ls").builtins.formatting.gofmt,
			require("null-ls").builtins.formatting.rustfmt,
			require("null-ls").builtins.formatting.black,
			--require("null-ls").builtins.completion.spell,
		},
		on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format{ async = true }<CR>")

				-- format on save
				if vim.bo.filetype ~= "cpp" then
					vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format{ timeout_ms = 2000 }")
				end
			end

			if client.server_capabilities.documentRangeFormattingProvider then
				vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
			end
		end,
	})

	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	use("williamboman/mason-lspconfig.nvim")
	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup_handlers({
		function(server_name)
			--local opts = {}
			--opts.on_attach = function(_, bufnr)
			--local bufopts = { silent = true, buffer = bufnr }
			--vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			--vim.keymap.set("n", "gtD", vim.lsp.buf.type_definition, bufopts)
			--vim.keymap.set("n", "grf", vim.lsp.buf.references, bufopts)
			--vim.keymap.set("n", "<space>p", vim.lsp.buf.format, bufopts)
			--end
			--nvim_lsp[server_name].setup(opts)
			--local on_attach = function(client, bufnr)
			--client.resolved_capabilities.document_formatting = false
			--local set = vim.keymap.set
			--set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
			--set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
			--set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
			--set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
			--set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
			--set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
			--set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
			--set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
			--set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
			--set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
			--set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
			--set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
			--set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
			--set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
			--set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
			--set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
			--set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
			--end
			--require("lspconfig")[server_name].setup({
			--on_attach = on_attach,
			--})
		end,
	})

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	--use("hrsh7th/cmp-nvim-lsp-signature-help")

	-- Set up nvim-cmp.
	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
				-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "vsnip" }, -- For vsnip users.
			--{ name = "nvim_lsp_signature_help" },
			-- { name = 'luasnip' }, -- For luasnip users.
			-- { name = 'ultisnips' }, -- For ultisnips users.
			-- { name = 'snippy' }, -- For snippy users.
		}, {
			{ name = "buffer" },
		}),
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = "buffer" },
		}),
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	-- Set up lspconfig.
	local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	local on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
	end
	local lsp_flags = {
		-- This is the default in Nvim 0.7+
		debounce_text_changes = 150,
	}
	require("lspconfig")["rust_analyzer"].setup({
		on_attach = on_attach,
		flags = lsp_flags,
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {},
		},
	})
	require("lspconfig")["pylsp"].setup({
		on_attach = on_attach,
		flags = lsp_flags,
		capabilities = capabilities,
	})
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.offsetEncoding = { "utf-16" }
	capabilities.document_formatting = false
	require("lspconfig")["clangd"].setup({
		on_attach = on_attach,
		flags = lsp_flags,
		capabilities = capabilities,
	})

	-- fern
	use({ "lambdalisue/fern.vim", branch = "main" })
	vim.api.nvim_set_keymap("n", "fern", ":<C-u>Fern . -reveal=% -drawer<CR>", { noremap = true, silent = true })

	use("lambdalisue/fern-git-status.vim")
	use("lambdalisue/nerdfont.vim")

	use("lambdalisue/fern-renderer-nerdfont.vim")
	vim.g["fern#renderer"] = "nerdfont"

	use("lambdalisue/glyph-palette.vim")
	vim.cmd("augroup my-glyph-palette")
	vim.cmd("autocmd! *")
	vim.cmd("autocmd FileType fern call glyph_palette#apply()")
	vim.cmd("autocmd FileType nerdtree,startify call glyph_palette#apply()")
	vim.cmd("augroup END")

	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
	vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
	vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
	vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
	vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
	vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

	use("scrooloose/nerdcommenter")

	use("phaazon/hop.nvim")
	vim.api.nvim_set_keymap("n", "<Leader>c", ":<C-u>HopChar2<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<Leader>w", ":<C-u>HopWord<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<Leader>l", ":<C-u>HopLine<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<Leader>/", ":<C-u>HopPattern<CR>", { noremap = true, silent = true })
	require("hop").setup()

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "ff", builtin.find_files, {})
	vim.keymap.set("n", "fg", builtin.live_grep, {})
	vim.keymap.set("n", "fb", builtin.buffers, {})
	vim.keymap.set("n", "fh", builtin.help_tags, {})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	require("lualine").setup()

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	vim.api.nvim_set_keymap("n", "<Leader>dv", ":<C-u>DiffviewOpen<CR>", { noremap = true, silent = true })

	use("p00f/nvim-ts-rainbow")
	require("nvim-treesitter.configs").setup({
		highlight = {
			-- ...
		},
		-- ...
		rainbow = {
			enable = true,
			-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- colors = {}, -- table of hex strings
			-- termcolors = {} -- table of colour name strings
		},
	})

	use("lukas-reineke/indent-blankline.nvim")
	require("indent_blankline").setup({
		-- for example, context is off by default, use this to turn it on
		--show_current_context = true,
		--show_current_context_start = true,
	})

	use("machakann/vim-sandwich")
	use("kyazdani42/nvim-web-devicons")
	require("nvim-web-devicons").get_icons()

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"lewis6991/hover.nvim",
		config = function()
			require("hover").setup({
				init = function()
					-- Require providers
					require("hover.providers.lsp")
					-- require('hover.providers.gh')
					-- require('hover.providers.jira')
					-- require('hover.providers.man')
					-- require('hover.providers.dictionary')
				end,
				preview_opts = {
					border = nil,
				},
				-- Whether the contents of a currently open hover window should be moved
				-- to a :h preview-window when pressing the hover keymap.
				preview_window = false,
				title = true,
			})

			-- Setup keymaps
			vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
			vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
		end,
	})
	use({"github/copilot.vim",
		config = function()
			require("copilot").setup({})
		end,
    })
end)
