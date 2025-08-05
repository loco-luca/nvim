-- on_attach


local M = {}


local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function M.on_attach(client, bufnr)
    if client.supports_method and client:supports_method("textDocument/formatting") then
        -- Clear existing autocmds in this group for the buffer
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

        -- Create autocmd to format on save synchronously
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end,
        })
    end
end

return M

