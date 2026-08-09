return function(capabilities)
	vim.lsp.config["cssls"] = {
		cmd = { "vscode-css-language-server", "--stdio" },
		capabilities = capabilities,
		filetypes = { "css", "scss", "less" },
		root_markers = { ".git" },
		settings = {
			css = { validate = true },
			scss = { validate = true },
			less = { validate = true },
		},
	}

	vim.lsp.enable("cssls")
end
