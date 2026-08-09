return function(capabilities)
	-- zig lsp
	vim.lsp.config["zig"] = {
		cmd = { "zls" },
		capabilities = capabilities,
		filetypes = { "zig" },
		root_markers = {
			".git",
			"build.zig",
			"build.zig.zon",
		},
	}
	vim.lsp.enable("zig")
end
