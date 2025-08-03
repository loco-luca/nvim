-- LSP and Autocompletion Configuration

local null_ls = require("null-ls")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local cmp = require("cmp")
local luasnip = require("luasnip")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup nvim-cmp completion
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),
})

-- Optionally, configure cmdline completion if you want:
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

-- on_attach function with formatting support and omnifunc
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = bufnr, desc = "LSP Format" })
    end
end

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
