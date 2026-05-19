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
			-- C / C++
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
			---- Rust
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
