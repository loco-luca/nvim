return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua formatter
				null_ls.builtins.formatting.stylua,
				-- Python
				null_ls.builtins.formatting.black,
				-- Dart/Flutter
				null_ls.builtins.formatting.dart_format,
			},
		})

		-- -- Format on save for all specified filetypes
	vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.lua", "*.py", "*.rs", "*.dart" },
			callback = function()
				vim.lsp.buf.format({ async = true })
			end,
		})
	end,
}
