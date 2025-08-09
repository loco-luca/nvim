return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Lua formatter
                null_ls.builtins.formatting.stylua,
                -- C/C++
                null_ls.builtins.formatting.clang_format,
                -- Python
                null_ls.builtins.formatting.black,
                -- Rust
                null_ls.builtins.formatting.rustfmt,
                -- Dart/Flutter
                null_ls.builtins.formatting.dart_format,
            },
        })

        -- Format on save for all specified filetypes
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.lua", "*.c", "*.cpp", "*.h", "*.hpp", "*.py", "*.rs", "*.dart" },
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end,
}
