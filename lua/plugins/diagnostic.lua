-- Diagnostics appearance
return {
	{
		"neovim/nvim-lspconfig",
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
