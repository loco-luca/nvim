return function(capabilities)
	vim.lsp.config["bashls"] = {
		cmd = { "bash-language-server", "start" },
		capabilities = capabilities,
		filetypes = { "sh", "bash" },
		root_markers = { ".git" },
	}
	vim.lsp.enable("bashls")
end
