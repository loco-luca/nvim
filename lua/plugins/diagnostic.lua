-- Diagnostics appearance
return {
	{
		"neovim/nvim-lspconfig",
		priority = 1000,
		lazy = false,
		config = function()
			vim.diagnostic.config({
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
				},
			})
		end,
	},
}
