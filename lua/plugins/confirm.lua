return {
	"stevearc/conform.nvim",
	lazy = false,
	priority = 1000,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				dart = { "dart_format" },
				lua = { "stylua" },
				python = { "ruff_format", "black", stop_after_first = true },
				rust = { "rustfmt" },
				zig = { "zigfmt" },
			},
			format_on_save = {
				lsp_format = "fallback",
			},
		})
	end,
}
