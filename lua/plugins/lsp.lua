-- lsp
return {
	{
		"neovim/nvim-lspconfig",
		priority = 1000,
		lazy = false,
		dependencies = { "hrsh7th/cmp-nvim-lsp", "stevearc/dressing.nvim" },

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Python
			vim.lsp.config["pyright"] = {
				cmd = { "pyright-langserver", "--stdio" },
				capabilities = capabilities,
				filetypes = { "python" },
				root_markers = { ".git", "pyproject.toml" },
			}
			vim.lsp.enable("pyright") -- Activate lsp
			-- Rust
			vim.lsp.config["rust_analyzer"] = {
				cmd = { "rust-analyzer" },
				capabilities = capabilities,
				filetypes = { "rust" },
				root_markers = { ".git", "Cargo.toml" },
			}
			vim.lsp.enable("rust_analyzer") -- Activate lsp
			-- Lua
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
			-- Html lsp
			vim.lsp.config["html"] = {
				cmd = { "vscode-html-language-server", "--stdio" },
				capabilities = capabilities,
				filetypes = { "html" },
				root_markers = { ".git" },
			}
			vim.lsp.enable("html")
			-- CSS lsp
			vim.lsp.config["cssls"] = {
				cmd = { "vscode-css-language-server", "--stdio" },
				capabilities = capabilities,
				filetypes = { "css", "scss", "less" },
				root_markers = { ".git" },
				settings = {
					css = { validate = true },
					scss = { validate = true },
					less = { validate = true },
				},
			}

			vim.lsp.enable("cssls")
		end,
	},
}
