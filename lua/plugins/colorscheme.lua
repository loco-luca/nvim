local function enable_tranparency()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end
return {
        {
                "rose-pine/neovim",
                name = "rose-pine",
                priority = 1000,
                lazy = false,
                config = function()
                        require("rose-pine").setup({
                                variant = "moon", -- "main", "moon", "dawn"
                                dark_variant = "moon",
                                disable_background = false,
                                -- vim.cmd.colorscheme("rose-pine-dawn"),
                        })
                        -- You can comment this out to use another theme instead
                        enable_tranparency()
                end,
        },

        {
                "folke/tokyonight.nvim",
                name = "tokyonight",
                priority = 1000,
                lazy = false,
                config = function()
                        -- Uncomment to set this as your theme
                        vim.cmd("colorscheme tokyonight-night")
                        --
                end,
        },
        {
                "Mofiqul/vscode.nvim",
                name = "vscode",
                priority = 1000,
                lazy = false,
                config = function()
                        -- comment
                end,
        },
        {
                "Mofiqul/dracula.nvim",
                name = "dracula",
                priority = 1000,
                lazy = false,
                config = function()
                        -- comment
                end,
        },
        {
                "navarasu/onedark.nvim",
                name = "onedark",
                priority = 1000,
                lazy = false,
                config = function()
                        require("onedark").setup({
                                style = "dark",
                        })
                end,
        },
        {
                "catppuccin/nvim",
                name = "catppuccin",
                priority = 1000,
                config = function()
                        -- vim.cmd.colorscheme("catppuccin-latte")
                end,
        },
        {
                "nvim-lualine/lualine.nvim",
                dependencies = {
                        "nvim-tree/nvim-web-devicons",
                },
                opts = {
                        theme = "rose-pine",
                },
        },
}
