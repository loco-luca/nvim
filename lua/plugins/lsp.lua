return {
	{
		"neovim/nvim-lspconfig",
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
