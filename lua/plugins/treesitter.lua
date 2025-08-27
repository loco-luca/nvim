return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUPdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotage = { enable = true },
			ensure_installed = {
				"c",
				"lua",
				"cpp",
				"python",
				"dart",
				"rust",
			},
			auto_install = false,
		})
	end,
}
