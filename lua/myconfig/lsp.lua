-- LSP and Autocompletion Configuration
local lspconfig = require("lspconfig")
local cmp = require("cmp")

-- Setup nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- Setup LSP for Python using pyright
lspconfig.pyright.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
lspconfig.clangd.setup({
capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
