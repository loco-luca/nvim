-- treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	priority = 1000,
	lazy = false,
	config = function()
		require("nvim-treesitter").setup()
		local parsers = {
			"bash",
			"json",
			"lua",
			"python",
			"vim",
			"yaml",
			"c",
			"java",
			"cpp",
			"dart",
			"zig",
			"markdown",
			"markdown_inline",
		}
		pcall(function()
			require("nvim-treesitter").install(parsers)
		end)
	end,
}
