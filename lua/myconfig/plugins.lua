--
--[[
This for you not needed to
have to download every single repo
individually  in future.
]]

return {
    "wbthomason/packer.nvim",

    "neovim/nvim-lspconfig",

    -- Autocomplete plugins
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",

    -- Theme and UI
    "Mofiqul/vscode.nvim",
    {
        "rose-pine/neovim",
        as = "rose-pine",
    },


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

    {
        "catppuccin/nvim",
        as = "catppuccin",
    },
    {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    },
    {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5', -- Optional: use a stable tag
        requires = { { 'nvim-lua/plenary.nvim' } }
    },
}
