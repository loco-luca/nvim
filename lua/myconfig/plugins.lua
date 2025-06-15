--[[
This setup ensures you don’t need to manually clone each plugin repository.
Just run :PackerSync after updating this list.
]]

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

    -- Statusline
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
    -- DAP UI
    {
        --
        -- -- Debug Adapter Protocol
        -- "mfussenegger/nvim-dap",
        -- "nvim-neotest/nvim-nio", -- required by dap-ui on Neovim 0.9+
        --

        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dapui = require("dapui")
            local dap = require("dap")

            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    }
}
