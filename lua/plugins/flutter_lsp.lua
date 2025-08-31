return {
	-- nil,  -- temp filler value
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)

			require("flutter-tools").setup({
				lsp = {
					capabilities = capabilities,
				},
				flutter_path = vim.fn.expand("$HOME/development/flutter/bin/flutter"),
				dart_sdk_path = vim.fn.expand("$HOME/development/flutter/bin/cache/dart-sdk/bin"),
			})
		end,
	},
}
