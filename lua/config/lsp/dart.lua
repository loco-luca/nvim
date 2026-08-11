return function(capabilities)
	vim.lsp.config["dartls"] = {
		cmd = { "dart", "language-server", "--protocol=lsp" },
		capabilities = capabilities,
		filetypes = { "dart" },
		root_marker = { "pubspec.yaml", "analysis_options.yaml", ".git" },
		settings = {
			dart = {
				analysis = {
					completeFunctionCalls = true,
					showTodos = true,
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
				},
			},
		},
	}
	vim.lsp.enable("dartls")
end
