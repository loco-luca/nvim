return function(capabilities)
	vim.lsp.config["pyright"] = {
		cmd = { "pyright-langserver", "--stdio" },
		capabilities = capabilities,
		filetypes = { "python" },
		root_markers = { ".git", "pyproject.toml", "pyrightconfig.json" },
		settings = {
			python = {
				analysis = {
					extraPath = { "." },
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
				},
			},
		},
	}
	vim.lsp.enable("pyright") -- Activate lsp
end
