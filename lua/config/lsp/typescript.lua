return function(capabilities)
	-- Typescript
	vim.lsp.config["tsserver"] = {
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"javascript.jsx",
		},
		root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
		single_file_support = true,
	}
	vim.lsp.enable("tsserver")
end
