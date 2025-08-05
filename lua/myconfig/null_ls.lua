local null_ls = require("null-ls")
local capabilities = require("myconfig.capabilities").capabilities
local on_attach = require("myconfig.on_attach").on_attach
--


local null_ls = require("null-ls")
local h = require("null-ls.helpers")


-- Setup null-ls with formatting and diagnostics sources
null_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.formatting.clang_format,
                
        },
})
