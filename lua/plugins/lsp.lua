return {
	{
		"neovim/nvim-lspconfig",
		priority = 1000,
		lazy = false,
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {

						{ path = "${3rd}/luc/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			require("lspconfig").lua_ls.setup({})
		end,
	},
}
