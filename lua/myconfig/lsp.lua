-- LSP and Autocompletion Configuration

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("myconfig.on_attach").on_attach
local flutterconfig = require("flutter-tools")
local null_ls = require("null-ls")
-- Setup language servers with capabilities and on_attach
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = util.root_pattern(".git", "setup.py", "pyproject.toml", "requirements.txt", ".venv"),
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.dartls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = util.root_pattern("pubspec.yaml"),
})

-- Flutter Configuration
flutterconfig.setup({
	lsp = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

null_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	sources = {
		-- Completions
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.completion.vsnip,
		null_ls.builtins.completion.nvim_snippets,
		null_ls.builtins.completion.tags,
		null_ls.builtins.completion.spell,

		-- Diagnostics
		null_ls.builtins.diagnostics.actionlint,
		null_ls.builtins.diagnostics.mypy,
		-- null_ls.builtins.diagnostics.pylint, -- Optional
		null_ls.builtins.diagnostics.clazy,
		null_ls.builtins.diagnostics.cppcheck,
		null_ls.builtins.diagnostics.dotenv_linter,

		-- Formatting
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.stylua,
	},
})
