return function(capabilities)
	vim.lsp.config["rust_analyzer"] = {
		cmd = { "rust-analyzer" },
		capabilities = capabilities,
		filetypes = { "rust" },
		root_markers = { ".git", "Cargo.toml" },

		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},

				checkOnSave = true,
				check = {
					command = "clippy",
				},

				diagnostics = {
					enable = true,
				},

				inlayHints = {
					typeHints = true,
					parameterHints = true,
					chainingHints = true,
				},

				completion = {
					autoimport = {
						enable = true,
					},
				},
			},
		},
	}

	vim.lsp.enable("rust_analyzer")
end
