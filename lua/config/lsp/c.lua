return function(capabilities)
	vim.lsp.config["clangd"] = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--completion-style=detailed",
			"--header-insertion=iwyu",
			"--query-driver=/usr/bin/gcc,/usr/bin/clang",
		},
		init_options = {
			fallbackFlags = {
				"-std=c89",
				"-Wno-old-style-definition",
				"-Wno-deprecated-non-prototype",
			},
		},
		capabilities = capabilities,
		filetypes = { "c" },
		root_markers = {
			".git",
			"compile_commands.json",
			"compile_flags.txt",
			"Makefile",
			"CMakeLists.txt",
		},
	}

	vim.lsp.enable("clangd")
end
