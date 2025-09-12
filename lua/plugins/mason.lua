-- Mason lsp
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
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"pyright",
				},

				handlers = {
					-- Lua LSP with custom globals
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim", "it", "describe", "before_each", "after_each" },
									},
								},
							},
						})
					end,
					-- Default handler for other LSPs
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,
				},
			})
		end,
	},
}
