-- lsp
return {

	"neovim/nvim-lspconfig",
	priority = 1000,
	lazy = false,
	dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "stevearc/dressing.nvim" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = {
			"python",
			"clangd", -- for c and cpp
			"rust",
			"lua_ls",
			"typescript",
			"html",
			"css",
			"bash",
			"dart",
			"zig",
		}
		for _, server in ipairs(servers) do
			require("config.lsp." .. server)(capabilities)
		end
	end,
}
