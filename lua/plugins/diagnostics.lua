-- diagnosticj:9

return {
	{
		"nvim-lspconfig",
		config = function()
			-- Open floating diagnostic window
			vim.keymap.set("n", "<leader>w", vim.diagnostic.open_float)
			-- Go to previous diagnostic
			vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next)
			-- Go to next diagnostic
			vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev)
		end,
	},
}
