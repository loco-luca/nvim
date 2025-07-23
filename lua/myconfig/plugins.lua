--[[
This setup ensures you don’t need to manually clone each plugin repository.
Just run :PackerSync after updating this list.
--]]

return {
    -- Packer manages itself
    "wbthomason/packer.nvim",

    -- Mason (LSP server installer)
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
                ensure_installed = { "lua_ls", "pyright", "clangd" },
                automatic_installation = true,
            })
        end,
    },

    -- LSP support
    "neovim/nvim-lspconfig",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",

    -- Telescope (Fuzzy finder)
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = { { "nvim-lua/plenary.nvim" } },
    },

    -- Treesitter (Syntax highlighting)
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
    },

    -- Themes
    "Mofiqul/vscode.nvim",
    {
        "rose-pine/neovim",
        as = "rose-pine",
    },
    {
        "catppuccin/nvim",
        as = "catppuccin",
    },
    {
        "akinsho/flutter-tools.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("flutter-tools").setup {}
        end,
    },
    -- Dart syntax highlighting
    "dart-lang/dart-vim-plugin",

}
