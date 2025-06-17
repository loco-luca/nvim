-- Treesitter Configuration
require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "lua", "bash", "json", "yaml", "cpp" }, -- Add more languages if needed
    highlight = {
        enable = true,                                                     -- Enable syntax highlighting
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true, -- Enable indentation based on Treesitter
    },
})




-- Load and configure Material Design Icons
local status, web_devicons = pcall(require, "nvim-web-devicons")
if status then
    web_devicons.setup({
        default = true, -- Enable default icons for unsupported file types
        override = {
            py = {
                icon = "", -- Python icon
                color = "#3572A5",
                cterm_color = "61",
                name = "Python",
            },
            ["__pycache__"] = {
                icon = "", -- Folder icon
                color = "#6d8086",
                cterm_color = "245",
                name = "PyCache",
            },
        },
    })
else
    print("Failed to load nvim-web-devicons")
end
