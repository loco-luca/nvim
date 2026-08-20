return function(capabilities)
	vim.lsp.config["clangd"] = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--clang-tidy-checks=bugprone-*,readability-*,performance-*,modernize-*",
			"--completion-style=detailed",
			"--header-insertion=iwyu",
			"--query-driver=/usr/bin/gcc,/usr/bin/clang,/usr/bin/clang++",
			"--header-insertion-decorators",
			"-j=4",
		},
		init_options = {
			fallbackFlags = {

				"-Wall",
				"-Wextra",
				"-Wpedantic",
				"-Wconversion",
				"-Wshadow",
			},
			clangFileStatus = true,
		},
		capabilities = capabilities,
		filetypes = { "c", "cpp", "objcpp", "cuda" },
		single_file_support = true,
		root_markers = {
			".git",
			"compile_commands.json",
			"compile_flags.txt",
			"CMakeLists.txt",
		},
	}

	vim.lsp.enable("clangd")
end
