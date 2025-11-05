return {
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("flutter-tools").setup({
				ui = {
					border = "rounded",
					notification_style = "plugin",
				},
				decorations = {
					statusline = {
						app_version = true,
						device = true,
					},
				},
				debugger = {
					enabled = true,
					run_via_dap = true,
				},
				dev_tools = {
					autostart = true,
				},
				lsp = {
					enabled = false,
					capabilities = capabilities,
				},
			})
		end,
	},
}
