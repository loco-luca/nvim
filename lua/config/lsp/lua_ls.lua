return function(capabilities)
	vim.lsp.config["lua_ls"] = {
		cmd = { "lua-language-server" },
		capabilities = capabilities,
		filetypes = { "lua" },
		root_markers = { ".git" },
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim" } },
				workspace = { checkThirdParty = false },
				format = { enable = false },
			},
		},
	}
	vim.lsp.enable("lua_ls") -- Activate lsp
end
