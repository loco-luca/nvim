-- LSP and Autocompletion Configuration
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
    -- Enable omnifunc for completion
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.server_capabilities.documentFormattingProvider then
        -- Async format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = true })
            end,
        })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
            { noremap = true, silent = true })
    end
end

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

local servers = { "lua_ls", "clangd" }
for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end
