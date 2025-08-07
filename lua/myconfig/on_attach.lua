-- on_attach
--



local M = {}

function M.format_on_save(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        local group = vim.api.nvim_create_augroup("LspFormat", { clear = false })

        vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

        vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

return M

