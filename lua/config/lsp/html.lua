return function(capabilities)
	vim.lsp.config["html"] = {
		cmd = { "vscode-html-language-server", "--stdio" },
		capabilities = capabilities,
		filetypes = { "html" },
		root_markers = { ".git" },
	}
	vim.lsp.enable("html")
end
