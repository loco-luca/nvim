-- LSP and Autocompletion Configuration

-- Load LSP and CMP modules
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Attach function for LSPs
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Format on save if supported
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = true })
            end,
        })

        -- Map <leader>f to manual format
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = bufnr, desc = "LSP Format" })
    end
end

-- Setup nvim-cmp
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
    },
})


-- Set up LSP servers
local servers = { "lua_ls", "clangd", "pyright" }

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end
