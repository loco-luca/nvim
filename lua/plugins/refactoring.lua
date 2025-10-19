return {
	{
		"ThePrimeagen/refactoring.nvim",
		priority = 1000,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		opts = {},
		config = function()
			require("refactoring").setup({})
		end,
	},
}
