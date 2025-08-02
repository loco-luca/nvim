-- Treesitter Configuration
require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "lua", "bash", "json", "yaml", "cpp" }, -- Add more languages as needed
    highlight = {
        enable = true,                                                     -- Enable syntax highlighting
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true, -- Enable Treesitter-based indentation
    },
})

-- Load and configure nvim-web-devicons (Material Design Icons)
local status_ok, web_devicons = pcall(require, "nvim-web-devicons")
if status_ok then
    web_devicons.setup({
        default = true, -- Enable default icons for unsupported filetypes
        override = {
            py = {
                icon = "", -- Python icon
                color = "#3572A5",
                cterm_color = "61",
                name = "Python",
            },
            ["__pycache__"] = {
                icon = "", -- Folder icon for __pycache__
                color = "#6d8086",
                cterm_color = "245",
                name = "PyCache",
            },
        },
    })
else
    vim.notify("Failed to load nvim-web-devicons", vim.log.levels.WARN)
end
