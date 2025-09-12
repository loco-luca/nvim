-- [[
-- This plugin adds indentation guides to Neovim.
-- It uses Neovim's virtual text feature and no conceal
-- ]]
return {

	{
		"lukas-reineke/indent-blankline.nvim",
		priority = 1000,
		lazy = false,
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
}
