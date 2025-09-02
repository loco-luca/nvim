return {
	"nvimtools/none-ls.nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim", lazy = true },
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
				vim.lsp.buf.format({ async = false })
			end,
		})
		-- -- rename variables across all buffers
		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	callback = function(ev)
		-- 		local opts = { buffer = ev.buf, desc = "LSP Rename" }
		-- 		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		-- 	end,
		-- })
	end,
}
