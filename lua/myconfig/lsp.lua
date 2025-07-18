-- LSP and Autocompletion Configuration

-- Load LSP and CMP (completion) related modules
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Function to run when LSP server attaches to a buffer
local on_attach = function(client, bufnr)
    -- Enable built-in func completion for the buffer
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- If the server supports formatting, set up autoformat on save
    if client.server_capabilities.documentFormattingProvider then
        -- Auto-format the buffer before saving (asynchronously)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = true })
            end,
        })

        -- Map <leader>f to manually trigger formatting
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
            { noremap = true, silent = true })
    end
end

-- Configure nvim-cmp (autocompletion plugin)
cmp.setup({
    snippet = {
        -- Snippet expansion using LuaSnip
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- Scroll through completion docs
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        -- Trigger completion manually
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Abort completion
        ["<C-e>"] = cmp.mapping.abort(),
        -- Confirm selection
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    -- Define completion sources
    sources = {
        { name = "nvim_lsp" }, -- Language server
        { name = "buffer" },   -- Current buffer words
        { name = "path" },     -- Filesystem paths
        { name = "luasnip" },  -- Snippets
    },
})
lspconfig.dartls.setup {
    cmd = { "dart", "language-server", "--protocol=lsp" },
    root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
}


-- Define which LSP servers to set up
local servers = { "lua_ls", "clangd" }
for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities, -- Include CMP capabilities
        on_attach = on_attach,       -- Attach formatting and keymaps
    })
end
