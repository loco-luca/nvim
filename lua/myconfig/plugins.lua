--[[
This setup ensures you don’t need to manually clone each plugin repository.
Just run :PackerSync after updating this list.
--]]

-- plugins.lua
return {
    -- Packer manages itself
    { "wbthomason/packer.nvim" },

    -- Mason (LSP installer)
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        after = "mason.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" },
                automatic_installation = true,
            })
        end,
    },

    -- LSP support
    { "neovim/nvim-lspconfig" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
    { "L3MON4D3/LuaSnip" },

    -- Formatter & Linter via none-ls
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.ruff,
                },
            })
        end,
    },

    -- Optional: GitHub Copilot
    -- { "github/copilot.vim" },

    -- Fuzzy Finder
    {
        "junegunn/fzf",
        run = "./install --all",
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = { "nvim-lua/plenary.nvim" },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    },

    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
    },

    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
    },

    -- Themes
    { "Mofiqul/vscode.nvim" },
    {
        "rose-pine/neovim",
        as = "rose-pine",
    },
    {
        "catppuccin/nvim",
        as = "catppuccin",
    },

    -- Flutter/Dart
    {
        "akinsho/flutter-tools.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("flutter-tools").setup()
        end,
    },
    { "dart-lang/dart-vim-plugin" },
}
