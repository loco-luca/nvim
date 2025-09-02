-- treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
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
				"dart",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			sync_install = true,
			modules = {},
			ignore_install = {},
		})
	end,
}
