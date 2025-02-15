return {
	"yetone/avante.nvim",
	branch = "main",
	event = "VeryLazy",
	lazy = false,
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	keys = {
		{ "<leader>uc", ":AvanteChat<CR>", desc = "avante chat" },
		{ "<leader>ut", ":AvanteToggle<CR>", desc = "avante toggle" },
		{ "<leader>us", ":AvanteSwitchProvider<CR>", desc = "avante switch provider" },
	},
	opts = {
		provider = "copilot",
		windows = {
			position = "right",
			width = 30,
			sidebar_header = {
				align = "center",
				rounded = false,
			},
			ask = {
				floating = true,
				start_insert = true,
				border = "rounded",
			},
		},
		behaviour = {
			auto_suggestions = false,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = true,
			support_paste_from_clipboard = true,
			auto_set_highlight_group = true,
		},
		vendors = {
			copilot_o3 = {
				__inherited_from = "copilot",
				model = "o3-mini",
			},
			copilot_gemini = {
				__inherited_from = "copilot",
				model = "gemini-2.0-flash-001",
			},
			qc32b = {
				__inherited_from = "openai",
				disable_tools = true,
				api_key_name = "",
				--endpoint = "127.0.0.1:11000/v1",
				endpoint = "127.0.0.1:11000/api",
				--model = "hf.co/unsloth/DeepSeek-R1-Distill-Qwen-32B-GGUF:Q4_K_M",
				model = "qwen2.5-coder:32b",
				--model = "qwen2.5-coder:7b",
				num_ctx = 16384,
				parse_curl_args = function(opts, code_opts)
					return {
						url = opts.endpoint .. "/chat",
						headers = {
							["Accept"] = "application/json",
							["Content-Type"] = "application/json",
						},
						body = {
							model = opts.model,
							options = {
								num_ctx = 16384,
							},
							messages = require("avante.providers").copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
							stream = true,
						},
					}
				end,
				parse_stream_data = function(data, handler_opts)
					-- Parse the JSON data
					local json_data = vim.fn.json_decode(data)
					-- Check for stream completion marker first
					if json_data and json_data.done then
						-- Properly terminate the stream
						handler_opts.on_stop({ reason = json_data.done_reason or "stop" })
						return
					end
					-- Process normal message content
					if json_data and json_data.message and json_data.message.content then
						-- Extract the content from the message
						local content = json_data.message.content
						-- Call the handler with the content
						handler_opts.on_chunk(content)
					end
				end,
			},
			qc14b = {
				__inherited_from = "openai",
				disable_tools = true,
				api_key_name = "",
				--endpoint = "127.0.0.1:11000/v1",
				endpoint = "127.0.0.1:11000/api",
				--model = "hf.co/unsloth/DeepSeek-R1-Distill-Qwen-32B-GGUF:Q4_K_M",
				model = "qwen2.5-coder:14b",
				--model = "qwen2.5-coder:7b",
				num_ctx = 16384,
				parse_curl_args = function(opts, code_opts)
					return {
						url = opts.endpoint .. "/chat",
						headers = {
							["accept"] = "application/json",
							["content-type"] = "application/json",
						},
						body = {
							model = opts.model,
							options = {
								num_ctx = 16384,
							},
							messages = require("avante.providers").copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
							stream = true,
						},
					}
				end,
				parse_stream_data = function(data, handler_opts)
					-- Parse the JSON data
					local json_data = vim.fn.json_decode(data)
					-- Check for stream completion marker first
					if json_data and json_data.done then
						-- Properly terminate the stream
						handler_opts.on_stop({ reason = json_data.done_reason or "stop" })
						return
					end
					-- Process normal message content
					if json_data and json_data.message and json_data.message.content then
						-- Extract the content from the message
						local content = json_data.message.content
						-- Call the handler with the content
						handler_opts.on_chunk(content)
					end
				end,
			},
			qc7b = {
				__inherited_from = "openai",
				disable_tools = true,
				api_key_name = "",
				--endpoint = "127.0.0.1:11000/v1",
				endpoint = "127.0.0.1:11000/api",
				--model = "hf.co/unsloth/DeepSeek-R1-Distill-Qwen-32B-GGUF:Q4_K_M",
				model = "qwen2.5-coder:7b",
				--model = "qwen2.5-coder:7b",
				num_ctx = 16384,
				parse_curl_args = function(opts, code_opts)
					return {
						url = opts.endpoint .. "/chat",
						headers = {
							["accept"] = "application/json",
							["content-type"] = "application/json",
						},
						body = {
							model = opts.model,
							options = {
								num_ctx = 16384,
							},
							messages = require("avante.providers").copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
							stream = true,
						},
					}
				end,
				parse_stream_data = function(data, handler_opts)
					-- Parse the JSON data
					local json_data = vim.fn.json_decode(data)
					-- Check for stream completion marker first
					if json_data and json_data.done then
						-- Properly terminate the stream
						handler_opts.on_stop({ reason = json_data.done_reason or "stop" })
						return
					end
					-- Process normal message content
					if json_data and json_data.message and json_data.message.content then
						-- Extract the content from the message
						local content = json_data.message.content
						-- Call the handler with the content
						handler_opts.on_chunk(content)
					end
				end,
			},
		},
				mappings = {
					--- @class avanteconflictmappings
					ask = "<leader>ua", -- ask
					edit = "<leader>ue", -- edit
					refresh = "<leader>ur", -- refresh
					-- '/clear' to clear chat
				},
				hints = { enabled = false },
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"kyazdani42/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
