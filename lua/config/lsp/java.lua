-- Java lsp
return function(capabilities)
	vim.lsp.config["jdtls"] = {
		cmd = { "jdtls" },
		capabilities = capabilities,
		filetypes = { "java" },
		root_markers = { ".git", "pom.xml", "build.gradle", "gradlew", "mvnw" },
		settings = {
			java = {
				eclipse = {
					downloadSources = true,
				},
				configuration = {
					updateBuildConfiguration = "interactive",
				},
				maven = {
					downloadSources = true,
				},
				implementationsCodeLens = {
					enabled = true,
				},
				referencesCodeLens = {
					enabled = true,
				},
			},
		},
	}
	vim.lsp.enable("jdtls")
end
