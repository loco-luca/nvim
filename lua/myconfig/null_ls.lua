
local null_ls = require("null-ls")
local on_attach = require("myconfig.on_attach")

local M = {}

function M.setup()
    null_ls.setup({
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
            -- null_ls.builtins.diagnostics.pylint,
            null_ls.builtins.diagnostics.clazy,
            null_ls.builtins.diagnostics.cppcheck,
            null_ls.builtins.diagnostics.dotenv_linter,

            -- Formatting
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.clang_format,
            null_ls.builtins.formatting.stylua,
        },

        -- Important: add on_attach to enable format-on-save
        on_attach = on_attach.format_on_save,
    })
end

return M

