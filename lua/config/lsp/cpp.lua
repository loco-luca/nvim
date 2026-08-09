return function(capabilities)
	vim.lsp.config["clangd"] = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--completion-style=detailed",
			"--header-insertion=iwyu",
			"--query-driver=/usr/bin/clang++,/usr/local/bin/clang++",
		},
		init_options = {
			fallbackFlags = { "-std=c++23", "-stdlib=libc++" },
		},
		capabilities = capabilities,
		filetypes = { "c", "cpp", "objc", "objcpp" },
		root_markers = {
			".git",
			"compile_commands.json",
			"compile_flags.txt",
			"CMakeLists.txt",
		},
	}

	vim.lsp.enable("clangd")
end
