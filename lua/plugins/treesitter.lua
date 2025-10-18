-- treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	priority = 1000,
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"json",
				"lua",
				"python",
				"vim",
				"yaml",
				"c",
				"cpp",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			sync_install = true,
			incremental_selection = { enable = true },
			textobjects = { enable = true },
			modules = {},
			ignore_install = {},
		})
	end,
}
