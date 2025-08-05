-- LSP and Autocompletion Configuration

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("myconfig.on_attach").on_attach
local flutterconfig = require("flutter-tools")

-- Setup language servers with capabilities and on_attach
lspconfig.jedi_language_server.setup({
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
