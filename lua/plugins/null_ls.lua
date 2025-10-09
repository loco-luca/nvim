return {
	"nvimtools/none-ls.nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Use stylua without --lsp
				null_ls.builtins.formatting.stylua.with({
					extra_args = function()
						return {} -- remove --lsp argument
					end,
				}),

				-- Python
				null_ls.builtins.formatting.black,

				-- Dart/Flutter
				null_ls.builtins.formatting.dart_format,
			},
		})

		-- Format on save for all specified filetypes
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.lua", "*.py", "*.rs", "*.dart" },
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
}
