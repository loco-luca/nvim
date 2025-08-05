--[[
This setup ensures you don’t need to manually clone each plugin repository.
Just run :PackerSync after updating this list.
--]]

vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
	-- Packer manages itself
	use("wbthomason/packer.nvim")

	-- LSP support
	use({ "neovim/nvim-lspconfig" })
	use({
		"nvimtools/none-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({ "mrcjkb/rustaceanvim" })
	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for cmp
			"hrsh7th/cmp-buffer", -- Buffer completions
			"hrsh7th/cmp-path", -- Path completions
			"hrsh7th/cmp-cmdline", -- Cmdline completions
			{ "L3MON4D3/LuaSnip", run = "make install_jsregexp" }, -- Snippet engine
			"saadparwaiz1/cmp_luasnip", -- Snippet completions
		},
	})

	-- Flutter/Dart
	use({
		"akinsho/flutter-tools.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	-- Optional: GitHub Copilot
	-- use("github/copilot.vim")

	-- Fuzzy Finder
	use({
		"junegunn/fzf",
		run = "./install --all",
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- File Explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Status Line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Themes
	use("Mofiqul/vscode.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "catppuccin/nvim", as = "catppuccin" })
end)
