-- mason lsp
return {
	{
		"williamboman/mason.nvim",
		priority = 1000,
		lazy = false,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"stevearc/dressing.nvim",
		},

		config = function()
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)

			-- Mason setup
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },

				handlers = {
					-- Lua LSP with custom globals
					["lua_ls"] = function()
						-- Define config
						vim.lsp.config("lua_ls", {
							cmd = { "lua-language-server" },
							capabilities = capabilities,
							filetypes = { "lua" },
							root_dir = vim.fs.dirname(
								vim.fs.find({ ".git", ".luarc.json", ".luarc.jsonc" }, { upward = true })[1]
							) or vim.loop.cwd(),
							settings = {
								Lua = {
									runtime = { version = "LuaJIT" },
									workspace = { checkThirdParty = false },
									diagnostics = {
										globals = { "vim", "it", "describe", "before_each", "after_each" },
									},
									format = { enable = false }, -- disable LSP formatter if using null-ls
								},
							},
						})

						-- Enable it for its filetypes
						vim.lsp.enable("lua_ls")
					end,

					-- Default handler for other LSPs
					function(server_name)
						local cmd_map = {
							pyright = { "pyright-langserver", "--stdio" },
							rust_analyzer = { "rust-analyzer" },
						}

						vim.lsp.config(server_name, {
							cmd = cmd_map[server_name],
							capabilities = capabilities,
							root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]) or vim.loop.cwd(),
						})

						vim.lsp.enable(server_name)
					end,
				},
			})
		end,
	},
}
